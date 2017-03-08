#!/bin/bash

echo "Please enter the path to config file downloaded form aws"
read config
echo "Please enter private ip of vyos instance"
read privateip
echo "Please enter the VPC CIDR in which VyOS resides in"
read vpccidr
echo "Please enter the gateway for vyos instance"
read gateway
rm -rf real.out
echo "set protocols static route $vpccidr next-hop $gateway distance 10" >>real.out
`cat $config | grep -v "\!" >>real.out`
`sed -i.bak "s/local-address.*'/local-address $privateip/g" real.out`
sed -i.bak  "s!network.*!network $vpccidr!g" real.out
sed -i.bak '/^$/d' real.out
echo "set vpn ipsec nat-traversal enable" >> real.out
