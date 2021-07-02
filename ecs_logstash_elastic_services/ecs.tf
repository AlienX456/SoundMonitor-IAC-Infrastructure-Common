resource "aws_ecs_service" "main" {
  name            = var.service-name
  cluster         = data.aws_ecs_cluster.soundmonitor.arn
  task_definition = aws_ecs_task_definition.main.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = [data.aws_subnet.main.id]
    assign_public_ip = true
  }

}