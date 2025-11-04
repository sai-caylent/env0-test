# Environment-Specific Configuration Guide

This document explains how to set up multiple environments in env0 using a single project.

## Architecture Overview

```
Repository: env0-test
└── Single Template (Terraform Config)
    ├── Dev Environment
    ├── Staging Environment  
    └── Prod Environment
```

## Step-by-Step Setup in env0

### 1. Create One Template
- **Name**: "Learning Infrastructure"
- **Repository**: `sai-caylent/env0-test`
- **IaC Tool**: Terraform
- **Path**: `/` (root directory)

### 2. Create Multiple Environments from Same Template

#### Environment 1: Development
- **Name**: `dev`
- **Template**: Learning Infrastructure
- **Variables**:
  ```
  TF_VAR_environment = "dev"
  TF_VAR_aws_region = "us-east-1"
  AWS_ACCESS_KEY_ID = [your-aws-key]
  AWS_SECRET_ACCESS_KEY = [your-aws-secret]
  ```

#### Environment 2: Staging  
- **Name**: `staging`
- **Template**: Learning Infrastructure
- **Variables**:
  ```
  TF_VAR_environment = "staging"
  TF_VAR_aws_region = "us-east-1"
  AWS_ACCESS_KEY_ID = [your-aws-key]
  AWS_SECRET_ACCESS_KEY = [your-aws-secret]
  ```

#### Environment 3: Production
- **Name**: `prod`
- **Template**: Learning Infrastructure
- **Variables**:
  ```
  TF_VAR_environment = "prod"
  TF_VAR_aws_region = "us-west-2"
  AWS_ACCESS_KEY_ID = [your-aws-key]
  AWS_SECRET_ACCESS_KEY = [your-aws-secret]
  ```

## Benefits of This Approach

### 🔄 Promotion Pipeline
1. Test changes in `dev`
2. Promote to `staging` for integration testing
3. Deploy to `prod` when ready

### 🎯 Environment Isolation
- Each environment gets its own AWS resources
- Separate S3 buckets: `env0-learning-dev-bucket-xxx`, `env0-learning-staging-bucket-xxx`
- Different regions for production redundancy

### 💰 Cost Control
- Set different cost limits per environment
- Dev: $50/month
- Staging: $100/month  
- Prod: $200/month

### 🔒 Governance
- Apply approval policies to production
- Allow auto-deploy for dev/staging
- Require manual approval for prod

## env0 UI Workflow

1. **Templates Tab**: Create one template pointing to this repo
2. **Environments Tab**: 
   - Deploy environment → Select template → Name it "dev"
   - Deploy environment → Select template → Name it "staging"  
   - Deploy environment → Select template → Name it "prod"
3. **Configure Variables**: Set environment-specific variables for each

## Advanced Features to Try

### Approval Workflows
```yaml
# In env0 UI for prod environment
approvalPolicy:
  - type: manual
    users: ["admin@company.com"]
```

### Scheduled Destroys
```yaml
# For dev environment - auto-destroy every night
schedule:
  destroy: "0 22 * * *"  # 10 PM daily
```

### Cost Policies
```yaml
# Different limits per environment
cost:
  dev: 50
  staging: 100
  prod: 200
```

## Common Patterns

### Environment Naming
- Use clear, consistent names: `dev`, `staging`, `prod`
- Or use feature branches: `feature-auth`, `feature-payments`

### Variable Strategy
- Environment-specific: region, instance sizes, replica counts
- Shared: project name, common tags
- Secrets: AWS credentials, API keys (use env0's secret management)

### Deployment Strategy
- **Dev**: Auto-deploy on every commit
- **Staging**: Auto-deploy on PR merge to main
- **Prod**: Manual approval required

This approach scales well as you learn more env0 features! 🚀