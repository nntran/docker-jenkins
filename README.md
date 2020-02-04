# Jenkins custom for CI/CD

## How to use it ?

Build image :

```sh
docker build --rm=true -t jenkins:2.184-jdk11-docker .
```

Run :

```sh
docker run --name jenkins -d -p 8080:8080 -v <your_jenkins_home>:/var/jenkins_home jenkins:2.184-jdk11-docker
```

## Jenkins slave

### GCC slave


Build: 

```sh
docker build --rm=true -t jenkins-salve-gcc .
```

Run :

```sh
docker run --name jenkins-slave-gcc -d -p 2222:22 -v <your_jenkins_home>:/home/jenkins/jenkins_slave jenkins-slave-gcc
```

## Java & Maven slave

