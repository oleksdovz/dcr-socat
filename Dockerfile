FROM alpine:latest
LABEL maintainer="Oleks Dovzh oleksdovz@gmail.com"

RUN apk update --no-cache && apk upgrade --no-cache -a --prune
RUN apk add --no-cache socat

ENV SOURCE_PORT=4533
ENV DEST_PORT=4533
ENV DEST_IP=192.168.0.11


CMD sh -cx "while true; do socat tcp-listen:${SOURCE_PORT},fork,reuseaddr  tcp-connect:${DEST_IP}:${DEST_PORT},connect-timeout=30,forever,intervall=10 ; done"
