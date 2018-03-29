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
echo "export HADOOP_YARN_HOME=/opt/hadoop" >> ~/.bashrc

#spark
echo "export SPARK_HOME=/opt/spark" >> ~/.bashrc

#path
echo "export PATH=/opt/scripts:/opt/spark/bin:/opt/spark/sbin:/opt/hadoop/bin:/opt/hadoop/sbin:${PATH}" >> ~/.bashrc 

#Configurando inicialização do hadoop com os serviços com o sistema
cd /opt/
mkdir scripts
cp /vagrant/scripts/hadoop-service.sh /opt/scripts/
chmod +x /opt/scripts/hadoop-service.sh
yes | cp /vagrant/resources/config/rc.local /etc 
chmod +x /etc/rc.local

 
#Iniciando o Hadoop
sh /opt/scripts/hadoop-service.sh start