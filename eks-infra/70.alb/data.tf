
data "aws_ssm_parameter" "public_alb_sg_id" {
    name = "/${var.project}/${var.env}/public_alb_sg_id"
}

data "aws_ssm_parameter" "frounttir_subnet_ids" {
    name = "/${var.project}/${var.env}/frounttir_subnet_ids"
}

data "aws_ssm_parameter" "certificate_arn" {
    name = "/${var.project}/${var.env}/certificate_arn"
}

data "aws_ssm_parameter" "vpc_id" {
    name = "/${var.project}/${var.env}/vpc_id"
}