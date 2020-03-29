FROM ubuntu:bionic

MAINTAINER Shixin Li "leept416@gmail.com"

RUN apt-get -y update && apt-get install -y
RUN apt-get -y install sudo

COPY run_env_prep.sh /root/install/
RUN /root/install/run_env_prep.sh

COPY install_bazel.sh /root/install/
RUN /root/install/install_bazel.sh

COPY install_gtsam4.sh /root/install/
RUN /root/install/install_gtsam4.sh

COPY install_opencv3.sh /root/install/
RUN /root/install/install_opencv3.sh
