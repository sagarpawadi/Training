# Topic: Ansible Modules

## Topics to be Covered

* Ansible Core Modules
* Gathering facts using ansible modules
* Inventory file usage

## What You Will Learn

* More about ansible modules and using inventory file on group basis.

## The Assignment

1. Create and delete ninja directory on host machine
1. Set hostname on all nodes from remote machine
1. Fetch os of all nodes and store o/p into a file, use min two different machine of different flavour of os.
1. Add three group into hosts file through ansible module.
```
          Debian ( ip of debian machine)
          Centos ( ip of centos machine)
          All ( ip of all nodes )
```

## Problem statement: Using Adhoc command

Step 1:
```
    * Install apache on Debian machine
    * Cross check apache isntalled or not from remote machine
    * Apache runn  on 8082 port
    * Create two virtual host
    * Restart apache from remote machine
```
Step2:
```
   * Install nginx on centos machine
   * Nginx run on 8080 port.
```

Step3:
``` 
   * Configure Nginx - configure it to run as reverse proxy to apache
```

## Reference

* [Files_modules](http://docs.ansible.com/ansible/latest/list_of_files_modules.html)
* [Hostname](http://docs.ansible.com/ansible/latest/hostname_module.html)
* [Nginx_reverse_proxy](https://www.digitalocean.com/community/tutorials/how-to-configure-nginx-as-a-web-server-and-reverse-proxy-for-apache-on-one-ubuntu-14-04-droplet)
