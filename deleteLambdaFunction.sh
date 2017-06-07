#!/bin/bash

STACK_NAME=alexaSkill
REGION=us-east-1

#--------DO NOT CHANGE ANYTHING BELOW THIS LINE -----------

aws cloudformation delete-stack --stack-name $STACK_NAME --region $REGION
aws cloudformation wait stack-delete-complete --stack-name $STACK_NAME --region $REGION
rm functionName.txt