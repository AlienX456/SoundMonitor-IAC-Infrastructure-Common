# SoundMonitor-IAC-Infrastructure-Common
Repository for shared and Template infrastructure

## Steps to start deploy

### Step 1

Crear contextos en circleCI

#### Terraform context:
  AWS_ACCESS_KEY_ID	<br>
  AWS_REGION <br>
  AWS_SECRET_ACCESS_KEY	<br>
  TF_VAR_account_id <br>
  TF_VAR_aws_ecr_account_url <br>
  TF_VAR_aws_provider_key <br>
  TF_VAR_aws_provider_secret <br>
  TF_VAR_kafka_bootstrap_server_one <br>

#### KafkaVisualUploadContext:
  TF_VAR_index_name <br>
  TF_VAR_kafka_result_topic_name <br>
  TF_VAR_kafka_upload_topic_name <br>
  TF_VAR_records_bucket_name <br>

#### KafkaAudioUploadContext:
  TF_VAR_index_name <br>
  TF_VAR_kafka_result_topic_name <br>
  TF_VAR_kafka_upload_topic_name <br>
  TF_VAR_records_bucket_name <br>
  
#### ElasticContext:
  TF_VAR_password	<br>
  TF_VAR_user <br>
