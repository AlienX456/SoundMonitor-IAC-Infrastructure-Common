/*
  CLUSTER CONFIG
*/

variable "family-name" {
  default = "monitor-inferencer-adapa"
}

variable "cluster-name" {
  default = "monitor-inferencers-cluster"
}

variable "cluster-arn" {
  description = "ARN of cluster for monitor events"
}

/*
  SERVICE CONFIG
*/

variable "service-name" {
  default = "monitor-inferencer-service"
}

variable "sound-monitor-subnet" {
  description = "subnet of SoundMonitorVPC"
}

variable "task-definition" {
  description = "Task definition of the inference service"
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

variable "aws_inferencer_key" {
  description = "AWS key for inferencer"
}

variable "aws_inferencer_secret" {
  description = "AWS secret for inferencer"
}

/*
  INEFERENCER-KAFKA CONFIGURATION
*/

variable "kafka_group_id" {
  description = "Kafka inferencers group id"
}

variable "kafka_audio_upload_event" {
  description = "Kafka event of audio uploading"
}
variable "kafka_inference_event" {
  description = "Kafka event of inference"
}

variable "kafka_encode_format" {
  description = "encode format"
}

/*
  AWS ENTITIES
*/

variable "ecr_image_tag" {
  description = "Inferencer latest image tag"
}

variable "ecr_image_repo" {
  description = "Inferencer repo"
}

variable "records_bucket_name" {
  description =  "audio files bucket NAME"
}

variable "kafka_server" {
  description =  "Endpoint of kafkaserver"
}

