provider "aws" {
 region     = "eu-north-1"
}


terraform {
  backend "s3" {
    bucket         = "bucket-statefile"
    key            = "dev/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "statetable"
    encrypt        = true
  }
}

resource "aws_instance" "ec21" {
  ami   = "ami-075449515af5df0d1"
  instance_type = "t3.micro"

  tags = {
    Name = "instance1"
  }
}
