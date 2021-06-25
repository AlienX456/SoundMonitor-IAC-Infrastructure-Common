/*
  CLUSTER CONFIG
*/

variable "cluster-name" {
  description = "Name of the cluster were services are deployed"
  default = "sound-monitor-cluster"
}

/*
  SERVICE CONFIG
*/

variable "service-name" {
  description = "Name of the ECS service"
}

variable "family-name" {
  description = "Family for task definition"
}

variable "number_of_tasks" {
  description = "Number of the tasks to be deploy"
  default = 1
}
variable "cpu" {
  description = "CPU cpu units"
}

variable "memory" {
  description = "Memory units"
}
/*
  AWS CONFIG
*/

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

/*
  INFERENCER
*/

variable "mapper_url" {
  description = "URL of class mapper"
}

/*
  KAFKA CONFIGURATION
*/

variable "kafka_group_id" {
  description = "Kafka inferencers group id"
}

variable "kafka_upload_topic_name" {
  description = "Name of the topic to upload the events"
}

variable "kafka_result_topic_name" {
  description = "Name of the topic to save the results"
}

variable "kafka_encode_format" {
  description = "encode format"
  default = "utf-8"
}

variable "kafka_bootstrap_server_one" {
  description =  "Endpoint of kafkaserver"
}


/*
  AWS ENTITIES
*/

variable "ecr_image_tag" {
  description = "Inferencer latest image tag"
}

variable "ecr_image_repo" {
  description = "Image repository"
}

variable "records_bucket_name" {
  description =  "Bucket name of the records to be processed"
}

/*
  DEVICE
*/

variable "device_selector" {
  description =  "Device cpu/gpu to use"
}
