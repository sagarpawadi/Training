# Assignments 

* Assignment1:  
	1. Install Nginx 
	2. Install below listed plugins
		1. SSH plugin
		2. Git plugin
     	
* Assignment2:
	1. Enable password less login between jenkins & root user
	2. Check  Global configuration and provide SSH remote host(root) details
 	 
     
* Assignment3:
	1. Create a tag creator Jenkins Job
	2. Job will create tag on your forked repo.
	3. Job should accept 2 parameters  
		1. SRC_BRANCH  
		2. TAG_NAME
		
        
* Assignment4:
	1. Sync your forked jenkins repo with https://github.com/ot-training/jenkins.git (using multiple remote).  
	2. Create a Deployer Jenkins Job(static-code-deployment).  
	3. It will checkout code from https://github.com/<your-name>/jenkins.git (your forked repo).
	4. Job will require a parameter TAG_NAME 
	5. It will use SSH Publish plugin to publish files from jenkins server to target server
	6. Deploy index.html (existed inside attendees/assignments/day7) into nginx doc root.
	7. Update index.html (with your name) and create a new tag. 
	8. Deploy with new tag.  

* Assignment5:
	1. Install tomcat7   
	2. Install mysql
	3. Fork [ContinuousIntegration](https://github.com/OpsTree/ContinuousIntegration) from opstree account.
	4. Create a job Spring3HibernateApp-deployment
		1. This job will be copy of static-code-deployment
		2. Update deploymnet target to tomcat webapps directory
		3. This job and code-stability (job from 6th day assignmnet) will  have common workspace.
	5. Deploy Spring3HibernateApp.war into tomcat7 (pick from workspace, copy into webapp of tomcat)

	6. Verify you can acecess http://<your-machine-ip>:8080/Spring3HibernateApp/

* Assignment6:
	1. Configure nginx in a way so that it can serve
		1. static file (index.html) at http://<your-machine-ip>
		2. java application (Spring3HibernateApp) at http://<your-machine-ip>/Spring3HibernateApp/  
		Hint: Add another location (Spring3HibernateApp/) and proxy_pass details in your nginx configireation. 


---

* Assignment7:  
	1. Deploy a demo node application
		1. Fork [node-js-sample](https://github.com/OpsTree/node-js-sample) repo into your account  
		2. Create a jenkins job to build node code and create a tar file(artifact)  
		3. Stop already application, Deploy tar file on a target server and start application again.
		Hint: Use pm2 to start and stop node process (process management)  
	

 
