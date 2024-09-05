#!/bin/bash

IMG_NAME=acd-hw
USERNAME=$(id -un)
script_dir=$(realpath $(dirname $0))

# zip scripts to a single file for image building
zip -r scripts.zip scripts

docker build -t $IMG_NAME \
             --build-arg USERNAME="${USERNAME}" \
             .

docker run -d -it \
           -v ./data:/home/${USERNAME}/data \
           ${IMG_NAME} bash

# remove ghenerated zip file
rm scripts.zip