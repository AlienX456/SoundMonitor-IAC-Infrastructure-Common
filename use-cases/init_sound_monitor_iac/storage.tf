resource "aws_s3_bucket" "soundmonitor-audiodata" {
  bucket = local.topic-index-mapping-audio.bucket-name
  acl    = "private"
}

resource "aws_s3_bucket" "soundmonitor-visualdata" {
  bucket = local.topic-index-mapping-images.bucket-name
  acl    = "private"
}

