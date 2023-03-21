resource "aws_s3_bucket" "hosting_bucket" {
  bucket = "lrd-arqiva-tech-challenge"

}

resource "aws_s3_bucket_policy" "hosting_bucket_policy" {
  bucket = aws_s3_bucket.hosting_bucket.id
  policy = <<POLICY
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : "*",
          "Action" : "s3:GetObject",
          "Resource" : [
            "arn:aws:s3:::${aws_s3_bucket.hosting_bucket.id}/*",
            "arn:aws:s3:::${aws_s3_bucket.hosting_bucket.id}"
          ]
        }
      ]
    }
  POLICY
}

resource "aws_s3_object" "indexhtml" {
  key     = "index.html"
  bucket  = aws_s3_bucket.hosting_bucket.id
  content = "<h1>The saved string is ${var.arqiva-dynamic-string}</h1>"
}