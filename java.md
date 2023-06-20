## JAVA 8 installation in ubuntu 16.04

- sudo apt-get -y install default-jdk

## JAVA 8 installation in ubuntu 18.04

- sudo apt update
- sudo apt install openjdk-8-jdk openjdk-8-jre
- set path 
```
cat >> /etc/environment <<EOL
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
EOL
```

execute command - sudo update-alternatives --config java ( select which ever java version you need )

## Java 11 ( open JDK )
- sudo add-apt-repository ppa:openjdk-r/ppa
- sudo apt-get update
- sudo apt install openjdk-11-jdk


## JAVA 11 installation in ubuntu 16.04

 - sudo add-apt-repository ppa:linuxuprising/java
 - sudo apt update
 - sudo apt-get install oracle-java11-installer
 - sudo apt-get install oracle-java11-set-default ( to set java 11 as default ) 
 - java -version ( verify java installation )

for more details - https://tecadmin.net/install-oracle-java-11-on-ubuntu-16-04-xenial/

#### JAVA 11 installation in GCP machine 
  - download **jdk-11.0.12_linux-x64_bin.tar.gz** from https://www.oracle.com/java/technologies/downloads/#java11 and place it under **/var/cache/oracle-jdk11-installer-local**
  - sudo apt-get install oracle-java11-installer-local
  - sudo apt install oracle-java11-set-default-local
