#!/bin/bash

 tomcat (){
 cd /disk2/
 wget http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.45/bin/apache-tomcat-8.0.45.tar.gz
 tar -xvf apache-tomcat-8.0.45.tar.gz  
 mv apache-tomcat-8.0.45 tomcat
 useradd -m -d /home/tomcat tomcat
 sudo mkdir /home/tomcat 
 sudo chown -R tomcat:tomcat /home/tomcat/
 sudo touch /home/tomcat/iconnect_services.properties 
 sudo mkdir /disk2/applogs
 sudo chown -R tomcat:tomcat /disk2/applogs/
 sudo chown -R tomcat:tomcat tomcat/*


echo "JAVA_OPTS="$JAVA_OPTS -Xms1024m -Xmx2048m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/disk2/dumps"
CATALINA_OPTS="$CATALINA_OPTS -Dlogback.configurationFile=/home/tomcat/logback-qa.xml -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote -Djava.rmi.server.hostname=10.10.50.26 -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"" >> tomcat/bin/setenv.sh 
 echo "  <Resources

        cachingAllowed="true"

        cacheMaxSize="100000"

    />
    <!-- Uncomment this to disable session persistence across Tomcat restarts -->
    <!--
    <Manager pathname="" />
    -->" >> tomcat/conf/context.xml  
echo "<Resource name="jdbc/iconnect_services"
          auth="Container"
          type="javax.sql.DataSource"
          factory="org.apache.tomcat.jdbc.pool.DataSourceFactory"
          testWhileIdle="true"
          testOnBorrow="true"
          testOnReturn="false"
          validationQuery="SELECT 1"
          validationInterval="30000"
          timeBetweenEvictionRunsMillis="30000"
          maxActive="200"
          minIdle="10"
          maxWait="10000"
          initialSize="10"
          removeAbandonedTimeout="60"
          removeAbandoned="true"
          minEvictableIdleTimeMillis="30000"
          jmxEnabled="true"
          username="iconnect_qa"
          password="iconnect"
          driverClassName="com.mysql.jdbc.Driver"
          url="jdbc:mysql://qabackend3:3306/iconnect_qa?zeroDateTimeBehavior=convertToNull"/> " >> tomcat/conf/context.xml
 cd tomcat/bin/
 sudo cat /home/vagrant/tomcat.conf  >>  /etc/init.d/tomcat 
 sudo cd /etc/init.d/
 sudo chown tomcat:tomcat /etc/init.d/tomcat 
 sudo chmod +x tomcat 
 sudo service tomcat start
}
tomcat
 
sh /disk2/tomcat/bin/version.sh 

