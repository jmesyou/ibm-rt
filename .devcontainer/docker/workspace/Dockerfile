FROM rockylinux:9 as base

RUN dnf upgrade -y \
 && dnf install -y dnf-plugins-core epel-release \
 && dnf config-manager --set-enabled crb \
 && dnf upgrade -y \
 && dnf group install -y --with-optional \
    "Development Tools"

RUN dnf install -y \
    alsa-lib-devel \
    cups-devel \
    freetype-devel \
    fontconfig-devel \
    libstdc++-static \
    libdwarf-devel \
    libffi-devel \
    libXtst-devel libXt-devel libXrender-devel libXrandr-devel libXi-devel \
    nasm \
    numactl-devel \
    openmpi-devel \
    openssl-devel \
    util-linux-user

FROM base as development

SHELL ["/bin/bash", "-c"]

RUN chsh -s /bin/bash

RUN dnf install -y \
    findutils \
    git \
    openssh \
    sudo

RUN python3 -m ensurepip \
 && pip3 install --no-cache --upgrade pip setuptools

FROM development as user


ENV EXPORT_COMPILE_COMMANDS=1
# sdk manager
RUN curl -s "https://get.sdkman.io" | bash \
 && source "$HOME/.sdkman/bin/sdkman-init.sh" \
 && sdk install java \
 && sdk install ant \
 && sdk install gradle
