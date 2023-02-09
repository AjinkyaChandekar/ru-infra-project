variable "ec2_instance_web" {
  type = map(object({
    ami               = string
    instance_type     = string
    availability_zone = string
    key_name          = string
    monitoring        = string
    subnet_id         = string
    rbd_size          = string
    rbd_type          = string
  }))
}

# Instances parameters
variable "awsconf_dbservers" {
  type = map(string)
  default = {
    role             = "DB"
    itype            = "x2iedn.xlarge"
    soft-instance-id = "SI0000000"
    state            = "started"
    map-migrated     = "d-server-025dusna9qeeut"
  }
}

# DB Specific parameters
variable "ec2_instance_db" {
  type = map(object({
    ami               = string
    availability_zone = string
    backup-plan       = string
    ebsdel_on_ter     = string
    host_name         = string
    keypair           = string
    monitoring        = string
    rbdsize           = string
    rbdtype           = string
    subnet_id         = string
    schedule          = string
    user_data         = string
  }))
}

#  EBS
variable "awsconf_db_ebs_gp3" {
  type = map(object({
    ebdiops       = string
    ebsname       = string
    ebssize       = string
    ebstype       = string
    KMS           = string
    snapshot_id_a = string
    snapshot_id_b = string
    throughput    = string
  }))
}

variable "awsconf_db_ebs_io2" {
  type = map(object({
    ebdiops       = string
    ebsname       = string
    ebssize       = string
    ebstype       = string
    KMS           = string
    snapshot_id_a = string
    snapshot_id_b = string
  }))
}
