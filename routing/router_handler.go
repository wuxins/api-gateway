package routing

import (
	"context"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/regularpath"
	"github.com/wuxins/api-gateway/utils"
	"math"
	"net/http"
	"strings"
)

// 63 plugins
const abortIndex int8 = math.MaxInt8 / 2

type PluginHandler func(*RouterContext)

type Router struct {
	groups []*Group
}

type Group struct {
	*Router
	path     string
	handlers []PluginHandler
}

type RouterContext struct {
	Rw  http.ResponseWriter
	Req *http.Request
	Ctx context.Context
	*Group
	index                  int8
	RegularPath            *regularpath.RegularPath
	RequestId              string
	RequestTime            string
	RequestUpstreamAddress string
}

func (c *RouterContext) Get(key interface{}) interface{} {
	return c.Ctx.Value(key)
}

func (c *RouterContext) Set(key, val interface{}) {
	c.Ctx = context.WithValue(c.Ctx, key, val)
}

func NewRouterContext(rw http.ResponseWriter, req *http.Request, r *Router) *RouterContext {
	newSliceGroup := &Group{}
	matchUrlLen := 0
	for _, group := range r.groups {
		if strings.HasPrefix(req.RequestURI, group.path) {
			pathLen := len(group.path)
			if pathLen > matchUrlLen {
				matchUrlLen = pathLen
				*newSliceGroup = *group
			}
		}
	}

	c := &RouterContext{Rw: rw, Req: req, Group: newSliceGroup, Ctx: req.Context()}
	c.Reset()
	return c
}

type RouterHandler struct {
	router *Router
}

func (w *RouterHandler) ServeHTTP(rw http.ResponseWriter, req *http.Request) {
	c := NewRouterContext(rw, req, w.router)
	c.Reset()
	c.Next()
}

func NewRouter() *Router {
	return &Router{}
}

func (g *Router) Group(path string) *Group {
	return &Group{
		Router: g,
		path:   path,
	}
}

func (g *Group) Use(handlers ...PluginHandler) *Group {
	g.handlers = append(g.handlers, handlers...)
	existsFlag := false
	for _, oldGroup := range g.Router.groups {
		if oldGroup == g {
			existsFlag = true
		}
	}
	if !existsFlag {
		g.Router.groups = append(g.Router.groups, g)
	}
	return g
}

func (c *RouterContext) Next() {
	c.index++
	for c.index < int8(len(c.handlers)) {
		c.handlers[c.index](c)
		c.index++
	}
}

func (c *RouterContext) Abort() {
	c.index = abortIndex
}

func (c *RouterContext) Reset() {
	c.index = -1
}

func NewRouterHandler() *RouterHandler {

	router := NewRouter()

	// heartbeat endpoint
	router.Group("/ping").Use(func(routerContext *RouterContext) {
		routerContext.Rw.WriteHeader(http.StatusOK)
		_, _ = routerContext.Rw.Write(common.StringToBytes(common.HeartbeatMsg))
		routerContext.Abort()
		return
	})

	// oauth2.0 token endpoint
	router.Group("/oauth/tokens").Use(
		AccessControlPlugin(),
		OauthTokenPlugin())

	// reverse proxy router
	router.Group("/").Use(
		AccessControlPlugin(),
		UrlCheckPlugin(),
		TenantCheckPlugin(),
		RateLimiterPlugin(),
		FallbackPlugin(),
		IgnoreParamsPlugin(),
		GrayStrategyPlugin(),
		BreakerProxyPlugin())

	return &RouterHandler{
		router,
	}
}

func success(c *RouterContext, data string) {
	utils.WriteHttpResponse(c.Rw, http.StatusOK, data, c.RequestId, c.RequestTime, c.Req, false)
	c.Abort()
}

func fail(c *RouterContext, status int, data string) {
	utils.WriteHttpResponse(c.Rw, status, data, c.RequestId, c.RequestTime, c.Req, true)
	c.Abort()
}
