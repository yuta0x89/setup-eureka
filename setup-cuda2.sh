#!/bin/bash

# Append CUDA path to .bashrc
echo 'export PATH=/usr/local/cuda-12.3/bin${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-12.3/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc

# Source the .bashrc to update the environment variables
source ~/.bashrc

# Check the status of the nvidia-persistenced service using the systemctl command
status=$(systemctl is-active nvidia-persistenced)


# If the service is not active, nvidia-persistenced will be started
if [ "$status" == "active" ]; then
    echo "NVIDIA Persistence Daemon is active."
else
    echo "NVIDIA Persistence Daemon is not active." >&2
    echo "Attempting to start NVIDIA Persistence Daemon..." >&2
    sudo systemctl start nvidia-persistenced || { echo "Failed to start nvidia-persistenced service." >&2; exit 1; }
fi

# Make cuda samples
cd ~/
git clone https://github.com/NVIDIA/cuda-samples.git
cd cuda-samples
sudo apt-get update
sudo apt-get -y install cmake
make

# Execute the deviceQuery command and store the output in a variable
output=$(./Samples/1_Utilities/deviceQuery/deviceQuery)

# Check if the output contains "Result = PASS" by analyzing the output
if echo "$output" | grep -q "Result = PASS"; then
    echo "The deviceQuery result is PASS."
else
    echo "Failed to execute deviceQuery." >&2
    exit 1
fi

# Execute the bandwidthTest command and store the output in a variable
output=$(./Samples/1_Utilities/bandwidthTest/bandwidthTest)

# Check if the output contains "Result = PASS" by analyzing the output
if echo "$output" | grep -q "Result = PASS"; then
    echo "The bandwidthTest result is PASS."
else
    echo "Failed to execute bandwidthTest." >&2
    exit 1
fi

sudo apt-get -y remove --purge "cuda-repo-ubuntu2004-12-3-local*"
