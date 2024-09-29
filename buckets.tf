resource "aws_s3_bucket" "rsschool_course_app_main_bucket" {
  bucket = "rsschool_course_app_main_bucket"
}

resource "aws_s3_bucket_versioning" "rsschool_course_app_main_bucket_versioning" {
  bucket = aws_s3_bucket.rsschool_course_app_main_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}