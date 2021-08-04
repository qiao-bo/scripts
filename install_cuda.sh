#!/bin/bash

echo
echo "Installing NVIDIA drivers"

LOCAL_UBUNTU_VERSION=$(lsb_release -a 2>/dev/null | grep Release | awk '{print $2}' | sed 's/\.//g')
CUDA_UBUNTU_VERSIONS=$(wget http://developer.download.nvidia.com/compute/cuda/repos/ -qO - | grep ubuntu | sed 's/.*ubuntu\([0-9]\{4\}\).*/\1/g' | sort)

for VERSION in $CUDA_UBUNTU_VERSIONS; do
  UBUNTU_VERSION=$VERSION
  if [ "$LOCAL_UBUNTU_VERSION" == "$VERSION" ]; then
    break;
  fi
done

if [ "$LOCAL_UBUNTU_VERSION" != "$UBUNTU_VERSION" ]; then
  echo "Warning: CUDA for Ubuntu version $LOCAL_UBUNTU_VERSION not found"
fi

echo "  Installing NVIDIA driver apt repository"
sudo su -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu'$UBUNTU_VERSION'/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
wget http://developer.download.nvidia.com/compute/cuda/repos/GPGKEY -O - | sudo apt-key add -
sudo apt update

echo "  Installing NVIDIA driver, CUDA, and settings package"
#NVIDIA_VERSION=$(apt-cache search nvidia | grep "nvidia-[0-9]*\ " | tr "-" " " | awk '{print $2}' | sort | tail -n1)
#sudo apt install nvidia-$NVIDIA_VERSION nvidia-settings
sudo apt install cuda

echo "  Setting up environment variables"
sudo su -c 'echo "export PATH=\$PATH:/usr/local/cuda/bin" > /etc/profile.d/cuda.sh'

echo "  Setting up library path"
sudo su -c 'echo "/usr/local/cuda/lib64" > /etc/ld.so.conf.d/cuda.conf'
sudo ldconfig
