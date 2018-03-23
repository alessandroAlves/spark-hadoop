#!/bin/bash

echo " 5 - Configurações do sistema"
echo " ... "

#Start/Stop scripts
cd /opt/
mkdir scripts
cp /vagrant/scripts/*_all.sh /opt/scripts/

#Saving Vars
#java
echo "export JAVA_HOME=/opt/jdk1.8.0_161/" >> /root/.bashrc
#hadoop
echo "export HADOOP_HOME=/opt/hadoop" >> /root/.bashrc
echo "export HADOOP_LOG_DIR=/opt/hadoop/logs" >> /root/.bashrc
echo "export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop" >> /root/.bashrc
#spark
echo "export SPARK_HOME=/opt/spark" >> /root/.bashrc | . ~/.bashrc
#path
echo "export PATH=/opt/solr/bin:/opt/scripts:/opt/spark/bin:/opt/spark/sbin:/opt/hadoop/bin:/opt/hadoop/sbin:${PATH}" >> /root/.bashrc 


 