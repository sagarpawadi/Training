

# Topic: Continuous integration and Continuous Deployment using Jenkins and Ansible


## The Assignment
All needs to be done using ansible modules with jenkins
There will be three jenkins jobs,
Provisioning, Build, Deployment.



Provisioning:-

1. Provision application servers, for example - java, tomcat are required for a java project.
1. This job will be a separate job and can be executed to any machine on requirement.

### Build and Deployment Job will be in downstream relationship.

Build:-
1. Build any Project - can be java or any other language using jenkins.

Deployment:-
1. Create a down stream deployment job to the build job .
2. In the deployment job , deploy the artifact (war in case of java) to the application server (tomcat/joboss) using ansible in the downstream job.
3. Ansible play book will include health check also, (status code == 200) , if health check fails, job should also fail.




## Resources

* [YAML Syntax](http://docs.ansible.com/ansible/YAMLSyntax.html)
* [service module](http://docs.ansible.com/ansible/service_module.html)
* [uri module](http://docs.ansible.com/ansible/template_module.html)
* [file module](http://docs.ansible.com/ansible/file_module.html)
