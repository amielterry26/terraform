resource "aws_instance" "server2" {
  ami = "ami-055e3d4f0bbeb5878"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.public.id]
  key_name = "keypair2"

  tags = {
    name = "practice server 2"
  }
}

resource "aws_security_group" "public" {
  name = "publicsg"
  description = "This is a public security group"
  vpc_id = "vpc-0ea139c6ddec19b8e"

  ingress {
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
  }

  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
  }
}

