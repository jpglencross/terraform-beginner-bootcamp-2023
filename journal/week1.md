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

### Fixing using terraform refresh

https://developer.hashicorp.com/terraform/cli/commands/refresh


## Module sources 

Using the source we can import a module from mutliple places, e.g. tf registry, locally or github. Local examples here:

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"

  user_uuid = vars.user_uuid
  bucket_name = vars.bucket_name
}
```

https://developer.hashicorp.com/terraform/language/modules/sources#local-paths


## Referencing files within your file system

In tf theres a special path variable that helps us reference the local path:

- `path.module` - is the filesystem path of the module where the expression is placed. We do not recommend using path.module in write operations because it can produce different behavior depending on whether you use remote or local module sources. Multiple invocations of local modules use the same source directory, overwriting the data in path.module during each call. This can lead to race conditions and unexpected results.
- `path.root` - is the filesystem path of the root module of the configuration.
path.cwd is the filesystem path of the original working directory from where you ran Terraform before applying any -chdir argument. This path is an absolute path that includes details about the filesystem structure. It is also useful in some advanced cases where Terraform is run from a directory other than the root module directory. We recommend using path.root or path.module over path.cwd where possible.
- `terraform.workspace` - is the name of the currently selected workspace.

[Special path variables](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration)

## Built in functions 

[A list of TF built in functions](https://developer.hashicorp.com/terraform/language/functions)
