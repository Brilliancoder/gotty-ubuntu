FROM ubuntu:22.04


RUN apt-get update
RUN apt-get install -y wget bash curl openssh-client git

RUN wget -qO gotty.tar.gz https://github.com/yudai/gotty/releases/latest/download/gotty_linux_amd64.tar.gz
RUN tar xf gotty.tar.gz -C /usr/local/bin
