#! /bin/bash

function start {
	echo "Starting Hadoop File System - HDFS ..."
	/opt/hadoop/sbin/start-dfs.sh 

	echo "Starting YARN ..."
	/opt/hadoop/sbin/start-yarn.sh 

	echo "Starting Spark History Server ..."
	/opt/spark/sbin/start-history-server.sh

	echo "Starting Solr ..."
	sleep 90s
	hdfs dfs -rm -f /solr/index/write.lock
	runuser -l vagrant -c '/opt/solr/bin/solr start -Dsolr.directoryFactory=HdfsDirectoryFactory -Dsolr.lock.type=hdfs -Dsolr.data.dir=hdfs://localhost:9000/solr -Dsolr.updatelog=hdfs://localhost:9000/solr -p 8983'
}

function stop {
	echo "Stopping Solr ..."
	runuser -l vagrant -c '/opt/solr/bin/solr stop -all'

	echo "Stopping Spark History Server ..."
	/opt/spark/sbin/stop-history-server.sh

	echo "Stopping YARN ..."
	/opt/hadoop/sbin/stop-yarn.sh 

	echo "Stopping Hadoop File System - HDFS ..."
	/opt/hadoop/sbin/stop-dfs.sh 
}

case "${1}" in
        start)
                start
                ;;
        stop)
                stop
                ;;
        restart)
                stop
                start
                ;;
        *)
                echo "${0} {start|stop|restart}"
                exit 1
        esac
exit 0