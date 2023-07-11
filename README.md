
## Terraform AWS Configuration

This Terraform configuration deploys an AWS EC2 instance and a corresponding security group. It allows inbound SSH (port 22) and HTTP (port 80) traffic, and allows all outbound traffic.

## Prerequisites

Before you can use this Terraform configuration, ensure you have the following:

- An AWS account with appropriate credentials.
- Terraform installed on your machine. You can download it from the [Terraform website](https://www.terraform.io/downloads.html).

## Configuration

1. Clone or download the repository to your local machine.

2. Open the `main.tf` file and make the following modifications:

   - Update the `ami` attribute in the `aws_instance` resource block to the desired Amazon Machine Image (AMI) ID.
   - Update the `key_name` attribute in the `aws_instance` resource block to match the name of your existing SSH key pair.
   - Update the `private_key` attribute in the `connection` block of the `aws_instance` resource block with the path to your SSH private key file.

3. Optionally, update the `region` variable in the `variables.tf` file to your desired AWS region. The default value is set to `ap-south-1` (Asia Pacific Mumbai).

4. If you wish to use an AWS profile for authentication, update the `profile` variable in the `variables.tf` file. Otherwise, leave it blank.

## Usage

1. Initialize the Terraform configuration by running the following command in the project directory:

   ```bash
   terraform init


A brief description of what this project does and who it's for

2. Preview the changes that Terraform will apply by running:

    ```bash
    terraform plan

3. Apply the Terraform configuration to create the AWS resources by running:
    ```bash
    terraform apply
You will be prompted to confirm the changes. Enter yes to proceed

4.Terraform will provision the EC2 instance and security group based on the configuration. Once completed, the output will display the public IP address of the created instance.

5. You can now connect to the EC2 instance using SSH and the provided private key. For example:
    ```bash
    ssh -i /path/to/private_key.pem ec2-user@<public_ip>

6. To clean up and destroy the created resources, run:

    ```bash
    terraform destroy
You will be prompted to confirm the destruction. Enter yes to proceed.