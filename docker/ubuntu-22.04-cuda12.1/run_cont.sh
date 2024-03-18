name=$1
# to install nsight-systems and nsight compute run inside the container:
# wget --user=pavel.golikov@alum.utoronto.ca --ask-password https://developer.nvidia.com/downloads/assets/tools/secure/nsight-systems/2024_1/nsightsystems-linux-public-2024.1.1.59-3380207.run
# wget --user=pavel.golikov@alum.utoronto.ca --ask-password https://developer.nvidia.com/downloads/assets/tools/secure/nsight-compute/2024_1_0/nsight-compute-linux-2024.1.0.13-33681293.run

# on yubo's machine
docker run --ipc=host --ulimit memlock=-1 --shm-size=20g --privileged --gpus all -v /home/golikovp/:/home/root/ --entrypoint /bin/bash -it $name

# on other machines
# docker run --ipc=host --ulimit memlock=-1 --shm-size=20g --runtime=nvidia --privileged --gpus all -v /home/golikovp/:/home/root/ --entrypoint /bin/bash -it $name
