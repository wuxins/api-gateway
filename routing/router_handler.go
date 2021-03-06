package routing

import (
	"context"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/regularpath"
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
	Rw          http.ResponseWriter
	Req         *http.Request
	Ctx         context.Context
	RegularPath *regularpath.RegularPath
	*Group
	index int8
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

	router.Group("/ping").Use(func(c *RouterContext) {
		c.Rw.WriteHeader(http.StatusOK)
		c.Rw.Write(common.StringToBytes("pong"))
	})

	router.Group("/").Use(
		AccessControlPlugin(),
		UrlCheckPlugin(),
		TenantCheckPlugin(),
		RateLimiterPlugin(),
		ReverseProxyPlugin())

	return &RouterHandler{
		router,
	}
}
