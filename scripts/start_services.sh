#! /bin/bash

echo "Starting Hadoop File System - HDFS ..."
start-dfs.sh 

echo "Starting YARN ..."
start-yarn.sh 

echo "Starting Spark History Server ..."
start-history-server.sh

echo "Starting Solr ..."
runuser -l vagrant -c '/opt/solr/bin/solr start -Dsolr.directoryFactory=HdfsDirectoryFactory -Dsolr.lock.type=hdfs -Dsolr.data.dir=hdfs://localhost:9000/solr -Dsolr.updatelog=hdfs://localhost:9000/solr -p 8983'