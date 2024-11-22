# This is a walkthrough of how to deploy an EC2 instance with Terraform on AWS.

### Prerequisites: 
- The [Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)</br>
- The [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- An [AWS Account](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all) 
and 

### Process: 
1. Create an Access Key in the AWS Console. 
2. Run `aws configure` and follow the prompts
    > Your access key will only display your secrey key one time and then you need to store it and be able to access it. 
    > If you lose it the root user will have to create you another access key. 