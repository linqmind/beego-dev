# Develop Go application on Beego Framework
# version 1.0

FROM cloudcube/beego

MAINTAINER net.cloudcube, cloudcube@outlook.com

USER root

RUN apt-get update  

RUN apt-get install git openssh-server vim ssh telnet zsh tmux -y

RUN mkdir /root/repos -p

WORKDIR /root/repos

# Clone Develop Tool Vim for golang
RUN git clone https://github.com/haibinpark/gorc.git devrc

WORKDIR /root/repos/devrc

RUN git checkout -b golang origin/golang

RUN git submodule update --init --recursive

RUN git submodule foreach git pull origin master

RUN sh install-gorc.sh

# Install go plugin

RUN go get -u github.com/jstemmer/gotags

RUN go get -u github.com/nsf/gocode

RUN go get -u code.google.com/p/rog-go/exp/cmd/godef

RUN go get -u github.com/bradfitz/goimports

WORKDIR /root

# Add run script 
ADD run.sh /usr/local/bin/run

RUN chmod +x /usr/local/bin/run

EXPOSE 22

CMD ["/usr/local/bin/run"]

