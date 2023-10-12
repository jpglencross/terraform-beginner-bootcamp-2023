<!-- Table of Contents -->
## Table of Contents


<!-- Terraform Beginner Bootcamp 2023 -->

# Week 1

---

# Summary

## Basic module structure 

The recommended filenames for a minimal module, even if they're empty are:

- main.tf - this should be the primary entrypoint. For a simple module, this may be where all the resources are created. 
- variables.tf and outputs.tf - should contain the declarations for variables and outputs, respectively.

> For a complex module, resource creation may be split into multiple files but any nested module calls should be in the main file.

It can also include: 

- provider.tf - define required providers and configuration
- output.tf - stores our outputs
- readme.md - details on the module and documentation

## TF variable

In terraform cloud you can set two types of variables, either:
- Environment variables - these can be set to sensitive so the values aren't shared (e.g. AWS_KEY
- Terraform variables - these can be added in CLI or in the tfvars file

### Loading vars

We can either use:

- `-var` and add via the cli e.g. `-var user_uuid='my-12345-fake-1234-uuid'` 
- `var-file` This will load the variable values from the specified .tfvars file, and the value of user_uuid from your .tfvars file will be used in your Terraform configuration. E.g. `terraform apply -var-file=custom_variables.tfvars`
- use default file `terraform.tfvars`, this will be loaded by default if `var-file` not set

## Dealing with configuration drift

### Fix missing resources with TF import 

For importing state of a aws s3 bucket, example below: 
```
terraform import aws_s3_bucket.example
```

More details [here](https://developer.hashicorp.com/terraform/cli/import)

### Fix manual config changes

If something happens that causes tf state to be out of sync with our deployed infra, running `tf plan` will corret that by re-introducing the missing state.
