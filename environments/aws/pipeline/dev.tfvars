
# Organization
account_id = "235297331187"

# Global
common_region = "eu-central-1"
common_tags = {
  Terraform = "true",
  Team      = "myteam"
}

# Pipeline
pipeline_resource_prefix                    = "devpipeline"
pipelinebuild_resource_prefix               = "devbuild"
pipeline_s3_bucket                          = "terraform-eks-pipeline"
iam_policy_resource_prefix                  = "devpipeline"
environment_name                            = "shared"
pipeline_tags                               = {}
pipeline_tier_name                          = "private"
pipeline_iam_role_policy_path               = "/"
pipeline_iam_role_path                      = "/"
pipeline_iam_role_max_session_duration      = 7200 # seconds
pipeline_iam_role_permissions_boundary      = ""
pipeline_iam_role_tags                      = {}
pipelinebuild_tier_name                     = "private"
pipelinebuild_iam_role_policy_path          = "/"
pipelinebuild_iam_role_path                 = "/"
pipelinebuild_iam_role_max_session_duration = 7200 # seconds
pipelinebuild_iam_role_permissions_boundary = ""
pipelinebuild_iam_role_tags                 = {}
approval                                    = "False"
github_repo_owner                           = "iv-st-me"
github_repo                                 = "terraform-eks-pipeline"
github_repo_branch                          = "master"
github_repo_oauth_token                     = ""
pipelinebuild_build_template                = "version: 0.1\nphases:\n  install:\n    commands:\n      - yum      -y install jq\n      - cd /tmp && curl -o terraform.zip https://releases.hashicorp.com/terraform/0.14.0/terraform_0.14.0_linux_amd64.zip && unzip terraform.zip && mv terraform /usr/bin\n  build:\n    commands:\n      - terraform -chdir=services/aws/3-vpc-network init -backend-config=backend.config -input=false\n      - terraform -chdir=services/aws/3-vpc-network workspace new dev || true\n      - terraform -chdir=services/aws/3-vpc-network workspace select dev\n      - terraform -chdir=services/aws/3-vpc-network apply -input=false -auto-approve=true -var-file=../../../environments/aws/network/dev.tfvars\n      - terraform -chdir=services/aws/4-eks init -backend-config=backend.config -input=false\n      - terraform -chdir=services/aws/4-eks workspace new dev || true\n      - terraform -chdir=services/aws/4-eks workspace select dev\n      - pwd\n      - ls -al\n      - terraform -chdir=services/aws/4-eks apply -input=false -auto-approve=true -var-file=../../../environments/aws/eks/dev.tfvars"
