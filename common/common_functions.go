package common

import (
	"bytes"
	"compress/gzip"
	"errors"
	"github.com/dgrijalva/jwt-go"
	"time"

	"github.com/gitstliu/log4go"
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
		log4go.Error("Run time Error %v", r)
		panic(r)
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

func JwtDecode(tokenString string) (*jwt.StandardClaims, error) {
	token, err := jwt.ParseWithClaims(tokenString, &jwt.StandardClaims{}, func(token *jwt.Token) (interface{}, error) {
		return []byte(JwtSignKey), nil
	})
	if err != nil {
		return nil, err
	}
	if claims, ok := token.Claims.(*jwt.StandardClaims); ok {
		return claims, nil
	} else {
		return nil, errors.New("token is not jwt.StandardClaims")
	}
}

func JwtEncode(claims jwt.StandardClaims) (string, error) {
	mySigningKey := []byte(JwtSignKey)
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString(mySigningKey)
}
