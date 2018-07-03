variable "pub_key" {}
variable "vpc_id" {}

provider "aws" {
	region = "ap-northeast-1"
}

resource "aws_instance" "backend" {
  ami = "ami-bec974d8"
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.backend.key_name}"
	security_groups = ["${aws_security_group.ctt.id}"]
}

resource "aws_key_pair" "backend" {
  key_name   = "default_ssh_key"
  public_key = "${var.pub_key}"
}

resource "aws_security_group" "c-base" {
   name = "ctt"
	 vpc_id = "${var.vpc_id}"
   ingress {
     from_port = 22
		 to_port = 22
		 protocol = "tcp"
		 cider_blocks = ["0.0.0.0/0"]
	 }
}
