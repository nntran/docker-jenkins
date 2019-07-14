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

```sh
docker build --rm=true -t jenkins-salve-gcc .
```

## Java & Maven slave

