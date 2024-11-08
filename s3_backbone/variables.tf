variable "environment" {
  type    = string
  default = "test"
}

variable "s3_bucket_prefix" {
  default     = "dhaka-byte-state-bucket"
  description = "S3 bucket to try out terraform"
  type        = string
}

variable "s3_bucket_play" {
  default     = "dhaka-byte-state-bucket-play"
  description = "S3 bucket to play with terraform"
  type        = string
}

locals {
  s3_tags = {
    created_by  = "terraform"
    environment = var.environment
  }
}


variable "s3_region" {
  type    = string
  default = "eu-southeast-2"
}