package utils

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/log"
	"net"
	"net/http"
	"strings"
)

func GetIP(r *http.Request) string {

	xForwardedFor := r.Header.Get("X-Forwarded-For")
	ip := strings.TrimSpace(strings.Split(xForwardedFor, common.DelimiterComma)[0])
	if len(ip) <= 0 || strings.ToUpper(ip) == "UNKNOWN" {
		ip = strings.TrimSpace(r.Header.Get("X-Real-Ip"))
		if len(ip) <= 0 || strings.ToUpper(ip) == "UNKNOWN" {
			_ip, _, err := net.SplitHostPort(strings.TrimSpace(r.RemoteAddr))
			if err != nil {
				log.Error("Ip locate fail", err)
			} else {
				ip = _ip
			}
		}
	}
	return ip
}
