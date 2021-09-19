resource "aws_cloudwatch_log_group" "monitor-logstash" {
  name = "/ecs/${var.service-name}"
}