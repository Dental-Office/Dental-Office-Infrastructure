#!/bin/bash

mkdir /home/ec2-user/jars

sudo chmod 777 jars/

cd /home/ec2-user/jars/

sudo yum update -y

sleep 30s

sudo amazon-linux-extras install java-openjdk11

sudo yum install java-11-openjdk-devel

