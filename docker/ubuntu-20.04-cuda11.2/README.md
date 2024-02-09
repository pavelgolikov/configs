# To build the image:

./build.sh <name_of_image>
chmod +w .

# To run the container from the above image:

docker run -it golikovp-ubuntu-20.04

# To leave container without stopping it:

ctrl+p ctrl+q

# To attach back to running:

docker attach <container_name>
