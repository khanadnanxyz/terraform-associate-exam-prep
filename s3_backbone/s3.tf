# Bucket with encryption and versioning
resource "aws_s3_bucket" "state-bucket" {
  bucket = format("%s-%s", var.s3_bucket_prefix, var.s3_region)
  tags   = local.s3_tags

  lifecycle {
    prevent_destroy = false
  }
}

# Apply server-side encryption to the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.state-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Enable versioning for the bucket
resource "aws_s3_bucket_versioning" "state-bucket-versioning" {
  bucket = aws_s3_bucket.state-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Second bucket without encryption or versioning
resource "aws_s3_bucket" "state-bucket-play" {
  bucket = format("%s-%s", var.s3_bucket_play, var.s3_region)
  tags   = local.s3_tags

  lifecycle {
    prevent_destroy = false
  }
}
