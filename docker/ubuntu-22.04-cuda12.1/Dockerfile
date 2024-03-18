FROM nvidia/cuda:12.1.0-devel-ubuntu22.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    openmpi-bin \
    libopenmpi-dev \
    git \
    wget \
    curl \
    vim \
    git-lfs

RUN pip3 install tensorrt_llm -U --pre --extra-index-url https://pypi.nvidia.com &&\
    pip3 install mpmath==1.3.0 &&\
    
