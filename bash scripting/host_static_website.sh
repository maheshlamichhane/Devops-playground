#!/bin/bash

# Variable Declaration
PACKAGE="apache2 wget unzip"
SVC="apache2"
URL="https://www.tooplate.com/zip-templates/2098_health.zip"
ART_NAME="2098_health"
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "############################################################"
echo "Installing packages."
echo "############################################################"
sudo apt install $PACKAGE -y > /dev/null
echo

# Start & Enable Apache Service
echo "############################################################"
echo "Start & Enable Apache2 Service"
echo "############################################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temp Directory
echo "#############################################################"
echo "Starting Artifact Deployment"
echo "#############################################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $URL > /dev/null
unzip "$ART_NAME.zip" > /dev/null
sudo cp -r $ART_NAME/* /var/www/html/
echo

# Restart Apache Service
echo "##############################################################"
echo "Restarting Apache2 Service"
echo "#############################################################"
sudo systemctl restart $SVC
echo

# Clean Up
echo "#############################################################"
echo "Removing Temporary Files"
echo "#############################################################"
rm -rf $TEMPDIR
echo

sudo systemctl status $SVC --no-pager
ls /var/www/html

# Done
echo "#############################################################"
echo "Deployment Complete. Visit: http://localhost"
echo "#############################################################"
