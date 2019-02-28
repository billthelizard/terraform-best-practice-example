variable name {
  type    = "string"
  default = ""
}

variable cidr {
  type = "string"
  default = "0.0.0.0/0"
}

variable public_subnets {
  type = "list"
  default = ["0.0.0.0/0"]
}

variable azs {
  type = "list"
  default = [""]
}

variable env {
  type = "string"
  default = ""
}
