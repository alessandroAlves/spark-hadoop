#! /bin/bash	

echo "Stopping Solr ..."
runuser -l vagrant -c '/opt/solr/bin/solr start stop -all'

echo "Stopping Spark History Server ..."
stop-history-server.sh

echo "Stopping YARN ..."
stop-yarn.sh 

echo "Stopping Hadoop File System - HDFS ..."
stop-dfs.sh 




