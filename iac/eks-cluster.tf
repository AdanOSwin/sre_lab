module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name = var.cluster_name

  cluster_version = "1.24"

  vpc_id                          = module.vpc.vpc_id
  subnet_ids                      = module.vpc.private_subnets
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  cluster_addons = {

    coredns = {
      resolve_conflict = "OVERWRITE"
    }

    vpc-cni = {
      resolve_conflict = "OVERWRITE"
    }

    kube-proxy = {
      resolve_conflict = "OVERWRITE"
    }

    #csi = {
    #  resolve_conflict = "OVERWRITE"
    #}
  }

  #manage_aws_auth_configmap = true

  eks_managed_node_groups = {
    node-group = {
      desired_capacity = 1
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.small"]

      tags = {
        Environment = "sre_lab"
      }
    }

    node-group2 = {
      instance_types   = ["t3.small"]
      desired_capacity = 1
      max_capacity     = 3
      min_capacity     = 1

      tags = {
        Environment = "sre_lab"
      }
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "sre_lab"
  }
}



/*
//resource "aws_eks_cluster" "sre_cluster" {
//  name     = "sre_cluster"
//  role_arn = aws_iam_role.eks-role
  //security_group_ids = [aws_security_group.sre_group.id]

//  vpc_config {
//    subnet_ids = module.vpc.private_subnets
  }

 // depends_on = [
 //   aws_iam_role_policy_attachment.SRE-AmazonEKSClusterPolicy,
 //   aws_iam_role_policy_attachment.SRE-AmazonEKSVPCResourceController
  ]

}

*/

