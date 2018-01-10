# 3proxy docker
# VERSION               0.3

FROM alpine:latest
MAINTAINER Riftbit ErgoZ <ergozru@riftbit.com>

ARG PROXY_VERSION=0.8.11

RUN DIR=$(mktemp -d) && cd ${DIR} && \
    apk add --update alpine-sdk wget bash && \
    wget -q http://3proxy.ru/${PROXY_VERSION}/3proxy-${PROXY_VERSION}.tgz && \
    tar -xf 3proxy-${PROXY_VERSION}.tgz && \
    cd 3proxy && \
    make -f Makefile.Linux && \
    mkdir -p /etc/3proxy/log && \
    cd src && mv 3proxy /etc/3proxy/ && \
    chmod -R 777 /etc/3proxy && \
    cd / && rm -rf ${DIR} && \
    apk del alpine-sdk wget && \
    rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

VOLUME ["/etc/3proxy/log"]

EXPOSE 3128:3128/tcp

CMD ["start_proxy"]
