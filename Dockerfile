FROM alpine:latest
LABEL maintainer="Oleks Dovzh oleksdovz@gmail.com"

RUN apk upgrade --no-cache -a --prune
RUN apk add --no-cache socat

ENV SOURCE_PORT=4533
ENV DEST_PORT=4533
ENV DEST_IP=192.168.0.11


CMD sh -cx "socat tcp-listen:${SOURCE_PORT},fork,reuseaddr tcp-connect:${DEST_IP}:${DEST_PORT}"
