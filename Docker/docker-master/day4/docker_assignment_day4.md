## Topic: Docker DOCKERFILE

Topics to be Covered
------------------------
* What is DockerFile.
* How DockerFile is easing the things that we were doing using Docker CLI.

Assignment 1
-------------------
1. Create a file named index.js with below content.

index.js
----------------
var os = require("os");
var hostname = os.hostname();
console.log("hello from " + hostname);

2. Create a file named Dockerfile and write code as per the steps mentioned.

* Use alpine image.
* Add Author/Maintainer name in DockerFile
* run commands -> apk update & apk add nodejs
* copy current directory to /app
* change your working directory to /app
* specify the default command to be run upon container creation as mentioned below.
	node index.js
	
3. Build image from Dockerfile.
4. Tag image with name "hello:v0.1"

Assignment 2
-----------------------
1. Create a DockerFile.
2. Use Ubuntu latest image.
3. Add your name as a Manintainer.
4. Update local packages using command (apt-get update).
5. Install nodejs package.
6. Install npm package.
7. Create a symlink using command (ln -s /usr/bin/nodejs /usr/bin/node).
8. Trigger a command (npm install -g http-server)
9. Add any test index.html file from local at /usr/apps/hello-docker/index.html on container.
10. change your working directory to /usr/apps/hello-docker/.
11. Run a command (http-server -s) on every container initialization.

12. Build your dockerfile and tag it with "yourname:docker-web"
13. Run a docker container from the image that you have just created and map container 8080 port to host 8080 port.(8080:8080)
14. Try accessing your webpage using "http://<virtualmachine_ipaddress>:8080/index.html" URL.
15. Delete docker container and image from local.


Reference
-----------------
[Docker DockerFile](https://docs.docker.com/engine/reference/builder/)
