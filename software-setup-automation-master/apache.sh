#!/bin/bash
apache2(){
sudo apt-get update
sudo apt-get install apache2
cd /etc/apache2/sites-available/
sudo rm  000-default.conf
sudo touch fleet.conf
sudo touch ports.conf
sudo mkdir /disk2/site-apache-root         
sudo chown -R www-data:www-data site-apache-root/       
sudo mkdir -p /disk2/site-apache-root /fleet/commons
sudo service apache2 start
}
apache2
