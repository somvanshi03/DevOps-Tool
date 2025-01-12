resource "aws_s3_bucket" "devopshangoutbucket2025" {
  bucket = "devopshangoutbucket2025"

  tags = {
    Name        = "My bucket"
    Environment = "devopshangoutbucket2025"
  }
}

resource "aws_s3_bucket_versioning" "devopshangoutbucket2025" {
  bucket = aws_s3_bucket.devopshangoutbucket2025.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "object" {
  bucket = "devopshangoutbucket2025"
  key    = "YourLocalFile"
  source = "YourLocalFile"
  
  }
  
resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
  bucket = aws_s3_bucket.devopshangoutbucket2025.id

  rule {
    id = "log"

    expiration {
      days = 90
    }

    filter {
      and {
        prefix = "log/"

        tags = {
          rule      = "log"
          autoclean = "true"
        }
      }
    }

    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
	
}
}
