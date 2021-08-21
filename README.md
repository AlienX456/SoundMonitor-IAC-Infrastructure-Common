# SoundMonitor-IAC-Infrastructure-Common
Repository for shared and Template infrastructure

## Steps to start deploy

### Step 1
Fork projects associated:

* https://github.com/AlienX456/SoundMonitor-S3EventProducer
* https://github.com/AlienX456/SoundMonitor-InferencerAdapa
* https://github.com/AlienX456/SoundMonitor-NoiseLevel
* https://github.com/AlienX456/SoundMonitor-KafkaElasticLogstash


### Step 2

S3 bucket name is globally unique https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingBucket.html, so it's required to change the name of the buckets on :

* https://github.com/AlienX456/SoundMonitor-IAC-Infrastructure-Common/blob/master/init_sound_monitor_iac/backend.tf
* https://github.com/AlienX456/SoundMonitor-IAC-Infrastructure-Common/blob/master/lambda_s3_kafka/data.tf

Note: Also you must update the backend S3 name on all forked projects.


### Step 3

create CircleCI contexts:

#### Terraform context:

| Varible | Value  |
|---|---|
| AWS_ACCESS_KEY_ID | **** |
| AWS_REGION | **** |
| AWS_SECRET_ACCESS_KEY | **** |
| TF_VAR_account_id | **** |
| TF_VAR_aws_ecr_account_url | **** |
| TF_VAR_aws_provider_key | **** |
| TF_VAR_aws_provider_secret | **** |
| TF_VAR_kafka_bootstrap_server_one | **** |

#### KafkaAudioUploadContext:

| Varible | Value  |
|---|---|
| TF_VAR_index_name | audio_result |
| TF_VAR_kafka_result_topic_name | audio_result_event |
| TF_VAR_kafka_upload_topic_name | audio_upload_event |
| TF_VAR_records_bucket_name | **** |

#### KafkaVisualUploadContext:

| Varible | Value  |
|---|---|
| TF_VAR_index_name | visual_result |
| TF_VAR_kafka_result_topic_name | visual_result_event |
| TF_VAR_kafka_upload_topic_name | visual_upload_event |
| TF_VAR_records_bucket_name | **** |
  
#### ElasticContext:

| Varible | Value  |
|---|---|
| TF_VAR_password | **** |
| TF_VAR_user | **** |

### Step 4

Associate the project to circleCI and start deploy.
