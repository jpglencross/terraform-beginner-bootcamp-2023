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

## Data sources

This allows us to use data from cloud resources, useful when we want to reference them without importing.

E.g. when you're looking for your AWS account id then you can get it from `data.aws_caller_identity.current.account_id`

[Data source docs](https://developer.hashicorp.com/terraform/language/data-sources)

## Changing the lifecycle of resources

lifecycle is a nested block that can appear within a resource block. The lifecycle block and its contents are meta-arguments, available for all resource blocks regardless of type.

The arguments available within a lifecycle block are create_before_destroy, prevent_destroy, ignore_changes, and replace_triggered_by.

[Lifecycle arguement](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

## Terraform Data

The `terraform_data` implements the standard resource lifecycle, but does not directly take any other actions. You can use the terraform_data resource without requiring or configuring a provider. It is always available through a built-in provider with the source address terraform.io/builtin/terraform. https://developer.hashicorp.com/terraform/language/resources/terraform-data

## Provisioners

These allow you to execute commands on compute instances for actions E.g. AWS CLI

These are not recommended as this should be done with tools like Ansible, as this handles configuration management, but the ability exists.

[More docs here](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)

### Local exec

This will execute a command on the machine running the TF commands, e.g. terraform plan / apply. 

### Remote exec

This will run commands on a machine that you target, and you will need to provide creds e.g. ssh keys to access these.

## For each

This allows you to itterate over conplex data types, this is mostly useful when you're creating multiple of a cloud resource and you want to reduce duplicating repetative terraform code.

[For each docs](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)