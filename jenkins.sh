#!/bin/bash

sudo apt update -y

sudo apt upgrade -y 

sudo apt install openjdk-17-jre -y

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
  
sudo apt-get update -y 
sudo apt-get install jenkins -y

sudo systemctl start jenkins 
sudo systemctl status jenkins

cat /var/lib/jenkins/secrets/initialAdminPassword



#for firewall :
sudo ufw allow 8080
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status



#refrence :
#https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-20-04
#https://github.com/vikash-kumar01/installation_scripts/blob/master/jenkins.sh
#https://www.jenkins.io/doc/book/installing/linux/#debianubuntu
