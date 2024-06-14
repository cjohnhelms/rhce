sudo yum update -y
sudo yum install iptables -y
sudo sysctl -w net.ipv4.ip_forward=1
sudo /sbin/iptables -t nat -A POSTROUTING -o enX0 -j MASQUERADE
sudo yum install -y iptables-services
sudo systemctl enable --now iptables.service