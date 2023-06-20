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

# ******************   OR    *****************

## Jenkins installation in ubuntu 16.04
 
 - wget https://updates.jenkins-ci.org/download/war/2.162/jenkins.war ( installs 2.162 version, if you want any other version to be installed visit https://updates.jenkins-ci.org/download/war/ download particular version )
 - java -jar jenkins.war ( default runs on 8080 port ) 
 - java -jar jenkins.war --httpPort=5000 ( if you want run on any other port use this, in my case its 5000 port ) 
 - nohup java -jar jenkins.jar & ( to run jenkins process in background )
 
## Jenkins as a service 
 - wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
 - echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
 - apt-get update
 - apt-get install jenkins
 - systemctl start jenkins
 - systemctl status jenkins
