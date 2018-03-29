#! /bin/bash

function start {
	echo "Starting Hadoop File System - HDFS ..."
	/opt/hadoop/sbin/start-dfs.sh 

	echo "Starting YARN ..."
	/opt/hadoop/sbin/start-yarn.sh 

	echo "Starting Spark History Server ..."
	/opt/spark/sbin/start-history-server.sh
}

function stop {
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