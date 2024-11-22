# This is a walkthrough of how to deploy an EC2 instance with Terraform on AWS.

### Prerequisites: 
- The [Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)</br>
- The [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- An [AWS Account](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all) 
and associated credentials (provided by the root user).

### Process: 
1. Access Key: 
    - **If Root User/Admin:** Create an Access Key in the AWS Console for yourself or user.
    - **Else:** Request or utilize Access Key credentials that were provided by root user/admin.
2. Run `aws configure` and follow the prompts.
    > Your secret access key one will only be displayed time. Ensure you store it and be able to access it. 
     If you lose it the root user will have to create you another access key. 
    
3. 