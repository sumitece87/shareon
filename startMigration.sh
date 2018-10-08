#!/bin/bash
source ./config.sh
oldIP=$(cat oldEdge.txt);
ssh -i ~/.ssh/id_geni_ssh_rsa smaheshw@$oldIP "cd /var/lib/lxd/containers/;
tar -xczf edgecontainer.tar.gz edgecontainer;
echo "Starting Container Migration";
newIP=$(cat newIP.txt);
sudo scp tom1.tar.gz smaheshw@$newIP:/var/lib/lxd/containers/;
echo "Migration Successful";"

ssh -i ~/.ssh/id_geni_ssh_rsa smaheshw@$newIP "cd /var/lib/lxd/containers/;
tar -xzvf edgecontainer.tar.gz;
ln -s ../containers/edgecontainer;
echo "Importing container";
lxd import edgecontainer;
echo "List of containers";
lxc list;
echo "Starting container";
lxc stop edgecontainer;
lxc start edgecontainer;
lxc list;
echo "Running Number Plate Recognition on a Migrated Container";
lxc exec edgecontainer /root/runalpr.sh >> time.txt;
python3 sdnreporting1.py;
echo "Experiment successful";"
