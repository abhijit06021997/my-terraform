resource "aws_s3_bucket" "bucket-demo" {

  bucket = "abhijitramteke.site"

}

resource "aws_s3_object" "my-object1" {
  bucket       = aws_s3_bucket.bucket-demo.bucket
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html" #for contect type if we  do not specify this we are not able to acess url ,it will download object intead of seeeing wenbiste thts why we specify this content type


}

resource "aws_s3_object" "my-object2" {
  bucket       = aws_s3_bucket.bucket-demo.bucket
  key          = "styles.css"
  source       = "./styles.css"
  content_type = "text/css"


}

resource "aws_s3_object" "my-object3" {
  bucket       = aws_s3_bucket.bucket-demo.bucket
  key          = "abhi.jpg"
  source       = "./abhi.jpg"
  content_type = "text/jpg"


}

resource "aws_s3_bucket_public_access_block" "publci_block" {
  bucket = aws_s3_bucket.bucket-demo.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "my-policy" { #for pubic acess policy
  bucket = aws_s3_bucket.bucket-demo.id
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Sid       = "PublicReadGetObject",
          Effect    = "Allow",
          Principal = "*",
          Action    = "s3:GetObject"
          Resource  = "arn:aws:s3:::${aws_s3_bucket.bucket-demo.id}/*"

        }
      ]
    }
  )


}

resource "aws_s3_bucket_website_configuration" "example" { # for website access for website purose 
  bucket = aws_s3_bucket.bucket-demo.id

  index_document {
    suffix = "index.html"
  }
}



output "name" {
  value = aws_s3_bucket_website_configuration.example.website_endpoint # for diect see webiste url to aceess 

}
