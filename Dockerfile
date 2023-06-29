# Set the base image to Ubuntu 18.04 with cuda 10.2 and cudnn 8 
FROM nvidia/cuda:10.2-cudnn8-runtime-ubuntu18.04

# Set environment variables to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install required packages
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libssl-dev \
    uuid-dev \
    libgpgme11-dev \
    squashfs-tools \
    libseccomp-dev \
    wget \
    pkg-config \
    git \
    cryptsetup-bin

# Install Go
ENV GO_VERSION=1.16.9
RUN wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    rm go${GO_VERSION}.linux-amd64.tar.gz

# Add Go to PATH
ENV PATH=$PATH:/usr/local/go/bin

# Install Singularity
ENV SINGULARITY_VERSION=3.7.0
RUN git clone https://github.com/sylabs/singularity.git && \
    cd singularity && \
    git checkout v${SINGULARITY_VERSION} && \
    ./mconfig && \
    cd ./builddir && \
    make && \
    make install && \ 
    rm -rf /singularity && \
    rm -rf /var/lib/apt/lists/*

# set workdir 
ENV WORKDIR=/root/workspace 

WORKDIR $WORKDIR

# Set the default command
CMD ["/bin/bash"]
