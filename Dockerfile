FROM alpine:latest
LABEL maintainer="Oleks Dovzh oleksdovz@gmail.com"

RUN apk upgrade --no-cache -a --prune
RUN apk add --no-cache socat

ENV SOURCE_PORT=4533
ENV DEST_PORT=4533
ENV DEST_IP=192.168.0.11

CMD sh -cx "socat -d -d  TCP-LISTEN:${SOURCE_PORT},reuseaddr,fork TCP:${DEST_IP}:${DEST_PORT}"