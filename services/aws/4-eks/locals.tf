locals {
  terraform_assume_role_name = "Administrator"

  eks_master_iam_role_policy_description = format(
    "%s %s %s %s",
    lower(var.eks_cluster_resource_prefix),
    lower(var.environment_name),
    lower(var.eks_master_tier_name),
    "node IAM role policy"
  )

  eks_master_iam_assume_role_policy_document_statements = [
    {
      sid       = "0"
      effect    = "Allow"
      actions   = ["sts:AssumeRole"]
      resources = []
      condition = [
        {
          test     = ""
          variable = ""
          values   = []
        }
      ]
      principals = [
        {
          type        = "Service"
          identifiers = ["eks.amazonaws.com"]
        }
      ]
    }
  ]

  eks_master_iam_role_policy_attachments = list(
    # module.eks_master_iam_role_policy.arn,
    data.aws_iam_policy.amazon_eks_cluster_policy.arn,
    data.aws_iam_policy.amazon_eks_service_policy.arn,
  )

  eks_master_kms_key_policy_document_statements = [
    {
      sid    = "Allow access through EBS for all principals in the account that are authorized to use EBS"
      effect = "Allow"
      actions = [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:CreateGrant",
        "kms:DescribeKey"
      ]
      resources = ["*"]
      condition = [
        {
          test     = "StringEquals"
          variable = "kms:ViaService"
          values   = [data.aws_region.current.endpoint]
        },
        {
          test     = "StringEquals"
          variable = "kms:CallerAccount"
          values   = [data.aws_caller_identity.current.account_id]
        }
      ]
      principals = [
        {
          type        = "AWS"
          identifiers = ["*"]
        }
      ]
    },
    {
      sid    = "Allow direct access to key metadata to the account"
      effect = "Allow"
      actions = [
        "kms:Describe*",
        "kms:Get*",
        "kms:List*",
        "kms:RevokeGrant"
      ]
      resources = ["*"]
      condition = [
        {
          test     = "StringEquals"
          variable = "kms:CallerAccount"
          values   = [data.aws_caller_identity.current.account_id]
        }
      ]
      principals = [
        {
          type = "AWS"
          identifiers = [
            format(
              "%s%s%s",
              "arn:aws:iam::",
              data.aws_caller_identity.current.account_id,
              ":root"
            )
          ]
        }
      ]
    },
    {
      sid    = "Allow access for key administrators"
      effect = "Allow"
      actions = [
        "kms:Create*",
        "kms:Describe*",
        "kms:Enable*",
        "kms:List*",
        "kms:Put*",
        "kms:Update*",
        "kms:Revoke*",
        "kms:Disable*",
        "kms:Get*",
        "kms:Delete*",
        "kms:TagResource",
        "kms:UntagResource",
        "kms:ScheduleKeyDeletion",
        "kms:CancelKeyDeletion"
      ]
      resources = ["*"]
      condition = [
        {
          test     = ""
          variable = ""
          values   = []
        }
      ]
      principals = [
        {
          type = "AWS"
          identifiers = [
            format(
              "%s%s%s",
              "arn:aws:iam::",
              data.aws_caller_identity.current.account_id,
              ":role/Administrator"
            ),
            format(
              "%s%s%s",
              "arn:aws:iam::",
              data.aws_caller_identity.current.account_id,
              ":root"
            )
          ]
        },
      ]
    },
    {
      sid    = "Allow use of the key"
      effect = "Allow"
      actions = [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:DescribeKey"
      ]
      resources = ["*"]
      condition = [
        {
          test     = "StringEquals"
          variable = "kms:CallerAccount"
          values   = [data.aws_caller_identity.current.account_id]
        }
      ]
      principals = [
        {
          type = "AWS"
          identifiers = [
            format(
              "%s%s%s%s",
              "arn:aws:iam::",
              data.aws_caller_identity.current.account_id,
              ":role/",
              module.eks_master_iam_role.name,
            )
          ]
        }
      ]
    },
    {
      sid    = "Allow attachment of persistent resources"
      effect = "Allow"
      actions = [
        "kms:CreateGrant",
        "kms:ListGrants",
        "kms:RevokeGrant"
      ]
      resources = ["*"]
      condition = [
        {
          test     = "Bool",
          variable = "kms:GrantIsForAWSResource",
          values   = ["true"]
        }
      ]
      principals = [
        {
          type = "AWS"
          identifiers = [
            format(
              "%s%s%s%s",
              "arn:aws:iam::",
              data.aws_caller_identity.current.account_id,
              ":role/",
              module.eks_master_iam_role.name
            )
          ]
        }
      ]
    }
  ]

  eks_master_kms_key_description = format(
    "%s %s %s %s",
    lower(var.eks_cluster_resource_prefix),
    lower(var.environment_name),
    lower(var.eks_master_tier_name),
    "node kms key."
  )

  eks_master_kms_key_usage = "ENCRYPT_DECRYPT"

  eks_common_security_group_ingress_rules = [
    {
      from_port       = 443
      to_port         = 443
      protocol        = "tcp"
      cidr_blocks     = []
      security_groups = []
      self            = true
      description     = "Allow all Kubernetes nodes to communicate between themselves"
    },
  ]

  eks_master_security_group_ingress_rules = concat(
    var.eks_master_security_group_custom_ingress_rules,
    local.eks_common_security_group_ingress_rules,
  )

  eks_master_security_group_egress_rules = concat(
    [
      {
        from_port       = 1025
        to_port         = 65535
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        security_groups = []
        self            = false
        description     = "Allow cluster Egress access to the Internet"
      },
    ],
    var.eks_master_security_group_custom_egress_rules
  )

  eks_worker_iam_assume_role_policy_document_statements = [
    {
      sid    = "0"
      effect = "Allow"
      actions = [
        "sts:AssumeRole",
      ]
      resources = []
      condition = [
        {
          test     = ""
          variable = ""
          values   = []
        },
      ]
      principals = [
        {
          type = "Service"
          identifiers = [
            "ec2.amazonaws.com"
          ]
        }
      ]
    }
  ]

  eks_worker_autoscaling_iam_role_policy_document_statements = [
    {
      sid    = "EKSWorkerAutoscalingAll"
      effect = "Allow"
      actions = [
        "autoscaling:DescribeAutoScalingGroups",
        "autoscaling:DescribeAutoScalingInstances",
        "autoscaling:DescribeLaunchConfigurations",
        "autoscaling:DescribeTags",
        "ec2:DescribeLaunchTemplateVersions",
      ]
      resources = ["*"]
      condition = [
        {
          test     = ""
          variable = ""
          values   = []
        },
      ]
      principals = [
        {
          type        = ""
          identifiers = []
        }
      ]
    },
    {
      sid    = "EKSWorkerAutoscalingOwn"
      effect = "Allow"
      actions = [
        "autoscaling:SetDesiredCapacity",
        "autoscaling:TerminateInstanceInAutoScalingGroup",
        "autoscaling:UpdateAutoScalingGroup",
      ]
      resources = ["*"]
      condition = [
        {
          test = "StringEquals"
          variable = format(
            "%s%s",
            "autoscaling:ResourceTag/kubernetes.io/cluster/",
            # module.eks_master_instances.id,
            module.eks_master_instances.eks_id,
          )
          values = ["owned"]
        },
        {
          test     = "StringEquals"
          variable = "autoscaling:ResourceTag/k8s.io/cluster-autoscaler/enabled"
          values   = ["true"]
        },
      ]
      principals = [
        {
          type        = ""
          identifiers = []
        }
      ]
    },
  ]

  eks_worker_autoscaling_iam_role_policy_description = format(
    "%s %s %s %s",
    lower(var.eks_cluster_resource_prefix),
    lower(var.environment_name),
    lower(var.eks_worker_tier_name),
    "autoscaling node IAM role policy."
  )

  eks_worker_iam_role_policy_description = format(
    "%s %s %s %s",
    lower(var.eks_cluster_resource_prefix),
    lower(var.environment_name),
    lower(var.eks_worker_tier_name),
    "node IAM role policy."
  )

  eks_worker_iam_role_policy_attachments = list(
    # module.eks_worker_iam_role_policy.arn,
    # module.eks_worker_autoscaling_iam_role_policy.arn,
    data.aws_iam_policy.amazon_eks_worker_node_policy.arn,
    data.aws_iam_policy.amazon_ec2_container_registry_ro_policy.arn,
    data.aws_iam_policy.amazon_eks_cni_policy.arn,
  )

  eks_worker_kms_key_policy_document_statements = [
    {
      sid       = "EnableIAMUserPermissions"
      effect    = "Allow"
      actions   = ["kms:*"]
      resources = ["*"]
      condition = [
        {
          test     = ""
          variable = ""
          values   = []
        }
      ]
      principals = [
        {
          type = "AWS"
          identifiers = [
            format(
              "%s%s%s",
              "arn:aws:iam::",
              data.aws_caller_identity.current.account_id,
              ":root"
            )
          ]
        }
      ]
    },
    {
      sid    = "AllowAccessForKeyAdministrators"
      effect = "Allow"
      actions = [
        "kms:Create*",
        "kms:Describe*",
        "kms:Enable*",
        "kms:List*",
        "kms:Put*",
        "kms:Update*",
        "kms:Revoke*",
        "kms:Disable*",
        "kms:Get*",
        "kms:Delete*",
        "kms:TagResource",
        "kms:UntagResource",
        "kms:ScheduleKeyDeletion",
        "kms:CancelKeyDeletion"
      ]
      resources = ["*"]
      condition = [
        {
          test     = ""
          variable = ""
          values   = []
        }
      ]
      principals = [
        {
          type = "AWS"
          identifiers = [
            format(
              "%s%s%s",
              "arn:aws:iam::",
              data.aws_caller_identity.current.account_id,
              ":role/Administrator"
            )
          ]
        }
      ]
    },
    {
      sid    = "AllowUseOfTheKey"
      effect = "Allow"
      actions = [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:DescribeKey"
      ]
      resources = ["*"]
      condition = [
        {
          test     = ""
          variable = ""
          values   = []
        }
      ]
      principals = [
        {
          type = "AWS"
          identifiers = [
            format(
              "%s%s%s%s",
              "arn:aws:iam::",
              data.aws_caller_identity.current.account_id,
              ":role/",
              module.eks_worker_iam_role.name
            )
          ]
        }
      ]
    },
    {
      sid    = "AllowAttachmentOfPersistentResources"
      effect = "Allow"
      actions = [
        "kms:CreateGrant",
        "kms:ListGrants",
        "kms:RevokeGrant"
      ]
      resources = ["*"]
      condition = [
        {
          test     = "Bool"
          variable = "kms:GrantIsForAWSResource"
          values   = ["true"]
        }
      ]
      principals = [
        {
          type = "AWS"
          identifiers = [
            format(
              "%s%s%s%s",
              "arn:aws:iam::",
              data.aws_caller_identity.current.account_id,
              ":role/",
              module.eks_worker_iam_role.name
            )
          ]
        }
      ]
    }
  ]

  eks_worker_kms_key_description = format(
    "%s %s %s %s",
    lower(var.eks_cluster_resource_prefix),
    lower(var.environment_name),
    lower(var.eks_worker_tier_name),
    "node kms key."
  )

  eks_worker_kms_key_usage = "ENCRYPT_DECRYPT"

  eks_worker_security_group_ingress_rules = concat(
    [
      {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = []
        security_groups = []
        self            = true
        description     = "Allow worker nodes to communicate between themselves"
      },
      {
        from_port       = 1025
        to_port         = 65535
        protocol        = "tcp"
        cidr_blocks     = []
        security_groups = [module.eks_master_security_group.id]
        self            = false
        description     = "Allow Kubelets to receive communication from the cluster master nodes"
      },
      {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = []
        security_groups = [module.eks_master_security_group.id]
        self            = false
        description     = "Allow Kubelets to receive communication from the cluster master nodes"
      }
    ],
    var.eks_worker_security_group_custom_ingress_rules,
    local.eks_common_security_group_ingress_rules,
  )

  eks_worker_security_group_egress_rules = concat(
    [
      {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
        security_groups = []
        self            = false
        description     = "Allow nodes all egress to the Internet."
      },
    ],
    var.eks_worker_security_group_custom_egress_rules,
  )

  instance_type_standard = [
    "t3.medium",
  ]
  instance_type_ebs_optimized = [
    "t3.medium",
  ]

}
