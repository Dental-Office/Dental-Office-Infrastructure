#!/bin/bash

BUCKET_NAME="dental-office-app"
# S3_FILE_PATH="

mkdir /home/ec2-user/jars

sudo chmod 777 /home/ec2-user/jars/

sudo yum update -y

sudo yum install java-17-amazon-corretto-devel -y