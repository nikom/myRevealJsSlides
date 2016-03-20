#  dOcKeR, iNfRaStRuCtUrE aNd MiCrOsErViCeS nOtEs
<br/>


---
### Docker stuff 
 - tools
 - plugins
 - gr8 container

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
## pprof and flame graph: performance tests
 - docker-stress go stress test tool https://github.com/crosbymichael/docker-stress
 - go lang package https://golang.org/pkg/net/http/pprof/
 - Virtualization: https://medium.com/@calavera/docker-flame-graphs-f9523e98d57d#.qfmp4xnpj

-
## flocker data volume management
 - a Flocker data volume, called a dataset, is portable and can be used with any container in your cluster.
 - Flocker manages Docker containers and data volumes together. 
 - When you use Flocker to manage your stateful microservice, your volumes will follow your containers when they move between different hosts in your cluster.
 - https://clusterhq.com/flocker/introduction/
 - kubernetes integration: https://github.com/kubernetes/kubernetes/tree/release-1.2/examples/flocker/


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
## Lorry.io 
 - online docker-compose editor
 - validator
 - composer
 - https://lorry.io 

-
## DRAY
 - Docker Workflow Engine
 - http://dray.it

-
## ImageLayers
 - visualize docker images and layers
 - discover which layer is shared by multiple images
 - https://imagelayers.io/

-
## ZODIAC
 - built on top of docker-compose
 - Historisierung und Versionierung von deployments 
 - rollback of container versions
 - https://github.com/CenturyLinkLabs/zodiac/blob/master/README.md

-
## watchtower
 - https://github.com/CenturyLinkLabs/watchtower/blob/master/README.md
 - docker pull centurylink/watchtower

-
## prometheus
 - open-source systems monitoring and alerting toolkit
 - https://entropia.de/GPN15:Monitoring_mit_Prometheus
 - https://labs.ctl.io/monitoring-docker-services-with-prometheus/

-
## ruxit
<table>
 <div align="left">Full stack web application monitoring (SaaS)</div>
 <div align="left">Web, Application, Server, Network, Cloud Monitoring (not open source)</div>
 <div align="left">![logo](/images/ruxit-screen.png)</div>
</table>

-
## rancher convoy
 - docker plugin to backup and restore container (convoy) volumes
 - https://github.com/rancher/convoy#quick-start-guide
 - http://rancher.com/introducing-convoy-a-docker-volume-driver-for-backup-and-recovery

-
## rancher os
 - 20 mb linux distribution
 - gesamte os läuft in docker containern
 - an os made of containers

---
### Docker Management Frameworks
 - simple solution: dockerui
 - kubernetes
 - kitematic
 - panamax
 - rancher server
 - mesos
 - swarm
 - shipyard

-
## dockerui

<table>
 	 <div>![logo](/images/dockerui-1.png)</div>
	 <div align="left"> - simple solution, to monitor, start and stop containers</div>
</table> 

-
## dockerui

<table>
 	 <div>![logo](/images/dockerui-2.png)</div>
	 <div align="left"> - https://github.com/crosbymichael/dockerui</div>
</table> 

-
## kubernetes

<table>
 <div align="left">![logo](/images/kubernetes-logo.jpg)</div>
	 <div align="left"> - opensource cluster management software von google</div>
	 <div align="left"> - scheduler for docker containers</div>
	 <div align="left"> - pods, labels, replication controllers</div>
	 <div align="left"> - google cloud or selfhosting</div>
	 <div align="left"> - http://www.infoq.com/articles/scaling-docker-with-kubernetes</div>
</table> 

-
## kitematic

<table>
 <div align="left">![logo](/images/kitematic-logo.png)</div>
	 <div align="left"> - opensource gui management for docker containers</div>
	 <div align="left"> - easy to use</div>
	 <div align="left"> - docker hub integration</div>
	 <div align="left"> - included virtualbox image</div>
	 <div align="left"> - only running on mac and windows</div>
	 <div align="left"> - included in docker toolbox</div>
</table> 

-
## kitematic
![logo](/images/kitematic-screen.png)
-
## panamax

<table>
 <div align="left">![logo](/images/panamax-logo.jpg)</div>
	 <div align="left"> - complex multi container management</div>
	 <div align="left"> - runs in virtualbox (coreos) with vagrant and homebrew </div>
	 <div align="left"> - templates (combination of containers)</div>
	 <div align="left"> - sharing templates</div>
	 <div align="left"> - stitching containers together</div>
	 <div align="left"> - fleetctl</div>
	 <div align="left"> - https://www.youtube.com/watch?v=J0XWLiIu41Y </div>
</table> 

-
## panamax
![logo](/images/panamax-screen.png)
-

