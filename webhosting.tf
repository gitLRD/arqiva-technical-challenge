resource "aws_s3_bucket" "hosting_bucket" {
  bucket = "lrd-arqiva-tech-challenge"

}

resource "aws_s3_bucket_acl" "hosting_bucket_acl" {
  bucket = aws_s3_bucket.hosting_bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "indexhtml" {
  key     = "index.html"
  bucket  = aws_s3_bucket.hosting_bucket.id
  content = "<h1>The saved string is ${var.arqiva-dynamic-string}</h1>"
}