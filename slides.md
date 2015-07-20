# my docker notes
<br/>

---

## docker cmd cheats

-

## alias
 - alias dl="docker ps -l -q" -> last container id
 - alias d="docker"
 - alias drm="docker rm"
 - alias dps="docker ps"
 - alias dkd="docker run -d -P"
 - alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

-

## bashcompletion
 - /etc/bash_completion.d/ (yum install ...)
 - wget [bash docker](https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker)
-
## sublime syntax highlightning docker files
 - https://github.com/asbjornenge/Docker.tmbundle
-
## useful docker commands
 - remove all containers
  <pre><code> drm -f $(dps -aq) </code></pre> 
 - start a stopped container and attach to it
    <pre><code> function da () {  
    docker start $1 && docker attach $1 } </code></pre> 
 - top der laufenden container
    <pre><code> docker stats $(docker ps -q) </code></pre> 
 - Kill all running containers
    <pre><code> docker kill $(docker ps -q)</code></pre> 
 - delete old containers
 <pre><code>docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm </code></pre>
 - delete danling images
 <pre><code>docker rmi $(docker images -q -f dangling=true)</code></pre>
 
---
## container runs
 - reveal JS

```
docker run -d -p 8000:8000 -v
/Users/nikomahle/Dockerfiles/mySlides:/revealjs/md amouat/revealjs:latest
```

 - dockerui

```
docker run -d -p 9000:9000 --privileged -v /var/run/docker.sock:/var/run/docker.sock
dockerui/dockerui
```

---
### Registry

```
docker run -d -p 5000:5000 registry
docker run -p 8080:8080 -e REG1=http://localhost:5000/v1/ -d atcol/docker-registry-ui
docker tag jenkins:1.596.2-8u45 localhost:5000/jenkins:1.596.2-8u45
docker push localhost:5000/jenkins:1.596.2-8u45
```

---
### container images
---
### jenkins hacks
 - start jenkins master

```
docker run -p 5555:8080 -p 50000:50000 -d -v 
/Users/nikomahle/Dockerfiles/jenkins/jenkins-data:/var/jenkins_home nikom-jenkins:1.596.2-jdk7u79-1
```

 - get slave.jar
 
```
wget http://hostname.de:8080/jnlpJars/slave.jar 
```
 - connect to jenkins master after manual adding of new node in jenkins master gui

```
wget http://hostname.de:8080/jnlpJars/slave.jar
```
 
---
### Dockerfiles
 - otechlabs in Dockerhub
 - devopsil in Dockerhub

---
### ecosystem
-
## gliderlabs/logspout
 - greift per docker event / socket die Log STDOUT und STDERR der Docker Container ab.
 - start logspout

```
docker run -d --name="logspout" --volume=/var/run/docker.sock:
/tmp/docker.sock --publish=127.0.0.1:8000:80 gliderlabs/logspout 
```

 - curl the logs

``` 
curl http://172.17.0.108:8000/logs
curl http://172.17.0.108:8000/logs/id:containerid
curl http://172.17.0.108:8000/logs/name:containername
```

-
## consul
 - highly distributed and highly available tool for service discovery
 - http://jlordiales.me/2015/01/23/docker-consul/

```
docker run -d -p 8400:8400 -p 8500:8500 -p 8600:53/udp -h node1 
progrium/consul -server -bootstrap -ui-dir /ui
```

```
JOIN_IP="$(docker inspect -f '{{.NetworkSettings.IPAddress}}' node1)"
```

```
docker run -d --name node2 -h node2 progrium/consul -server -join 
$JOIN_IP
```

```
docker run -d --name node3 -h node3 progrium/consul -server -join 
$JOIN_IP
```

```
 curl -s http://10.xx.xx.20:8500/v1/catalog/services
 curl -s http://10.xx.xx.20:8500/v1/catalog/service/dockerui
```

-
## gliderlabs/registrator
 - http://gliderlabs.com/blog
 - http://jlordiales.me/2015/02/03/registrator
 - autom. Registrierung von Docker Containern 

```  
docker run -d -v /var/run/docker.sock:/tmp/docker.sock -h 
  $HOSTNAME gliderlabs/registrator consul://10.xx.xx.20:8500
```

-

---
## to research 
 - panamax
 - kubernetes
 - consul
 - rancher
 - rancheros
 - shipyard
 - logspout
 - gliderlabs/registrator
---
<!-- .slide: data-background="#555555" -->
## A slide with a different background
---
