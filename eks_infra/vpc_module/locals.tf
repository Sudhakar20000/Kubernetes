locals {
    common_name = "${var.project}-${var.env}"
    common_tags = {
        Project = var.project
        Env = var.env
        Name = local.common_name
        Terraform = true
    }
    available_zones = slice(data.aws_availability_zones.available,0 ,2)
}