#! /bin/bash

echo " 4 - Instalando Solr"
echo " ... "

cd /opt
tar xzf /vagrant/resources/installers/solr-7.2.1.tgz

ln -s solr-7.2.1/ solr

runuser -l vagrant -c 'export SOLR_HOME=/opt/solr'
runuser -l vagrant -c 'export SOLR_CONF_DIR=/opt/solr/server/solr/configsets/_default/conf'

yes | cp /vagrant/resources/config/solrconfig.xml /opt/solr/server/solr/configsets/_default/conf

chown -R vagrant:vagrant solr-7.2.1/

#testa serviço do solr
runuser -l vagrant -c '/opt/solr/bin/solr start -Dsolr.directoryFactory=HdfsDirectoryFactory -Dsolr.lock.type=hdfs -Dsolr.data.dir=hdfs://localhost:9000/solr -Dsolr.updatelog=hdfs://localhost:9000/solr -p 8983'

#Precisa do hdfs no ar
/opt/hadoop/sbin/start-dfs.sh

#Cria Collection
runuser -l vagrant -c '/opt/solr/bin/solr create -c EleicoesCollection'

#Derruba serviço do solr
runuser -l vagrant -c '/opt/solr/bin/solr stop -all'

#Derruba hadoop
/opt/hadoop/sbin/stop-dfs.sh