#!/bin/bash
echo "Starting License Plate Recognition Application"
ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_geni_ssh_rsa smaheshw@204.102.244.68 -p 22 "lxc stop edgecontainer; lxc start edgecontainer; lxc exec edgecontainer /root/runalpr.sh >> time.txt;
python3 sdnreporting.py"


