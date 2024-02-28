sudo docker run -v $PWD/vpn-data:/etc/openvpn --rm -it myownvpn easyrsa build-client-full $2 nopass
sudo docker run -v $PWD/vpn-data:/etc/openvpn --rm myownvpn ovpn_getclient $2 > $2.ovpn
