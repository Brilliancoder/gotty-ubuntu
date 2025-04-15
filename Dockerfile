FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y wget bash curl openssh-client git sudo coreutils openjdk-21-jre iputils-ping
RUN apt-get install -y wget curl vim sudo systemd ifupdown rsyslog logrotate less bash-completion ca-certificates netbase lsb-release apt-utils gnupg2 apt-transport-https ubuntu-keyring

RUN wget -qO gotty.tar.gz https://github.com/yudai/gotty/releases/latest/download/gotty_linux_amd64.tar.gz
RUN tar xf gotty.tar.gz -C /usr/local/bin

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu
USER ubuntu
WORKDIR /home/ubuntu
