mkdir /home/U1
mkdir /home/U2
mkdir /home/U3
mkdir /home/U4
sudo useradd -d /home/U1 -p $(openssl passwd -1 p1) U1
sudo useradd -d /home/U2 -p $(openssl passwd -1 p2) U2
sudo useradd -d /home/U3 -p $(openssl passwd -1 p3) U3
sudo useradd -d /home/U4 -p $(openssl passwd -1 p4) U4
chown -R U1 /home/U1
chown -R U2 /home/U2 
chown -R U3 /home/U3 
chown -R U4 /home/U4 
mkdir report
touch file1.txt file2.txt file3.txt
touch .conf1 .conf2
touch report1.csv report2.csv
echo "root:p0" | chpasswd
echo "U1 ALL=(ALL) ALL" >> /etc/sudoers
echo "U3 ALL=(root) /bin/ls" >> /etc/sudoers
touch /home/U1/script1.py
touch /home/U2/script2.py
touch /home/U3/script3.py
touch /home/U4/script4.py




