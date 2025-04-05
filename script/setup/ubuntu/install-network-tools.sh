#!/bin/bash

### install networking tool
echo "networking tool list:"
echo "1. nslookup, dig (dnsutils)"
echo "2. ip (iproute2)"
echo "3. iputils-ping"
echo "4. traceroute"
echo "5. iperf3"
echo "6. mtr"
echo "7. nmap"
echo "8. tcpdump"
echo "9. wireshark"
echo "10. arp, ifconfig, netstat, route (net-tools)"
echo "11. telnet"
read -p "select networking tool you want to install (1,3,4,11): " LANGS
LANGS="${LANGS:-1,4,11}"

for i in $(echo $LANGS | tr "," "\n"); do

    if [[ $i =~ ^[1]$ ]]; then
        echo "installing dnsutils..."
        sudo apt-get install dnsutils -y
    
    elif [[ $i =~ ^[2]$ ]]; then
        echo "installing iproute2..."
        sudo apt-get install iproute2 -y
    
    elif [[ $i =~ ^[3]$ ]]; then
        echo "installing iputils-ping..."
        sudo apt-get install iputils-ping -y
    
    elif [[ $i =~ ^[4]$ ]]; then
        echo "installing traceroute..."
        sudo apt-get install traceroute -y
    
    elif [[ $i =~ ^[5]$ ]]; then
        echo "installing iperf3..."
        sudo apt-get install iperf3 -y
    
    elif [[ $i =~ ^[6]$ ]]; then
        echo "installing mtr..."
        sudo apt-get install mtr -y
    
    elif [[ $i =~ ^[7]$ ]]; then
        echo "installing nmap..."
        sudo apt-get install nmap -y
    
    elif [[ $i =~ ^[8]$ ]]; then
        echo "installing tcpdump..."
        sudo apt-get install tcpdump -y
    
    elif [[ $i =~ ^[9]$ ]]; then
        echo "installing wireshark..."
        sudo apt-get install wireshark -y
    
    elif [[ $i =~ ^[10]$ ]]; then
        echo "installing net-tools..."
        sudo apt-get install net-tools -y
    
    elif [[ $i =~ ^[11]$ ]]; then
        echo "installing telnet..."
        sudo apt-get install telnet -y
        
    else
        echo "invalid selection, please select a valid tool."
        echo "exiting..."
        exit 1
        
    fi
done