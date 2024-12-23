resource "aws_s3_bucket" "my_bucket" {
  bucket = "abhijitrateke.site"
}
resource "aws_s3_bucket_object" "bucket_data" {
  bucket = aws_s3_bucket.my_bucket.bucket #it denoted in which bucket you are uploading  as well as "bucket=abhijitramteke.site thats specified  [hole bucketb name in upper content]
  source = "./object.txt"
  key    = "object.txt" #key represented where we want to upload [it is compulsory]
}
