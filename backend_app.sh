#!/bin/bash

BUCKET_NAME="dental-office-app"
S3_FILE_PATH="s3://dental-office-app/dentaloffice-0.0.1-SNAPSHOT.jar"
LOCAL_DIR="/home/ec2-user/jars"
LOCAL_FILE_NAME="dentaloffice-0.0.1-SNAPSHOT.jar"

mkdir -p $LOCAL_DIR

sudo chmod 755 $LOCAL_DIR

sudo yum update -y

sudo yum install java-17-amazon-corretto-devel -y

# Download the file from the S3 bucket to the local directory
# aws s3 cp s3://$BUCKET_NAME/$S3_FILE_PATH $LOCAL_DIR/$LOCAL_FILE_NAME

aws s3 cp s3://denatl-office-app/dentaloffice-0.0.1-SNAPSHOT.jar /home/ec2-user/jars

# aws s3 cp s3://dental-office-app/s3://dental-office-app/dentaloffice-0.0.1-SNAPSHOT.jar /home/ec2-user/jars/dentaloffice-0.0.1-SNAPSHOT.jar

echo "File downloaded successfully"