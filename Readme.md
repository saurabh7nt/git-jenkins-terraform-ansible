# Git-Jenkins-Terraform-Ansible Flow

This project demonstrates an end-to-end DevOps pipeline integrating Git, Jenkins, Terraform, and Ansible. The pipeline provisions an AWS EC2 instance using Terraform, sets up an inventory file dynamically, and uses Ansible to configure the instance by installing Nginx.

## Features
- **Git**: Stores the source code and configuration files for the pipeline.
- **Jenkins**: Automates the pipeline stages, including Terraform and Ansible execution.
- **Terraform**: Provisions the AWS infrastructure (EC2 instance).
- **Ansible**: Configures the EC2 instance by installing and setting up Nginx.
- **AWS**: Hosts the infrastructure for this project.

---

## **Pipeline Flow**

1. **Clean Workspace**: Ensures a clean workspace for each pipeline run.
2. **Clone Code**: Pulls the latest code from the GitHub repository.
3. **Initialize Terraform**: Initializes the Terraform backend and downloads necessary providers.
4. **Apply Terraform**: Provisions an EC2 instance in AWS.
5. **Fetch EC2 IP**: Retrieves the public IP of the newly created EC2 instance.
6. **Wait for SSH**: Waits until the instance is reachable over SSH.
7. **Ping Ansible**: Validates Ansible connectivity to the EC2 instance.
8. **Run Ansible**: Executes the playbook to install and configure Nginx on the instance.

---

