## JFROG Artifactory installation in ubuntu 16.04 using docker container 

 - export JFROG_HOME= /set/some/path
 - mkdir -p $JFROG_HOME/artifactory/var/etc/
 - cd $JFROG_HOME/artifactory/var/etc/
 - touch ./system.yaml
 - chown -R 1030:1030 $JFROG_HOME/artifactory/var
   
   run below docker command 

      docker run --name artifactory -v $JFROG_HOME/artifactory/var/:/var/opt/jfrog/artifactory -d -p 8081:8081 -p 8082:8082 docker.bintray.io/jfrog/artifactory-oss:latest
   
