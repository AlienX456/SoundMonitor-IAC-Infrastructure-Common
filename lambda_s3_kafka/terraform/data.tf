data "aws_s3_bucket" "s-1" {
  bucket = "soundmonitor-audiodata"
}

data "aws_s3_bucket" "s-2" {
  bucket = "soundmonitor-visualdata"
}

