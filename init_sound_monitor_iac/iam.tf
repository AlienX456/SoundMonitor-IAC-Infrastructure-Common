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
