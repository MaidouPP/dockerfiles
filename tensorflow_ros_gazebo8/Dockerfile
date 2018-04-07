FROM gcr.io/tensorflow/tensorflow:latest-gpu

COPY install_ros_gazebo.sh /root/install/

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN chmod +x /root/install/install_ros_gazebo.sh \
    && /root/install/install_ros_gazebo.sh \
    && apt-get install libgoogle-glog-dev -y

CMD gazebo --version
