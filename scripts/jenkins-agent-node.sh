#!/bin/bash 

sudo su 

apt-get update -y 
apt-get install openjdk-17-jre -y


groupadd jenkins 
mkdir -p /home/jenkins 
chown -R jenkins:jenkins /home/jenkins 

useradd -g jenkins -d /home/jenkins -s /bin/bash -c "User for remote access to master" jenkins

cd /home/jenkins && sudo mkdir -p .ssh
cd .ssh/

ssh-keygen -t rsa -b 2048 -f home/jenkins/.ssh/id_rsa -N "jenkin-credential" -y 
chown jenkins:jekins id_rsa*

cat id_rsa.pub >> /home/jenkins/.ssh/authorized_keys 

Private_key=`cat id_rsa`

echo "Please use this private key to make a connection"
echo "$Private_key"


