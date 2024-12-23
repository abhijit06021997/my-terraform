resource "aws_iam_user" "name" {
  count = length(var.aws_iam_user)
  name = var.aws_iam_user[count.index]
  
}
