package common

import (
	"bytes"
	"compress/gzip"
	"errors"
	"github.com/dgrijalva/jwt-go"
	"github.com/wuxins/api-gateway/log"
	"strings"
	"time"
)

type TimeSpan struct {
	startNS int64
	endNS   int64
}

type NodeToRecord interface {
	ToRecord() string
}

func PanicHandler() {
	if r := recover(); r != nil {
		log.Fatal("Run time Error")
	}
}

func (this *TimeSpan) Start() {
	this.startNS = time.Now().UnixNano()
}

func (this *TimeSpan) End() {
	this.endNS = time.Now().UnixNano()
}

func (this *TimeSpan) GetTimeSpanMS() float64 {

	return float64(this.endNS-this.startNS) / 1000000
}

func InterfacesToStrings(src []interface{}) []string {
	result := []string{}
	for _, value := range src {
		result = append(result, value.(string))
	}
	return result
}

func EncodeGzipBytes(meta []byte) []byte {
	b := bytes.Buffer{}
	w := gzip.NewWriter(&b)
	defer w.Close()

	w.Write(meta)
	w.Flush()

	return b.Bytes()
}

func StringToBytes(value string) []byte {
	return []byte(value)
}

func ContainsStr(items []string, item string) bool {
	for _, eachItem := range items {
		if eachItem == item {
			return true
		}
	}
	return false
}

// UnixMilliseconds go support millisecond function until go 1.17+
//
//	func (t Time) UnixMilli() int64 {
//		return t.unixSec()*1e3 + int64(t.nsec())/1e6
//	}
//	func (t Time) UnixNano() int64 {
//		return (t.unixSec())*1e9 + int64(t.nsec())
//	}
//
// (t.unixSec())*1e9 + int64(t.nsec()) / 1e6 = t.unixSec()*1e3 + int64(t.nsec())/1e6
func UnixMilliseconds(t time.Time) int64 {
	return t.UnixNano() / 1e6
}

func JwtDecode(tokenString string, signKey string) (*jwt.StandardClaims, error) {

	if strings.TrimSpace(signKey) == DelimiterEmpty {
		signKey = JwtSignKey
	}

	token, err := jwt.ParseWithClaims(tokenString, &jwt.StandardClaims{}, func(token *jwt.Token) (interface{}, error) {
		return []byte(signKey), nil
	})

	if token != nil {
		if claims, ok := token.Claims.(*jwt.StandardClaims); ok {
			return claims, nil
		}
		return nil, errors.New("token is not jwt.StandardClaims")
	}
	return nil, err
}

func JwtEncode(claims jwt.StandardClaims, signKey string, signMethod string) (string, error) {

	if strings.TrimSpace(signKey) == DelimiterEmpty {
		signKey = JwtSignKey
	}

	var token *jwt.Token
	if signMethod == "HS256" {
		token = jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	} else if signMethod == "HS512" {
		token = jwt.NewWithClaims(jwt.SigningMethodHS512, claims)
	} else if signMethod == "HS384" {
		token = jwt.NewWithClaims(jwt.SigningMethodHS384, claims)
	} else {
		return DelimiterEmpty, errors.New("Unsupported sign method ")
	}

	return token.SignedString([]byte(signKey))
}
