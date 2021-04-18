data "aws_ecs_cluster" "inferencer" {
  cluster_name = "monitor-inferencers-cluster"
}

resource "aws_ecs_service" "main" {
  name = var.service-name
  cluster = data.aws_ecs_cluster.inferencer.arn
  task_definition = aws_ecs_task_definition.main.arn
  launch_type = "FARGATE"
  desired_count = 1

  lifecycle {
    ignore_changes = [
      desired_count]
  }

  network_configuration {
    subnets          = [var.soundmonitor_mainsubnet]
    assign_public_ip = true
  }

}
