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
  iam_instance_profile = "SSMInstanceProfile"

  ec2_tags = merge(module.tags.common_tags, {
    Name   = each.key
    Backup = "local-default"
  })
}
  
# EC2
module "ec2_instance_db" {
  source = "./modules/ec2"

  for_each = var.ec2_instance_db

  ami                 = each.value["ami"]
  app_code            = var.app_code
  appenv              = var.appenv
  appname             = var.appname
  availability_zone   = each.value["availability_zone"]
  user_data           = each.value["user_data"]
  awsconf_db_ebs_gp3  = var.awsconf_db_ebs_gp3
  awsconf_db_ebs_io2  = var.awsconf_db_ebs_io2
  awsid               = var.awsid
  backup-plan         = each.value["backup-plan"]
  data_classification = var.data_classification
  ebd_encrypted       = "true"
  ebsdel_on_ter       = each.value["ebsdel_on_ter"]
  host_name           = each.value["host_name"]
  itype               = lookup(var.awsconf_dbservers, "itype")
  keypair             = each.value["keypair"]
  monitoring          = each.value["monitoring"]
  name                = each.key
  patch-group         = var.patch-group
  project             = var.project
  rbd_size            = each.value["rbdsize"]
  rbd_type            = each.value["rbdtype"]
  sg_ids              = [aws_security_group.sg_common.id, aws_security_group.sg_db.id]
  soft-instance-id    = lookup(var.awsconf_dbservers, "soft-instance-id")
  ssm_name            = aws_iam_instance_profile.ssm.name
  subnet_id           = each.value["subnet_id"]
  SupportContact      = var.SupportContact
  TeamContact         = var.TeamContact

  tags_ec2 = merge(module.tag.aws_db_instance_tags, {
    "Name"        = each.key
    "Hostname"    = each.value["host_name"]
    "backup"      = each.value["backup-plan"]
    "Patch Group" = var.patch-group
    "Role"        = lookup(var.awsconf_dbservers, "role")
    #"Maintenance Patch Group" = var.maintenance-patch-group
    "soft-instance-id" = lookup(var.awsconf_dbservers, "soft-instance-id")
    "schedule"         = each.value["schedule"]
    "state"            = lookup(var.awsconf_dbservers, "state")
    "map-migrated"     = lookup(var.awsconf_dbservers, "map-migrated")
  })
  tags_ebs = merge(module.tag.aws_ebs_volume_tags, {
    "soft-instance-id" = lookup(var.awsconf_dbservers, "soft-instance-id")
    "map-migrated"     = lookup(var.awsconf_dbservers, "map-migrated")
  })
}
