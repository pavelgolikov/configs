FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
ARG user
ARG userid
RUN echo ${user}
RUN apt-get update && \
apt-get install -y --no-install-recommends \
    sudo \
    gdb \
    git \
    python3-dev \
    python3-numpy \
    python3-pip \
    python-pip \
    tmux \
    wget \
    curl

RUN adduser --home /home/${user} --shell /bin/bash --uid ${userid} --gecos '' --disabled-password ${user}
RUN adduser ${user} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN echo "export CUDA_INSTALL_PATH=/usr/local/cuda" >> /home/${user}/.bashrc
RUN rm -rf /var/lib/apt/lists/*
