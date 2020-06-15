mkdir /home/U1
mkdir /home/U2
sudo useradd -d /home/U1 -p $(openssl passwd -1 p1) U1
sudo useradd -d /home/U2 -p $(openssl passwd -1 p2) U2
chown -R U1 /home/U1
chown -R U2 /home/U2 
ssh -oStrictHostKeyChecking=no root@[[HOST2_IP]] 
mkdir /home/W1
sudo useradd -d /home/W1 -p $(openssl passwd -1 p1) W1
sudo useradd -d /home/W1 -p $(openssl passwd -1 p1) U1
exit
