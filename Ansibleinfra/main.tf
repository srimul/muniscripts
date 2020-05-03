provider "aws" {
   region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "clisrimul"
    key    = "Ansible/terraform.tfstate"
    region = "us-east-2"
  }
}
resource "aws_security_group" "allow_ssh" {
  name = "sg_jenkins"
  description = "Allow ssh inbound traffic"
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
data "template_cloudinit_config" "master" {
  gzip          = true
  base64_encode = true

  # get common user_data
  part {
    filename     = "host.sh"
    content_type = "text/part-handler"
    content      = "${data.template_file.userdata_common.rendered}"
  }

  # get master user_data
  part {
    filename     = "master.sh"
    content_type = "text/part-handler"
    content      = "${data.template_file.userdata_master.rendered}"
  }

}
resource "aws_instance" "cZServers" {
  #ami = "ami-5e8bb23b"
  ami = "${lookup(var.amiid, var.region)}"
  instance_type = "${var.instance_type}"
  count = "${var.instance_count}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  tags = {
    Name  = "${element(var.instance_tags, count.index)}"
  }

  key_name = "${var.key_name}"
  
  provisioner "file" {
    source      = "/home/vidya/srimul.pem"
    destination = "/tmp/srimul.pem"
  }

  user_data = "${data.template_cloudinit_config.master.rendered}"

connection {
    type     = "ssh"
    user     = "ubuntu"
    password = ""
    private_key = "${file("~/srimul.pem")}"
  }

}

output "public_ip" {
#value = "${aws_instance.cZServers.public_ip}"
  value = "${formatlist("%v", aws_instance.cZServers.*.public_ip)}"
}

resource "null_resource" "myPublicIps" {
count = "${var.instance_count}"
provisioner "local-exec" {
      command = "echo '${element(aws_instance.cZServers.*.public_ip, count.index)}' >> hosts1"
}
}

