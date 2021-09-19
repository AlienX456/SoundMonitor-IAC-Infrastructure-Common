resource "aws_s3_bucket" "soundmonitor-audiodata" {
  bucket = "soundmonitor-audiodata"
  acl    = "private"
}

resource "aws_s3_bucket" "soundmonitor-visualdata" {
  bucket = "soundmonitor-visualdata"
  acl    = "private"
}

