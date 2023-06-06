package routing

func FallbackPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		if c.RegularPath.NeedFallback {
			success(c, c.RegularPath.Fallback)
			return
		}

		c.Next()
	}
}
