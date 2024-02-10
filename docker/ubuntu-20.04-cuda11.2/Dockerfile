FROM nvidia/cuda:11.2.2-runtime-ubuntu20.04
ARG user
ARG userid
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get update && \
apt-get install -y --no-install-recommends \
    sudo \
    software-properties-common \
    gdb \
    gcc-9 \
    g++-9 \
    git \
    python3-dev \
    python3-pip \
    wget \
    curl \
    vim \
    openssh-server \
    libgl1 \
    pkg-config


RUN useradd -ms /bin/bash -u ${userid} ${user}
RUN passwd -d $user
RUN adduser $user sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN sudo add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y --no-install-recommends python3.10
RUN sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 20
RUN sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 20
RUN sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 20
RUN sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 20

