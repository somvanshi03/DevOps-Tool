resource "aws_iam_user" "terraform-demo-user101" {
  name = "terraform-demo-user101"

}

resource "aws_iam_group" "developers" {
  name = "developers"
}

resource "aws_iam_user_group_membership" "example1" {
  user = aws_iam_user.terraform-demo-user101.name

  groups = [
    aws_iam_group.developers.name
  ]
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  groups     = [aws_iam_group.developers.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}