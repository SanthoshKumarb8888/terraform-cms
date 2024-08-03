#!/bin/bash

# Update the package repository
sudo yum update -y

# Install nginx from the Amazon Linux Extras repository
sudo yum install nginx -y

# Start and enable nginx service
sudo systemctl start nginx
sudo systemctl enable nginx
