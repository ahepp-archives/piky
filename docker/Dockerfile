FROM debian:buster-slim

RUN dpkg-reconfigure debconf -f noninteractive -p critical

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    ca-certificates \
    chrpath \
    cpio \
    diffstat \
    file \
    gawk \
    git \
    libncurses5-dev \
    locales \
    python3-distutils \
    ssh \
    texinfo \
    wget


RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN groupadd -g 1000 dev \
    && useradd -m -u 1000 -g dev dev
    
USER dev
WORKDIR /ws
