#!/bin/bash

# Change the hostname

#sudo hostnamectl set-hostname mail.letsdoiton.cloud

# Install Postfix
sudo apt-get update

sudo echo <<< "postfix postfix/mailname string smtptest | debconf-set-selections"
sudo echo <<< "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

sudo apt-get install postfix -y

#Backup the existing conf file

sudo cp /etc/opendkim.conf /etc/opendkim.conf.bak

#Add new line after Syslog

#sed -i '/Syslog/a Logwhy yes' /etc/opendkim.conf 

# Install Telnet Client

sudo apt install telnet -y

# Setting up DKIM

sudo apt install opendkim opendkim-tools -y
sudo gpasswd -a postfix opendkim


################################################################
#### Edit /etc/opendkim.conf add "Logwhy yes" after "Syslog yes" line
#### Uncomment the following "Canonicalization simple" line change simple with "relaxed/simple"
#### Uncomment the following "Mode sv" "SubDomains no"
#### Add the following lines to
####AutoRestart         yes
####AutoRestartRate     10/1M
####Background          yes
####DNSTimeout          5
####SignatureAlgorithm  rsa-sha256#OpenDKIM user
# Remember to add user postfix to group opendkim
####UserID             opendkim

# Map domains in From addresses to keys used to sign messages
####KeyTable           refile:/etc/opendkim/key.table
####SigningTable       refile:/etc/opendkim/signing.table

# Hosts to ignore when verifying signatures
####ExternalIgnoreList  /etc/opendkim/trusted.hosts

# A set of internal hosts whose mail should be signed
####InternalHosts       /etc/opendkim/trusted.hosts

####
################################################################


#sudo sed -i '/^Syslog/a Logwhy yes' /etc/opendkim.conf

#sudo sed -i '/Canonicalization/s/^/#' /etc/opendkim.conf

sudo sed -i '{
/^Syslog/a Logwhy     yes
/^#Canonicalization/a Canonicalization         relaxed/simple
/Mode/s/^#//
/SubDomains/s/^#//
/SubDomains/a AutoRestart     yes\nAutoRestartRate     10/1M\nBackground     yes\nDNSTimeout     5\nSignatureAlgorithm     rsa-sha256

}' /etc/opendkim.conf

###End of script###
