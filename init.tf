variable "pub_key" {}

provider "aws" {
	region = "ap-northeast-1"
}

resource "aws_instance" "backend" {
  ami = "ami-bec974d8"
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.backend.key_name}"
}

resource "aws_key_pair" "backend" {
  key_name   = "default_ssh_key"
  public_key = "${var.pub_key}"
}

