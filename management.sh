!#/bin/bash


# Display a WELCOME TEXTLINE
echo "The script has been written by...and is for system health monitoring ."
echo

# 2. Checks for the following

# a) Number of vCPUs
vcpu_count=$(grep -c processor /proc/cpuinfo)
echo "Number of vCPUs:$vcpu_count"
echo

# b) RAM size and used RAM
ram_total=$(free -h | awk '/^Mem:/ {print $2}')
ram_used=$(free -h | awk '/^Mem:/ {print $3}')
echo "RAM Total: $ram_total"
echo "RAM Used: $ram_used"
echo

# c) Total disk size and used disk size
disk_total=$(df -h --total | awk '/^total/ {print $2}')
disk_used=$(df -h --total | awk '/^total/ {print$3}')
echo "Total Disk Size: $disk_total"
echo "Used Disk Size: $disk_used"
echo

# d) Get public and private IP addresses of server
private_ip=$(hostname -I)
public_ip=$(curl -s ifconfig.me)
echo "private IP: $private_ip"
echo "public IP: $public_ip"
echo

# e) Get the status of services installed on the server (example: nginx and sshd)
services=("nginx" "sshd")  # Add more services as needed
echo "Service  statuses:"
for service in "${services[@]}"
do
	status=$(systemctcl is-active $services)
	echo "services: $status"
done
