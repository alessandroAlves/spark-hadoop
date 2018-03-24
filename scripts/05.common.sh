#!/bin/bash

echo " 5 - Configurações do sistema"
echo " ... "

#Salvando variáveis
#java
echo "export JAVA_HOME=/opt/jdk1.8.0_161/" >> ~/.bashrc

#hadoop
echo "export HADOOP_HOME=/opt/hadoop" >> ~/.bashrc
echo "export HADOOP_LOG_DIR=/opt/hadoop/logs" >> ~/.bashrc
echo "export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop" >> ~/.bashrc

#spark
echo "export SPARK_HOME=/opt/spark" >> ~/.bashrc

#solr/bin
echo "export SOLR_HOME=/opt/solr" >> ~/.bashrc
echo "export SOLR_CONF_DIR=/opt/solr/server/solr/configsets/_default/conf" >> ~/.bashrc

#path
echo "export PATH=/opt/solr/bin:/opt/scripts:/opt/spark/bin:/opt/spark/sbin:/opt/hadoop/bin:/opt/hadoop/sbin:${PATH}" >> ~/.bashrc 
runuser -l vagrant -c 'echo "export PATH=/opt/solr/bin:/opt/scripts:/opt/spark/bin:/opt/spark/sbin:/opt/hadoop/bin:/opt/hadoop/sbin:${PATH}" >> ~/.bashrc'

#Inicializando serviços com o sistema
cd /opt/
mkdir scripts
cp /vagrant/scripts/spark-hadoop-solr.sh /opt/scripts/
chown -R vagrant:vagrant /opt/scripts
chmod +x /opt/scripts/spark-hadoop-solr.sh
echo "/opt/scripts/spark-hadoop-solr.sh start" >> /etc/rc.local 

 
