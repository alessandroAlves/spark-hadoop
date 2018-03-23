#!/bin/bash

echo " 3 - Instalando Spark 2.3.0"
echo " ... "

cd /opt/
tar xzf /vagrant/resources/installers/spark-2.3.0-bin-hadoop2.7.tgz
ln -s spark-2.3.0-bin-hadoop2.7/ spark

export SPARK_HOME=/opt/spark
export PATH=/opt/spark/bin:/opt/spark/sbin:${PATH}

yes | cp /vagrant/resources/config/spark-defaults.conf $SPARK_HOME/conf

echo "Spark Ok!" 