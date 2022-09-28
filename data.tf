# data "aws_instance" "all" {
#   instance_tags = {
#     Name = "*-ec2-web-*"
#     app  = "ureport"
#   }
# }