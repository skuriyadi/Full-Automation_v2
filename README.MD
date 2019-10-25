# Code Challenge

This project is created to install a two-tier application. The project is split into two modules, Infrastructure management and Configuration management. 

Terraform is used for Infrastructure Management and Ansible is used for Configuration Management. Nginx server is the endpoint of this project. Nginx can be accessed from your web browser through using port 80.

Terraform will provision an AWS EC2 server with an Ubuntu operating system.

Ansible will install docker on the AWS EC2 and run a docker container with Nginx.

## Getting Started

Copy/Clone the repository codechallenge to your local system.

## Prerequisites
```
Operating System: CentOS 7
Terraform
Ansible
AWS Account 
```
## Folder structure
```

├── ansible
│   ├── config-management ----------> This is an Ansible Role
│   │   ├── defaults
│   │   │   └── main.yml
│   │   ├── files
│   │   ├── handlers
│   │   │   └── main.yml
│   │   ├── meta
│   │   │   └── main.yml
│   │   ├── README.md
│   │   ├── tasks
│   │   │   ├── install.yml
│   │   │   └── main.yml
│   │   ├── templates
│   │   ├── tests
│   │   │   ├── inventory
│   │   │   └── test.yml
│   │   └── vars
│   │       └── main.yml
│   └── installdocker.yml
└── terraform         
    ├── dev
    │   └── main.tf
    └── modules ---------------> This is a Terraform Module
        ├── ec2
        │   ├── instances.tf
        │   └── variables.tf
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

copy your AWS PEM Key to /ansible/

```

## Running the tests

```
$ cd /terraform/dev/ and run "terraform plan" to create an execution plan and check the current state.

Output will show the entire infrastructure of the AWS EC2 Instance if the code is executed correctly.

```

## Deployment

```
AWS EC2:
*** You can change the region in the AWS by editing the main.yml in dev folder ***

commands:
 $ cd /codechallenge/terraform/dev
 $ terraform apply -auto-approve
 
 - Verify if the code is executed without errors
 - Log into AWS Console to check if the 'one project' EC2 is initialized.
 
 Docker and Nginx Server:
 
 commands:
  $ cd /codechallenge/ansible
  $ ansible-playbook installdocker.yml --private-key xxxx.key -u ubuntu
  
  - verify if the code is executed without errors
  - Go-to browser and use the EC2 public ID and port 80 to view the Nginx home page

```
## Destroy
```
 $ cd /codechallenge/terraform/dev
 $ terraform destroy -auto-approve
```

## Version
Version 1.0.0

## Authors

* **Shiva Prasad** 

