FROM jenkins/jenkins:lts

USER root

RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

## RUN useradd -r -u 1000 -g jenkins jenkins
RUN groupadd docker
RUN usermod -a -G docker jenkins
RUN newgrp docker
## RUN chown jenkins /var/run/docker.sock
## RUN sudo gpasswd -a jenkins docker
## RUN setfacl -m user:jenkins:rw /var/run/docker.sock

#USER jenkins

# COPY plugins.sh /usr/local/bin/plugins.sh
# COPY plugins.txt /usr/share/jenkins/plugins.txt
# RUN cat /usr/share/jenkins/plugins.txt | /usr/local/bin/plugins.sh


# Create container from the image:
# docker run -d --name myjenk -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -p 8080:8080 myjenk
# Install Jenkins Plug-ins: Docker, Docker Pipeline
