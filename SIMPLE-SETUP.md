# Simple env0 AWS Setup

**You only need this ONE file to get started with env0.**

## 🎯 **Step 1: Get Your env0 Organization ID**

1. Login to env0
2. Go to Settings → Organization  
3. Copy your Organization ID

## 🚀 **Step 2: Deploy AWS Role**

Run this command with your Organization ID:

```bash
aws cloudformation deploy \
  --stack-name env0-role \
  --template-file env0-assume-role.yaml \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides ExternalId=5d745878-bbb7-48ae-8900-3409aaa16fca
```

## 📋 **Step 3: Get the Role ARN**

```bash
aws cloudformation describe-stacks \
  --stack-name env0-role \
  --query 'Stacks[0].Outputs[?OutputKey==`AssumeRoleArn`].OutputValue' \
  --output text
```

## ⚡ **Step 4: Add to env0**

1. env0 Dashboard → Settings → Credentials → Add Credential
2. Type: **AWS Assumed Role**
3. Role ARN: [paste from step 3]
4. Save

## ✅ **That's It!**

Now you can create environments in env0 that will use your AWS account.

**Files you need:**
- ✅ `env0-assume-role.yaml` (CloudFormation template)
- ✅ Your Terraform files (`main.tf`, `variables.tf`, `outputs.tf`)

**Files to ignore:**
- ❌ All the other setup files I created (too confusing)

Focus on learning env0's core features first! 🎓