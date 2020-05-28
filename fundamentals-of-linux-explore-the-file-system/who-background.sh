mkdir /home/U1
mkdir /home/U2
sudo useradd -d /home/U1 -p $(openssl passwd -1 p1) U1
sudo useradd -d /home/U2 -p $(openssl passwd -1 p2) U2
chown -R U1 /home/U1
chown -R U2 /home/U2 
mkdir report
touch file1.txt file2.txt file3.txt
touch .conf1 .conf2
touch report1.csv report2.csv
echo "root:p0" | chpasswd





