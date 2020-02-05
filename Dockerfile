# https://github.com/jenkinsci/docker
FROM jenkins/jenkins:lts
MAINTAINER ntran@ntdt.fr

# As root user
USER root

# Install docker (default version 18.06)
ARG DOCKER_VERSION
ENV DOCKER_VERSION ${DOCKER_VERSION:-18.06}

RUN apt-get update \ 
    && apt-get install -y apt-transport-https ca-certificates software-properties-common git curl \ 
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" \ 
    && apt-get update && apt-get install -y docker-ce=$(apt-cache madison docker-ce | grep $DOCKER_VERSION | head -1 | awk '{print $3}') \
    && rm -rf /var/lib/apt/lists/* 

# run docker commands as jenkins user (sudo not required)
RUN usermod -aG docker jenkins

# Setting the number of executors (default 2 executors)
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# drop back to the regular jenkins user - good practice
USER jenkins