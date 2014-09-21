#!/bin/zsh
set -e

PROJ_NAME=${PROJ_NAME:-"demo"}

echo $PROJ_NAME

if [ ! -d $PROJ_NAME ] ;then
   mkdir $PROJ_NAME -p
fi

sudo chsh -s /usr/bin/zsh

mv /beego-dev/tmp/env.sh $PROJ_NAME/

mv /beego-dev/tmp/link.sh $PROJ_NAME/

exec supervisord -c /etc/supervisor/supervisord.conf
