terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "ansible_key" {
  key_name   = "ansible_key"
  public_key = file("${path.module}/ssh/ansible_key.pub")
}

resource "aws_instance" "app_demo_server" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ansible_key.key_name
  tags = {
    Name = "ExampleAppDemoServerInstance2"
  }
}

resource "null_resource" "inventory_update" {
  depends_on = [aws_instance.app_demo_server]

  provisioner "local-exec" {
    command = <<EOT
      echo "[web_servers]" > inventory.txt
      echo "ubuntu@${aws_instance.app_demo_server.public_ip}" ansible_ssh_private_key_file=../terraform/ssh/ansible_key >> inventory.txt
      chmod 600 inventory.txt
      mv inventory.txt ../ansible/
    EOT
  }
}
