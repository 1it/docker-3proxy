#!/bin/sh

if [ "$PROXY_LOGIN" ] || [ "$PROXY_PASSWORD" ]; then
cat <<END
nserver ${NS1:-1.1.1.1}
nserver ${NS2:-8.8.8.8}
nscache ${NSCACHE:-65536}
log /dev/stdout
logformat "L%Y-%m-%d %H:%M:%S %z %N.%p %E %U %C:%c %R:%r %O %I %h %T"
users $PROXY_LOGIN:CL:$PROXY_PASSWORD
auth strong
maxconn ${MAXCONN:-100}
socks -p${SOCKS_PORT:-3128}
proxy -p${HTTP_PORT:-8000}
flush
END
fi

if [ "$ALLOWED_IPS" ]; then
cat <<END
nserver ${NS1:-1.1.1.1}
nserver ${NS2:-8.8.8.8}
nscache ${NSCACHE:-65536}
log /dev/stdout
logformat "L%Y-%m-%d %H:%M:%S %z %N.%p %E %U %C:%c %R:%r %O %I %h %T"
auth iponly
END
for ip in $ALLOWED_IPS
do
echo "allow * $ip"
done
cat <<END
maxconn ${MAXCONN:-100}
socks -p${SOCKS_PORT:-3128}
proxy -p${HTTP_PORT:-8000}
flush
END
fi

$BIN $CONFFILE
