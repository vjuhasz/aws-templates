provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "eu-west-1"
}

resource "aws_security_group" "test" {
  name = "test"
  description = "my test SG"
  vpc_id = "vpc-74458913"
}

resource "aws_instance" "example" {
  ami           = "ami-a8d2d7ce"
  subnet_id = "subnet-f5f13d92"
  security_groups = ["${aws_security_group.test.id}"]
  instance_type = "t2.micro"
}