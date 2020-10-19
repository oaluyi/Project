provider "aws" {
        region = "eu-west-2"
        #IAM T_user 
        access_key = "access_key" 
        secret_key = "secret_key"
}
resource "aws_instance" "Terraform" {
 ami            = "ami-0a669382ea0feb73a"
 instance_type  = "t2.micro"
 key_name       = "devops"
 subnet_id      = "subnet-8daee3e4"
 user_data = <<- EOF
  #!/bin/bash
  echo "Welcome to DevOps"
  nohup busybox httpd -f -p 8080 & EOF
tags = {
        Name = "Terraform_instance"
}
}
resource          "aws_eip" "ip" {
  instance        = "i-066beb58175e2acf5"
  vpc 		= true
}

resource "aws_security_group" "SG"
        name = "Terraform-SG"

        ingress {
                from_port = 8080
                to_port   = 8080
                protocol  = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }
        }
        