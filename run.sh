#!/bin/sh
sed -e

USER=${USER:-"root"}
PASSWD=${PASSWD:-"root"}

echo ${USER}:${PASSWD} |chpasswd

exec /usr/sbin/sshd -D