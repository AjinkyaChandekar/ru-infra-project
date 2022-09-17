locals {
  common_tags = {
    app       = "ureport"
    msp       = "lti"
    terraform = true
  }
}

output "common_tags" {
  value = local.common_tags

}