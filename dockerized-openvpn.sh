cd ~
mkdir vpn
cd vpn
git clone https://github.com/kylemanna/docker-openvpn.git
cd docker-openvpn/
sudo docker build -t myownvpn .
cd ..
mkdir vpn-data && touch vpn-data/vars
sudo docker run -v $PWD/vpn-data:/etc/openvpn --rm myownvpn ovpn_genconfig -u udp://$1:3000
sudo docker run -v $PWD/vpn-data:/etc/openvpn --rm -it myownvpn ovpn_initpki
sudo docker run -v $PWD/vpn-data:/etc/openvpn -d -p 3000:1194/udp --cap-add=NET_ADMIN myownvpn
