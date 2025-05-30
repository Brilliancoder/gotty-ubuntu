FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y wget bash curl openssh-client git git-lfs nano sudo coreutils openjdk-21-jre iputils-ping && \
    apt-get install -y wget curl vim sudo systemd ifupdown rsyslog logrotate less bash-completion ca-certificates netbase lsb-release apt-utils gnupg2 apt-transport-https ubuntu-keyring && \
    rm -rf /var/lib/apt/lists/*

RUN wget -qO gotty.tar.gz https://github.com/yudai/gotty/releases/latest/download/gotty_linux_amd64.tar.gz && \
    tar xf gotty.tar.gz -C /usr/local/bin && \
    rm -rf gotty.tar.gz

# Create a non-root user
RUN useradd -m user && \
    echo "user:password" | chpasswd && \
    usermod -aG sudo user

# Switch to the user
USER user
WORKDIR /home/user

# Command to run Gotty (listening on port 8080 and running bash shell)
CMD ["gotty", "--permit-arguments", "--title-format", "Gotty in Docker", "bash"]
