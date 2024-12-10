![image](https://github.com/user-attachments/assets/b47c282c-1886-4fab-a769-1fae88f9e1cf)# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

## Introduction

For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

## Getting Started

1. Clone this repository
2. Create your infrastructure as code
3. Update this README to reflect how someone would use your code.

## Dependencies

1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

## Instructions

1. Make sure the following environment variables are set and correspond to your azure account details:

   - AZURE_CLIENT_ID
   - AZURE_CLIENT_SECRET
   - AZURE_SUBSCRIPTION_ID
   - AZURE_TENANT_ID

2. Navigate to the start_files directory

3. Create the VM image using packer.

   ```bash
   packer build server.json
   ```

4. Create tagging policy definition as defined in tagging-policy-rule.json and assign this to the subscription

    ```bash
    az policy definition create --name TaggingPolicy --rules TaggingPolicty.json
    ```

5. Deploy the scalable web server by executing the following commands:

   ```bash
   terraform init
   ```

   Dry run the deployment and save it to a file "solution.plan"

   ```bash
   terraform plan -out solution.plan
   ```

   - provide VM users password when prompted

   Deploy the resources

   ```bash
   terraform apply "solution.plan"
   ```
   How to customize vars.tf
   This file contains all the variables that going to be used in main.tf file. If you want to customize parameter, you need to change values default inside the vars.tf file. Example:
   
   ![image](https://github.com/user-attachments/assets/80706a63-945d-4f3f-825b-3d61cbc10bf0)

   If you want to use another image, you can switch to another image simply by changing the default value of variable "packer_image"
   
7. To destroy resources when finished execute from the same directory:

   Provide VM users password when prompted and confirm destruction by typing "yes"

   ```bash
   terraform destroy
   ```
