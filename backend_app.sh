#!/bin/bash

BUCKET_NAME="dental-office-app"
S3_JAR_FILE_URL="https://dental-office-app.s3.us-west-2.amazonaws.com/dentaloffice-0.0.1-SNAPSHOT.jar"
LOCAL_DIR="/home/ec2-user/jars"
LOCAL_FILE_NAME="dentaloffice-0.0.1-SNAPSHOT.jar"

mkdir -p $LOCAL_DIR

sudo chmod 755 $LOCAL_DIR

sudo yum update -y

sudo yum install java-17-amazon-corretto-devel -y

cd $LOCAL_DIR

wget $S3_JAR_FILE_URL

echo "Successfully downloaded jar file to EC2 instance"