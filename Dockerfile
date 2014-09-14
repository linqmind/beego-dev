# Develop Go application on Beego Framework
# version 1.0

FROM cloudcube/beego

MAINTAINER net.cloudcube, cloudcube@outlook.com

ENV REFERESH_AT 2014-09-04

USER root

RUN apt-get update  

RUN apt-get install git openssh-server vim ssh telnet zsh tmux -y

RUN echo "export LC_ALL=C" >> /root/.bashrc

RUN chsh -s /usr/bin/zsh

# Install Supervisor.
RUN \
   apt-get install -y supervisor && \
     sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

ADD adds/authorized_keys /authorized_keys

ADD config/config.sh /config.sh

RUN bin/bash /config.sh && rm /config.sh

ADD config/sshd.conf /etc/supervisor/conf.d/sshd.conf

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
WORKDIR /root

RUN mkdir projs/dep/go -p

RUN mkdir projs/go -p

RUN go get -u github.com/jstemmer/gotags

RUN go get -u github.com/nsf/gocode

RUN go get -u code.google.com/p/rog-go/exp/cmd/godef

RUN go get code.google.com/p/go.tools/cmd/goimports

RUN echo $GOPATH

# RUN go get -u github.com/bradfitz/goimports

ENV GOPATH /root/projs/go:$GOPATH

RUN echo $GOPATH

# Add run script 

ADD run.sh /usr/local/bin/run

RUN chmod +x /usr/local/bin/run

EXPOSE 22

CMD ["/bin/zsh","/usr/local/bin/run"]

# CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
