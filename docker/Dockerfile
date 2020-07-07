FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
ARG user
ARG userid
RUN echo ${user}
RUN apt-get update && \
apt-get install -y --no-install-recommends \
    sudo \
    software-properties-common \
    gdb \
    gcc-8 \
    g++-8 \
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

RUN sudo add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y --no-install-recommends python3.8
RUN sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 20
RUN sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 20
RUN sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 20
