FROM opensuse/leap:15.4

USER root
WORKDIR /root

# Linux
RUN zypper install -y \
    sudo which tree tmux \
    nano vim \
    tar gzip \
    make git

# C++
ARG GCC_VERSION=10
RUN zypper install -y \
    gcc${GCC_VERSION}-c++ cmake
RUN ln -fs /usr/bin/gcc-${GCC_VERSION} /usr/bin/gcc && \
    ln -fs /usr/bin/gcc /usr/bin/cc && \
    ln -fs /usr/bin/g++-${GCC_VERSION} /usr/bin/g++ && \
    ln -fs /usr/bin/gcov-${GCC_VERSION} /usr/bin/gcov && \
    ldconfig

# Python
ARG PYTHON_VERSION=11
RUN zypper install -y \
    python3${PYTHON_VERSION} \
    python3${PYTHON_VERSION}-pip \
    python3${PYTHON_VERSION}-devel
RUN pip3.${PYTHON_VERSION} install \
    numpy==1.24.3 matplotlib==3.7.1 pandas==2.0.1 jupyter==1.0.0 \
    nuitka patchelf

# Add a non-root user
ARG USERNAME="default-user"
RUN useradd -m ${USERNAME}
USER ${USERNAME}
WORKDIR /home/${USERNAME}