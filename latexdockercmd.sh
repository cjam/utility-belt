#!/bin/sh
IMAGE=blang/latex:ctanfull
echo "Executing latex from docker with args $@"
exec docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data "$IMAGE" "$@"
echo "Finsihed"
