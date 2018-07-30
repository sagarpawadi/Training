# Topic: Ad-Hoc Commands and Basic Ansible Modules


## The Assignment

Perform the following operations using ad-hoc commands and ansible modules :

1. Fetch and display to STDOUT Ansible facts using the `setup` module.
2. Fetch and display only the "virtual" subset of facts for each host.
3. Fetch and display the value of fully qualified domain name (FQDN) of each host from their Ansible facts.
4. Display the uptime of all hosts using the `command` module.
5. Ping all hosts **except** the 'control' host using the `--limit` option
6. Setup Java8 on the hosts in the "App" group using the apt module.
7. Setup and enable the EPEL package repository on the hosts in the "web" group using the yum module.
  * CentOS systems use the latest `epel-release` package
  * RHEL systems should use [https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm](https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm)
  * Create inventory groups app and web
8. set a cron on ansible control machine that will run every 1 minute ,  and perform below tasks:-
  * execute ansible adhoc commands on client machines (cannot be control machine) , to  create a file in /var/log/ninja_name on all the client nodes,
    append `system_hostname [:space:] system_time` in the file every 1 minute using ansible facts.
## Reference

* `ansible --help` `ansible-doc -s <module_name>`
* [ping module](http://docs.ansible.com/ansible/ping_module.html)
* [setup module](http://docs.ansible.com/ansible/setup_module.html)
* [yum module](http://docs.ansible.com/ansible/yum_module.html)
* [apt module](http://docs.ansible.com/ansible/apt_module.html)
* [command module](http://docs.ansible.com/ansible/command_module.html)
* [Introduction To Ad-Hoc Commands](http://docs.ansible.com/ansible/intro_adhoc.html)
* [cron module](http://docs.ansible.com/ansible/latest/cron_module.html)
* [All File Modules](http://docs.ansible.com/ansible/latest/list_of_files_modules.html)
* [block in file](http://docs.ansible.com/ansible/latest/blockinfile_module.html)
 