#!/bin/bash

echo " 1 - Instalando JDK 8"
echo " ... "

cd /opt/
tar xzf /vagrant/resources/installers/jdk-8u161-linux-x64.tar.gz
cd /opt/jdk1.8.0_161/
alternatives --install /usr/bin/java java /opt/jdk1.8.0_161/bin/java 2
alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_161/bin/jar 2
alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_161/bin/javac 2
alternatives --set jar /opt/jdk1.8.0_161/bin/jar
alternatives --set javac /opt/jdk1.8.0_161/bin/javac	  
alternatives --set java /opt/jdk1.8.0_161/bin/java

export JAVA_HOME=/opt/jdk1.8.0_161/

java -version