resource "aws_cloudwatch_log_group" "service-cloudwatch" {
  name = "/ecs/${var.service-name}"
}