resource "aws_ecs_task_definition" "main" {
  family = var.family-name
  container_definitions = <<EOF
  [
    {
      "name": "repo-inferencer",
      "image": "${var.ecr_image_repo}:${var.ecr_image_tag}",
      "cpu": 0,
      "portMappings": [],
      "essential": true,
      "environment": [
          {
              "name": "DEVICE_NAME",
              "value": ""
          },
          {
              "name": "GROUP_ID",
              "value": ""
          },
          {
              "name": "AUDIO_UPLOAD_EVENT",
              "value": ""
          },
          {
              "name": "KAFKA_SERVER",
              "value": "${var.kafka_server}"
          },
          {
              "name": "AWS_KEY",
              "value": "${var.aws_inferencer_key}"
          },
          {
              "name": "AWS_SECRET",
              "value": "${var.aws_inferencer_secret}"
          },
          {
              "name": "ENCODE_FORMAT",
              "value": ""
          },
          {
              "name": "INFERENCE_EVENT",
              "value": ""
          },
          {
              "name": "BUCKET_NAME",
              "value": "${var.records_bucket_name}"
          }
      ],
      "mountPoints": [],
      "volumesFrom": [],
      "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
              "awslogs-group": "/ecs/monitor-inferencer",
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
  execution_role_arn = aws_iam_role.monitor-adapa-task-execution-role.arn
}