provider "aws" {
  region     = var.aws_region
  access_key = var.aws_provider_key
  secret_key = var.aws_provider_secret
}