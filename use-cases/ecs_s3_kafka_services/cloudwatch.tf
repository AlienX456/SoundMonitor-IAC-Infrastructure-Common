resource "aws_cloudwatch_log_group" "service-cloudwatch" {
  name = "/ecs/${local.names.service}"
}
