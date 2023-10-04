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