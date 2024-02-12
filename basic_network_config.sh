#!/bin/bash

# Prompt for network configuration details
read -p "Enter the IP address: " ip_address
read -p "Enter the subnet mask: " subnet_mask
read -p "Enter the default gateway: " default_gateway
read -p "Enter the DNS server: " dns_server

# Defining network configuration file
network_config_file="/etc/network/interfaces"

# Backup the original network configuration file
cp $network_config_file $network_config_file.bak

# New network configuration to the file
cat << EOF > $network_config_file
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address $ip_address
    netmask $subnet_mask
    gateway $default_gateway
    dns-nameservers $dns_server
EOF

# Restart the networking service to apply changes
sudo systemctl restart networking

echo "Network configuration has been updated!"
