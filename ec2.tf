resource "aws_security_group" "cms-sg" {
  name        = var.security_group_name
  description = var.security_group_description

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }
}

# Define the AWS EC2 Instance
resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.cms-sg.id]

  tags = {
    Name = "demo-instance"
  }

  provisioner "file" {
    source      = var.source_script_path
    destination = "/home/ec2-user/install_script.sh"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }

    inline = [
      "chmod +x /home/ec2-user/install_script.sh",
      "sudo /home/ec2-user/install_script.sh"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > data.txt"
  }
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.web.public_ip
}

output "security_group_id" {
  description = "The ID of the security group."
  value       = aws_security_group.cms-sg.id
}

output "instance_id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.web.id
}
