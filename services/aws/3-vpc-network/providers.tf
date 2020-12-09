provider "aws" {
  region = var.common_region
}

provider "aws" {
  alias  = "shared"
  region = var.common_region
  assume_role {
    role_arn = format(
      "%s%s%s%s",
      "arn:aws:iam::",
      var.organizations_shared_account_id,
      ":role/",
      local.terraform_assume_role_name,
    )
  }
}

# provider "aws" {
#   alias   = "dev"
#   region  = var.common_region
#   assume_role {
#     role_arn = format(
#       "%s%s%s%s",
#       "arn:aws:iam::",
#       var.organizations_dev_account_id,
#       ":role/",
#       local.terraform_assume_role_name,
#     )
#   }
# }
#
# provider "aws" {
#   alias   = "prod"
#   region  = var.common_region
#   assume_role {
#     role_arn = format(
#       "%s%s%s%s",
#       "arn:aws:iam::",
#       var.organizations_prod_account_id,
#       ":role/",
#       local.terraform_assume_role_name,
#     )
#   }
# }
