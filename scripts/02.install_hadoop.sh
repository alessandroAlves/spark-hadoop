#!/bin/bash

echo " 2 - Instalando HADOOP 2.7.5"
echo " ... "

echo "Descompactando instalador ..."
cd /opt/
tar xzf /vagrant/resources/installers/hadoop-2.7.5.tar.gz
ln -s /opt/hadoop-2.7.5/ hadoop


export HADOOP_HOME=/opt/hadoop
export HADOOP_LOG_DIR=$HADOOP_HOME/logs/
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH


echo "Copiando arquivos de configuração ... "
yes | cp /vagrant/resources/config/core-site.xml 	$HADOOP_CONF_DIR
yes | cp /vagrant/resources/config/hdfs-site.xml 	$HADOOP_CONF_DIR
yes | cp /vagrant/resources/config/hadoop-env.sh 	$HADOOP_CONF_DIR
yes | cp /vagrant/resources/config/mapred-site.xml  $HADOOP_CONF_DIR
yes | cp /vagrant/resources/config/yarn-site.xml	$HADOOP_CONF_DIR


echo "Configurando SSH" 
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

yes | cp /vagrant/resources/config/ssh_config /etc/ssh/
cp /vagrant/resources/config/known_hosts ~/.ssh/ 


echo "Configurando HDFS"
hdfs namenode -format -force

#prepara e testa hdfs
start-dfs.sh
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/root

#spark logs dir
hdfs dfs -mkdir /spark-logs

stop-dfs.sh

