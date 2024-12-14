FROM opensuse/leap:15.6

USER root
WORKDIR /root

# Linux
RUN zypper install -y \
    sudo \
    which \
    tree \
    tmux \
    nano \
    vim \
    tar \
    gzip \
    make \
    git

# C++
ARG GCC_VERSION=10
RUN zypper install -y \
    gcc${GCC_VERSION}-c++ \
    cmake
RUN ln -fs /usr/bin/gcc-${GCC_VERSION} /usr/bin/gcc && \
    ln -fs /usr/bin/gcc /usr/bin/cc && \
    ln -fs /usr/bin/g++-${GCC_VERSION} /usr/bin/g++ && \
    ln -fs /usr/bin/gcov-${GCC_VERSION} /usr/bin/gcov && \
    ldconfig

# Add a non-root user
ARG DEFAULT_USER="default-user"
RUN useradd -m ${DEFAULT_USER}
USER ${DEFAULT_USER}
WORKDIR /home/${DEFAULT_USER}