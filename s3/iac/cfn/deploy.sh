#!/bin/bash

echo 'Deploy S3 bucket via CFN (Cloudformation)'

STACK_NAME="cfn-s3-simple"

aws cloudformation deploy \
--template-file template.yaml \
--no-execute-changeset \
--region eu-north-1 \
--stack-name $STACK_NAME\