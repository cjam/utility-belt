#!/bin/bash
IMAGE_NAME=cjam/gnuradio-dev:latest
SOURCE_DIR=/src

docker run -v `pwd`:$SOURCE_DIR -w $SOURCE_DIR -t -i $IMAGE_NAME $@
