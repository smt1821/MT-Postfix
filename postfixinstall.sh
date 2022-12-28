#!/bin/bash

# Change the hostname

sudo hostnamectl set hostname mail.letsdoiton.cloud

# Install Postfix
sudo apt-get update
sudo apt-get install postfix -y

# Install Telnet Client

sudo apt install telnet