/*
#terraform import aws_ssm_maintenance_window.restart_instance mw-0d3cc994d807a703c
resource "aws_ssm_maintenance_window" "restart_instance" {
  name                       = "maintenance-window-restart-instance"
  enabled                    = true
  allow_unassociated_targets = false #Whether targets must be registered with the Maintenance Window
  schedule                   = "cron(15 * ? * * *)"
  duration                   = 3
  cutoff                     = 1
}

#terraform import aws_ssm_maintenance_window_target.restart_instance mw-0d3cc994d807a703c/764cad18-e44b-47c5-98b0-46a5a8c4cfc7
#terraform import aws_ssm_maintenance_window_target.restart_instance WINDOW_ID/WINDOW_TARGET_ID
resource "aws_ssm_maintenance_window_target" "restart_instance" {
  window_id     = aws_ssm_maintenance_window.restart_instance.id
  name          = "maintenance-window-restart-instance-target"
  resource_type = "INSTANCE"

  targets {
    key    = "tag:app"
    values = ["ureport"]
  }
}

resource "aws_ssm_maintenance_window_task" "restart_instance" {
  name            = "maintenance-window-restart-instance-task"
  max_concurrency = 2
  max_errors      = 1
  priority        = 1
  task_arn        = "AWS-RestartEC2Instance"
  task_type       = "AUTOMATION"
  window_id       = aws_ssm_maintenance_window.restart_instance.id
  service_role_arn = aws_iam_role.restart_instance.arn

  targets {
    key    = "WindowTargetIds"
    values = [aws_ssm_maintenance_window_target.restart_instance.id]
  }

  task_invocation_parameters {
    automation_parameters {
      document_version = "$LATEST"

      parameter {
        name   = "InstanceId"
        values = [data.aws_instance.all.id]
      }
    }
  }
}
*/