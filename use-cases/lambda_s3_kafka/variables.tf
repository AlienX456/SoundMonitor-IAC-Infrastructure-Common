variable "aws_region" {
  description = "aws region to deploy"
  default     = "us-east-1"
}

variable "aws_provider_key" {
  description = "AWS key for deploy and infrastructure providing"
}

variable "aws_provider_secret" {
  description = "AWS secret for deploy and infrastructure providing"
}

variable "kafka_bootstrap_server_one" {
  description = "Endpoint of kafka server one"
}
