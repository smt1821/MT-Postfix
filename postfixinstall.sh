#!/bin/bash

# Change the hostname

#sudo hostnamectl set-hostname mail.letsdoiton.cloud

# Install Postfix
sudo apt-get update

sudo echo "postfix postfix/mailname string letsdoiton.cloud" | debconf-set-selections
sudo echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

sudo apt-get install postfix -y

#Backup the existing conf file

sudo cp /etc/opendkim.conf /etc/opendkim.conf.bak

#Add new line after Syslog

sed -i '/Syslog/a Logwhy yes' /etc/opendkim.conf 

# Install Telnet Client

sudo apt install telnet