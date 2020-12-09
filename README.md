# terraform-eks-pipeline


## Description

This is a sample Terraform code to deploy AWS EKS cluster and worker nodes using AWS CodePipeline

## Installation

Clone the repository

cd terraform-eks-pipeline
Change the configuration files:
environments/aws/network/dev.tfvars
environments/aws/eks/dev.tfvars
environments/aws/pipeline/dev.tfvars


terraform -chdir=services/aws/1-bootstrap init


terraform -chdir=services/aws/1-bootstrap apply
You will need to provide a region, for example eu-central-1

terraform -chdir=services/aws/2-codepipeline init -backend-config=backend.config
terraform -chdir=services/aws/2-codepipeline workspace new dev
terraform -chdir=services/aws/2-codepipeline apply -var-file=../../../environments/aws/pipeline/dev.tfvars

That's it!

Please note that it will install new CodePipeline and will kick in automatically Deployment of:
- VPC
- Networking: 3 Availability zones, 3 Netwroks, NAT GWs, Security Groups, Routing Tables
- EKS: Based on the configuration it will install Kubernetes cluster with multiple worker nodes as per configuration


The deployment is based in the configuration files:
environments/aws/network/dev.tfvars (or qa.tfvars, or ...)
environments/aws/eks/dev.tfvars (or qa.tfvars, or ...)
