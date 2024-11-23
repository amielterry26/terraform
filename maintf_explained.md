# `main.tf` files explained

1. **Provider Block**  
   Specifies the cloud provider or service Terraform interacts with, such as AWS, Azure, or Google Cloud. You define required configurations like the region.

2. **Data Blocks (Optional)**  
   Retrieves existing information about infrastructure resources, like AMI IDs or VPC IDs.

3. **Variables (Optional)**  
   Defines input values that can be dynamically set when running Terraform commands.

4. **Resource Block**  
   Declares resources you want to create, such as an EC2 instance, S3 bucket, or a VPC.

5. **Outputs (Optional)**  
   Specifies information to display after the infrastructure is created, such as instance IDs or IP addresses.

<u>**Example:**</u>
</br>

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

## Tags:
### Why Tags Are Good Practice

1. **Organization and Management**  
   Tags make it easy to identify and categorize resources in the cloud provider’s console, especially in environments with many resources.

2. **Billing and Cost Allocation**  
   Tags allow you to track costs by team, department, environment, or project, making cost management more transparent.

3. **Automation and Filtering**  
   Cloud services often allow automation or filtering based on tags, such as auto-stopping non-production instances at night.

4. **Compliance and Auditing**  
   Tags help enforce policies (e.g., ensuring every resource has an `Owner` or `Environment` tag).

5. **Searchability**  
   Tags let you quickly search for or group related resources in a cloud provider’s interface.

---

### Which Components to Use Tags For

Tags should be applied to **all major cloud resources**, especially those that need to be managed, tracked, or billed. Below is a breakdown:
</br>
</br>
# Common Components for Tags

| **Resource Type**         | **Suggested Tags**                                  |
|---------------------------|----------------------------------------------------|
| **EC2 Instances**         | `Name`, `Owner`, `Environment`, `Purpose`, `Team` |
| **S3 Buckets**            | `Name`, `DataType`, `Retention`, `Compliance`     |
| **Security Groups**       | `Name`, `Purpose`, `Owner`, `Environment`         |
| **Databases (RDS, DynamoDB)** | `Name`, `Application`, `Owner`, `Environment`    |
| **Load Balancers**        | `Name`, `Application`, `Owner`, `Environment`     |
| **Lambdas**               | `Name`, `Functionality`, `Environment`            |
| **VPC/Subnets**           | `Name`, `Region`, `Purpose`, `Owner`              |

---

# Essential Tags to Use

1. **Name (or Resource Identifier):**  
   A human-readable name for easy identification.  
   **Example:** `WebServer01`.

2. **Environment:**  
   Differentiates between `dev`, `staging`, and `prod` resources.

3. **Owner or Team:**  
   Identifies who owns or manages the resource (e.g., `DevOpsTeam`, `ProjectXTeam`).

4. **Purpose or Application:**  
   Explains the resource’s role.  
   **Example:** `DatabaseForAppX`.

5. **Cost Center or Department:**  
   Tracks resource costs by department or billing group.

---

# Best Practices for Tagging

1. **Standardize Tag Names and Values:**  
   Define a consistent tagging schema for your organization (e.g., always use `Environment`, `Owner`, `Purpose`).

2. **Use Tags Everywhere:**  
   Apply tags consistently across all resources, even minor ones like security groups, for consistency.

3. **Leverage Tag Policies (AWS):**  
   AWS Tag Policies can enforce mandatory tags and validate their formats.

4. **Avoid Over-Tagging:**  
   Stick to meaningful and necessary tags to avoid clutter.