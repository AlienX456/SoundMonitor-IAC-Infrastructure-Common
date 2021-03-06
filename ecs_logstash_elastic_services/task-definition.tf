resource "aws_ecs_task_definition" "main" {
  family = var.family_name
  container_definitions = <<EOF
  [
    {
      "name": "sound-monitor-container",
      "image": "${var.aws_ecr_account_url}/${var.family_name}:${var.ecr_image_tag}",
      "cpu": 0,
      "portMappings": [],
      "essential": true,
      "environment": [
          {
              "name": "AWS_ELASTIC_ENDPOINT",
              "value": "${data.aws_elasticsearch_domain.domain.endpoint}"
          },
          {
              "name": "KAFKA_BOOTSTRAP_SERVER_ONE",
              "value": "${var.kafka_bootstrap_server_one}"
          },
          {
              "name": "USER",
              "value": "${var.user}"
          },
          {
              "name": "PASSWORD",
              "value": "${var.password}"
          }
      ],
      "mountPoints": [],
      "volumesFrom": [],
      "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
              "awslogs-group": "/ecs/${var.service-name}",
              "awslogs-region": "us-east-1",
              "awslogs-stream-prefix": "ecs"
          }
      }
    }
  ]
  EOF

  cpu = "${var.cpu}"
  memory = "${var.memory}"
  requires_compatibilities = ["FARGATE"]
  network_mode = "awsvpc"
  execution_role_arn = aws_iam_role.task-execution-role.arn
}