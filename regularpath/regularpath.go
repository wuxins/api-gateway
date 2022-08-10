package regularpath

import (
	"errors"
	"fmt"
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/config"
	dto2 "github.com/wuxins/api-gateway/dto"
	"net/http"
	"regexp"
	"strings"
	"time"
)

type RegularPath struct {
	ApiId           int64
	ApiName         string
	ApiCode         string
	Method          string
	URL             string
	Address         string
	GrayAddress     string
	NeedMassRelease bool
	MassReleaseRate int
	SrcURL          string
	DesURL          string
	SrcParams       map[string]int
	SrcParamsIndex  map[int]string
	DesParams       map[string]int
	DesParamsIndex  map[int]string
	SrcSplitURL     []string
	DesSplitURL     []string
	NeedRateLimit   bool
	RateLimit       int
	NeedFallback    bool
	Fallback        string
	NeedMonitor     bool
	ReadTimeout     int64
	Tenants         []dto2.ApiTenant
	Transport       http.RoundTripper
}

type RegularPathTree struct {
	IsPath bool
	Value  RegularPath
	Child  map[string]*RegularPathTree
}

var regexpStringUnshell = "[a-zA-Z\\d]+"
var regexpString = "{{[a-zA-Z\\d]+}}"
var placeHolderRegexp = regexp.MustCompile(regexpString)

var requestMethodApiPathTree = map[string]*RegularPathTree{}

func FlushPathMapByDtos(apis []dto2.Api) error {

	requestMethodWithApis := map[string][]RegularPath{}
	for _, api := range apis {
		path, pathErr := urlsToPath(api)
		if pathErr != nil {
			return pathErr
		}
		requestMethodWithApis[api.Method] = append(requestMethodWithApis[api.Method], path)
	}

	for method, itemApis := range requestMethodWithApis { // GET、POST、PUT、DELETE
		tempRoot := &RegularPathTree{}
		for _, currRegularPath := range itemApis { // each api info
			currRegularPathTree := tempRoot
			for _, currUrlSplitPath := range currRegularPath.SrcSplitURL { // api path analysis
				nextKey := ""
				if strings.Contains(currUrlSplitPath, "{{") && strings.Contains(currUrlSplitPath, "}}") {
					currRegularPathTree.IsPath = false
					nextKey = "{{}}"
				} else {
					currRegularPathTree.IsPath = true
					nextKey = currUrlSplitPath
				}

				nextItem := &RegularPathTree{}
				if currRegularPathTree.Child == nil {
					currRegularPathTree.Child = map[string]*RegularPathTree{}
				}

				if _, isExit := currRegularPathTree.Child[nextKey]; isExit {
					currRegularPathTree = currRegularPathTree.Child[nextKey]
				} else {
					currRegularPathTree.Child[nextKey] = nextItem
					currRegularPathTree = nextItem
				}
			}
			currRegularPathTree.Value = currRegularPath
		}

		requestMethodApiPathTree[method] = tempRoot
	}

	return nil
}

