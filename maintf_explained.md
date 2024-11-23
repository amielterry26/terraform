# Main Components of `main.tf`

1. **Provider Block:**  
   Specifies the cloud provider or service Terraform interacts with, such as AWS, Azure, or Google Cloud. You define required configurations like the region.

2. **Resource Block:**  
   Declares resources you want to create, such as an EC2 instance, S3 bucket, or a VPC.

3. **Variables (Optional):**  
   Defines input values that can be dynamically set when running Terraform commands.

4. **Outputs (Optional):**  
   Specifies information to display after the infrastructure is created, such as instance IDs or IP addresses.

5. **Data Blocks (Optional):**  
   Retrieves existing information about infrastructure resources, like AMI IDs or VPC IDs.

<u>**Example:**</u>
</br>
```hcl
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
   region  = "us-west-2"
}

resource "aws_instance" "app_server" {
   ami           = "ami-830c94e3"
   instance_type = "t2.micro"

   tags = {
      Name = "ExampleAppServerInstance"
   }
}
```
or
```terraform
# 1. Provider Block
provider "aws" {
  region = "us-west-2" # Specify the AWS region
}

# 2. Data Block to Get Latest AMI for Amazon Linux
data "aws_ami" "amazon_linux" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["137112412989"] # AWS account ID for Amazon Linux AMIs
}

# 3. Resource Block for Security Group
resource "aws_security_group" "example_sg" {
  name        = "example-ec2-sg"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere (use cautiously)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }
}

# 4. Resource Block for EC2 Instance
resource "aws_instance" "example_instance" {
  ami           = data.aws_ami.amazon_linux.id # Use the latest Amazon Linux AMI
  instance_type = "t2.micro" # Free-tier eligible instance type
  security_groups = [aws_security_group.example_sg.name] # Attach security group

  tags = {
    Name = "example-ec2-instance"
  }
}

# 5. Output Block
output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.example_instance.public_ip
}
```