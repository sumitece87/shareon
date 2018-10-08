#!/bin/bash
source ./config.sh
echo "Setting up the nodes"

ssh root@$nodee1 "ifconfig $ip_if $basenet$e1 netmask $netmask up"
ssh root@$nodee2 "ifconfig $ip_if $basenet$e2 netmask $netmask up"
ssh root@$nodee3 "ifconfig $ip_if $basenet$e3 netmask $netmask up"
ssh root@$nodee4 "ifconfig $ip_if $basenet$e4 netmask $netmask up"
ssh root@$nodee5 "ifconfig $ip_if $basenet$e5 netmask $netmask up"


ssh root@$nodesdn "ifconfig $ip_if $basenet$sdn netmask $netmask up"
