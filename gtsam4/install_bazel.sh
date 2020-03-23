#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive
apt-get update

apt-get install --yes openjdk-11-jdk

# Bazel DEB Dependencies
apt-get install --yes g++ zlib1g-dev bash-completion unzip python

TEMP_DEB="$(mktemp)" && wget -O "$TEMP_DEB" 'https://github.com/bazelbuild/bazel/releases/download/0.24.1/bazel_0.24.1-linux-x86_64.deb' && dpkg -i "$TEMP_DEB"

# Extract bazel.
bazel version

unset DEBIAN_FRONTEND
rm -rf /var/lib/apt/lists/*
