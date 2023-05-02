#!/bin/bash

# sudo amazon-linux-extras install java-openjdk11
# sudo yum install java-17-amazon-corretto.x86_64
# sudo yum install java-17-amazon-corretto-devel

mkdir /home/ec2-user/jars

sudo chmod 777 /home/ec2-user/jars/

sudo yum update -y

sudo yum install java-17-amazon-corretto-devel -y