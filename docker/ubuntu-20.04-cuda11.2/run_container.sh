name=$1
user=$USER
id=$UID

docker run -it --user $user:$id  -v /home/$user:/home/$user -w /home/$user $name
