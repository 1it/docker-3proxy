FROM alpine:edge

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing 3proxy

COPY docker-entrypoint.sh /
COPY docker-3proxy.cfg.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

