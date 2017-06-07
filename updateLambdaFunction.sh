#!/bin/bash

PACKAGE_FILE_NAME=alexaSkill.zip
S3_BUCKET=lambdfunctions
LAMBDA_FUNCTION_NAME=testSkillFunction
REGION=us-east-1

#--------DO NOT CHANGE ANYTHING BELOW THIS LINE -----------

DATE=`date +%Y%m%d_%H%M%S`
PACK="$DATE-$PACKAGE_FILE_NAME"
zip -r $PACK node_modules/ speechAssets/ handlers/ lib/ index.js
aws s3 cp ./$PACK s3://$S3_BUCKET/ 
aws lambda update-function-code --function-name $LAMBDA_FUNCTION_NAME --s3-bucket $S3_BUCKET --s3-key $PACK --region $REGION

rm $PACK
aws s3 rm s3://$S3_BUCKET/$PACK