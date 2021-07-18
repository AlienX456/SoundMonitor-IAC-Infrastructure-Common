resource "aws_lambda_function" "func" {
  filename      = "function.zip"
  function_name = "soundmonitor-reporter"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  runtime       = "nodejs12.x"
  publish = true
  source_code_hash = filebase64sha256("function.zip")
  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.soundmonitor-reporter
  ]

  environment {
    variables = {
      KAFKA_ENDPOINTS = var.kafka_bootstrap_server_one
    }
  }
}
