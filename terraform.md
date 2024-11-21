# Terraform Walkthrough
### Installation: </b>
- Install through homebrew.
- Check that it was successfully installed by running `terraform -v`. </br>
  - If out of date, got to [Terraform Package Manager.]( https://www.terraform.io/downloads.html)
- Run `terraform -v` again. 

### Providers
basically a plugin that allows you to talk to a bunch of different API's and connect with and utilize them with Terraform. </br>
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
