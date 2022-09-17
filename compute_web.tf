module "ec2_instance_web" {
  source = "./modules/ec2"

  for_each = var.ec2_instance_web

  ami               = each.value["ami"]
  instance_type     = each.value["instance_type"]
  availability_zone = each.value["availability_zone"]
  key_name          = each.value["key_name"]
  monitoring        = each.value["monitoring"]
  subnet_id         = each.value["subnet_id"]
  sg_ids            = [aws_security_group.sg_web.id]
  rbd_size          = each.value["rbd_size"]
  rbd_type          = each.value["rbd_type"]

  ec2_tags = merge(module.tags.common_tags, {
    Name   = each.key
    Backup = "local-default"
  })
}