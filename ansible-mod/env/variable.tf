variable "region" {
  default = "us-east-2"
}
variable "amiid" {
  type = "map"
  default = {
    us-east-2 = "ami-0fc20dd1da406780b"
    us-east-1 = "ami-0400a1104d5b9caa1"
    us-west-1 = "ami-03ba3948f6c37a4b0"
  }
  description = "You may added more regions if you want"
}

variable "instance_count" {
default = "1"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "srimul"
  description = "the ssh key to be used for the EC2 instance"
}

variable "instance_tags" {
  type = "list"
  default = ["Ansible-Master", "Ansible-Node"]
}
variable "security_group" {
  default = "sg-01d0657887a80ee04"
  description = "Security groups for the instance"
}
#Host variables
variable "hostinstance_count" {
default = "2"
}
variable "hostinstance_type" {
  default = "t2.micro"
}
