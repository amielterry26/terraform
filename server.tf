resource "aws_instance" "server1" {
  ami           = "ami-055e3d4f0bbeb5878"
  instance_type = var.instance_size
  count = 3
  key_name = var.kp
  security_groups = [aws_security_group.public.name,"default"]

  tags = {
    Name = var.server_var
  }
}

resource "aws_security_group" "public" {
  name = "publicsg"
  description = "public security group"
  vpc_id = "vpc-0ea139c6ddec19b8e"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.public.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.public.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

