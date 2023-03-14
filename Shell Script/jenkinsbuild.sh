#!/bin/bash
# Update the package list by running the following command in the terminal:
sudo apt update

sudo apt install default-jdk -y

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update

sudo apt install jenkins -y

sudo systemctl status jenkins | grep Active:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
