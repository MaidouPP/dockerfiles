FROM nvidia/cuda:11.3.0-devel-ubuntu18.04

MAINTAINER Shixin Li "leept416@gmail.com"

RUN apt-get -y update && apt-get install -y

COPY run_env_prep.sh /root/install/
RUN ["chmod", "+x", "/root/install/run_env_prep.sh"]
RUN /root/install/run_env_prep.sh

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
