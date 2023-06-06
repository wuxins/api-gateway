FROM golang:1.20 As build
WORKDIR /project/
COPY . /project
RUN go env -w GOPROXY=https://goproxy.io,direct
RUN go env -w GO111MODULE=on
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app main.go

FROM alpine
ENV TZ Asia/Shanghai
COPY --from=build /project/app /project/app
ADD config.toml /project/
ADD log.xml /project/

WORKDIR /project
ENTRYPOINT  ["./app"]
