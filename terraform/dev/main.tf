provider "aws" {
  region = "us-east-1"
}

module "my_vpc" {
  source = "../modules/vpc"
}

variable "insta_count" {}
variable "ami_type" {}

module "my_ec2" {
  source        = "../modules/ec2"
  instance_count = "${var.insta_count}"
  ami_id        = "${var.ami_type}"
  sg_id         = [module.my_vpc.sg_id]
  instance_type = "t2.micro"
}




