# SoundMonitor-IAC-Infrastructure-Common
Repository for shared and Template infrastructure

## Steps to start deploy

### Step 1

Crear contextos en circleCI

#### Terraform context:
  AWS_ACCESS_KEY_ID	
  AWS_REGION
  AWS_SECRET_ACCESS_KEY	
  TF_VAR_account_id
  TF_VAR_aws_ecr_account_url	
  TF_VAR_aws_provider_key
  TF_VAR_aws_provider_secret
  TF_VAR_kafka_bootstrap_server_one	

#### KafkaVisualUploadContext:
  TF_VAR_index_name
  TF_VAR_kafka_result_topic_name
  TF_VAR_kafka_upload_topic_name
  TF_VAR_records_bucket_name

#### KafkaAudioUploadContext:
  TF_VAR_index_name
  TF_VAR_kafka_result_topic_name	
  TF_VAR_kafka_upload_topic_name	
  TF_VAR_records_bucket_name
  
#### ElasticContext:
  TF_VAR_password	
  TF_VAR_user
