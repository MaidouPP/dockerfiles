FROM ros:kinetic-perception
MAINTAINER Shixin Li "leept416@gmail.com"

RUN apt-get -y update && apt-get install -y

COPY run_env_prep.sh /root/install/
RUN /root/install/run_env_prep.sh

COPY install_vins_mono.sh /root/install/
RUN /root/install/install_vins_mono.sh
