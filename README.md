<!-- Table of Contents -->
## Table of Contents

- [Terraform Beginner Bootcamp 2023](#terraform-beginner-bootcamp-2023)
- [Summary](#summary)
  - [Install terraform cli](#install-terraform-cli)
    - [Changing script perms](#changing-script-perms)
  - [Working with env vars](#working-with-env-vars)
    - [Persisting Gitpod secrets](#persisting-gitpod-secrets)
  - [Installing AWS CLI](#installing-aws-cli)
  - [Terraform](#terraform)
    - [TF Registry](#tf-registry)
      - [Key Terraform command](#key-terraform-command)
    - [Terraform login](#terraform-login)

<!-- Terraform Beginner Bootcamp 2023 -->

# Terraform Beginner Bootcamp 2023

---

# Summary

Given a version number MAJOR.MINOR.PATCH, e.g. `1.0.1` increment the:

MAJOR version when you make incompatible API changes
MINOR version when you add functionality in a backward compatible manner
PATCH version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Install terraform cli

Had issues in the tf install in the provided yml, also noticed [newer/different docs](https://developer.hashicorp.com/terraform/cli/commands) than in the video. 

These newer install instructions are included in this script here: [bin/install_tf_cli](./bin/install_tf_cli). 

> Note this isn't a `.sh` script file, this is set using shebang to improve portability, [more info on this here](https://en.wikipedia.org/wiki/Shebang_(Unix)#Portability).

This install runs on gitpod inti, docs here on [Gitpod init yml](https://www.gitpod.io/docs/configure/workspaces/tasks).

### Changing script perms

> Great resource on linux permissions by Redhat can be [found here](https://www.redhat.com/sysadmin/linux-file-permissions-explained).

In order to run the script without using the `source` command you need to grant executable permissions to the user on the file. To do this you need to run the below:

```
chmod u+x ./bin/install_tf_cli
```


## Working with env vars

You can list all env vars using `env` command or filter them by piping them into `grep`.

> To unset a env var you can use `unset [ENV_NAME] // e.g. unset MY_ENV_VAR` and note they only apply to the terminal you're using.

Set them using `export` in terminal and prinnt them our using `echo $[ENV_VAR_NAME`.  

#### Persisting Gitpod secrets

We can persist secret variables in different gitpod workspaces by storing them in gitpod secrets. Do this using:

```
gp env HELLO='world'
```

Or you can set non-secret env vars in `gitpod.yml`.

## Installing AWS CLI

AWS CLI is installed for this project and certain env vars need to be set to know which account and region you're using etc. [More info here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

We can check if our AWS creds are configured correctly by runnig the following command:

```
aws sts get-caller-identity
```

When you're connected successfully you will see a resonse that looks like the following:

```
{
    "UserId": "AIDA5RC6GL3AOM7DCUREG",
    "Account": "930057969344",
    "Arn": "arn:aws:iam::930057969344:user/tf-bootcamp"
}
```

## Terraform 

### TF Registry 

When looking for TF providers (interface to APIs) and modules (templates that allow you to recreate generally accepted pattern / use cases), you can find them on the [terraform registry site](https://registry.terraform.io/).

The provider we have beem using from the registry is the [random provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string). We did this to create a random output and test terraform commands. 


#### Key Terraform command 

```
terraform init  <!-- Initialise a repo to use terraform -->
terraform plan  <!-- Plan a terraform build terraform to see changes to infra -->
terraform apply --auto-approve  <!-- Apply terraform changes listed in the plan, automatically  -->
terraform output random_bucket_name  <!-- Get terraform to log out a variable to console  -->
terraform destroy --auto-approve <!-- This will destroy your resources, again automatically -->
```
> After running these commands your terraform state will be saved to `terraform.tfstate` and `terraform.tfstate.backup` files. You can read these to see the same info as your terminal outputs e.g. `random_bucket_name`, but these should not be committed to git.

### Terraform login

In order to automate the login process we have created a script to login using a JSON file (`credentials.tfrc.json`) with an API token secret stored inside it. More details on this [can be found here](https://developer.hashicorp.com/terraform/cli/commands/login)