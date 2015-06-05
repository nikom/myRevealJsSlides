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
 <pre><code> docker run -d -p 8000:8000 
 	-v /Users/nikomahle/Dockerfiles/mySlides:/revealjs/md 
 	amouat/revealjs:latest </code></pre> 
 - dockerui
 <pre><code> docker run -d -p 9000:9000 --privileged 
 	-v /var/run/docker.sock:/var/run/docker.sock 
 	dockerui/dockerui </code></pre> 
---
### Registry
 - <pre><code>docker run -d -p 5000:5000 registry</code></pre> 
 - <pre><code>docker run -p 8080:8080 -e REG1=http://localhost:5000/v1/ -d atcol/docker-registry-ui</code></pre>
 - <pre><code>docker tag jenkins:1.596.2-8u45 localhost:5000/jenkins:1.596.2-8u45</code></pre>
 - <pre><code>docker push localhost:5000/jenkins:1.596.2-8u45</code></pre>

---
### container images
---
### jenkins hacks
 - start jenkins master
 <pre><code>docker run -p 5555:8080 -p 50000:50000 -d -v 
 	/Users/nikomahle/Dockerfiles/jenkins/jenkins-data:/var/jenkins_home nikom-jenkins:1.596.2-jdk7u79-1</code></pre> 
 - get slave.jar
 <pre><code> wget http://hostname.de:8080/jnlpJars/slave.jar</code></pre> 
 - connect to jenkins master after manual adding of new node in jenkins master gui
 <pre><code> wget http://hostname.de:8080/jnlpJars/slave.jar</code></pre>
 
---
### Dockerfiles
 - otechlabs in Dockerhub
 - devopsil in Dockerhub
---
## to resarch 
 - panamax
 - kubernetes
 - consul
 - rancher
 - rancheros
 - shipyard
---
<!-- .slide: data-background="#555555" -->
## A slide with a different background
---
