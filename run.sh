#!/bin/sh
set -e

#USER=${USER:-"root"}
#PASSWD=${PASSWD:-"root"}
chmod u+x /root/repos/install-gorc.sh

exec sh /root/repos/install-gorc.sh


exec supervisord -c /etc/supervisor/supervisord.conf
