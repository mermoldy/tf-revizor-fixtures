module "security_group" {
  source  = "alibaba/security-group/alicloud"
  region  = var.region
  version = "2.3.0"

  name        = "AL${var.brand}${var.app_name}${var.vm_role}${var.env}-securitygroup"
  description = "Secrutiy group for ${var.app_name} - server type: ${var.vm_role}"
  vpc_id      = var.vpc

  ingress_cidr_blocks      = var.ingress_cidr_blocks
  ingress_rules            = var.ingress_rules
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
  egress_cidr_blocks       = var.egress_cidr_blocks
  egress_rules             = var.egress_rules
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
}

resource "alicloud_key_pair" "default" {
  key_name = "AL${var.brand}${var.app_name}${var.vm_role}${var.env}-key"
  key_file = "AL${var.brand}${var.app_name}${var.vm_role}${var.env}-key"
}

resource "alicloud_snapshot_policy" "default" {
  count           = var.snapshot_policy_id == "0" ? 1 : 0
  name            = "AL${var.brand}${var.app_name}${var.vm_role}${var.env}-daily-backup"
  repeat_weekdays = ["1", "2", "3", "4", "5", "6", "7"]
  retention_days  = var.retention_days
  time_points     = var.backup_time
}

module "ecs_primary" {
  source               = "git::https://git.lbn.fr/apac/clients/lmvh-china/infa-as-code/modules/terraform-aliyun-lvmh-ecs.git?ref=v1.1.1"
  number_of_instances  = var.number_of_instances_primary
  instance_charge_type = var.instance_charge_type
  image_type           = var.image_type
  instance_type        = var.instance_type
  user_data            = var.user_data
  role_name            = var.role_name

  vswitch_id         = var.primary_vswitch_id
  security_group_ids = ["${module.security_group.this_security_group_id}"]

  system_disk_category = var.system_disk_category
  system_disk_size     = var.system_disk_size
  data_disk_category   = var.data_disk_category
  data_disk_size       = var.data_disk_size
  snapshot_policy_id   = var.snapshot_policy_id == "0" ? alicloud_snapshot_policy.default[0].id : var.snapshot_policy_id

  brand       = var.brand
  project     = var.project
  vm_role     = var.vm_role
  env         = var.env
  app_name    = var.app_name
  criticality = var.criticality
  cost_center = var.cost_center
  owner       = var.owner
  compliance  = var.compliance
}

module "ecs_secondary" {
  source               = "git::https://git.lbn.fr/apac/clients/lmvh-china/infa-as-code/modules/terraform-aliyun-lvmh-ecs.git?ref=v1.1.1"
  number_of_instances  = var.number_of_instances_secondary
  instance_charge_type = var.instance_charge_type
  image_type           = var.image_type
  instance_type        = var.instance_type
  user_data            = var.user_data
  role_name            = var.role_name
  index                = var.number_of_instances_primary + 1

  vswitch_id         = var.secondary_vswitch_id
  security_group_ids = ["${module.security_group.this_security_group_id}"]

  system_disk_category = var.system_disk_category
  system_disk_size     = var.system_disk_size
  data_disk_category   = var.data_disk_category
  data_disk_size       = var.data_disk_size
  snapshot_policy_id   = var.snapshot_policy_id == "0" ? alicloud_snapshot_policy.default[0].id : var.snapshot_policy_id

  brand       = var.brand
  project     = var.project
  vm_role     = var.vm_role
  env         = var.env
  app_name    = var.app_name
  criticality = var.criticality
  cost_center = var.cost_center
  owner       = var.owner
  compliance  = var.compliance
}
