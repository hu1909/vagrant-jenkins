#!/bin/bash


export DATE=`date +%Y%m%d`

echo "********** Start to install Jenkins **********"

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

if [ $? -eq 0 ]; then
        echo "********** Downloaded the Jenkins GPG key **********"  
else
        echo " Please check the log to see detail error " 
fi


echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "*********** Update the package index **********"
sudo apt-get update -y

echo "********** Install Jenkins **********"
sudo apt-get install jenkins -y

echo "********** Install support package **********"
sudo apt-get install fontconfig openjdk-17-jre -y 

echo "*********** Start the Jenkin service **********"
sudo systemctl start jenkins 
sudo systemctl enable jenkins 

initPassword=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword`

echo "Please use this password to login as default user: $initPassword" 