# FROM jenkins/jenkins:lts
FROM jenkins/jenkins:jdk17

USER root

RUN apt-get update && apt-get install -y maven

USER jenkins


# To build image:
# docker build -t jdk17-jenkins-maven .

# To build container:
# docker run -d --name jenkins -u root -v /opt/docker/jenkins/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -p 8080:8080 -p 50000:50000 jdk17-jenkins-maven
