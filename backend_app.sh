#!/bin/bash

# Update the package repositories
sudo yum update u-y

# Install Git
sudo yum install -y git

# Clone my project repository
git clone git@gitlab.com:d5911/dental-office-api.git

# Navigate to the project directory
cd /Documents/dentaloffice/dental-office-api

# Make the Gradle wrapper executable
chmod +x gradlew

# Build the project
./gradlew build

# Path to the .jar file on my machine
jar_file=/Documents/dentaloffice/dental-office-api/build/libs/dentaloffice-0.0.1-SNAPSHOT.jar

# SSH key file for authentication
ssh_key=/Downloads/labsuser.pem

# IP address or host name of the EC2 instance
ec2_instance=ip-10-0-4-203.us-west-2.compute.internal

# Destination directory on the EC2 instance
destination_dir=/home/ec2-user/

# Use scp to copy the .jar file to the EC2 instance
scp -i $ssh_key $jar_file $ec2_instance:$destination_dir
