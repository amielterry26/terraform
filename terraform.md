# Terraform Walkthrough
## Important to note: 
- Terraform is a declarative language, meaning that you write it to describe the desired end state of your infrastructure. </br>
- This is in contrast to most programming languages which are ___procedural___ which requre step by step instructions to perform tasks. 
</br>
</br>

Terraform takes the "declarative instructions", and builds the infrastructure for you. 

___

### Installation: </b>
- Install through homebrew.
- Check that it was successfully installed by running `terraform -v`. </br>
  - If out of date, got to [Terraform Package Manager.]( https://www.terraform.io/downloads.html)
- Run `terraform -v` again.


### Steps for a Terraform Project: 
1. <u>**Define Your Scope:**</u> Identify the infrastructure for your project.
2. <u>**Author:**</u> Write the configuration file for your project infrastructure. [**Reference Here.**](https://github.com/amielterry26/programming_fundamentals/blob/main/docs/understanding_config_files.md)
3. <u>**Initialize:**</u> Install the plugins Terraform needs to manage your infrastructure (`terraform init`).
4. <u>**Plan:**</u> Preview the changes Terraform will make (`terraform plan`).
5. <u>**Apply:**</u> Apply the changes (`terraform apply`)

## Key Concepts:
### 1. <u>Providers</u>
Basically a plugin that allows you to talk to a bunch of different API's and connect with and utilize them with Terraform. **Examples include:** AWS, GCP, AZURE, etc.
</br> 
</br>
It make sure that Terraform downloads all the necessary code so that it can talk to the associated API so we can create resources with the preferred environment.


1. Go to [Terraform Providers Link](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
2. Select the provider of your choice and then in your .tf file, use the provider name and add the region (for AWS). </br>
Example: 
```terraform
provider "aws" {
        region = "us-west-2"
}
```
### Config file (main.tf):
All terraform projects and files need a config file; which in terraform is typically referenced as the `main.tf`. </br>
**Reference:** [Understanding Config Files](https://github.com/amielterry26/programming_fundamentals/blob/main/docs/understanding_config_files.md)
