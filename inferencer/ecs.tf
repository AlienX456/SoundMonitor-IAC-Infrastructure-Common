data "aws_ecs_cluster" "ecs-inferencer" {
  cluster_name = "monitor-inferencers-cluster"
}

resource "aws_ecs_service" "main" {
  name = var.service-name
  cluster = aws_ecs_cluster.ecs-inferencer.arn
  task_definition = aws_ecs_task_definition.main.arn
  launch_type = "FARGATE"
  desired_count = 1

  lifecycle {
    ignore_changes = [
      desired_count]
  }

  network_configuration {
    subnets          = [var.sound-monitor-subnet]
    assign_public_ip = true
  }

}
