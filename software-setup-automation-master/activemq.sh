#!/bin/bash

 activemq1 (){
cd /disk2/
wget https://archive.apache.org/dist/activemq/5.14.0/apache-activemq-5.14.0-bin.tar.gz
        tar -xvf apache-activemq-5.14.0-bin.tar.gz
	mv apache-activemq-5.14.0 activemq
    	sudo cp activemq/bin/env /etc/default/activemq
   	sudo chown root:root /etc/default/activemq
        sed -i '34 s/^/#/'  /etc/default/activemq
        #sed -i '35 s/^/ACTIVEMQ_OPTS_MEMORY="-Xms64M -Xmx128M"/'  /etc/default/activemq
   	echo "ACTIVEMQ_HOME="/disk2/activemq"

 ACTIVEMQ_BASE="$ACTIVEMQ_HOME"

 ACTIVEMQ_CONF="$ACTIVEMQ_BASE/conf"

 ACTIVEMQ_DATA="$ACTIVEMQ_BASE/data"

 ACTIVEMQ_TMP="$ACTIVEMQ_BASE/tmp"" >> /etc/default/activemq 
        useradd activemq
   	sudo cp /disk2/activemq/bin/activemq /etc/init.d
   	sudo chown activemq:activemq /etc/init.d/activemq
    	sudo service activemq start
}
  quit (){
exit
}


activemq1
# activemq --version
quit
