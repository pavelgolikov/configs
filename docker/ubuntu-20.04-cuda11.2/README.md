# Build the image:

./build.sh <name_of_image>

# Create container

./create_cont.sh <container_name>, <image_name>

# Start container and attach

./start_attach.sh <container_name>

# Leave container without stopping it:

ctrl+p ctrl+q

# To attach back to running:

docker attach <container_name>
