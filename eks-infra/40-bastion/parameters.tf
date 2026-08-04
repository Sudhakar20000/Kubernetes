resource "aws_ssm_parameter" "bastion_iam_role_arn" {
  name  = "/${var.project}/${var.env}/bastion_iam_role_arn"
  type  = "String"
  value = aws_iam_role.bastion.arn
  overwrite = true
}