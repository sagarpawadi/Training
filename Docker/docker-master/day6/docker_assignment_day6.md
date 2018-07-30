## Topic: Docker-Compose day1

Topics to be Covered
------------------------
* What is Docker-Compose file.
* Why Docker-Compose.
* How Docker-compose ease the image and container creation.

Assignment
-------------------
* Install docker-compose on your machine, if not already installed.
* Check docker-compose version.
* Create a directory named nginx in your root.
* Switch to that directory and create a file named docker-compose.yaml
* Use docker-compose version 2 to create docker-compose.yaml file.
* Create a service named "databases".
* Use image named "mysql"
* Map container 3306 port to host machine 3306 port.
* Add environment variables named "MYSQL_ROOT_PASSWORD", "MYSQL_DATABASE", "MYSQL_USER" and "MYSQL_PASSWORD" along with corresponding values for all.

* Add another service named "web"
* Use image "nginx"
* Save docker-compose.yaml file and do docker-compose up.
* Verify nginx service is up and is accessible on machine.
* Stop and remove your docker container using docker-compose.


Reference
-----------------
[Docker-Compose](https://docs.docker.com/compose/overview/)
