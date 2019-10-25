variable "instance_count" {
  default = "1"
}
variable "ami_id" {
  default = "ami-04b9e92b5572fa0d1"
}

variable "sg_id" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "key1_name" {
  default = "Jenkins"
}
