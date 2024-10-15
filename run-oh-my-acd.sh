#!/bin/bash

IMG_NAME=oh-my-acd-hw2

sudo docker container rm -f ${IMG_NAME}

BASE_IMG=ubuntu:22.04 \
IMG_NAME=${IMG_NAME} \
CUSTOM_SCRIPTS_PATH=container \
USE_SYSTEMD=no \
LOCALE=zh_TW.UTF-8 \
TZ=Asia/Taipei \
USE_OMZ=yes \
OMS_MODE=br \
    oh-my-scripts/run.sh