# Assignments 

* Prerequisite: Install Job DSL [job-dsl](https://plugins.jenkins.io/job-dsl) plugin first.  
* *Ref Doc: [job-dsl pluign doc](https://jenkinsci.github.io/job-dsl-plugin/)*    


* Assignment1:  
	1. Create Job DSL for   
		1. helloworld Job  
		2. hellotoperson Job (Take SALUTATION as choice parameter & NAME as string parameter)  
		3. Gitclone and list content of cloned directory  
		4. buildperiodically Job (This job will run by every 5 min)  
		5. pollscm Job (This job will have a poll interval of 2 min)  
		6. upstream Job (This job have helloworld job as upstream)  
		7. downstream Job ( This job have hellotoperson job as downstream. Note: Pass variable(SALUTATION & NAME) from this job to hellotoperson job.)   
		8. nestedview Job ( This job will create a nested view named as 'ninja-jobs' with folders 'simple-jobs' & 'complex-jobs'. simple-jobs will contain helloworld, hellotoperson, Gitclone, buildperiodically and  pollscm. complex-jobs will contain upstream and downstream jobs.)  
		

* Assignment2: 
	1. Write Job DSL to Setup CI/CD (Java app) Jobs
		1. tagcreation Job (check assignment of day7 for details).   
		1. codestability Job  
		2. codequality Job   
		3. codecoverage Job (The all 3 jobs will be based on Java project(Spring3HibernateApp) from [ContinuousIntegration](https://github.com/OpsTree/ContinuousIntegration).)  
		4. deployment Job for war file (Deployed into tomcat7).  
		5. static-deployment Job for static file deployment in nginx (Deployment of static code i.e. index.html from day7 assignment).    


---

* Assignment3:
	1. Write Job DSL to Setup CI/CD (Nodejs app) Jobs 
		1. nodeapp-tagcreation Job  
		2. nodeapp-build Job (This will build (download dependency and create tar package) nodejs sample app code from [node-js-sample](https://github.com/OpsTree/node-js-sample)).  
		3. nodeapp-deploy Job (Check assignmnet 7 of [day7](https://github.com/ot-training/jenkins/blob/master/attendees/assignments/day7/assignments.md#assignments) for more details).  
	
     	
