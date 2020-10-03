#!/bin/bash
REGIONS=$@
for REGION in $REGIONS
do
echo "Listing VPC in REGION $REGION"
aws ec2 describe-vpcs --region $REGION | jq .Vpcs[].VpcId
echo "---------------------------------------------------------"
echo " Listing VPC CIDRBLOCK in REGION $REGION"
aws ec2 describe-vpcs --region $REGION | jq .Vpcs[].CidrBlockAssociationSet[].CidrBlock
done
