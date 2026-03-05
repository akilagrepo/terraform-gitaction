resource "aws_security_group" "app_sg" {
  name = "react-app-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {

  ami           = "ami-0f5ee92e2d63afc18"   # Ubuntu AMI (Mumbai)
  instance_type = "t2.micro"
  key_name      = "mum-key"

  security_groups = [aws_security_group.app_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt upgrade -y

              apt install docker.io -y

              systemctl start docker
              systemctl enable docker

              usermod -aG docker ubuntu
              EOF
  tags = {
    Name = "Terraform-React-App"
  }
}