data "aws_ssm_parameter" "eks_cluster_name" {
    name = "/${var.project}/${var.env}/eks_cluster_name"
}

data "aws_ssm_parameter" "bastion_iam_role_arn" {
    name = "/${var.project}/${var.env}/bastion_iam_role_arn"
}