/*
#Create Backup Vault
#terraform import aws_backup_vault.prod ureport-prd-backup-vault
resource "aws_backup_vault" "prod" {
  name        = "ureport-prd-backup-vault"
  kms_key_arn = "arn:aws:kms:us-east-1:475150818934:key/f4a3d258-1239-44ad-8b58-97245b0725c0"
}

# terraform import aws_backup_plan.prod 84f5dee9-f257-451d-8461-08193256b435
resource "aws_backup_plan" "prod" {
  name = "ureport-prd-backup-plan"

  rule {
    rule_name         = "ureport-prd-backup-plan-rule-ec2"
    target_vault_name = aws_backup_vault.prod.name
    schedule          = "cron(50 22 ? * * *)"
    start_window      = 60
    completion_window = 180

    lifecycle {
      delete_after = 7
    }

    recovery_point_tags = module.tags.common_tags
  }
}

#terraform import aws_backup_selection.example plan-id|selection-id
#terraform import aws_backup_selection.prod 84f5dee9-f257-451d-8461-08193256b435|data.aws_backup_selection.prod.id
resource "aws_backup_selection" "prod" {
  iam_role_arn = aws_iam_role.backup2.arn
  name         = "ureport-prd-backup-resource-selection"
  plan_id      = aws_backup_plan.prod.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Backup"
    value = "local-default"
  }
}
*/
