cont_name=$1
image_name=$2
user=$USER
id=$UID

docker container create -it --privileged --cap-add=SYS_ADMIN --user $user:$id -v /home/$user:/home/$user -w /home/$user --name $cont_name $image_name
