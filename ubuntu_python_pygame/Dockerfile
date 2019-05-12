FROM ubuntu:16.04
MAINTAINER Shixin Li "lshixin@ucsd.edu"

RUN apt-get update && apt-get install -y \
    mercurial \
    libsdl-image1.2-dev \
    libsdl-mixer1.2-dev \
    libsdl-ttf2.0-dev \
    libsmpeg-dev \
    libsdl1.2-dev \
    libportmidi-dev \
    libswscale-dev \
    libavformat-dev \
    libavcodec-dev \
    libplib-dev \
    libopenal-dev \
    libalut-dev \
    libvorbis-dev \
    libxxf86vm-dev \
    libxmu-dev \
    libgl1-mesa-dev \
    libfreetype6-dev \
    && apt-get install -y python3-pip python3-dev

RUN apt-get install -y wget git

RUN cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade setuptools \
    && pip3 install hg+http://bitbucket.org/pygame/pygame \
    && pip3 install numpy
