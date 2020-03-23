#! /bin/bash
set -e

apt-get update

# Install C++
apt-get -y install build-essential

# Install boost and cmake
apt-get -y install libboost-all-dev cmake

# Install TBB
apt-get -y install libtbb-dev

# Install latest Eigen
apt-get install -y libeigen3-dev

cd /root/

git clone https://github.com/borglab/gtsam.git
cd gtsam

mkdir build && cd build
cmake ..
make -j`nproc`

make install
