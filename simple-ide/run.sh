#!/bin/sh

contents=$(realpath $1)
if [ -e $contents ]; then
    docker run -it --rm \
        -e DISPLAY=$DISPLAY \
        -e XAUTHORITY=/tmp/.Xauthority \
        -v $XAUTHORITY:/tmp/.Xauthority:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
        -v $1:/home/app/contents \
        --device /dev/dri \
        --net=host \
        simpleide
else
    echo "$contents DOES NOT EXIST!"
fi