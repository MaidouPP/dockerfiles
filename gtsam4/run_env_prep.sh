#!/usr/bin/env bash
set -e

chmod 755 /root

export DEBIAN_FRONTEND=noninteractive

# Fix a warning.
apt-get --yes install apt-utils

# Install essential software.
apt-get --yes install \
        vim curl wget git openssh-client tmux screen less rsync cmake netcat

# Install python dependencies.
apt-get --yes install python-pip
python -m pip install --upgrade pip requests

# Fix locale issue.
apt-get --yes install locales
locale-gen en_US en_US.UTF-8
dpkg-reconfigure locales

# Set the timezone.
apt-get install tzdata
ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
echo "America/Los_Angeles" > /etc/timezone

unset DEBIAN_FRONTEND
rm -rf /var/lib/apt/lists/*
