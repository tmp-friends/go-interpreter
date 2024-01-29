FROM golang:1.19-alpine

USER root
ENV TZ=Asia/Tokyo \
  LANG=ja_JP.UTF-8

ARG uid
ARG gid
ARG user

RUN adduser -u $uid -g $gid -D $user \
  && chown -R $user:$user /go \
  && chmod -R 0755 /go \
  && install -m 0755 -o $user -g $user -d /go/go-interpreter \
  && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apk update \
  && apk add git \
  && go install github.com/cosmtrek/air@latest \
  && go install golang.org/x/tools/gopls@latest

USER $user

WORKDIR /go/go-interpreter
