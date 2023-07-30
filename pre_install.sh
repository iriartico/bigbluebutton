#!/bin/bash

# Check if Docker is installed
if command -v docker &>/dev/null; then
    echo "Docker Installed"
else
    ./requirements/install_docker.sh
fi

# Configure firewall
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 1935/tcp
ufw allow 7443/tcp
ufw allow 16384:32678/udp
ufw enable

# Configure the hostname and the public IP address
echo -n "Please enter the hostname [bbb.mydomain.com]: "
read hostname

echo -n "Please enter the public IP [8.8.8.8]: "
read public_ip

file="/etc/hostname"

if [[ "$hostname" != "$(cat "$file")" ]]; then
    echo "$hostname" | tee "$file" > /dev/null
fi

grep -v "$hostname" /etc/hosts | grep -v "$public_ip" | tee -a /etc/hosts
echo -e "$public_ip\t$hostname" | tee -a /etc/hosts

# Others requisites
apt-get install -y language-pack-en
systemctl set-environment LANG=en_US.UTF-8
update-locale LANG=en_US.UTF-8