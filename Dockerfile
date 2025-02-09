# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Disable interactive dialogs during package installs
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install required packages:
# build-essential, clang, gdb, radare2, ltrace, strace, git, curl, ropper, nasm, python3, pip, binutils, libssl-dev, libffi-dev
RUN apt-get update && apt-get install -y \
    build-essential \
    vim \
    file \
    ncat \
    socat \
    ltrace \
    strace \
    binwalk \
    gcc \
    g++ \
    gcc-multilib \
    g++-multilib \
    make \
    cmake \
    clang \
    gdb \
    radare2 \
    ltrace \
    strace \
    git \
    curl \
    wget \
    nasm \
    python3 \
    python3-pip \
    binutils \
    net-tools \
    iputils-ping \
    libssl-dev \
    libffi-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Install pwntools (popular for CTF exploitation)
RUN pip3 install --break-system-packages --no-cache-dir \
    pwntools \
    ropper \
    ropgadget \
    z3-solver \
    angr \
    capstone \
    unicorn \
    keystone-engine \
    one_gadget

# Install pwndbg for enhanced GDB debugging for pwn challenges
RUN git clone --depth 1 https://github.com/pwndbg/pwndbg.git /opt/pwndbg \
    && cd /opt/pwndbg && ./setup.sh

# Set the working directory to /pwn
WORKDIR /pwn

# Launch bash when the container starts
CMD ["/bin/bash"]