## rancher server platform
<table>
 <div align="left">![logo](/images/rancher-logo.png)</div>
	 <div align="left"> - framework provides private container services and environments</div>
	 <div align="left"> - powerful container management platform (tools, ui, container graphs)</div>
	 <div align="left"> - resource management, health checking, recovery, service discovery, load balancing...</div>
	 <div align="left"> - https://github.com/rancher/rancher#launching-management-server</div>
</table> 

```
docker run -d --restart=always -p 8080:8080 rancher/server
```
-
## rancher server platform
![logo](/images/rancher-screen.png)

-
## mesos

<table>
 <div align="left">![logo](/images/mesos-logo.png)</div>
	 <div align="left"> - open-source cluster manager by Apache</div>
	 <div align="left"> - designed to scale to large clusters involving hundreds or thousands of hosts</div>
	 <div align="left"> - using zookeeper, Marathon Scheduler, ...</div>
</table> 

-
## swarm

<table>
	 <div align="left"> - native clustering tool for Docker</div>
	 <div align="left"> - uses the standard Docker API</div>
	 <div align="left"> - turns a pool of Docker hosts into a single, virtual Docker host</div>
</table> 

-
## shipyard

<table>
 <div align="left">![logo](/images/shipyard-logo.png)</div>
	 <div align="left"> - https://shipyard-project.com</div>
	 <div align="left"> - 100% compatible with the Docker Remote API</div>
</table> 

---
### Security
 - docker-bench-security
 - docklock
 - https://docs.docker.com/engine/articles/security/
 - https://www.ctl.io/developers/blog/post/tutorial-protecting-sensitive-info-docker
 - updates in docker 1.10 (seccomp, usernamespaces, ...)

-
## docker-bench-security
<table>
	 <div align="left">docker container, that checks several best practices </div>
	 <div align="left"> - https://github.com/docker/docker-bench-security</div>
   	 <div align="left">![screen](/images/security-benchmark.png)</div>
</table> 

-
## docklock
 - lets you encrypt your images and critical data
 - https://github.com/rarchk/docklock

---

## favourite docker cmd cheats

-

## alias
 - alias dl="docker ps -l -q" -> last container id
 - alias d="docker"
 - alias drm="docker rm"
 - alias dps="docker ps"
 - alias dpsas="docker ps -as"
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
 - https://github.com/chadoe/docker-cleanup-volumes
 
-
## container runs
 - reveal JS
 - markdown syntax cheat: http://stationinthemetro.com/wp-content/uploads/2013/04/Markdown_Cheat_Sheet_v1-1.pdf

```
docker run -d -p 8000:8000 -v
/Users/nikomahle/Dockerfiles/mySlides:/revealjs/md amouat/revealjs:latest
```

 - best simple UI: dockerui

```
docker run -d -p 9000:9000 --privileged -v /var/run/docker.sock:/var/run/docker.sock
dockerui/dockerui
```

-
### Registry v1

```
docker run -d -p 5000:5000 registry
docker run -p 8080:8080 -e REG1=http://localhost:5000/v1/ -d atcol/docker-registry-ui
docker tag jenkins:1.596.2-8u45 localhost:5000/jenkins:1.596.2-8u45
docker push localhost:5000/jenkins:1.596.2-8u45
```

-
### Registry v2

