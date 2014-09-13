#!/bin/sh
set -e

#USER=${USER:-"root"}
#PASSWD=${PASSWD:-"root"}

#echo $USER

#echo $PASSWD

# exec echo 'root:123456' | chpasswd
# exec echo "root:123456" |chpasswd

#exec /usr/sbin/sshd -D
exec supervisord -c /etc/supervisor/supervisord.conf
