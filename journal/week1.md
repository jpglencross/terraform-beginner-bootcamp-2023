<!-- Table of Contents -->
## Table of Contents


<!-- Terraform Beginner Bootcamp 2023 -->

# Week 1

---

# Summar

The recommended filenames for a minimal module, even if they're empty are:

- main.tf - this should be the primary entrypoint. For a simple module, this may be where all the resources are created. 
- variables.tf and outputs.tf - should contain the declarations for variables and outputs, respectively.

> For a complex module, resource creation may be split into multiple files but any nested module calls should be in the main file.

It can also include: 

- provider.tf - define required providers and configuration
- output.tf - stores our outputs
- readme.md - details on the module and documentation




