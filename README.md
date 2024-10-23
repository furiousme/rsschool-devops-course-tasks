# Terraform AWS Infrastructure

This project demonstrates the basic setup and use of Terraform with AWS and GitHub Actions.

## Features

- Terraform-managed AWS infrastructure
- GitHub Actions workflow to automate deployment
- OpenID Connect (OIDC) integration for secure authentication with AWS

## Prerequisites

To use this project, make sure you have:

- An AWS account
- Terraform installed locally (the project is created with Terraform v1.9.6)
- AWS CLI configured
- SSH key pair for EC2 instances
- SSH agent forwarding set up for secure access

## Infrastructure Setup

1. **VPC and Subnets**:
   - Created a VPC with 2 public and 2 private subnets in different availability zones.
   - The public subnets are used for the bastion host and NAT gateway, and the private subnets for k3s server instances.

2. **Bastion Host**:
   - Deployed a bastion host in one of the public subnets for secure access to the k3s server in the private subnet.
   - SSH access from the local machine to the bastion host is allowed via port 22.

3. **Security Groups**:
   - Configured security groups to control access:
     - Bastion host security group allows SSH (port 22) from certain IP.
     - k3s server security group allows SSH (port 22) only from the bastion host.

4. **NAT Gateway**:
   - Deployed a NAT gateway in the public subnet to enable the k3s server instances in private subnets to access the internet.

## k3s Cluster Deployment

1. **k3s Installation**:
   - k3s is installed by running user scripts
   - SSH into the private EC2 instance (k3s server) from the bastion host using agent forwarding to verify installation


2. **Verify k3s Installation**:
   - After installation, verified the cluster status by running:
     ```bash
     kubectl get nodes
     ```
   - Output shows the k3s node ready.
