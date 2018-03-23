#!/bin/bash

echo " 5 - Configurações do sistema"
echo " ... "

#Start/Stop scripts
cd /opt/
mkdir scripts
cp /vagrant/scripts/*_all.sh /opt/scripts/

#Salvando variáveis
#java
echo "export JAVA_HOME=/opt/jdk1.8.0_161/" >> /etc/profile

#hadoop
echo "export HADOOP_HOME=/opt/hadoop" >> /etc/profile
echo "export HADOOP_LOG_DIR=/opt/hadoop/logs" >> /etc/profile
echo "export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop" >> /etc/profile

#spark
echo "export SPARK_HOME=/opt/spark" >> /etc/profile 

#path
echo "export PATH=/opt/solr/bin:/opt/scripts:/opt/spark/bin:/opt/spark/sbin:/opt/hadoop/bin:/opt/hadoop/sbin:${PATH}" >> /etc/profile 

#Adicionando serviços na inicialização do sistema
echo "sleep 60s" >> /etc/rc.d/rc.local
echo "start_services.sh" 
chmod +x /etc/rc.d/rc.local
chmod +x /vagrant/scripts/start_services.sh
