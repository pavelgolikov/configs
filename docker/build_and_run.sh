#!/bin/bash

# Add the package repositories
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

# build the container
docker build . -t ${USER}_cuda_container --build-arg user=$USER --build-arg userid=`id -u`

# run the container
docker run --privileged --gpus=all -dit -e DISPLAY=$DISPLAY -v /home/$USER:/mnt --ipc=host --name pavel_cuda_container ${USER}_cuda_container  
