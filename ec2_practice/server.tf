# This is to deploy a basic EC2 instance
resource "aws_instance" "prac_server1" {
  ami = "ami-055e3d4f0bbeb5878"
  instance_type = "t3.micro"
  key_name = "keypair1"
  vpc_security_group_ids = [aws_security_group.public.id]

  tags = {
    Name = "Practice Server 1"
  }
}

resource "aws_security_group" "public" {
  name = "pubsg"
  description = "this is a public security group"
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

# resource "aws_vpc_security_group_ingress_rule" "allow_tls_IPV4_traffic" {
#   security_group_id = aws_security_group.public.id
#   cidr_ipv4 = "0.0.0.0/0"
#   ip_protocol = "-1"
# }
#
# resource "aws_vpc_security_group_egress_rule" "allow_tls_IPV4_traffic" {
#   security_group_id = aws_security_group.public.id
#   cidr_ipv4 = "0.0.0.0/0"
#   ip_protocol = "-1"
# }