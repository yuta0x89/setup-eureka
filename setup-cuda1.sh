#!/bin/bash

# Install build-essential package
sudo apt update
sudo apt install build-essential -y

# Install Linux headers for the current running kernel
sudo apt-get install linux-headers-$(uname -r)

# Install the CUDA toolkit
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.3.1/local_installers/cuda-repo-ubuntu2004-12-3-local_12.3.1-545.23.08-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-12-3-local_12.3.1-545.23.08-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2004-12-3-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-3

# Install CUDA drivers
sudo apt-get install -y cuda-drivers

# Reboot the system
echo "The system will now reboot to apply changes."
sleep 3
sudo reboot
