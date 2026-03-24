# Multi-Environment Infrastructure using Terraform Workspaces (Dev, Staging, Production)

## 📌 Project Overview

This project demonstrates how to design and implement a **multi-environment AWS infrastructure** using **Terraform Workspaces**.  

In many organizations, using a single environment for development, testing, and production leads to instability and outages. This project solves that by isolating environments while reusing a single Terraform codebase.

---

## 🎯 Objectives

- Create isolated environments: **Dev, Staging, Production**
- Use **Terraform Workspaces** for environment separation
- Maximize **code reuse** using modules
- Apply **environment-specific configurations**
- Ensure **production safety and security**

---

## 🏗️ Architecture

Each environment contains:

- VPC
- EC2 Instance
- Security Group
- S3 Bucket

### Environment Differences

| Environment | Instance Type | Security Level        |
|------------|--------------|---------------          |
| Dev        | t3.micro     | Open access for testing |
| Staging    | t3.medium    | Moderate restrictions   |
| Production | t3.small     | Strict security rules   |

---

## 📁 Project Structure
<img width="1536" height="1024" alt="daigram" src="https://github.com/user-attachments/assets/2037090b-c48b-4c2d-a0e9-5f31ac5e5f7d" />
---

## ⚙️ Technologies Used

- Terraform
- AWS (EC2, VPC, S3, Security Groups)
- Terraform Workspaces
- S3 Remote Backend

---

## 🚀 Setup Instructions

### 1. Initialize Terraform

```bash
terraform init
```
### Why Workspaces?
- Single codebase for all environments
- Environment-specific state management
- Easy switching between environments
- Reduced duplication of code
  
### 2. Create and Switch Workspaces
```bash
terraform workspace new dev
terraform workspace new staging
terraform workspace new prod
```
### 3. Switch workspace & Deploy Infrastructure for dev
```bash
terraform workspace select dev
terraform apply -var-file="dev.tfvars"
```
### 3. Switch workspace & Deploy Infrastructure for staging
```bash
terraform workspace select staging
terraform apply -var-file="staging.tfvars"
```
### 3. Switch workspace & Deploy Infrastructure for production
```bash
terraform workspace select prod
terraform apply -var-file="prod.tfvars"
```
## 🔒 Remote Backend (S3)
Terraform state is stored remotely using S3 backend to ensure:
- State consistency
- Team collaboration
- Locking support
 ```bash
  terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket-sahi"
    key            = "terraform/state"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}

```
## 🔐 Security Best Practices
- Production resources are protected using:
```bash
  lifecycle {
  prevent_destroy = true
  }   
```
## 🔄 Environment Isolation Logic
Terraform Workspaces ensure that:
- Each environment has separate state files
- Resources are fully isolated
- Changes in one workspace do not affect others

## 📦 Key Features
- Modular Terraform architecture
- Workspace-based environment isolation
- Reusable infrastructure code
- Secure production setup
- Remote backend with S3
- Environment-specific configurations
