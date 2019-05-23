# 概要

このリポジトリは @antonbabenko さんによる [terraform-best-practices](https://github.com/antonbabenko/terraform-best-practices) にしたがって実装したものです。

このベストプラクティスに沿ったリソースの作り方の参考として用意したものです。

## このコードによって作られるインフラ

図のような、Public Subnet を Tripple AZ にもつ VPC を作成します.

![infrastructure](https://github.com/billthelizard/terraform-best-practice-example/raw/image/image/terraform-best-practice-infra.png)

## 必要なもの

* AWS アカウント
* aws-cli
* terraform: 0.11.x

## 使い方

1. profile を設定します

`~/.aws/credentials`

```
[stage]
aws_access_key_id = AKIA...
aws_secret_access_key = ...

[prod]
aws_access_key_id = AKIA...
aws_secret_access_key = ...
```

`~/.aws/configure`

```
[profile stage]
region = ap-northeast-1
output = json

[profile prod]
region = ap-northeast-1
output = json
```

`stage` と `prod` は同一のアカウント情報でも構いません。

1. tfstate 管理用の S3 Bucket を作成します

```console
$ aws s3api mb s3://(bucket-name)
```

2. `stage/main.tf` および `prod/main.tf` に、上で作成した Bucket 名を入力します.

```
bucket  = "(enter your bucket name for staging environment)"
```

3. `stage` または `prod` ディレクトリに移動して、 `terraform apply` します:

```console
$ cd stage
$ terraform init
$ terraform apply
```

4. 使い終わったら、リソースを削除します

```
$ terraform destroy
```

## バージョンを 0.11.14 に固定する

Module Registry から取得しているコード
[terraform-aws-modules/terraform-aws-vpc](https://github.com/terraform-aws-modules/terraform-aws-vpc)
が `0.12.0` に対応していないので、このリポジトリでは terraform のバージョンを `0.11.x` に固定しています。

異なるバージョンの terraform を共存させるには、
[Terraform Switcher](https://warrensbox.github.io/terraform-switcher/)
を使うと便利です。