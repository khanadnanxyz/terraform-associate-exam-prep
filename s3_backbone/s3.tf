resource "aws_s3_bucket" "state-bucket" {
  bucket = format("%s-%s", var.s3_bucket_prefix, var.s3_region)
  tags   = local.s3_tags

  # tags = {
  #   Name        = var.s3_tags.created_by
  #   Environment = var.s3_regions[0]
  # }

}