#!/usr/bin/zsh
# exec sh /root/repos/devrc/install-gorc.sh

if [ ! -d deps ]; then
    mkdir deps
fi
TOOLSPATH=`pwd`/deps
if [ ! -d proj ]; then
    mkdir proj
fi
PROJ=`pwd`/proj
GOPATH=$PROJ:$TOOLSPATH:/gopath:$GOPATH
PATH=${GOPATH//://bin:}/bin:~/.bin:$PATH
