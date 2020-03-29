#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive
apt-get update --yes
apt-get upgrade --yes

apt-get install --yes \
        build-essential \
        cmake \
        git \
        pkg-config \
        libjpeg8-dev \
        libtiff5-dev \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev \
        libv4l-dev \
        libx264-dev \
        libx265-dev \
        libatlas-base-dev \
        gfortran \
        python3-dev \
        python-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        wget \
        unzip \
        python3-pip \
        python-pip \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libsnappy-dev \
        yasm \
        libgtk2.0-dev

apt -y remove x264 libx264-dev

# https://www.learnopencv.com/install-opencv-3-4-4-on-ubuntu-18-04/
apt -y install build-essential checkinstall cmake pkg-config yasm
apt -y install git gfortran
apt -y install libjpeg8-dev libpng-dev

apt -y install software-properties-common
add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
apt -y update

apt -y install libjasper1
apt -y install libtiff-dev

apt -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
apt -y install libxine2-dev libv4l-dev
cd /usr/include/linux
ln -s -f ../libv4l1-videodev.h videodev.h
cd "$cwd"

sudo apt -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt -y install libgtk2.0-dev libtbb-dev qt5-default
sudo apt -y install libatlas-base-dev
sudo apt -y install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt -y install libvorbis-dev libxvidcore-dev
sudo apt -y install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt -y install libavresample-dev
sudo apt -y install x264 v4l-utils

# Optional dependencies
sudo apt -y install libprotobuf-dev protobuf-compiler
sudo apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

## Install Python lib
python3 -m pip install pip --upgrade
python3 -m pip install numpy scipy protobuf
python -m pip install pip --upgrade
python -m pip install numpy scipy protobuf

unset DEBIAN_FRONTEND
rm -rf /var/lib/apt/lists/*

# Install opencv
OPENCV_INSTALL_FILES=/root/install_opencv
mkdir -p $OPENCV_INSTALL_FILES

cd $OPENCV_INSTALL_FILES

wget -O opencv.zip https://github.com/opencv/opencv/archive/3.4.9.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.4.9.zip
unzip opencv.zip
unzip opencv_contrib.zip

cd opencv-3.4.9
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D INSTALL_C_EXAMPLES=ON \
      -D BUILD_opencv_dnn=ON \
      -D OPENCV_EXTRA_MODULES_PATH=$OPENCV_INSTALL_FILES/opencv_contrib-3.4.9/modules \
      -D PYTHON3_EXECUTABLE=/usr/bin/python3 \
      -D BUILD_opencv_python2=ON \
      -D BUILD_opencv_python3=ON \
      -D BUILD_EXAMPLES=ON ..

make -j"$(nproc)"
make install -j"$(nproc)"
ldconfig

cd /
rm -rf $OPENCV_INSTALL_FILES
