#!/bin/bash



# sudo amazon-linux-extras install java-openjdk11
# sudo yum install java-17-amazon-corretto-devel
# sudo yum install java-11-openjdk-devel

mkdir /home/ec2-user/jars

sudo chmod 777 /home/ec2-user/jars/

# cd /home/ec2-user/jars/

sudo yum update -y

sudo yum install java-17-amazon-corretto-devel


