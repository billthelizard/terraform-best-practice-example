terraform {
  backend "s3" {
    bucket  = "(enter your bucket name for staging environment)"
    key     = "terraform-best-practice-example/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "stage"
  }

  required_version = ">= 0.11.11"
}

provider aws {
  region  = "ap-northeast-1"
  profile = "stage"
  version = ">= 2.0.0"
}

module "netrowk" {
  source = "../modules/ap-northeast-1/network"

  name = "${var.name}"
  cidr = "${var.cidr}"
  azs  = "${var.azs}"

  public_subnets = "${var.public_subnets}"
  env = "${var.env}"
}
