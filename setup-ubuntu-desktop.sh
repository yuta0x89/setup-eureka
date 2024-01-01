#!/bin/bash

# Update package lists
sudo apt update

# Install tasksel if it's not already installed
sudo apt install -y wget tasksel

# Download and install the Debian Linux Chrome Remote Desktop installation package:
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt install -y ./chrome-remote-desktop_current_amd64.deb

# Install the Ubuntu desktop environment
sudo tasksel install ubuntu-desktop

# Set your Chrome Remote Desktop session to use Gnome, which is the default desktop environment for Ubuntu:
sudo bash -c ‘echo “exec /etc/X11/Xsession /usr/bin/gnome-session” > /etc/chrome-remote-desktop-session’

# Set the default target to graphical (GUI) mode
sudo systemctl set-default graphical.target

# Reboot the system
echo "The system will now reboot to apply changes."
sleep 3
sudo reboot
