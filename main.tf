provider "aws" {
        region = "eu-west-2"
        access_key = "AKIASLIUIFHMXLJGE56Q"
        secret_key = "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"
}
resource "aws_instance" "Terraform" {
 ami            = "ami-0a669382ea0feb73a"
 instance_type  = "t2.micro"
 key_name       = "devops"
 subnet_id      = "subnet-8daee3e4"
tags = {
        Name = "Terraform_instance"
}
}
resource          "aws_eip" "ip" {
  instance        = "i-066beb58175e2acf5"
  vpc 		= true
}
