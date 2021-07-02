/*
  SERVICE
*/
variable "family-name" {
  description = "family of the logstash service"
}

variable "service-name" {
  description = "name of the service"
}

variable "aws_region" {
  description = "AWS Region to deploy"
  default = "us-east-1"
}

variable "aws_ecr_account_url" {
  description = "ECR url"
}

variable "cpu" {
  description = "CPU cpu units"
}

variable "memory" {
  description = "Memory units"
}

/*
  CONTAINER
*/

variable "aws_provider_key" {
  description = "AWS key for deploy and infrastructure providing"
}

variable "aws_provider_secret" {
  description = "AWS secret for deploy and infrastructure providing"
}

variable "ecr_image_tag" {
  description = "Inferencer latest image tag"
}

variable "kafka_bootstrap_server_one" {
  description =  "Endpoint of kafka server one"
}

variable "user" {
  description =  ""
}

variable "password" {
  description =  ""
}