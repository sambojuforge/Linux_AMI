# AWS Linux Build Server AMI

This repository contains the infrastructure-as-code to build a custom AWS Linux Build Server AMI using **Packer**, **Ansible**, and **InSpec**.

---

## Tools Used

- **Ansible** — installs and configures required packages on the AMI
- **Packer** — orchestrates provisioners (Ansible playbooks) to build the AMI
- **InSpec** — runs automated compliance tests against the final AMI

---

## Repository Structure

```
├── buildserver/
│   ├── linux-buildserver.json   # Packer template
│   └── inspec.rb                # InSpec compliance tests
├── playbooks/                   # Ansible playbooks for each package
│   ├── install_ansible.yml
│   ├── install_azuredevopsagent.yml
│   ├── install_docker.yml
│   ├── install_dotnetsdk22.yml
│   ├── install_dotnetsdk31.yml
│   ├── install_dotnetsdk5.yml
│   ├── install_dotnetsdk6.yml
│   ├── install_fontconfig.yml
│   ├── install_git.yml
│   ├── install_gulpcli.yml
│   ├── install_inspec.yml
│   ├── install_java11.yml
│   ├── install_karma.yml
│   ├── install_kerberos.yml
│   ├── install_maven.yml
│   ├── install_nodev8.yml
│   ├── install_nodev12.yml
│   ├── install_packer.yml
│   ├── install_powershell.yml
│   ├── install_python.yml
│   ├── install_pywinrm.yml
│   └── install_ruby.yml
└── linux-buildserver-pipeline.yml  # Azure DevOps pipeline
```

---

## Pipeline

The pipeline is defined in `linux-buildserver-pipeline.yml` and runs on Azure DevOps.

- Commits to any branch **other than `main`** run the pipeline against a **test AWS account**
- Commits to **`main`** run the pipeline against the **production AWS account** and share the resulting AMI with target accounts
- To contribute, open a pull request to `main` — the AMI version number in `buildserver/linux-buildserver.json` (`ami_name`) should be incremented with each change

---

## Prerequisites

### Install Ansible

```bash
sudo yum install python2-pip-9.0.3-1.amzn2.0.2.noarch
pip install ansible==2.9.14
```

### Install Packer

```bash
sudo wget https://releases.hashicorp.com/packer/1.6.4/packer_1.6.4_linux_amd64.zip
sudo unzip packer_1.6.4_linux_amd64.zip -d /usr/local/bin/
```

### Install InSpec

```bash
sudo wget https://omnitruck.chef.io/install.sh
bash install.sh -s -- -P inspec
```

---

## Local Testing

### Required Environment Variables

Set the following environment variables before running Packer locally:

| Variable | Description |
|----------|-------------|
| `AWS_ACCESS_KEY_ID_main` | AWS access key for the production account |
| `AWS_SECRET_ACCESS_KEY_main` | AWS secret key for the production account |
| `AWS_ACCESS_KEY_ID_test` | AWS access key for the test account |
| `AWS_SECRET_ACCESS_KEY_test` | AWS secret key for the test account |
| `AWS_SUBNET_ID` | Subnet ID to launch the builder instance in |
| `AWS_VPC_ID` | VPC ID to launch the builder instance in |
| `AWS_SSH_USERNAME` | SSH username (e.g. `ec2-user`) |
| `AWS_INSTANCE_TYPE` | EC2 instance type (e.g. `t3.small`) |
| `AWS_REGION` | AWS region (e.g. `us-east-1`) |
| `AWS_AMI_ID` | Source AMI ID to build from |
| `Team1_AccountID` | AWS account ID for the first AMI share target |
| `Team2_AccountID` | AWS account ID for the second AMI share target |

### Run Packer

```bash
cd buildserver/
packer validate linux-buildserver.json
packer build linux-buildserver.json
```
