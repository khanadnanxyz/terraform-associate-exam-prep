variable "aws_s3_bucket" {
  default = "dhaka-byte-state-bucket"
  description = "S3 bucket to try out terraform"
  type = string
}

variable "s3_tags" {
  type = map(string)

  default = {
    created_by = "terraform"
    environment = "dev"
  } 
}

variable "s3_regions" {
  type = list(string)
  default = ["eu-north-1", ]
}