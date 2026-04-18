provider "aws" {
  region = "us-east-1"
}

# --- S3 Bucket ---
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-devsecops-bucket"
}

# Fix: block all public access
resource "aws_s3_bucket_public_access_block" "my_bucket" {
  bucket                  = aws_s3_bucket.my_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Fix: enable versioning
resource "aws_s3_bucket_versioning" "my_bucket" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Fix: enable logging
resource "aws_s3_bucket_logging" "my_bucket" {
  bucket        = aws_s3_bucket.my_bucket.id
  target_bucket = aws_s3_bucket.my_bucket.id
  target_prefix = "logs/"
}

# Fix: enable encryption with KMS
resource "aws_s3_bucket_server_side_encryption_configuration" "my_bucket" {
  bucket = aws_s3_bucket.my_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}

# --- Security Group ---
# Fix: restrict access, add descriptions
resource "aws_security_group" "allow_https" {
  name        = "allow_https"
  description = "Allow HTTPS inbound traffic only"

  ingress {
    description = "HTTPS from trusted IP only"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]  # private network only, not 0.0.0.0/0
  }
}