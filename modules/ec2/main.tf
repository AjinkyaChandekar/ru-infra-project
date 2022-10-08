resource "aws_instance" "ec2" {
  ami                                  = var.ami
  instance_type                        = var.instance_type
  associate_public_ip_address          = "true"
  availability_zone                    = var.availability_zone
  get_password_data                    = "false"
  instance_initiated_shutdown_behavior = "stop"
  ipv6_address_count                   = "0"
  key_name                             = var.key_name
  monitoring                           = var.monitoring
  source_dest_check                    = "true"
  subnet_id                            = var.subnet_id
  tenancy                              = "default"
  vpc_security_group_ids               = var.sg_ids
  iam_instance_profile                 = var.iam_instance_profile
  tags                                 = var.ec2_tags

  #cpu_core_count = Sets the number of CPU cores for an instance
  #cpu_threads_per_core = If set to to 1, hyperthreading is disabled on the launched instance. Defaults to 2 if not set.
  disable_api_termination = "false" #If true, enables EC2 Instance Termination Protection.
  # disable_api_stop        = "false"

  #ebs_optimized = "false"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  enclave_options {
    enabled = "false"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    volume_size           = var.rbd_size
    volume_type           = var.rbd_type
  }

}
