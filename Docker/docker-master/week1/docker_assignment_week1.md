## Topic: Docker Revision Week1

Topics to be Covered
-------------------------
* Docker Run
* Docker Lifecycle
* Docker Inspection
* Docker Monitoring 
* Port Mapping
* Volume Binding
* Linking
* Dockerfile
* Dockerhub


What You Will Learn
----------------------------
This exercise is to revise what we did in first week of docker training.

The Assignment
--------------------------

#### Docker Run

- Run a nginx latest version container
  - Name the container: "nginx01"
  - Set the hostname of container: "nginx.example.com"
  - Assign memory 
    - soft limit: 200 MB
    - hard limit: 400 MB
  - Assign CPU
    - cpu-share: 200
  - Set environment variables
  	- NAME: $(yourname)
  	- ORG: Opstree
  	- TEAM: Bootcamp
  	- TASK: Docker
  - Set above defined variables from a file
  - Set container default login directory to webroot

- Host your webpage on nginx container
  - Run 2 nginx containers with all pre-requisites of previous task
  - Container Name and Hostnames to modified as per the count, say 1 and 2
  - Create vHost on both containers with ServerName
    - nginx1.example.com
    - nginx2.example.com
  - Index page should reflect the content
    "This webpage is served by Nginx running on container n" (n: count of container)
  - Swap the Index page of both containers.

#### Docker Lifecycle

- Start an Ubuntu 14.04 container
- Get the name of file with maximum size in "/var/log" directory
- Get that file on your host machine
- Delete that file from container
- Create a new image of the current state of container and tag it "custom"
- Remove the container
- Run a new instance of fresh image
- Check for the earlier deleted file inside the container
- Copy that file to container from host machine
- Recheck the file inside container.

#### Docker Inspection

- Run a jenkins container and inspect the following info
  - IP Address
  - Mac Address
  - Hostname
  - Container Name
  - Ports
  - Environment Variables
  - Start time

#### Docker Monitoring 

- Run 3 containers (nginx, tomcat amd mysql)
  - Check the following resource utilization
  	- Memory
  	- CPU
  	- Disk I/O
  	- Net I/O
  - List down the process running inside the containers

#### Port Mapping

- Start a nginx container
- Check if any port is bind to host machine
- Start a new nginx01 container with 80 port binded to host
- Access nginx01 home page via host machine IP [ <ip-address> ]
- Run second nginx02 container with its 80 port binded to host machine's 8080 port
- Access nginx02 home page via host machine IP [ <ip-address>:8080 ]
- Run third nginx03 container and allow docker to bind any random port
- Access nginx03 container as well using host machine IP

#### Volume Binding

- Run an nginx container
  - Mount the webroot of container to host machine
  - Create an index page reflecting "Nginx Container With Volume Mounting"
  - Access the webpage of container
  - Destroy the running nginx container
  - Spin a new nginx container with same host machine volume mounted on container's webroot
  - Again access the webpage of container

- Run a Mysql container
  - Mount data directory of mysql container to host machine
  - Create a database and insert some data in it
  - Destroy the container
  - Spin a new mysql container with same host machine volume mounted on container's data directory
  - Check for the database and data earlier created

#### Linking

- Spin 1 nginx and 1 mysql container
- Link mysql container to nginx
- Get into the shell of nginx container
- Try to ping mysql container from shell within nginx container with mysql container name
- Check for the entries in "/etc/hosts" file of nginx container

#### Dockerfile

- Create a custom tomcat image and use it to spin new container
  - Use tomcat base image
  - Define Dockerfile author name and mailid
  - Image should have foloowing pakages
    - netstat
    - telnet
    - curl
    - vim 
  - Get a sample Hello World tomcat application war file
  - Copy this war file to tomcat webapps directory
  - Make webapps directory persistent
  - Add environment variables 
    - role: app
    - env: dev
    - name: < your-name >
  - Expose port 8080 to listen
  - Make webapps directory as default login directory
- Build an image out of the Dockerfile
- Run a tomcat container from recently created image and access app via host IP < ip-address >:9191

#### DockerHub

- Create an account on DockerHub
- Tag the tomcat image earlier created with your dockerhub id (eg. dockerhub_id/tomcat:myimage)
- Login to dockerhub account via terminal
- Publish your image
- Run a tomcat container on your partner machine using your's published image
  - Check the value environment variable "name" inside the container, it should reflect your name on your partner's machine


Reference
----------------
[Docker Run](https://docs.docker.com/engine/reference/commandline/cli/)

[Dockerfile](https://docs.docker.com/engine/reference/builder/#usage)

[Dockerhub](https://docs.docker.com/docker-hub/)
