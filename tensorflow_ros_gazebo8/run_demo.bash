#!/usr/bin/env bash

# Runs a docker container with the image created by build_demo.bash
# Requires
#   docker
#   nvidia-docker 
#   an X server
# Recommended
#   A joystick mounted to /dev/input/js0 or /dev/input/js1

# Make sure processes in the container can connect to the x server
# Necessary so gazebo can create a context for OpenGL rendering (even headless)
docker run -it \
  --runtime=nvidia \
  --name person_following \
  --net=host \
  -e DISPLAY=:0 \
  -e QT_X11_NO_MITSHM=1 \
  -v "/tmp/.X11-unix:/tmp/.X11-unix" \
  --privileged \
  tensorflow_ros_gazebo8 \
  bash
