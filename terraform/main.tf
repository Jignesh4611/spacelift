

resource "aws_security_group" "ssh" {
  name   = "spacelift-demo-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
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


resource "aws_instance" "demo" {
  ami                    = "ami-00b0a08d4568c22e8"
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = {
    Name        = "web-server"
    Role        = "web"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}