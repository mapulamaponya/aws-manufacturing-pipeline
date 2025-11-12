provider "aws" {
  region  = "eu-west-1" # change if needed
  profile = "manufacturing-dev"
}

locals {
  prefix = "mfg-pipeline-yourname"
}

# S3 bucket for raw data
resource "aws_s3_bucket" "raw_bucket" {
  bucket = "${local.prefix}-raw-data"
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "archive-to-glacier"
    enabled = true
    transition {
      days          = 30
      storage_class = "GLACIER"
    }
    expiration {
      days = 365
    }
  }
}

# PostgreSQL RDS instance
resource "aws_db_instance" "postgres" {
  identifier         = "${local.prefix}-rds"
  engine             = "postgres"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  name               = "manufacturingdb"
  username           = var.db_username
  password           = var.db_password
  skip_final_snapshot = true
}
