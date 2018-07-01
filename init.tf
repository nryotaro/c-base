provider "aws" {
	region = "ap-northeast-1a"
}


resource "aws_instance" "backend" {
  ami = "ami-bec974d8"
	instance_type = "t2.micro"
}

