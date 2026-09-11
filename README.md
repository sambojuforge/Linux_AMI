# AWS Linux Build Server AMI Creation

This code is implemented to create custom AWS Linux Build Server AMI's 

This code uses:

    * Ansible - Is used to install desired packages 

    * Packer - Is used to run provisioners (Ansible playbooks) to create AMIs

    * InSpec - Is used to test the final AMIs

----    

## Pipeline

The pipeline for this code can be file linux-buildserver-pipeline.yml file

The pipeline is created in such a way that if any commits pushed to branches other than master, the code will run in AWS test account

When you have finalized your code, you can submit a PR request to devops team

After PR approval, the code wil be merged into master

Merging into master will trigger the code to run in Shared Devops AWS account and share this AMI to all of our existing AWS accounts 

Note: When you make changes, please change the verison number under ami_name in linux-buildserver.json file

---- 

## Contents 

Packer file is builderver/linux-buildserver.json

Unit tests InSpec file is builderver/inspec.rb

Asible playbooks are located at playbooks/

Pipeline file is linux-buildserver-pipeline.yml

---- 

## To locally test this code

### Following packages installed in you linux

Installing Ansible 

```bash
$ sudo yum install python2-pip-9.0.3-1.amzn2.0.2.noarch
$ pip install ansible==2.9.14
```

Installing Packer

```bash
$ sudo wget https://releases.hashicorp.com/packer/1.6.4/packer_1.6.4_linux_amd64.zip
$ sudo tar -xvf packer_1.6.4_linux_amd64.zip -C /usr/local/bin/
```

Installing InSpec

```bash
$ sudo wget https://omnitruck.chef.io/install.sh 
$ bash install.sh -s -- -P inspec
```

### Following environment variables to be defined 

Below are the environment variables that need to be defined on your machine

AWS_ACCESS_KEY_ID_main

AWS_SECRET_ACCESS_KEY_main

AWS_ACCESS_KEY_ID_test

AWS_SECRET_ACCESS_KEY_test

AWS_SUBNET_ID

AWS_VPC_ID

AWS_SSH_USERNAME=ec2-user

AWS_INSTANCE_TYPE

AWS_REGION

AWS_AMI_ID

### To run this code locally, follow below

After the above variables are defined, navigate to /buildserver/

Run the below commands

```bash
$ packer validate linux-buildserver.json
$ packer build linux-buildserver.json
```
