#!/bin/bash
#################################################
# This script is used to clean the new instance created from AMI to ensure that the instance is secure and necessary security measures are in place.
# Author: Kalemudeen
# Usage: ./clean_up_script.sh | Run this script everytime when a new instance is created from Amazon AMI
#################################################

# Remove SSH keys:
rm -rf /root/.ssh/authorized_keys

# Clean user credentials and history:
rm -rf /root/.bash_history
rm -rf /root/git-credentials
rm -rf /home/ec2-user/.ssh/authorized_keys

# Clean system logs and temporary files:
rm -rf /var/log/*
rm -rf /tmp/*
rm-rf /var/tmp/*

# Remove user account:
deluser tempuser --remove-home

# Lock root account:
passwd -l root

#Reset configuration files (Nginx):
rm-rf /etc/nginx/nginx.conf

#End of script
