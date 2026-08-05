resource "aws_ssm_parameter" "public_alb_listener_arn" {
  name  = "/${var.project}/${var.env}/public_alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.https.arn
  overwrite = true
}