#!/bin/bash
##################################################
# This script will list all the resources in the AWS account
# Author: Kalemudeen
#
# Supported AWS services by the script
# 1. EC2
# 2. S3
# 3. RDS
# 4. DynamoDB
# 5. Lambda
# 6. EBS
# 7. VPC
# 8. IAM
# 9. CloudWatch
# 10. CloudFormation
#
# Usage: ./aws_resources.sh
# Example: ./aws_resources.sh us-east-1 EC2

##################################################

# Check if the required arguments are passed

if [ $# -lt 2 ]; then
    echo "Usage: $0 <region> <service>"
    echo "Example: $0 us-east-1 EC2"
    exit 1
fi

# Check if the AWS CLI is installed

if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it before running the script"
    exit 1
fi

# Check if the AWS CLI is configured

if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured.  Please configure it before running the script"
    exit 1
fi

# Execute the AWS CLI command based on the service

case $2 in
    EC2)
        aws ec2 describe-instances --region $1
        ;;
    S3)
        aws s3api list-buckets --region $1
        ;;
    RDS)
        aws rds describe-db-instances --region $1
        ;;
    DynamoDB)
        aws dynamodb list-tables --region $1
        ;;
    Lambda)
        aws lambda list-functions --region $1
        ;;
    EBS)
        aws ec2 describe-volumes --region $1
        ;;
    VPC)
        aws ec2 describe-vpcs --region $1
        ;;
    IAM)
        aws iam list-users --region $1
        ;;
    CloudWatch)
        aws cloudwatch list-metrics --region $1
        ;;
    CloudFormation)
        aws cloudformation list-stacks --region $1
        ;;
    *)
        echo "Invalid service. Supported services are EC2, S3, RDS, DynamoDB, Lambda, EBS, VPC, IAM, CloudWatch, CloudFormation"
        ;;
esac



