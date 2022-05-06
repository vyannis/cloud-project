#!/bin/bash

LOG_FILE="/vagrant/logs/install_ansible.log"
DEPLOY_KEY_SRC="/vagrant/files/ansibledeploy"
DEPLOY_KEY_DST="/home/vagrant/.ssh/ansibledeploy"
ANSIBLE_DATA="/vagrant/ansible"

echo "=> [1]: Installing required packages..."
yum install ansible -y >> $LOG_FILE 2>&1

cp $DEPLOY_KEY_SRC $DEPLOY_KEY_DST >> $LOG_FILE 2>&1
chmod 600 $DEPLOY_KEY_DST >> $LOG_FILE 2>&1

ansible-playbook -i $ANSIBLE_DATA/hosts.ini $ANSIBLE_DATA/cloud-playbook.yml --key-file $DEPLOY_KEY_DST >> $LOG_FILE 2>&1