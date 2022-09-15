# default = {
#     "key" = {
#       ami = "value"
#       instance_type = "value"
#     }
# }
ec2_instance_web = {
  "ureport-ec2-web-1" = {
    ami               = "ami-08d4ac5b634553e16"
    instance_type     = "t2.micro"
    availability_zone = "us-east-1a"
    key_name          = "ajcody-key"
    monitoring        = "false"
    subnet_id         = "subnet-0bb0189015730c5e7"
    rbd_size          = "10"
    rbd_type          = "gp3"
  }
}