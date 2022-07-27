package routing

func LoadBalancePlugin() func(c *RouterContext) {

	return func(c *RouterContext) {
		c.Next()
	}
}
