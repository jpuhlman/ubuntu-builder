FROM ubuntu:14.04
ENV RELEASE_DISTRO ubuntu
ENV RELEASE_VERSION 14.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y \
    lynx \
    build-essential \
    file \
    cpio \
    diffstat \
    gawk \
    sudo \
    apt-transport-https \
    ca-certificates \    
    curl \
    software-properties-common \
    locales \
    wget \
    chrpath \ 
    vim \
    screen \
    bzr \
    pbuilder \
    debootstrap \
    devscripts \
    ubuntu-dev-tools
RUN apt upgrade -y
RUN apt -y install lib32stdc++6
COPY init.sh /
CMD  bash /init.sh
