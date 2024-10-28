
resource "aws_instance" "subdomain" {
  count         = 1
  ami           = "ami-0e641a30ed7da3a07"
  instance_type = "t2.micro"

  key_name               = "kp1"
  vpc_security_group_ids = [aws_security_group.subdomaing.id]
  tags = {
    Name = "creative-solutions"
  }
}

resource "aws_security_group" "subdomaing" {
  name        = "subhome"
  description = "Allowing home traffic"

  ingress {
    description = "traffic from Vegas"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["72.203.7.178/32"]
  }

  ingress {
    description = "port 80 traffic from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "port 443 traffic from internet"
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "vegas home"
  }
}
