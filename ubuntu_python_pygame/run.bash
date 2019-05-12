#! /bin/bash

docker run \
       --name=python-pygame \
       --tty \
       --detach \
       --restart=always \
       --privileged \
       --net=host \
       --dns=8.8.8.8 \
       --dns=8.8.4.4 \
       --volume="$HOME:$HOME:rw" \
       --workdir="$HOME" \
       --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw \
       --env=DISPLAY --env=QT_X11_NO_MITSHM=1 \
       shixinli/python-pygame
       bash -l > /dev/null
