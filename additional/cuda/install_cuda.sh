#!/bin/bash

CUDA_VERSION=10.2

sudo apt update
sudo apt install -yq wget software-properties-common 

source /etc/os-release
ubuntu_ver=$ID$(echo "${VERSION_ID//./}")

wget https://developer.download.nvidia.com/compute/cuda/repos/$ubuntu_ver/x86_64/cuda-$ubuntu_ver.pin
sudo mv cuda-$ubuntu_ver.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/$ubuntu_ver/x86_64/7fa2af80.pub
sudo add-apt-repository 'deb http://developer.download.nvidia.com/compute/cuda/repos/'"$ubuntu_ver"'/x86_64/ /'
sudo apt-get update
sudo apt-get -y install cuda-$(echo $CUDA_VERSION | sed 's/\./-/g')
