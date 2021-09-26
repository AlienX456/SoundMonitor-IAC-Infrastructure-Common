
/*
  SERVICE CONFIG
*/

variable "repository_name" {
  description = "Name of repository"
}

variable "number_of_tasks" {
  description = "Number of the tasks to be deploy"
  default     = 1
}
variable "cpu" {
  description = "CPU cpu units"
}

variable "memory" {
  description = "Memory units"
}

variable "process-type" {
  description = "service process type"
}

/*
  AWS CONFIG
*/

variable "aws_region" {
  description = "AWS Region to deploy"
  default     = "us-east-1"
}

variable "aws_provider_key" {
  description = "AWS key for deploy and infrastructure providing"
}

variable "aws_provider_secret" {
  description = "AWS secret for deploy and infrastructure providing"
}

/*
  INFERENCER
*/

variable "mapper_url" {
  description = "URL of class mapper"
}

/*
  KAFKA CONFIGURATION
*/

variable "kafka_encode_format" {
  description = "encode format"
  default     = "utf-8"
}

variable "kafka_bootstrap_server_one" {
  description = "Endpoint of kafkaserver"
}


/*
  AWS ENTITIES
*/

variable "ecr_image_tag" {
  description = "Inferencer latest image tag"
}

variable "aws_ecr_account_url" {
  description = "ECR url"
}

/*
  DEVICE
*/

variable "device_selector" {
  description = "Device cpu/gpu to use"
}
