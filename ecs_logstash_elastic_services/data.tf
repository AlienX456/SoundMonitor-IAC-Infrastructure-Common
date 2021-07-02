data "aws_ecs_cluster" "soundmonitor" {
  cluster_name = "sound-monitor-cluster"
}

data "aws_subnet" "main" {
  filter {
    name   = "tag:Name"
    values = ["soundmonitor-mainsubnet"]
  }
}

data "aws_iam_policy" "ecs-task-execution-role" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}