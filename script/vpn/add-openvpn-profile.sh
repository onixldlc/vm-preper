cd ~/vpn
sudo docker run -v $PWD/vpn-data:/etc/openvpn --rm -it myownvpn easyrsa build-client-full $1 nopass
sudo docker run -v $PWD/vpn-data:/etc/openvpn --rm myownvpn ovpn_getclient $1 > $1.ovpn