func urlsToPath(api dto2.Api) (RegularPath, error) {

	srcMeta := placeHolderRegexp.FindAllString(api.SrcUrl, -1)
	desMeta := placeHolderRegexp.FindAllString(api.DesUrl, -1)

	if len(srcMeta) != len(desMeta) {
		return RegularPath{}, errors.New("The parameter count of the two url must be equally!!")
	}

	checkMap := map[string]bool{}
	for _, value := range srcMeta {
		checkMap[value] = true
	}

	for _, value := range desMeta {
		if _, ok := checkMap[value]; ok {
			checkMap[value] = false
		} else {
			checkMap[value] = true
		}
	}

	for key, value := range checkMap {
		if value {
			return RegularPath{}, errors.New(fmt.Sprintf("Parameter %v is mismatching", key))
		}
	}

	path := RegularPath{}
	path.ApiName = api.Name
	path.ApiCode = api.ApiCode
	path.Method = api.Method
	path.ReadTimeout = api.ReadTimeout
	path.Tenants = api.Tenants
	path.Address = api.Address
	path.GrayAddress = api.GrayAddress
	path.URL = placeHolderRegexp.ReplaceAllString(api.SrcUrl, regexpStringUnshell)
	path.SrcURL = api.SrcUrl
	path.DesURL = api.DesUrl
	path.SrcSplitURL = strings.Split(path.SrcURL, "/")
	path.DesSplitURL = strings.Split(path.DesURL, "/")
	path.SrcParams, path.SrcParamsIndex = urlToParamMap(path.SrcURL)
	path.DesParams, path.DesParamsIndex = urlToParamMap(path.DesURL)
	path.ApiId = api.Id
	if api.NeedRateLimit == "Y" {
		path.NeedRateLimit = true
		path.RateLimit = api.RateLimit
	} else {
		path.NeedRateLimit = false
	}
	if api.NeedFallback == "Y" {
		path.NeedFallback = true
		path.Fallback = api.Fallback
	} else {
		path.NeedFallback = false
	}
	if api.NeedMonitor == "Y" {
		path.NeedMonitor = true
	} else {
		path.NeedMonitor = false
	}
	path.Transport = &http.Transport{
		Proxy:                 http.ProxyFromEnvironment,
		ResponseHeaderTimeout: time.Duration(path.ReadTimeout) * time.Millisecond,
		MaxIdleConnsPerHost:   config.GetConfigure().Routing.MaxIdleConnsPerHost,
		MaxIdleConns:          config.GetConfigure().Routing.MaxIdleConns,
		IdleConnTimeout:       time.Duration(config.GetConfigure().Routing.IdleConnTimeout) * time.Millisecond,
		MaxConnsPerHost:       config.GetConfigure().Routing.MaxConnsPerHost,
	}
	log4go.Debug("urlsToPath results: %v", path)
	return path, nil
}

func urlToParamMap(url string) (map[string]int, map[int]string) {
	tempUrl := url
	result := map[string]int{}      // [url,index]
	indexResult := map[int]string{} // [index,url]
	urlMeta := strings.Split(tempUrl, "/")
	params := placeHolderRegexp.FindAllString(tempUrl, -1)
	paramsIndex := 0
	lengthParam := len(params)
	for index, value := range urlMeta {
		if paramsIndex >= lengthParam {
			break
		}
		if strings.EqualFold(value, params[paramsIndex]) {
			result[value] = index
			indexResult[index] = value
			paramsIndex++
		}
	}
	return result, indexResult
}

func CheckURLMatch(url string, method string) *RegularPath {

	requestTreeRoot := requestMethodApiPathTree[method]

	if requestTreeRoot == nil {
		return nil
	}

	tempRoot := requestTreeRoot.Child[""]
	urlMeta := strings.Split(url, "/")[1:]
	for _, urlMetaValue := range urlMeta {
		if tempRoot == nil {
			break
		}
		if _, hasPath := tempRoot.Child[urlMetaValue]; hasPath {
			tempRoot = tempRoot.Child[urlMetaValue]
		} else if _, hasParam := tempRoot.Child["{{}}"]; hasParam {
			tempRoot = tempRoot.Child["{{}}"]
		} else {
			tempRoot = nil
		}
	}

	if tempRoot == nil {
		return nil
	}
	log4go.Debug("tempRoot.Value %v", tempRoot.Value)
	return &tempRoot.Value
}

func GetTranURL(url string, path *RegularPath) (string, error) {

	metaResult := strings.Split(url, "/")
	metaLength := len(metaResult)
	desSplitURL := path.DesSplitURL
	for key, _ := range path.SrcParamsIndex {
		if key < metaLength {
			desSplitURL[path.DesParams[path.SrcParamsIndex[key]]] = metaResult[key]
		} else {
			return "", errors.New(fmt.Sprintf("The index is out of metaResult. Length is %v, index is %v", metaLength, key))
		}
	}
	urlResult := strings.Join(desSplitURL, "/")
	return urlResult, nil
}
