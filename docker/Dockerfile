FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
MAINTAINER Golikov Pavel <golikovp@cs.toronto.edu>


RUN apt-get update && apt-get install -y \
    sudo \
    python3 \
    python3-pip \
    git \
    vim \
    tmux \
&& rm -rf /var/lib/apt/lists/*

