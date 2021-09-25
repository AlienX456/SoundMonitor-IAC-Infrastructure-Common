resource "aws_iam_role" "task-execution-role" {
  name               = "${local.names.service}-task-execution-role"
  assume_role_policy = data.aws_iam_policy_document.ecs-task-assume-role.json
}

resource "aws_iam_role_policy_attachment" "execution-role" {
  role       = aws_iam_role.task-execution-role.name
  policy_arn = data.aws_iam_policy.policy-task-execution-role.arn
}
