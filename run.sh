#!/bin/sh
set -e

#USER=${USER:-"root"}
#PASSWD=${PASSWD:-"root"}
chmod u+x /root/repos/devrc/install-gorc.sh
cd /root/repos/devrc
exec sh /root/repos/devrc/install-gorc.sh


exec supervisord -c /etc/supervisor/supervisord.conf
