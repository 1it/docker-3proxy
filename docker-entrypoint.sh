#!/bin/sh

CONFFILE=/etc/3proxy/3proxy.cfg
BIN=/usr/bin/3proxy

/docker-3proxy.cfg.sh > $CONFFILE

$BIN $CONFFILE
