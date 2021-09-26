resource "aws_iam_role" "sound_monitor_role" {
  name               = "SoundMonitor-S3AccessRole"
  path               = "/"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_policy" "sound_monitor_s3_policy" {
  name        = "S3SoundMonitor-AccessPolicy"
  path        = "/"
  description = "Policy to access s3 resources of the sound monitor system"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor1",
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*"
    }
  ]
}
POLICY
}


resource "aws_iam_policy_attachment" "sound_monitor_policy_attachment" {
  name       = "S3SoundMonitor-AccessPolicy-policy-attachment"
  policy_arn = aws_iam_policy.sound_monitor_s3_policy.arn
  groups     = []
  users      = []
  roles      = [aws_iam_role.sound_monitor_role.name]
}

resource "aws_iam_policy" "ssm_policy_elastic_user" {
  name        = "SoundMonitor-AccessElasticUser"
  path        = "/"
  description = "Policy to access elastic user"
  policy      = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:GetParameters"
            ],
            "Resource": "arn:aws:ssm:us-east-1:${data.aws_caller_identity.current.account_id}:parameter/SoundMonitor-ElasticUser"
        }
    ]
}
POLICY
}

resource "aws_iam_policy" "ssm_policy_elastic_password" {
  name        = "SoundMonitor-AccessElasticPass"
  path        = "/"
  description = "Policy to access elastic password"
  policy      = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:DescribeParameters"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ssm:GetParameters"
            ],
            "Resource": "arn:aws:ssm:us-east-1:${data.aws_caller_identity.current.account_id}:parameter/SoundMonitor-ElasticPassword"
        }
    ]
}
POLICY
}
