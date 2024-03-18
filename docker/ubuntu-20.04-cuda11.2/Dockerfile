FROM nvidia/cuda:11.4.3-runtime-ubuntu20.04
ARG user
ARG userid
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get update && apt-get install -y \
    software-properties-common \
    sudo \
    gdb \
    gcc-9 \
    g++-9 \
    git \
    wget \
    curl \
    vim \
    openssh-server \
    libgl1 \
    pkg-config


RUN useradd -ms /bin/bash -u ${userid} ${user} &&\
    passwd -d $user &&\
    adduser $user sudo &&\
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers &&\
    sudo add-apt-repository -y ppa:deadsnakes/ppa &&\
    apt-get update && apt-get install -y python3.10 python3-pip &&\
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 20 &&\
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 20 &&\
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 20 &&\
    sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 20 &&\
    wget nsightsystems-linux-public-2024.1.1.59-3380207.run &&\
    sudo sh nsightsystems-linux-public-2024.1.1.59-3380207.run