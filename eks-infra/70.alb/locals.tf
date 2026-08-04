locals {
    public_alb_sg_id = data.aws_ssm_parameter.public_alb_sg_id.value
    common_name = "${var.project}-${var.env}"
    frounttir_subnet_ids = split(",", data.aws_ssm_parameter.frounttir_subnet_ids.value)
    common_tags = {
        Project = "${var.project}"
        Environment = "${var.env}"
        Terraform = "true"
    }
    certificate_arn = data.aws_ssm_parameter.certificate_arn.value
    vpc_id = data.aws_ssm_parameter.vpc_id.value
}