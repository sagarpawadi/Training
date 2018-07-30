## Topic: Docker Revision

Topics to be Covered
------------------------
* Docker CLI
* Dockerfile
* Docker Volume
* Docker Ports
* Docker Network
* Docker Compose
* Docker Swarm

Assignment
------------------------
* Create a seperate docker network 'mynet' (bridge mode) and use it for below tasks.

* Create docker image for Spring3HibernateApp

* Dockerize Spring3HibernateApp via Docker CLI
	- Use created image for running container
	- Bind application to host machine port 80
	- Persist webapps volume 
	- Restict memory utilization to 512M
	- Container should be removed if it gets into exited state
	- Run container in recently docker network 'my-net'

* Dockerize Spring3HibernateApp via Docker Compose
	- Deploy service using created image
	- Use 'my-net' network
	- Bind host machine port 80
	- Instead of volume mount use data volume to persist webapps directory

* Dockerize Spring3HibernateApp via Docker Swarm
	- Setup 1 manager and 2 worker nodes
	- Deploy Spring3HibernateApp stack using compose file
	- Replicate service to 3 containers

Reference
-----------------
[Spring3HibernateApp](https://github.com/OpsTree/ContinuousIntegration/tree/master/Spring3HibernateApp)

[Docker Run](https://docs.docker.com/engine/reference/run/)

[Docker Network](https://docs.docker.com/v17.09/engine/userguide/networking/work-with-networks/#create-networks)

[Dockerfile](https://docs.docker.com/engine/reference/builder/)

[Docker Compose](https://docs.docker.com/compose/compose-file/)

[Docker Swarm](https://docs.docker.com/engine/swarm/#swarm-mode-cli-commands)

