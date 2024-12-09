# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

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

2. Navigate to the directory containing the .tf and .json files

3. Create the VM image using packer.

   ```bash
   packer build server.json
   ```

4. Create tagging policy definition as defined in tagging-policy-rule.json and assign this to the subscription by running the bash script tagging-policy-create.sh

   First make the script executable:

    ```bash
    chmod +x tagging-policy-create.sh 
    ```

   Execute the script:

   ```bash
   ./tagging-policy-create.sh
   ```

5. Deploy the scalable web server by executing the following commands:

   ```bash
   terraform init
   ```

   Import resource group created in step 3 to terraform state and provide VM user password when prompted:

   ```bash
   terraform import azurerm_resource_group.main /subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/<resource-group-name>
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

6. To destroy resources when finished execute from the same directory:

   Provide VM users password when prompted and confirm destruction by typing "yes"

   ```bash
   terraform destroy
   ```
