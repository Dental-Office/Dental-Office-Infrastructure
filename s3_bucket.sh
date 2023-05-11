#!/bin/bash

echo `pwd`

BUCKET_NAME="dental-office-app"
REGION="us-west-2"
FILE_PATH="backend-app/dentaloffice-0.0.1-SNAPSHOT.jar"

# Create the S3 bucket
aws s3api create-bucket \
    --bucket $BUCKET_NAME \
    --region $REGION \
    --create-bucket-configuration LocationConstraint=$REGION

echo "S3 bucket created successfully"

# Copy file to the bucket
aws s3 cp $FILE_PATH s3://$BUCKET_NAME/

echo "File uploaded successfully"

# Public access to the s3 bucket and object
aws s3api put-public-access-block --bucket dental-office-app --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false


aws s3api put-bucket-policy --bucket dental-office-app --region us-west-2 --policy '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket"
            ],
            
            "Resource": [
                "arn:aws:s3:::dental-office-app/*",
                "arn:aws:s3:::dental-office-app"
            ]
        }
    ]
}'

echo "Bucket and objects set to public access successfully"


# mkdir $BUCKET_NAME/frontend
aws s3api put-object --bucket $BUCKET_NAME --key frontend_app/


echo "Direktory is created"