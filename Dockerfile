FROM opensuse/leap:15.4

USER root
WORKDIR /root

# Linux
RUN zypper install -y \
    sudo which tree tmux \
    nano vim \
    tar gzip \
    make git

# Python
ARG PYTHON_VERSION=11
RUN zypper install -y \
    python3${PYTHON_VERSION} \
    python3${PYTHON_VERSION}-pip \
    python3${PYTHON_VERSION}-devel
RUN pip3.${PYTHON_VERSION} install \
    numpy==1.24.3 matplotlib==3.7.1 pandas==2.0.1 jupyter==1.0.0 \
    nuitka patchelf

# C++
ARG GCC_VERSION=10
RUN zypper install -y \
    gcc${GCC_VERSION}-c++ cmake
RUN ln -fs /usr/bin/gcc-${GCC_VERSION} /usr/bin/gcc && \
    ln -fs /usr/bin/gcc /usr/bin/cc && \
    ln -fs /usr/bin/g++-${GCC_VERSION} /usr/bin/g++ && \
    ln -fs /usr/bin/gcov-${GCC_VERSION} /usr/bin/gcov && \
    ldconfig
# C++ - install Boost 1.83.0
RUN curl -L -o boost.tgz https://boostorg.jfrog.io/artifactory/main/release/1.83.0/source/boost_1_83_0.tar.gz && \
    mkdir boost && \
    tar -xf boost.tgz --strip-components=1 -C boost && \
    rm -rf boost.tgz && \
    cd boost && \
    # ./bootstrap.sh && \
    # ./b2 -j `nproc` address-model=64 cxxflags=-DBOOST_DATE_TIME_POSIX_TIME_STD_CONFIG cxxflags=-DBOOST_TEST_ALTERNATIVE_INIT_API cxxflags=-fPIC cxxflags=-std=c++17 link=static variant=release threading=multi runtime-link=shared -d+2 --with-thread --with-serialization --with-date_time --with-filesystem --with-system --with-program_options --with-regex --with-atomic --with-chrono --with-random --with-test cxxflags=-mtune=generic install && \
    cd .. && \
    # rm -rf boost && \
    ldconfig
# C++ - install Blitz
# C++ - install OpenCV

# Add a non-root user
ARG USERNAME="default-user"
RUN useradd -m ${USERNAME}
USER ${USERNAME}
WORKDIR /home/${USERNAME}