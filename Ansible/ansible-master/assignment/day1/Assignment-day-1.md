# Topic: Installing Ansible

## Topics to be Covered

* Installing Ansible using pip, yum or apt
* Automating Ansible Installation
* Configuration file basics
* Ansible inventory Usage 
* How to install a package

## What You Will Learn

* How easy it is to install and configure Ansible for yourself.

## The Assignment

1. Use pip to install the `ansible` package and its dependencies to your control machine.
1. Display the Ansible version and man page to STDOUT.
1. Check all the possible parameters you need to know in ansible.cfg file.
1. Ansible Inventory: Check the default inventory file for ansible control master and use inventory, run ansible ping commands on various inventory groups. Try this on minimum of two virtual machines.(You can use any of these Docker/Vagrant)
1. In `~/.ansible.cfg` file (create the file if it doesn't exist already) do the following:
  * Create a new directory `~/.ansible/retry-files` and set `retry_files_save_path` to it.
  * Set the Ansible system `forks` to 10

## Problem statement: Using Adhoc command
```
- Host a static website on minimum three hosts using inventory, content of static website is "Index page of Ansible assignment"
Document root /opt/html

- First do this manually and then with jenkins using ansible plugin or execute shell.
- only use ansible modules.
````
 * You will need to install below software on all hosts
    * nginx


 

## Reference

* [Ansible Installation](http://docs.ansible.com/ansible/intro_installation.html)
* [Ansible Configuration File](http://docs.ansible.com/ansible/intro_configuration.html)
