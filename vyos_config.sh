#!/bin/bash

echo "Please enter the path to config file downloaded form aws"
read config
echo "Please enter private ip of vyos instance"
read privateip
echo "Please enter the VPC CIDR in which VyOS resides in"
read vpccidr
echo "Please enter the gateway for vyos instance"
read gateway
rm -rf config.sh
echo "#!/bin/vbash" >>config.sh
echo "source /opt/vyatta/etc/functions/script-template" >>config.sh
echo 'echo "Vyos-1.1.7" |run add system image http://packages.vyos.net/iso/release/1.1.7/vyos-1.1.7-amd64.iso'  >>config.sh
echo "configure"  >>config.sh
echo "set protocols static route $vpccidr next-hop $gateway distance 10" >>config.sh
`cat $config | grep -v "\!" >>config.sh`
`sed -i.bak "s/local-address.*'/local-address $privateip/g" config.sh`
sed -i.bak  "s!network.*!network $vpccidr!g" config.sh
sed -i.bak '/^$/d' config.sh
echo "set vpn ipsec nat-traversal enable" >> config.sh
echo "commit" >>config.sh
echo "save" >>config.sh
echo "exit" >>config.sh
echo 'echo "Yes" |run reboot' >>config.sh


echo "Please execute script config.sh on VyOS instance"
