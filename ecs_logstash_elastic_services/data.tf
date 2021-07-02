data "aws_ecs_cluster" "soundmonitor" {
  cluster_name = "sound-monitor-cluster"
}

data "aws_elasticsearch_domain" "domain" {
  domain_name = "soundmonitor-elasticsearch"
}

data "aws_subnet" "main" {
  filter {
    name   = "tag:Name"
    values = ["soundmonitor-mainsubnet"]
  }
}

data "aws_iam_policy_document" "ecs-task-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy" "ecs-task-execution-role" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
