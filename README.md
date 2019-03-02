# Overview

This repository is a reference implementation of the best-practice terraform resource definition introduced by @antonbabenko:
https://github.com/antonbabenko/terraform-best-practices

## Infrastructure Created by this Example

![infrastructure](https://github.com/billthelizard/terraform-best-practice-example/raw/image/image/terraform-best-practice-infra.png)

## Requirements

* valid AWS account
* terraform >= 0.11.11

## How to Use

1. edit bucket name in `stage/main.tf` and `prod/main.tf`:

```hcl
  ..
  bucket  = "(enter your bucket name for staging environment)"
  ..
```

2. `cd stage` or `cd prod`
1. `terraform init`
1. `terraform plan`
1. `terraform apply`
1. `terraform destroy`
