provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {

  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.ssh_http.name]
  user_data              = file("template/nginx.sh")
  count         = var.instance_count

  tags = {
    hello-world-web = "hello-world-web"
  }
}

resource "aws_security_group" "ssh_http" {
  name        = "ssh_http"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
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
