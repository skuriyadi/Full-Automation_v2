#!/bin/bash
cd /opt/terransijenk/terraform/dev/ && terraform apply -auto-approve

echo `aws ec2 describe-instance-status --instance-id "$(sed -n 1p /opt/terransijenk/jenkins/templates/ec2_id.txt)"` > /opt/terransijenk/jenkins/templates/aws.json
state=`cat /opt/terransijenk/jenkins/templates/aws.json | jq .InstanceStatuses[0].SystemStatus.Status`
echo $state
#if [ $state = '"'ok'"' ]
#then 
#cd /opt/terransijenk/ansible/ && ansible-playbook installdocker.yml --private-key Jenkins.pem -u ubuntu
#else
#echo "AWS Instance not yet provisioned, please check the aws console"
#fi
until [ $state = '"'ok'"' ]

do
echo `aws ec2 describe-instance-status --instance-id "$(sed -n 1p /opt/terransijenk/jenkins/templates/ec2_id.txt)"` > /opt/terransijenk/jenkins/templates/aws.json
state=`cat /opt/terransijenk/jenkins/templates/aws.json | jq .InstanceStatuses[0].SystemStatus.Status`
if [ $state = '"'ok'"' ]
then
break
fi
done
echo $state
cd /opt/terransijenk/ansible/ && ansible-playbook installdocker.yml --private-key Jenkins.pem -u ubuntu



#until [ $state = '"'ok'"' ]
#do
#echo "AWS Instance is provisioning"
#done
#cd /opt/terransijenk/ansible/ && ansible-playbook installdocker.yml --private-key Jenkins.pem -u ubuntu

