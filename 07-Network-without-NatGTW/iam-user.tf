resource "aws_iam_user" "user1" {
  name = "samuel"
  tags = {
    tag-key = "samuel"
  }
}

resource "aws_iam_user" "user2" {
  name = "johnson"
  tags = {
    tag-key = "johnson"
  }
}

resource "aws_iam_user" "user3" {
  name = "jeffery"
  tags = {
    tag-key = "jeffery"
  }
}

resource "aws_iam_user" "user4" {
  name = "asake"
  tags = {
    tag-key = "asake"
  }
}

#Creating user groups
resource "aws_iam_group" "developers-group" {
  name = "developers"
}

#Associatting users to group
resource "aws_iam_group_membership" "developers-membership" {
  name = "developers-members"

  users = [
    aws_iam_user.user1.name,
    aws_iam_user.user2.name,
    aws_iam_user.user3.name,
    aws_iam_user.user4.name,
  ]

  group = aws_iam_group.developers-group.name
}

#Attach policy to User Group
resource "aws_iam_group_policy_attachment" "developers-attach-policy" {
  group      = aws_iam_group.developers-group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}