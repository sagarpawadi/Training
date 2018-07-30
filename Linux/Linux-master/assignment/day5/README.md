* How would you check

    - Memory used by a process(RAM)
    - total number of open files by a process
    - running duration of a process

* What is file descriptor

* How to kill a process

    - forcefully
    - gracefully

* What are the signals

* What is parent process ID

* Print pid of current shell

* How to clear a log file of running process

* What will happen if you delete a log file of running process

* How do you check all the running process in the system

* How do you check those process that are waiting for the resources

* What init process is responsible for

* What are Running, Waiting, Stopped and Zombie processes

* How do you you elevate the priority of a process

* What are stdin, stdout, and stderr and how do we use them

* How many tables are there in iptables. What filter and nat table responsible for

* What are the defualt policies in iptables and What it signifies.

* What is the difference between -I and -A while applying a rule in iptables

* What is the kernel module that tracks the connection block ssh and ftp access for vagrant1 machine to vagrant2
   machine

* What is DNAT and SNAT, Explain both with an example

* Make a shell script that would configure a firewall as below:

   - Flush all the rules
   - set default DROP policy for INPUT, ACCEPT for FORWARD and OUTPUT chain of filter table
   - Allow ssh from vagrant machine1 only
   - Allow port 80,443 from everywhere
   - Allow ping from outside
   - Allow loopback Access
   - Allow DNS
   - Allow rsync from outside
   - Allow postfix or sendmail
   
* Write a rule that would prevent you from DDOS attack [HINT: 25 connections/minute]