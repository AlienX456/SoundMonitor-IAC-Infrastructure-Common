terraform {
  backend "s3" {
    bucket  = "terraform-monitor-provide-states-files"
    key     = "inferencer.tfstate"
    region  = "us-east-1"
  }
}