#! /bin/bash
#
# install_ros_gazebo.sh
# Copyright (C) 2018-04-05 Shixin <Li>
#
# Distributed under terms of the MIT license.
#

set -e

#######
# ros #
#######

apt-get update
apt-get install wget git tmux -y
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
apt-get update 1>/dev/null
apt-get install ros-kinetic-desktop-full -y 1>/dev/null
echo "${green}[ROS Installed.]${endcolor}"
rosdep init 1>/dev/null
rosdep update -y 1>/dev/null
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
apt-get install python-rosinstall python-catkin-tools python-rosinstall-generator python-wstool build-essential -y 1>/dev/null

mkdir -p ~/catkin_ws/src
pushd ~/catkin_ws/src > /dev/null
git clone https://github.com/fetchrobotics/fetch_ros.git
git clone https://github.com/MaidouPP/robot_follower.git
git clone https://github.com/MaidouPP/gazebo_plugins.git
mv gazebo_plugins/* . && rm -rf gazebo_plugins
popd > /dev/null
echo "${green}[Finished ROS installation and configuration.]${endcolor}"

##########
# gazebo #
##########

sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - |  apt-key add -
apt-get update -y 1>/dev/null
apt-get install libignition-math3 -y 1>/dev/null
apt-get install gazebo8 -y 1>/dev/null
apt-get install libgazebo8-dev -y 1>/dev/null
apt-get install ros-kinetic-gazebo8-msgs ros-kinetic-gazebo8-plugins ros-kinetic-gazebo8-ros -y 1>/dev/null
apt-get install ros-kinetic-gazebo8-ros-pkgs -y 1>/dev/null
apt-get install ros-kinetic-moveit-core ros-kinetic-opencv-candidate ros-kinetic-control-toolbox ros-kinetic-robot-controllers ros-kinetic-costmap-2d -y 1>/dev/null
echo "${green}[Finished Gazebo installation and configuration.]${endcolor}"
