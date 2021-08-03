variable "aws_region" {
  description = "AWS Region to deploy"
  default = "us-east-1"
}

variable "aws_provider_key" {
  description = "AWS key for deploy and infrastructure providing"
}

variable "aws_provider_secret" {
  description = "AWS secret for deploy and infrastructure providing"
}
