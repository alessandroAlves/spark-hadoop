#! /bin/bash

cd /opt

tar xzf /vagrant/resources/installers/apache-hive-1.2.2-bin.tar.gz
ln -s /opt/apache-hive-1.2.2-bin/ hive

export HIVE_HOME=/opt/hive/

yes | cp /vagrant/resources/config/hive-config.sh $HIVE_HOME/bin