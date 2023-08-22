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



# *************************   OR   ****************************

 ## Docker installation in ubuntu 16.04
 
 - sudo apt-get update
 - sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
 - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 - sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
 - sudo apt-key fingerprint 0EBFCD88
 - sudo apt-get update
 - sudo apt-get install docker-ce docker-ce-cli containerd.io ( to install latest version )
 - sudo docker run hello-world

if you want all the things in a script use https://github.com/DeekshithSN/cheatsheet/blob/master/docker-install.sh

for more details refer  https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1 

        If you face below problem which is same as mentione below the you can refer this link

       https://stackoverflow.com/questions/25183063/docker-on-rhel-6-cgroup-mounting-failing

       Starting cgconfig service: Error: cannot create directory /cgroup/blkio
        /sbin/cgconfigparser; error loading /etc/cgconfig.conf: Cgroup, operation not allowed
       Failed to parse /etc/cgconfig.conf                         [FAILED]

       After doing this you need run all the commands with sudo concatenated to it.

        - To solve this issue we need to add current user to docker group , to do the same follow the below commands 
          sudo groupadd docker
          sudo usermod -aG docker $USER ( got a error while runing docker commands with the current user)
          sudo usermod -aG docker jenkins (got a error while runing docker commands with jenkins user )
          getent group <groupname> (to check the list of users in particular group)
          sudo passwd jenkins to change password of jenkins user
        
        - even after following the above commands if you face any issue in ruuning commands then run below command
          chmod 777 /var/run/docker.sock



==========================  OR  ===============================================

# ubuntu VM

curl get.docker.com | sh


======================  OR           ==============
# Cent OS VM

    sudo yum install -y yum-utils device-mapper-persistent-data lvm2
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum -y install docker-ce
    sudo systemctl enable --now docker
    sudo usermod -aG docker cloud_user


===============================================


