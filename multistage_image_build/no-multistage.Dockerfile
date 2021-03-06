FROM golang:1.11-alpine

RUN apk update && apk upgrade && apk add --no-cache git nodejs bash npm

RUN go get -u github.com/jteeuwen/go-bindata/...
RUN go get github.com/tools/godep

WORKDIR /go/src/github.com/kubernetes-up-and-running/kuard

COPY . .

ENV VERBOSE=0
ENV PKG=github.com/kubernetes-up-and-running/kuard
ENV ARCH=amd64
ENV VERSION=test

RUN build/build.sh
CMD ["/go/bin/kuard"]
