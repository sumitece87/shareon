#!/bin/bash
source ./config.sh
nullStr='none'
while true
do
	sudo scp root@node1-9:/root/report.txt .
	newIP=$(python3 decision.py 2>&1)
	if [ "$newIP" != "$nullStr" ];then
		sudo scp -o StrictHostKeyChecking=no oldEdge.txt $newIP:/users/smaheshw/
	else
		echo "QoS requirement met, no migration."
	fi
	sleep 1
done
