package dto

type TokensRequest struct {
	GrantType string `json:"grant_type" form:"grant_type"`
	Scope     string `json:"scope" form:"scope"`
}

type TokensResponse struct {
	AccessToken string `json:"access_token" form:"access_token"`
	ExpiresIn   int    `json:"expires_in" form:"expires_in"`
	TokenType   string `json:"token_type" form:"token_type"`
	Scope       string `json:"scope" form:"scope"`
}
