#!/usr/bin/env bash
set -e

export CERES_VERSION="1.12.0"
export DEBIAN_FRONTEND=noninteractive

apt-get update --yes
apt-get upgrade --yes

apt-get install --yes \
        libatlas-base-dev \
        libeigen3-dev \
        libgoogle-glog-dev \
        libsuitesparse-dev \
        python-catkin-tools \
        ros-${ROS_DISTRO}-cv-bridge \
        ros-${ROS_DISTRO}-image-transport \
        ros-${ROS_DISTRO}-message-filters \
        ros-${ROS_DISTRO}-tf

# Build and install Ceres
git clone https://ceres-solver.googlesource.com/ceres-solver && \
    cd ceres-solver && \
    git checkout tags/${CERES_VERSION} && \
    mkdir build && cd build && \
    cmake .. && \
    make -j$(USE_PROC) install && \
    rm -rf ../../ceres-solver

# RUN git clone https://github.com/HKUST-Aerial-Robotics/VINS-Mono.git
# Build VINS-Mono
# WORKDIR $CATKIN_WS

# ENV PYTHONIOENCODING UTF-8
# RUN catkin config \
    #       --extend /opt/ros/$ROS_DISTRO \
    #       --cmake-args \
    #         -DCMAKE_BUILD_TYPE=Release && \
    #     catkin build && \
    #     sed -i '/exec "$@"/i \
    #             source "/root/catkin_ws/devel/setup.bash"' /ros_entrypoint.sh
unset DEBIAN_FRONTEND
unset CERES_VERSION
rm -rf /var/lib/apt/lists/*
