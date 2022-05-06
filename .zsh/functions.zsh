# AWS ECR
function ecrpush(){
  docker push "$(aws sts get-caller-identity --query Account --output text)".dkr.ecr.us-gov-west-1.amazonaws.com/"$1"
}

function ecrpull(){
  docker pull "$(aws sts get-caller-identity --query Account --output text)".dkr.ecr.us-gov-west-1.amazonaws.com/"$1"
}

#IPA
function ipajoin(){
  ipa-client-install --domain="$1".bip.va.gov --realm="$1^^".BIP.VA.GOV -p $2 -W --server=idm."$1".bip.va.gov --force-join --mkhomedir
}

# AWS IAM
function assume_aws_role(){
	unset AWS_SESSION_TOKEN AWS_SECRET_ACCESS_KEY AWS_ACCESS_KEY_ID

	local ROLE_NAME="$1"
	local ACCOUNT_ID="$(aws sts get-caller-identity --output text --query Account)"
	local TAIL="$(echo $RANDOM | md5sum | head -c 5)"

	local tokens=$(aws sts assume-role --role-arn arn:aws-us-gov:iam::${ACCOUNT_ID}:role/project/${ROLE_NAME} --role-session-name testing-${TAIL})

	local secret=$(echo -- "$tokens" | sed -n 's!.*"SecretAccessKey": "\(.*\)".*!\1!p')
	local session=$(echo -- "$tokens" | sed -n 's!.*"SessionToken": "\(.*\)".*!\1!p')
	local access=$(echo -- "$tokens" | sed -n 's!.*"AccessKeyId": "\(.*\)".*!\1!p')
	local expire=$(echo -- "$tokens" | sed -n 's!.*"Expiration": "\(.*\)".*!\1!p')

	export AWS_SESSION_TOKEN=$session
	export AWS_SECRET_ACCESS_KEY=$secret
	export AWS_ACCESS_KEY_ID=$access

	aws sts get-caller-identity
}

function unassume_aws_role(){
	unset AWS_SESSION_TOKEN AWS_SECRET_ACCESS_KEY AWS_ACCESS_KEY_ID
}

#AWS SSM
function ssm_connect(){
  local NAME="$1"

  local id=$(aws ec2 describe-instances --filter "Name=tag:Name,Values=[${NAME}]" --query "Reservations[].Instances[].InstanceId" --output text)

  aws ssm start-session --target=$id
}

#AWS EC2
function ec2_list(){
  local TAG_KEY="$1"
  local TAG_VALUES="$2"

  aws ec2 describe-instances --filter "Name=tag:${TAG_KEY},Values=[${TAG_VALUES}]" --query 'Reservations[].Instances[].[ [Tags[?Key==`Name`].Value][0][0],PrivateIpAddress,InstanceId,State[?Name==`Running`].Value[0]]' --output table
}

function ec2_subnet_list(){
  aws ec2 describe-subnets | jq -r '.Subnets[] | {id: .SubnetId, name: .Tags | map(select(.Key == "Name"))}'
}

