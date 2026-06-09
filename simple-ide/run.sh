docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -e XAUTHORITY=/tmp/.Xauthority \
    -v $XAUTHORITY:/tmp/.Xauthority:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    --device /dev/dri \
    --net=host \
    simpleide