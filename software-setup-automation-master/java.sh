#!/bin/bash
java(){
cd /tmp
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
tar -xf jdk-8u131-linux-x64.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo mv jdk1.8* /usr/lib/jvm/java-8-oracle
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-oracle/jre/bin/java 1091
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-8-oracle/bin/javac 1091
sudo touch /etc/profile.d/jdk.sh
sudo -s <<EOF
source /etc/profile.d/jdk.sh
EOF
sudo -s <<EOF
echo "export J2SDKDIR=/usr/lib/jvm/java-8-oracle" >> /etc/profile.d/jdk.sh
echo "export J2REDIR=/usr/lib/jvm/java-8-oracle/jre" >> /etc/profile.d/jdk.sh
echo "export PATH=$PATH:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin" >> /etc/profile.d/jdk.sh
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/profile.d/jdk.sh
echo "export DERBY_HOME=/usr/lib/jvm/java-8-oracle/db" >> /etc/profile.d/jdk.sh
EOF
}
java

