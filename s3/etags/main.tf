terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}

resource "aws_s3_bucket" "default" {
}

resource "aws_s3_object" "object" {
    bucket = aws_s3_bucket.default.id
    key = "my_file.txt"
    source = "my_file.txt"

    etag = filemd5("my_file.txt")

}