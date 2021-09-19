resource "aws_ecs_task_definition" "main" {
  family                = local.names.family
  container_definitions = <<EOF
  [
    {
      "name": "sound-monitor-container",
      "image": "${var.aws_ecr_account_url}/${local.names.family}:${var.ecr_image_tag}",
      "cpu": 0,
      "portMappings": [],
      "essential": true,
      "environment": [
          {
              "name": "DEVICE_NAME",
              "value": "${var.device_selector}"
          },
          {
              "name": "GROUP_ID",
              "value": "${local.names.family}"
          },
          {
              "name": "DATA_UPLOAD_EVENT",
              "value": "${local.topic-index-mapping-json.kafka-upload-topic_name}"
          },
          {
              "name": "KAFKA_BOOTSTRAP_SERVER_ONE",
              "value": "${var.kafka_bootstrap_server_one}"
          },
          {
              "name": "ENCODE_FORMAT",
              "value": "${var.kafka_encode_format}"
          },
          {
              "name": "PROCESS_RESULT_EVENT",
              "value": "${local.topic-index-mapping-json.kafka-result-topic-name}"
          },
          {
              "name": "BUCKET_NAME",
              "value": "${local.topic-index-mapping-json.bucket-name}"
          },
          {
              "name": "MAPPER_URL",
              "value": "${var.mapper_url}"
          },
          {
              "name": "ELASTIC_INDEX_NAME",
              "value": "${local.topic-index-mapping-json.index-name}"
          }
      ],
      "mountPoints": [],
      "volumesFrom": [],
      "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
              "awslogs-group": "/ecs/${local.names.service}",
              "awslogs-region": "us-east-1",
              "awslogs-stream-prefix": "ecs"
          }
      }
    }
  ]
  EOF

  cpu                      = var.cpu
  memory                   = var.memory
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.task-execution-role.arn
  task_role_arn            = data.aws_iam_role.s3-role.arn
}
