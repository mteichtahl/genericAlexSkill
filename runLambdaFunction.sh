#!/bin/bash

FUNCTION_ARN=$(head -n 1 functionName.txt)
REGION=us-east-1
OUTPUT=lambdaOutput.txt

aws lambda invoke --function-name $FUNCTION_ARN \
  --region $REGION $OUTPUT

cat $OUTPUT