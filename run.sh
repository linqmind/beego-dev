#!/bin/sh
set -e

# USER=${USER:-"root"}
# PASSWD=${PASSWD:-"root"}
exec supervisord -c /etc/supervisor/supervisord.conf
chmod u+x /root/repos/devrc/install-gorc.sh
exec /usr/bin/zsh /root/repos/devrc/install-gorc.sh
echo "hello,world"
