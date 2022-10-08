/*
resource "aws_iam_role" "backup" {
  name               = "backup_and_restore"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": ["sts:AssumeRole"],
      "Effect": "allow",
      "Principal": {
        "Service": ["backup.amazonaws.com"]
      }
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "backup" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.backup.name
}
*/


resource "aws_iam_role" "backup2" {
  name = "backup_and_restore2"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : ["sts:AssumeRole"],
        "Effect" : "allow",
        "Principal" : {
          "Service" : ["backup.amazonaws.com"]
        }
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup",
    "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
  ]

  #inline_policy {}

}

/*
resource "aws_iam_role" "restart_instance" {
  name = "SSM_EC2_StartStop_Role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : ["sts:AssumeRole"],
        "Effect" : "allow",
        "Principal" : {
          "Service" : ["ssm.amazonaws.com"]
        }
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
  ]

  inline_policy {
    name = "SSM_EC2_StartStop_Policy"

    policy = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "Stmt1664400730894",
          "Action" : [
            "ec2:DescribeInstances",
            "ec2:StartInstances",
            "ec2:StopInstances"
          ],
          "Effect" : "Allow",
          "Resource" : "*"
        }
      ]
    })
  }

}
*/