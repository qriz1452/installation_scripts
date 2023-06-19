#!/bin/bash
sudo apt update -y
sudo apt upgrade -y


sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" -y

sudo apt update -y

apt-cache policy docker-ce -y

sudo apt install docker-ce -y

#sudo systemctl status docker

sudo chmod 777 /var/run/docker.sock


#refrence :
#https://github.com/vikash-kumar01/installation_scripts/blob/master/docker.sh
#https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
#https://docs.docker.com/engine/install/ubuntu/
