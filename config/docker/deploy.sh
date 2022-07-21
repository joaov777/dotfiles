#!/bin/bash

SCRIPT_FILE=$(readlink -f "$0") # script absolute path
SCRIPT_DIR=$(dirname "$SCRIPT_FILE") # script directory
PROJECT_DIR=$(dirname $(dirname $SCRIPT_DIR)) #
CONTAINER_NAME="dotfiles_container"
IMAGE_NAME="dotfiles_image"

# Uncomment this line for debugging
echo -e "$SCRIPT_FILE\n$SCRIPT_DIR\n$PROJECT_DIR\n$CONTAINER_NAME" 

# retrieve all local container names
CONTAINER=$(docker ps -f name=$CONTAINER_NAME --format "{{.Names}}")
echo $CONTAINER && sleep 10

# delete potential existing container
[ $CONTAINER ] && docker rm -f $CONTAINER_NAME

echo "--- Building image..."
docker build -t "$IMAGE_NAME" -f Dockerfile .

echo "--- Building container..."
docker run --rm -it --name "$CONTAINER_NAME" -v $:/home/joao/dotfiles "$IMAGE_NAME"

