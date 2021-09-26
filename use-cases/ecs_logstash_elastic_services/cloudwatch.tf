resource "aws_cloudwatch_log_group" "monitor-logstash" {
  name = "/ecs/${local.names.service}"
}
