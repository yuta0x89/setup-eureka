#!/bin/bash

# Update package lists
sudo apt update

# Install tasksel if it's not already installed
sudo apt install -y tasksel

# Install the Ubuntu desktop environment
sudo tasksel install ubuntu-desktop

# Set the default target to graphical (GUI) mode
sudo systemctl set-default graphical.target

# Reboot the system
echo "The system will now reboot to apply changes."
sleep 3
sudo reboot
