FROM nvidia/cuda:11.3.0-devel-ubuntu18.04

MAINTAINER Shixin Li "leept416@gmail.com"

RUN apt-get -y update && apt-get install -y

COPY run_env_prep.sh /root/install/
RUN ["chmod", "+x", "/root/install/run_env_prep.sh"]
RUN /root/install/run_env_prep.sh