```
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

-
### container images
-
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
 
-
### cool Dockerfiles in Dockerhub
 - otechlabs
 - devopsil 
 - progrium
 - atmoz

-
## useful DockerFile cmd

```
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
```

---
## PAAS in docker world

-
## tutum
<table>
 <div align="left">docker platform across any cloud</div>
 <div align="left">![logo](/images/tutum-screen.png)</div>
</table> 

-
## sloppy.io
<table>
 <div align="left">container as a service (beta status)</div>
  <div align="left">sloppy.json config file</div>
 <div align="left">![logo](/images/sloppy-screen.png)</div>
</table> 

-
## giantswarm.io
<table>
 <div align="left">container as a service (alpha status)</div>
  <div align="left"></div>
 <div align="left"></div>
</table> 

-
## dokku (dockerizing simple mini heroku)
 - uses docker
 - uses buildstep (Heroku's open source buildpacks)
 - uses gitreceive
 - a git push starts building and starting a docker container
 - http://progrium.com/blog/2013/06/19/dokku-the-smallest-paas-implementation-youve-ever-seen

-
## deis
 - open source paas für selfhosting zwecke
 - stack: coreos + docker + heroku light workflow
 - deploy application mit git push (gitreceive)
 - includes Heroku buildpacks like dokku
 - http://deis.io/overview/

-
## wercker
 - http://devcenter.wercker.com/learn/basics/introduction.html
 - Docker-based platform for developing, building and delivering applications as microservices, containers and in the cloud.
 - wercker workflow: develop, build, notify, deploy to docker hub, private registry
 - API call to a scheduler (such as Kubernetes or Mesosphere) to notify that there is a new version of a container image ready to be scheduled.

-
## wercker
<table>
 <div align="left">![logo](/images/wercker-1.png)</div>
</table> 

-
## wercker
<table>
 <div align="left">![logo](/images/wercker-2.png)</div>
</table> 

---
## famous companies / commiter groups

-
## CenturyLink 
 - panamax (drag and drop management)
 - Lorry.io (docker-compose.yml validator and composer)
 - DRAY (docker workflow engine)
 - ImageLayers (visualize docker images and containers)
 - ZODIAC (deployment and rollback of docker apps)
 - watchtower (autom. detecting and restarting new cont. with new image)

-
## Gliderlabs (Jeff Lindsay)
 - registrator
 - progrium
 - megalith

-
## Hashicorp
<table>
	 <div align="left"> HashiCorp is the creator of the open source projects Vagrant, Packer, Terraform, Serf, and Consul, and the commercial product Atlas.</div>
   <div align="left">![logo](/images/hashicorp-ecosystem.png)</div>
</table> 

-
## Rancher Labs
 - rancher server
 - rancher os

---
## Netflix stack microservices
 - Netflix Eureka 
 - Netflix Ribbon
 - Netflix Hystrix

-
## Netflix Eureka 
 - Service Discovery Server Netflix Eureka allows microservices to register themselves at runtime as they appear in the system landscape.

-
## Netflix Ribbon 
 - Dynamic Routing and Load Balancer Netflix Ribbon can be used by service consumers to lookup services at runtime. Ribbon uses the information available in Eureka to locate appropriate service instances. If more than one instance is found, Ribbon will apply load balancing to spread the requests over the available instances. Ribbon does not run as a separate service but instead as an embedded component in each service consumer.

-
## Netflix Hystrix 
 - Circuit breaker Netflix Hystrix provides circuit breaker capabilities to a service consumer. If a service doesn’t respond, Hystrix can redirect the call to an internal fallback method in the service consumer. If a service repeatedly fails to respond, Hystrix will open the circuit and fast fail (i.e. fallback method) on every subsequent call until the service is available again. To determine wether the service is available again Hystrix allow some requests to try out the service even if the circuit is open. Hystrix executes embedded within its service consumer.

-
## Netflix Zuul 
 - Zuul is the front door for all requests from devices and web sites to the backend of the Netflix streaming application. As an edge service application, Zuul is built to enable dynamic routing, monitoring, resiliency and security. It also has the ability to route requests to multiple Amazon Auto Scaling Groups as appropriate.
 - https://github.com/Netflix/zuul/wiki/Getting-Started

-
## Netflix Ribbon 
 - Ribbon is a client side IPC library that is battle-tested in cloud. It provides the following features 
 Load balancing, Fault tolerance Multiple protocol (HTTP, TCP, UDP) support in an asynchronous and reactive  model, Caching and batching

---
## microservice mindmap
![logo](/images/microservice-mindmap.png)

---
## infrastructure solutions

-
## hashicorp terraform 
 - creating, combining, and modifying infrastructure
 - CAPS (Chef, Ansible, Puppet, Salt) are mainly for centrally controlling what lives inside a large number of instances.  I.e. processes, files, etc.
 - terraform is mainly for creating instances themselves (and other cloud resources like load balancers etc).
 - codify entire infrastructures and datacenters into high-level abstractions for easier replication and management
 - https://www.scriptrock.com/articles/infrastructure-as-code-showdown-terraform-vs.-cloudformation

-
## hashicorp packer 
 - tool for creating machine images and deployable artifacts such as AMIs, OpenStack images, Docker containers, etc.
 - 

-
## hashicorp serf 
 - tool for cluster membership and failure detection. Consul uses Serf’s gossip protocol as the foundation for service discovery.
 - 

-
## hashicorp vagrant 
 - tool for managing development environments that mirror production

-
## hashicorp atlas 
 - unites Packer, Terraform, and Consul to make application delivery a versioned, auditable, repeatable, and collaborative process.

---
## some other great infrastructure solutions

-
## pancake.io
 - hosting dropbox files as static web pages

-
## ngrok
 - https://ngrok.com
 - secure tunnels to localhost
 - expose a local web server to the public internet


---
## still to research / todo
 - weave scope
 - weave run
 - weave net
 - rhel 7 bzw. atomic host
 - marathon (https://github.com/sloppyio/marathon)
 - https://github.com/Yelp/dockersh
 - https://github.com/crosbymichael/docker-stress stress test 4 docker
 - https://cloud.google.com/container-engine/
 - https://github.com/docktor/docktor



---
<!-- .slide: data-background="#555555" -->
## copyright Niko Mahle niko.mahle@googlemail.com
---
