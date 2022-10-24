FROM ubuntu:20.04
ARG user
ARG userid
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
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
    wget \
    curl \
    vim

RUN useradd -ms /bin/bash -u ${userid} ${user}
RUN passwd -d $user
RUN adduser $user sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN sudo add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y --no-install-recommends python3.8
RUN sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 20
RUN sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 20
RUN sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 20
RUN sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 20

