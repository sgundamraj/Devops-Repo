#!/bin/bash
REGIONS=$@
for REGION in $REGIONS
do
#echo "Listing VPC in REGION $REGION"
VPCS=$(aws ec2 describe-vpcs --region $REGION | jq .Vpcs[].VpcId)
VPCSARRAY=($VPCS)
LENGTH=${#VPCSARRAY[@]}
#echo ${VPCSARRAY[@]}
#echo "---------------------------------------------------------"
#echo " Listing VPC CIDRBLOCK in REGION $REGION"
CIDR=$(aws ec2 describe-vpcs --region $REGION | jq .Vpcs[].CidrBlockAssociationSet[].CidrBlock)
CIDRARRAY=($CIDR)
#echo ${CIDRARRAY[@]}

for ((i=0;i<$LENGTH;i++))
do
   echo "${VPCSARRAY[i]}  ------->  ${CIDRARRAY[i]}"
done
done
