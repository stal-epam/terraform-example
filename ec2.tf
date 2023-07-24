resource "aws_instance" "amazon-linux" {
  ami           = data.aws_ami.amazon-linux.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ports.id]
  user_data = file("init.sh")

  tags = {
    Name = "Test instance"
  }
}

resource "aws_security_group" "allow_ports" {
  name        = "allow_ports"
  description = "Allow Inbound Traffic on Ports"

  ingress {
    description      = "Port 80 from Everywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Don't use it for production! Only for DEMO!
  ingress {
    description      = "Port 22 from Everywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
