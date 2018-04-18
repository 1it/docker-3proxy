# Docker 3Proxy
Docker 3Proxy is a container with socks5 proxy server based on [3proxy](http://www.3proxy.ru/).

## Environment variables:
 - PROXY_LOGIN - login for proxy user (:exclamation:required!)
 - PROXY_PASSWORD - password for proxy user (:exclamation:required!)
 - NS1 - nameserver (1st), default 1.1.1.1
 - NS2 - nameserver (2nd), default 8.8.8.8
 - NSCACHE - DNS Cache, default 65536
 - MAXCONN - max connections limit (maxconn), default 100
 - ALLOWED_IPS - space delimited ips list, like ALLOWED_IPS="10.0.0.1 10.0.0.2"
 - SOCKS_PORT - Socks server listen port, default 3128
 - HTTP_PORT - HTTP server listen port, default 8000

## Usage

### Access by ip
```
docker run -d --name 3proxy-ip \
           -e "ALLOWED_IPS=10.0.0.1 10.0.0.2" \
           -e "HTTP_PORT=8000" \
           -e "SOCKS_PORT=5000" \
           -p 8000:8000 \
           -p 5000:5000 \
            kefirgames/3proxy:latest
```
### Access by user/passwd
```
docker run -d --name 3proxy-pass \
           -e "PROXY_LOGIN=socks5" \
           -e "PROXY_PASSWORD=SomeSockingPasswd"
           -e "HTTP_PORT=8001" \
           -e "SOCKS_PORT=5001" \
           -p 8001:8001 \
           -p 5001:5001 \
            kefirgames/3proxy:latest
```

