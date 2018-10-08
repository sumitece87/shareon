#!/bin/bash
oldIP=$(cat oldEdge.txt);
load=1;
while [ $load -le 15 ]
do
	ssh root@node1-$oldIP "lxc exec edgecontainer bash; cat /proc/loadavg >> loadserver1.txt;  stress -c $load -t 10; sleep 5; "
	sleep 5;
	load=$(($load+1));
done


