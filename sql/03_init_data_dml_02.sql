INSERT INTO api_gateway.tenant_env (tenant_code, env, access_control_content, need_api_auth, api_auth_content)
VALUES ('bling', 'dev', '{
	"AllowOrigin": "*",
	"AllowMethods": "POST, GET, OPTIONS, PUT, DELETE",
	"AllowHeaders": "G-tenant,channel,agentChannel,token,did,lang,securityToken,deviceRam,userToken"
}', 'Y', '{
	"ApiAuthType": "0",
	"Secret": "123456",
	"TokenSignKey": "hello world",
	"TokenSignMethod": "HS256",
	"TokenExpireIn": 1800,
	"TokenExpireReturnCode": 40003
}'),
       ('bling', 'test', '{
	"AllowOrigin": "*",
	"AllowMethods": "POST, GET, OPTIONS, PUT, DELETE",
	"AllowHeaders": "G-tenant,channel,agentChannel,token,did,lang,securityToken,deviceRam,userToken"
}', 'Y', '{
	"ApiAuthType": "0",
	"Secret": "123456",
	"TokenSignKey": "hello world",
	"TokenSignMethod": "HS256",
	"TokenExpireIn": 1800,
	"TokenExpireReturnCode": 40003
}'),
       ('website', 'dev', '{
	"AllowOrigin": "*",
	"AllowMethods": "POST, GET, OPTIONS, PUT, DELETE",
	"AllowHeaders": "G-tenant,channel,agentChannel,token,did,lang,securityToken,deviceRam,userToken"
}', 'N', null),
       ('website', 'test', '{
	"AllowOrigin": "*",
	"AllowMethods": "POST, GET, OPTIONS, PUT, DELETE",
	"AllowHeaders": "G-tenant,channel,agentChannel,token,did,lang,securityToken,deviceRam,userToken"
}', 'N', null),
       ('agent', 'dev', null, 'Y', null),
       ('agent', 'test', null, 'Y', null);

INSERT INTO api_gateway.upstream_service_env (service_code, env, address, need_gray, gray_content)
VALUES ('life-policy', 'dev', 'http://localhost:6666', 'Y', '{
	"Enable": true,
	"Address": "http://localhost:5555",
	"ScaleRelease": {
		"Enable": true,
		"Percent": 80
	},
	"FeatureRelease": {
		"Enable": true,
		"Headers": {
			"G-Gray-Tag": "Y",
			"did": "12222,311111,22222"
		}
	}
}'),
       ('life-policy', 'test', 'http://localhost:6666', 'Y', '{
	"Enable": false,
	"Address": "http://localhost:5555",
	"ScaleRelease": {
		"Enable": false,
		"Percent": 80
	},
	"FeatureRelease": {
		"Enable": false,
		"Headers": {
			"G-Gray-Tag": "Y",
			"did": "12222,311111,22222"
		}
	}
}'),
       ('life-order', 'dev', 'http://localhost:6666', 'Y', null),
       ('life-order', 'test', 'http://localhost:6666', 'Y', null);