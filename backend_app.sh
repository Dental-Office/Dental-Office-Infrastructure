#!/bin/bash

mkdir ~/jars

# INSTANCE_ID="ami-0df24e148fdb9f1d8"

# # SSH key file for authentication
# SSH_KEY=/Downloads/labsuser.pem

# # Path to the .jar file on my machine
# FILE_PATH=/Documents/dentaloffice/dental-office-api/build/libs/dentaloffice-0.0.1-SNAPSHOT.jar

# mkdir jars

# DEST_PATH=/home/ec2-user/jars

# cd jars

# aws ec2 scp $FILE_PATH ec2-user@$INSTANCE_ID:$DEST_PATH -i $SSH_KEY

# sudo yum update
# sudo yum install java

# java -jar dentaloffice-o.0..1-SNAPSHOT.jar



# # Update the package repositories
# sudo yum update u-y

# # Install Git
# sudo yum install -y git

# # Clone my project repository
# git clone git@gitlab.com:d5911/dental-office-api.git

# # Navigate to the project directory
# cd /Documents/dentaloffice/dental-office-api

# # Make the Gradle wrapper executable
# chmod +x gradlew

# # Build the project
# ./gradlew build

# # Path to the .jar file on my machine
# jar_file=/Documents/dentaloffice/dental-office-api/build/libs/dentaloffice-0.0.1-SNAPSHOT.jar

# # SSH key file for authentication
# ssh_key=/Downloads/labsuser.pem

# # IP address or host name of the EC2 instance
# ec2_instance=ip-10-0-4-203.us-west-2.compute.internal

# EC2_USERNAME=ec2-user

# # Install OpenJDK 11
# ssh -i $ssh_key $EC2_USERNAME@$ec2_instance << EOF
# sudo yum -y update
# sudo yum -y install java-11-openjdk-devel
# exit
# EOF

# # Destination directory on the EC2 instance
# destination_dir=/home/ec2-user/



# # Copy the JAR file to the EC2 instance
# scp -i $ssh_key $jar_file $EC2_USERNAME@$ec2_instance:/home/$EC2_USERNAME/$jar_file

# # SSH into the EC2 instance and run the application
# ssh -i $ssh_key $EC2_USERNAME@$ec2_instance << EOF
# cd /home/$EC2_USERNAME
# java -jar $jar_file &
# exit
# EOF

echo "Deployment complete."

# # Use scp to copy the .jar file to the EC2 instance
# scp -i $ssh_key $jar_file $ec2_instance:$destination_dir





# #!/bin/bash

# # Set variables
# APP_NAME=<dental-office-api>
# EC2_HOST=<your_ec2_instance_public_ip>
# EC2_USERNAME=<your_ec2_instance_username>
# KEY_PATH=<your_ssh_key_path>
# JAR_FILE=<your_jar_file_name>

# # Install OpenJDK 11
# ssh -i $KEY_PATH $EC2_USERNAME@$EC2_HOST << EOF
# sudo yum -y update
# sudo yum -y install java-11-openjdk-devel
# exit
# EOF

# # Build the JAR file with Gradle
# ./gradlew clean build

# # Copy the JAR file to the EC2 instance
# scp -i $KEY_PATH build/libs/$JAR_FILE $EC2_USERNAME@$EC2_HOST:/home/$EC2_USERNAME/$APP_NAME.jar

# # SSH into the EC2 instance and run the application
# ssh -i $KEY_PATH $EC2_USERNAME@$EC2_HOST << EOF
# cd /home/$EC2_USERNAME
# java -jar $APP_NAME.jar &
# exit
# EOF

# echo "Deployment complete."

