#!/bin/bash

MYUSERS="alpha beta gamma"

for usr in $MYUSERS
do
   echo "Adding user $usr."
   sudo useradd $usr
   id $usr
   echo "##############################"
done