## find ec2 info by list of ips and return ami private ip and name tag
```shell
aws ec2 describe-instances --filters Name=private-ip-address,Values='IP','IP' --query "Reservations[*].Instances[*].{IP:PrivateIpAddress,AMI:ImageId,Name:Tags[?Key== '*']|[0].Value}" --output table
```