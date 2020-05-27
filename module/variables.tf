terraform {
  experiments = [variable_validation]
}

variable "region" {
  description = "aliyun region ex cn-hangzhou"
  type        = string
  default     = "cn-hangzhou"
}


// net variables
variable "ingress_with_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used. The valid keys contains `cidr_blocks`, `from_port`, `to_port`, `protocol`, `description`, `priority` and `rule`."
  type        = list(map(string))
  default     = []
}
variable "ingress_cidr_blocks" {
  description = "The IPv4 CIDR ranges list to use on ingress cidrs rules."
  type        = list(string)
  default     = []
}
variable "ingress_rules" {
  description = "List of ingress rules to create by name"
  type        = list(string)
  default     = []
}

variable "egress_rules" {
  description = "List of egress rules to create by name"
  type        = list(string)
  default     = []
}
variable "egress_with_cidr_blocks" {
  description = "List of egress rules to create where 'cidr_blocks' is used. The valid keys contains `cidr_blocks`, `from_port`, `to_port`, `protocol`, `description` and `priority`."
  type        = list(map(string))
  default     = []
}
variable "egress_cidr_blocks" {
  description = "The IPv4 CIDR ranges list to use on egress cidrs rules."
  type        = list(string)
  default     = []
}

variable "primary_vswitch_id" {
  description = "primary vswitch id"
  type        = string
}

variable "secondary_vswitch_id" {
  description = "primary vswitch id"
  type        = string
  default     = ""
}

variable "vpc" {
  description = "vpc id"
  type        = string
}

// daily backups
variable "snapshot_policy_id" {
  type        = string
  description = "snapshot policy id for backup"
  default     = "0"
}

variable "backup_time" {
  type        = list(string)
  description = "daily backup hour"
  default     = ["1"]
}

variable "retention_days" {
  type        = number
  description = "daily retention days"
  default     = 7
}

// LVMH Project vars
variable "brand" {
  type        = string
  description = "lvmh brand in 3 letters"
  validation {
    condition     = length(var.brand) == 3
    error_message = "Brand is a trigramme."
  }
}

variable "app_name" {
  type        = string
  description = "application name in 3 letter"
  validation {
    condition     = length(var.app_name) == 3
    error_message = "App_name is a trigramme."
  }
}

variable "project" {
  type        = string
  description = "project"
}

variable "vm_role" {
  type        = string
  description = "vm role in 2 letters"
  validation {
    condition     = length(var.vm_role) == 2
    error_message = "Vm role is a 2 letter WS / DB/ ..."
  }
}

variable "env" {
  type        = string
  description = "environement in 3 letters"
  validation {
    condition     = length(var.env) == 3
    error_message = "Env is a trigramme."
  }
}

variable "criticality" {
  type        = string
  description = "Criticality in 2 letters (P1/P2/P3)"
  validation {
    condition     = length(var.criticality) == 2
    error_message = "Criticality in 2 letters."
  }
}

variable "owner" {
  type        = string
  description = "owner of the instance"
}

variable "compliance" {
  type        = string
  default     = "None"
  description = "compliance : PCI DSS, ..."
}

variable "cost_center" {
  type        = string
  description = "Costcenter imputation"
}

// Instance vars
variable "number_of_instances_primary" {
  description = "number of instance to create in the primary zone"
  type        = number
  default     = 1
}

variable "number_of_instances_secondary" {
  description = "number of instance to create in the secondary zone"
  type        = number
  default     = 0
}


variable "image_type" {
  description = "Regex name of the image, example ubuntu_18.*64"
  default     = "^ubuntu_18.*64"
  type        = string
}

variable "instance_type" {
  type        = string
  description = "instance type"
}

variable "user_data" {
  description = "user script executed at instance creation"
  type        = string
  default     = ""
}

//disks
variable "system_disk_category" {
  type        = string
  default     = "cloud_ssd"
  description = "system disk category"
}
variable "system_disk_size" {
  type        = number
  default     = 40
  description = "system disk size"
}

variable "data_disk_category" {
  type        = string
  default     = "cloud_ssd"
  description = "data disk category"
}

variable "data_disk_size" {
  type        = number
  default     = 50
  description = "data disk size"
}


// Security Vars
variable "role_name" {
  description = "Instance RAM role name"
  type        = string
  default     = ""
}

// Financial vars
variable "instance_charge_type" {
  default     = "PostPaid"
  type        = string
  description = "The charge type of instance. Choices are 'PostPaid' and 'PrePaid'"
}

variable "internet_charge_type" {
  description = "The internet charge type of instance. Choices are 'PayByTraffic' and 'PayByBandwidth"
  default     = "PayByTraffic"
  type        = string
}
