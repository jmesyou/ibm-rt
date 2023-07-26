FROM ubuntu:latest as base

RUN apt -y update \
 && apt -y --no-install-recommends install \
    autoconf \
    make \
    cmake \
    build-essential \
    unzip \
    zip \
    curl \
    file \
    findutils \
    numactl \
    nasm \
    #libraries
    libfreetype6-dev \
    libfontconfig-dev \
    libcups2-dev \
    libx11-dev \
    libxext-dev \
    libxrender-dev \
    libxrandr-dev \
    libxtst-dev \
    libxt-dev \
    libasound2-dev \
    libffi-dev \
    libnuma-dev \
    libdwarf-dev \
    libssl-dev

FROM base as development

SHELL ["/bin/bash", "-c"]

RUN chsh -s /bin/bash

RUN apt install -y --no-install-recommends \
    bear \
    git \
    openssh-client \
    python3 \
    python3-pip \
    sudo

RUN pip3 install --user --no-cache --upgrade pip setuptools

FROM development as user

# sdk manager
RUN curl -s "https://get.sdkman.io" | bash \
 && source "$HOME/.sdkman/bin/sdkman-init.sh" \
 && sdk install java \
 && sdk install ant \
 && sdk install gradle
