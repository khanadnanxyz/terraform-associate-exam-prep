resource "aws_s3_bucket" "state-bucket" {
  bucket = var.aws_s3_bucket
  tags = var.s3_tags

  # tags = {
  #   Name        = var.s3_tags.created_by
  #   Environment = var.s3_regions[0]
  # }

}