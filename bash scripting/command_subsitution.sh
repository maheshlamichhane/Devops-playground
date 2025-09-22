#!/bin/bash

echo "Welcome $USER on $HOSTNAME."
echo "############################################################"

FREERAM=$(free -m | grep Mem | awk '{print $4}')
LOAD=$(uptime | awk '{print $10}')
ROOTFREE=$(df -h | grep '/dev/nvme0n1p2' | awk '{print $4}')

echo "###########################################################"
echo "Available free RAM is $FREERAM MB"
echo "###########################################################"
echo "Current load Average: $LOAD"
echo "###########################################################"
echo "Free ROOT partition size is: $ROOTFREE"

