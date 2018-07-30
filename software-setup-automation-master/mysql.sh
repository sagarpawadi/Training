#!/bin/bash
mysql(){
sudo apt-get update
sudo apt-get install mysql-server-5.6
sudo /etc/init.d/mysql stop
sudo mkdir -p /disk2/mysql/
sudo su << EOF
sudo cp -R -p /var/lib/mysql/* /disk2/mysql/
EOF
#vim /etc/mysql/my.cnf
sudo sed -i '40 s/^/#/' /etc/mysql/my.cnf
sudo sed -i '40i\datadir                = /disk2/mysql\' /etc/mysql/my.cnf
#sudo vim /etc/apparmor.d/tunables/alias
sudo sed -i '16i\alias /var/lib/mysql/ -> /disk2/mysql,\' /etc/apparmor.d/tunables/alias
sudo /etc/init.d/apparmor reload
sudo chown -R mysql:mysql /disk2/mysql/*
sudo rm -rf /var/lib/mysql
sudo /etc/init.d/mysql start
sudo chown -R mysql:mysql /disk2/mysql*
#gunzip iconnect_prod_backup_*.sql.gz
mysql -u root -p
CREATE USER 'iconnect_qa'@'%' IDENTIFIED BY 'iconnect_qa';
GRANT ALL PRIVILEGES ON * . * TO 'iconnect_qa'@'%';
FLUSH PRIVILEGES;
create database iconnect_qa;
}
mysql
