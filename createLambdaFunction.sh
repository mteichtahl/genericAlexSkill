#!/bin/bash

STACK_NAME=alexaSkill
PACKAGE_FILE_NAME=alexaSkill.zip
S3_BUCKET=lambdfunctions
LAMBDA_FUNCTION_NAME=testSkillFunction
REGION=us-east-1

#--------DO NOT CHANGE ANYTHING BELOW THIS LINE -----------

DATE=`date +%Y%m%d_%H%M%S`
PACK="$DATE-$PACKAGE_FILE_NAME"
zip -r $PACK node_modules/ speechAssets/ handlers/ lib/ index.js
aws s3 cp ./$PACK s3://$S3_BUCKET/ 

aws cloudformation create-stack --stack-name $STACK_NAME --template-body file://lambdaStackCfn.json --region $REGION --parameters \
ParameterKey=FunctionName,ParameterValue=$LAMBDA_FUNCTION_NAME \
ParameterKey=BucketName,ParameterValue=$S3_BUCKET \
ParameterKey=PackagePath,ParameterValue=$PACK --capabilities CAPABILITY_IAM 

aws cloudformation wait stack-create-complete --stack-name $STACK_NAME --region $REGION
aws cloudformation describe-stacks --stack-name $STACK_NAME --region $REGION --output json | jq -r '.Stacks[0].Outputs[0].OutputValue' > functionName.txt

rm $PACK