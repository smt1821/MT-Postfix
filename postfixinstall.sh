#!/bin/bash

# Change the hostname

sudo hostnamectl set-hostname mail.letsdoiton.cloud

# Install Postfix
sudo apt-get update

sudo echo "postfix postfix/mailname string letsdoiton.cloud" | debconf-set-selections
sudo echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

sudo apt-get install postfix -y

# Install Telnet Client

sudo apt install telnet