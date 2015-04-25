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
-

## bashcompletion
 - /etc/bash_completion.d/ (yum install ...)
 - wget [bash docker](https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker)
-
## useful commands
 - remove all containers
  <pre><code> drm -f $(dps -aq) </code></pre> 
 - start a stopped container and attach to it
    <pre><code> function da () {  
    docker start $1 && docker attach $1 } </code></pre> 
 - top der laufenden container
    <pre><code> docker stats $(docker ps -q) </code></pre> 
 
---
## container runs
-
### container images
---
## slide 
---
<!-- .slide: data-background="#555555" -->
## A slide with a different background
---
