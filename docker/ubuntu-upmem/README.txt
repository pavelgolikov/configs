To build the image, run:

docker build --docker build -t golikovp-ubuntu-20.04 --build-arg user=golikovp --build-arg userid=1000 .

To run the container from the above image:

docker run -it golikovp-ubuntu-20.04

To leave container without stopping it:

ctrl+p ctrl+q

To attach back to running:

docker attach <container_name>

