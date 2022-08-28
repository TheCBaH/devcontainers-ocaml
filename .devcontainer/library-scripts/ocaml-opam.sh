#!/bin/sh
set -eu
set -x
DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND
apt-get update
apt-get install --no-install-recommends -y \
 aspcud \
 autoconf \
 automake \
 build-essential \
 bzip2 \
 ca-certificates \
 cmake \
 curl \
 git-core \
 libc6-dev \
 ocaml-nox \
 pkg-config \
 sudo \
 unzip \
 xz-utils \

apt-get install --no-install-recommends -y software-properties-common
add-apt-repository ppa:avsm/ppa
apt install --no-install-recommends -y opam
apt purge -y --purge software-properties-common
apt auto-remove -y
