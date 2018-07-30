## Topic: Docker-Swarm Advanced

Topics to be Covered
------------------------
* Docker Swarm
* Docker Compose

Assignment
-------------------
* Use docker compose file to create a stack over swarm
	- Deploy a wordpress service (service_name: wordpress)
	- Deploy database service to serve wordpress (service_name: db)
	- Restrict service resource utilization
		- Wordpress : CPU=0.25 Mem=256M
		- Database : CPU=0.50 Mem=512M
	- Setup environment variables for database service
		- MYSQL_ROOT_PASSWORD: wordpress
       	- MYSQL_DATABASE: wordpress
       	- MYSQL_USER: wordpress
        - MYSQL_PASSWORD: wordpress
	- Setup environment variables for wordpress service
		- WORDPRESS_DB_HOST: db:3306
       	- WORDPRESS_DB_USER: wordpress
       	- WORDPRESS_DB_PASSWORD: wordpress
    - Define deploy scale policies for wordpress service
    	- replicas: 3
    - Deploy the stack and inspect the services
    - Remove the running service

 * Destroy the docker swarm stack

Reference
-----------------
[Docker Swarm](https://docs.docker.com/engine/swarm/#swarm-mode-cli-commands)

