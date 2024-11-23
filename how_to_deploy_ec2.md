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
   
    **Note:** The default region is the region you want your resources hosted in. 
    The _default output format_ is typically `.json` or `None`.
</br>
</br>
3. Create your `main.tf` file to define your infrastructure ↓.

    ### Main Components of `main.tf`

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