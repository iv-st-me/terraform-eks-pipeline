terraform {
  required_version = ">= 0.12"
  # backend "remote" {}
  # required_providers {
  #   aws = {
  #     source  = "hashicorp/aws"
  #     version = "3.10.0"
  #   }
  # }

  # backend "local" {}
  backend "s3" {}

}
