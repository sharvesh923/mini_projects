#!/bin/bash

# Update the machine
sudo apt-get update
sudo apt-get upgrade -y

# Install Nginx
sudo apt-get install nginx -y

# Start Nginx
sudo systemctl start nginx

# Enable Nginx to start at boot
sudo systemctl enable nginx

# echo command enter value in index.html file
echo "<h1> Hello world </h1>" > /var/www/html/index.html