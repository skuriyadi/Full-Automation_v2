# Code Challenge

This project is created to install a two-tier application. The project is split into two modules, Infrastructure management and Configuration management. Jenkinks is used for integrating the modules.

Terraform is used for Infrastructure Management and Ansible is used for Configuration Management. Nginx server or Docker image/website is the endpoint of this project. Nginx server/website can be accessed from your web browser through using port 80.

Terraform will provision an AWS EC2 server with an Ubuntu operating system.

Ansible will install docker on the AWS EC2 and run a docker container with image provided.

Jenkins will automate all modules and launch the website on Nginx server.

## Getting Started

Copy/Clone the repository codechallenge to your local system and GitHub.

## Prerequisites
```
Operating System: CentOS 7
Terraform
Ansible
AWS Account
Jenkins Account

```
## Module structure
```

── ansible
│   ├── config-management
│   │   ├── defaults
│   │   │   └── main.yml
│   │   ├── files
│   │   ├── handlers
│   │   │   └── main.yml
│   │   ├── meta
│   │   │   └── main.yml
│   │   ├── README.md
│   │   ├── tasks
│   │   │   ├── install.yml
│   │   │   └── main.yml
│   │   ├── templates
│   │   ├── tests
│   │   │   ├── inventory
│   │   │   └── test.yml
│   │   └── vars
│   │       └── main.yml
│   ├── installdocker.yml
│   └── Jenkins.pem
├── docker
│   ├── Dockerfile
│   └── index.html
├── jenkins
│   └── Jenkinsfile
└── terraform
    ├── dev
    │   ├── automation
    │   │   └── ansible
    │   ├── create.tfplan
    │   ├── get-pip.py
    │   ├── main.tf
    │   ├── plan
    │   ├── terraform.tfstate
    │   ├── terraform.tfstate.backup
    │   ├── tfplan
    │   └── variable.tfvars
    └── modules
        ├── ec2
        │   ├── ansible
        │   ├── instances.tf
        │   ├── inventory.tpl
        │   ├── Jenkins.pem
        │   └── variables.tf
        └── vpc
            ├── network.tf
            └── variables.tf


```

## Installation
```
Initializing AWS:

Configure AWS CLI and configure the credentials in the workstation

Initializing Terraform:

Download Terraform tool and Install it in your CentOS 7 workstation
$ cd /terraform/dev/ and run "terraform init" to initialize the Terraform


Initializing Ansible:

copy your AWS PEM Key to /ansible/ folder

```

## Running the tests

```
$ cd /terraform/dev/ and run "terraform plan" to create an execution plan and check the current state.

Output will show all the details of the plan if the code is executed correctly.

```

## Deployment

```
Login to Jenkins and run "Automation_New" Job
 
 - Select the Automation type
      - Full Automation: Will provision AWS Instances and Launch the website on Nginx server.
      - Launch EC2: will create only EC2 Instances
      - Image update: will launch docker image on Docker container
 - Update number of instances required
 - Choose the AMI image 
 - Choose the Docker image

```
## Destroy
```
 $ cd /automation/terraform/dev
 $ terraform destroy -auto-approve
```

## Version
Version 1.0.0

## Authors

* **Shiva Prasad** 

