#! /bin/bash
set -e

chmod 755 /root

export DEBIAN_FRONTEND=noninteractive

apt-get -y update && apt-get install -y

# Install essential software.
apt-get --yes install \
        vim curl wget git openssh-client tmux screen less rsync cmake netcat

# Allow any user to access "sudo" without password.
apt-get -y install sudo
echo "ALL ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/allow_all
apt-get -y install libc-dev

# Install python and its dependencies.
apt-get --yes install python3.7
apt-get --yes install python3-pip
python3 -m pip install --upgrade pip requests
pip install pandas ipython==7.5.0 notebook matplotlib plotly pystan==2.19.1.1

# Set the timezone.
apt-get install tzdata
ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
echo "America/Los_Angeles" > /etc/timezone

# Fix locale issue.
apt-get --yes install locales
locale-gen en_US en_US.UTF-8
dpkg-reconfigure locales

unset DEBIAN_FRONTEND
rm -rf /var/lib/apt/lists/*
