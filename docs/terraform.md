# Terraform Walkthrough
### [Important to note]: 
- Terraform is a declarative language, meaning that you write it to describe the desired end state of your infrastructure. </br>
- This is in contrast to most programming languages which are ___procedural___ which requre step by step instructions to perform tasks. 
</br>
</br>

Terraform takes the "<u>declarative instructions</u>", and builds the infrastructure for you. 

___

### Installation: </b>
- Install through homebrew.
- Check that it was successfully installed by running `terraform -v`. </br>
  - If out of date, got to [Terraform Package Manager.]( https://www.terraform.io/downloads.html)
- Run `terraform -v` again.


### Steps for a Terraform Project: 
1. <u>**Define Your Scope:**</u> Identify the infrastructure for your project.
2. <u>**Author:**</u> Write the configuration file for your project infrastructure. [**Reference Here.**](https://github.com/amielterry26/programming_fundamentals/blob/main/docs/understanding_config_files.md)
   - "**Write the code and then run `terraform init` so it can **initialize** or install the plugins necessary based on the config file."
3. <u>**Initialize:**</u> Install the plugins Terraform needs to manage your infrastructure (`terraform init`).
4. <u>**Plan:**</u> Preview the changes Terraform will make (`terraform plan`).
5. <u>**Apply:**</u> Apply the changes (`terraform apply`)

### Main Commands:
- `terraform init`          Prepare your working directory for other commands
- `terraform validate`      Check whether the configuration is valid
- `terraform plan`          Show changes required by the current configuration 
- `terraform apply`         Create or update infrastructure 
- `terrafom destroy`       Destroy previously-created infrastructure


## Key Concepts:
### 1. <u>Providers</u>
Plugins that allow you to talk to different API's and connect with and utilize them with Terraform. **Examples include:** AWS, GCP, AZURE, etc.
</br> 
</br>
It make sure that Terraform downloads all the necessary code so that it can talk to the associated API so we can create resources with the preferred environment.


1. Go to [Terraform Registry (AWS)](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
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

### Terraform State Files </br>
**Definition:** Terraform State files (.tfstate) serve as snapshot of the current state of your infrastructure at any given time.</br>
- It acts almost like the autosave feature in Google Docs in the sense that it captures the state your .tf file is in ant any given moment prior to changes. </br>
- When you `terraform plan`, Terraform compares your current infrastructure in the file to your .tfstate file to be able to determine which changes are going to be made.

### Terraform Cloud
This is a remote backend feature that allows you to share your current `.tfstate` with your coworkers and collaborate.
Provide a stable environment for it to run in, and set raise conditions when changes are made. 