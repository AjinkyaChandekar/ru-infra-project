# default = {
#     "key" = {
#       ami = "value"
#       instance_type = "value"
#     }
# }

ec2_instance_web = {
  "ureport-ec2-web-1" = {
    ami               = "ami-0149b2da6ceec4bb0" #Ubuntu Server 20.04 ami-0149b2da6ceec4bb0 #Windows2012R2 ami-0910b65723f27f156
    instance_type     = "t2.micro"
    availability_zone = "us-east-1a"
    key_name          = "ajcody-key"
    monitoring        = "false"
    subnet_id         = "subnet-023efe946938923f1"
    rbd_size          = "10"
    rbd_type          = "gp2"
  }
}

awsconf_db_ebs_gp3 = {
  # "PPD_SQL_Home" = {
  #   ebsname       = "xvdf"
  #   ebstype       = "gp3"
  #   ebdiops       = "500"
  #   ebssize       = "10"
  #   throughput    = "125"
  #   snapshot_id_a = ""
  #   snapshot_id_b = ""
  #   KMS           = "arn:aws:kms:us-east-1:475150818934:key/4085cfdd-1ce0-4f6e-aea3-4e3390f157b3"
  # }
}

awsconf_db_ebs_io2 = {
  "PPD_SQL_Data" = {
    ebsname       = "xvdg"
    ebstype       = "io2"
    ebdiops       = "125"
    ebssize       = "10"
    snapshot_id_a = ""
    snapshot_id_b = ""
    KMS           = "arn:aws:kms:us-east-1:475150818934:key/4085cfdd-1ce0-4f6e-aea3-4e3390f157b3"
  },
  "PPD_SQL_Home" = {
    ebsname       = "xvdf"
    ebstype       = "io2"
    ebdiops       = "500"
    ebssize       = "10"
    snapshot_id_a = ""
    snapshot_id_b = ""
    KMS           = "arn:aws:kms:us-east-1:475150818934:key/4085cfdd-1ce0-4f6e-aea3-4e3390f157b3"
  }
}
