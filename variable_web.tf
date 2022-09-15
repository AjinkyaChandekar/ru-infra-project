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