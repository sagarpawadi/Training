# Workshop: Start Playing with Ansible Playbooks

## Topics to be Covered

* Using `ansible-playbook`
* YAML syntax basics
* Basic Ansible playbook structure
* Tasks,modules and plays
* Deploy a simple war file in Tomcat using ansible

## What You Will Learn

* How to use `ansible-playbook`
* The basics of YAML syntax and Ansible playbook structure

### NOTE

You will need to assure each host in "app" group has setup the java7 with java home setup. OS can be anyone ubuntu/centos.

## The Assignment

Create an Ansible playbook that targets members of the "app" group has the following state:

1. The tomcat7 is installed in all host
1. Has the war file in webapps folder specified in `appwar`.
1. Tomcat is started on each host.

While developing the playbook use the `--syntax-check` to check your work and debug problems. Run your playbook in verbose mode using the `-v` switch to get more information on what Ansible is doing. Try `-vv` and `-vvv` for added verbosity. Also consider running `--check` to do a dry-run as you are developing.

## Resources

* [YAML Syntax](http://docs.ansible.com/ansible/YAMLSyntax.html)
* [Intro to Ansible Playbooks](http://docs.ansible.com/ansible/playbooks_intro.html)
* [yum module](http://docs.ansible.com/ansible/yum_module.html)
* [apt_module](http://docs.ansible.com/ansible/apt_module.html)
* [file module](http://docs.ansible.com/ansible/file_module.html)
* [service module](http://docs.ansible.com/ansible/service_module.html)
