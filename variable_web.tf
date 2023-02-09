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
