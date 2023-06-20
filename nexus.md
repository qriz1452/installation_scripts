https://www.howtoforge.com/how-to-install-and-configure-nexus-repository-manager-on-ubuntu-20-04/

# *********************** OR **************************

 ## Nexus Installation in ubuntu 16.04

 - apt-get install wget ( install if you dont have wget )
 - java -version ( make sure java is installed which should be java 8 or higher version )
 - wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz 
 - tar -xvf latest-unix.tar.gz  
 - cd nexus-3.35.0-02/bin
 - ./nexus start ( starts the nexus artifactory )
 - ./nexus status ( by this you check the status of nexus artifactory )
 - To access this use http://ip_Address:8081 ( by deafault which will be running on 8081)
 
  ``` intial password will be present in /opt/sonatype-work/nexus3/admin.password ```
  
  using docker 
  ```
  docker run -d -p 8081:8081 --name nexus sonatype/nexus3
  ```
  
