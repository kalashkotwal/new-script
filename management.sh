#!/bin/bash


# 1. Display a WELCOME TEXTLINE
echo "This script has been written by KALASH KOTWAL and is for SYSTEM HEALTH MONITORING."
echo

# 2. Checks for the following

# a) Number of vCPUs
num_vcpus=$(nproc)
echo "Number of vCPUs: $num_vcpus"
echo

# b) RAM size and used RAM
total_ram=$(free -h | awk '/^Mem:/ {print $2}')
used_ram=$(free -h | awk '/^Mem:/ {print $3}')
echo "Total RAM: $total_ram"
echo "Used RAM: $used_ram"
echo

# c) Total disk size and used disk size
total_disk=$(df -h --total | awk '/^total/ {print $2}')
used_disk=$(df -h --total | awk '/^total/ {print$3}')
echo "Total Disk Size: $total_disk"
echo "Used Disk Size: $used_disk"
echo

# d) Get public and private IP addresses of server
ip_private=$(hostname -I)
ip_public=$(curl -s ifconfig.me)
echo "private IP: $ip_private"
echo "public IP: $ip_public"
echo

# e) Get the status of services installed on the server (example: Apache2 and Mysql)
services=("Apache2" "Mysql")  # Add more services as needed
echo "Service  statuses:"
for service in "${services[@]}"
do
	status=$(systemctcl is-active $service)
	echo "$service: $status"
done
