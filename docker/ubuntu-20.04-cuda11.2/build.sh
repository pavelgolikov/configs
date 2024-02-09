name=$1
user=$USER
id=$UID

docker build -t $name --build-arg user=$user --build-arg userid=$id .
