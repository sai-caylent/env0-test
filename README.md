# ENV0 Learning Project

This repository contains a simple Terraform configuration for learning env0 platform.

## What This Project Does

- Creates an AWS S3 bucket with security best practices
- Demonstrates environment-specific deployments
- Shows how to use env0 for Infrastructure as Code management

## Files Overview

- `main.tf` - Main Terraform configuration
- `variables.tf` - Input variables
- `outputs.tf` - Output values
- `.env0.yml` - env0-specific configuration

## env0 Setup Steps

### 1. Prerequisites
- AWS account with appropriate permissions
- env0 account (sign up at https://app.env0.com)
- This repository pushed to GitHub/GitLab/Bitbucket

### 2. Connect Repository to env0

1. **Login to env0**: Go to https://app.env0.com
2. **Create New Template**:
   - Navigate to "Templates" in the sidebar
   - Click "Create Template"
   - Choose "Terraform" as the IaC tool
   - Connect your Git repository (`sai-caylent/env0-test`)
   - Set the repository path (leave empty if Terraform files are in root)
   - Click "Create Template"

### 3. Create Environment

1. **Deploy Environment**:
   - Go to "Environments" in the sidebar
   - Click "Deploy Environment"
   - Select your template
   - Choose environment name (e.g., "dev", "staging")
   - Configure variables if needed
   - Click "Deploy"

### 4. AWS Credentials Setup

You'll need to configure AWS credentials in env0:

**Option 1: AWS IAM Role (Recommended)**
- Create an IAM role with S3 permissions
- Configure trust relationship with env0
- Use role ARN in env0 environment settings

**Option 2: AWS Access Keys**
- Create AWS IAM user with S3 permissions
- Add AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY as environment variables in env0

## Environment Variables in env0

Set these in your env0 environment configuration:

### Required (if using access keys):
- `AWS_ACCESS_KEY_ID` - Your AWS access key
- `AWS_SECRET_ACCESS_KEY` - Your AWS secret key

### Optional (to override defaults):
- `TF_VAR_aws_region` - AWS region (default: us-east-1)
- `TF_VAR_environment` - Environment name (default: dev)
- `TF_VAR_project_name` - Project name (default: env0-learning)

## Next Steps for Learning

1. **Try Multiple Environments**: Create dev, staging, and prod environments
2. **Experiment with Variables**: Override variables per environment
3. **Add More Resources**: Extend the Terraform configuration
4. **Set Up Approval Workflows**: Configure approval policies for production
5. **Monitor Costs**: Use env0's cost tracking features
6. **Try GitOps**: Make changes and see automatic deployments

## Useful env0 Features to Explore

- **Cost Monitoring**: Track infrastructure costs per environment
- **Approval Policies**: Require approvals for sensitive environments
- **Custom Flows**: Define deployment hooks and custom scripts
- **Variable Management**: Environment-specific variable overrides
- **Drift Detection**: Detect configuration drift
- **Destroy Scheduling**: Automatically destroy temporary environments

## Troubleshooting

- Check env0 deployment logs for detailed error messages
- Verify AWS credentials and permissions
- Ensure S3 bucket names are globally unique
- Check Terraform syntax with `terraform validate`

Happy learning with env0! 🚀