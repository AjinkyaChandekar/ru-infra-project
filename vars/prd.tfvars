# default = {
#     "key" = {
#       ami = "value"
#       instance_type = "value"
#     }
# }
ec2_instance_web = {
  # "ureport-ec2-web-1" = {
  #   ami               = "ami-0149b2da6ceec4bb0" #Ubuntu Server 20.04 ami-0149b2da6ceec4bb0 #Windows2012R2 ami-0910b65723f27f156
  #   instance_type     = "t2.micro"
  #   availability_zone = "us-east-1a"
  #   key_name          = "ajcody-key"
  #   monitoring        = "false"
  #   subnet_id         = "subnet-023efe946938923f1"
  #   rbd_size          = "10"
  #   rbd_type          = "gp2"
  # }
}

awsconf_dbservers_new = {
  role             = "DB"
  itype            = "x2iedn.8xlarge"
  soft-instance-id = "SI0004737"
  state            = "started"
  map-migrated     = "d-server-025dusna9qeeut"
}

#   Specific parameters
ec2_instance_db_new = {
  "ureport-ppd-ec2-db-a" = {
    availability_zone = "eu-west-1a"
    host_name         = "CMAOSDATASVC1"
    monitoring        = "true"
    subnet_id         = "subnet-027b8f3d0ac68a06c"
    ami               = "ami-0e86b3b1b702e1813"
    keypair           = "DBSERVER"
    user_data         = <<EOF
                          #!/bin/bash
                          cd /tmp
                          sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
                          sudo systemctl enable amazon-ssm-agent
                          sudo systemctl start amazon-ssm-agent
                          EOF
    ebsdel_on_ter     = "true"
    rbdtype           = "gp2"
    rbdsize           = "800"
    backup-plan       = "local-default"
    schedule          = "europe-mon-fri5:30-23:30"
  },
  "ureport-ppd-ec2-db-b" = {
    availability_zone = "eu-west-1b"
    host_name         = "CMAOSDATASVC2"
    monitoring        = "true"
    subnet_id         = "subnet-02cf54c23be37e8b7"
    ami               = "ami-013dda7eefb0b0c27"
    keypair           = "ureport-ppd-keypair-db"
    user_data         = <<EOF
                          #!/bin/bash
                          cd /tmp
                          sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
                          sudo systemctl enable amazon-ssm-agent
                          sudo systemctl start amazon-ssm-agent
                          EOF
    ebsdel_on_ter     = "true"
    rbdtype           = "gp2"
    rbdsize           = "800"
    backup-plan       = "local-default"
    schedule          = "europe-mon-fri6-23"
  }
}

awsconf_db_ebs_new = {
  "PPD_SQL_Home" = {
    ebsname       = "xvdf"
    ebstype       = "io2"
    ebdiops       = "16000"
    ebssize       = "800"
    throughput    = "1000"
    snapshot_id_a = "snap-0ff2ca2044978932f"
    snapshot_id_b = "snap-01d8d9c979cbd0759"
    KMS           = "arn:aws:kms:eu-west-1:629251642917:key/0950519e-354a-4cd8-a0b5-51d9058a1e5e"
  },
  "PPD_SQL_Temp" = {
    ebsname       = "xvdi"
    ebstype       = "gp3"
    ebdiops       = "16000"
    ebssize       = "400"
    throughput    = "1000"
    snapshot_id_a = "snap-0d2c0e8c1d132047e"
    snapshot_id_b = "snap-0082c2f34d952e34f"
    KMS           = "arn:aws:kms:eu-west-1:629251642917:key/0950519e-354a-4cd8-a0b5-51d9058a1e5e"
  }
}

awsconf_db_ebs_io2 = {
  "PPD_SQL_Data" = {
    ebsname       = "xvdg"
    ebstype       = "io2"
    ebdiops       = "16000"
    ebssize       = "2000"
    snapshot_id_a = "snap-0c84d58a5df034486"
    snapshot_id_b = "snap-0c4c10b9e3bd4c611"
    KMS           = "arn:aws:kms:eu-west-1:629251642917:key/0950519e-354a-4cd8-a0b5-51d9058a1e5e"
  },
  "PPD_SQL_Log" = {
    ebsname       = "xvdh"
    ebstype       = "io2"
    ebdiops       = "16000"
    ebssize       = "2000"
    snapshot_id_a = "snap-051bf875a01982de1"
    snapshot_id_b = "snap-0a614ceb307661588"
    KMS           = "arn:aws:kms:eu-west-1:629251642917:key/0950519e-354a-4cd8-a0b5-51d9058a1e5e"
  },
  "PPD_SQL_Data2" = {
    ebsname       = "xvdj"
    ebstype       = "io2"
    ebdiops       = "16000"
    ebssize       = "2000"
    snapshot_id_a = ""
    snapshot_id_b = ""
    KMS           = "arn:aws:kms:eu-west-1:629251642917:key/0950519e-354a-4cd8-a0b5-51d9058a1e5e"
  },
  "PPD_SQL_Log2" = {
    ebsname       = "xvdk"
    ebstype       = "io2"
    ebdiops       = "16000"
    ebssize       = "2000"
    snapshot_id_a = ""
    snapshot_id_b = ""
    KMS           = "arn:aws:kms:eu-west-1:629251642917:key/0950519e-354a-4cd8-a0b5-51d9058a1e5e"
  },
  "PPD_SQL_Data3" = {
    ebsname       = "xvdl"
    ebstype       = "io2"
    ebdiops       = "16000"
    ebssize       = "200"
    snapshot_id_a = ""
    snapshot_id_b = ""
    KMS           = "arn:aws:kms:eu-west-1:629251642917:key/0950519e-354a-4cd8-a0b5-51d9058a1e5e"
  },
  "PPD_SQL_Log3" = {
    ebsname       = "xvdm"
    ebstype       = "io2"
    ebdiops       = "16000"
    ebssize       = "200"
    snapshot_id_a = ""
    snapshot_id_b = ""
    KMS           = "arn:aws:kms:eu-west-1:629251642917:key/0950519e-354a-4cd8-a0b5-51d9058a1e5e"
  }
}
