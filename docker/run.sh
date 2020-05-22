docker run --privileged --gpus=all -dit -e DISPLAY=$DISPLAY -v /home/$USER:/home/$USER --ipc=host --name pavel_cuda_container ${USER}_cuda_container  
