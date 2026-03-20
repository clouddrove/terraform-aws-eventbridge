variable "create" {
  description = "Controls whether resources should be created"
  type        = bool
  default     = true
}

variable "create_role" {
  description = "Controls whether IAM role for Lambda Function should be created"
  type        = bool
  default     = true
}

variable "create_bus" {
  description = "Controls whether EventBridge Bus resource should be created"
  type        = bool
  default     = true
}

variable "create_rules" {
  description = "Controls whether EventBridge Rule resources should be created"
  type        = bool
  default     = true
}

variable "create_targets" {
  description = "Controls whether EventBridge Target resources should be created"
  type        = bool
  default     = true
}

variable "create_permissions" {
  description = "Controls whether EventBridge Permission resources should be created"
  type        = bool
  default     = true
}

variable "create_archives" {
  description = "Controls whether EventBridge Archive resources should be created"
  type        = bool
  default     = false
}

#######################
variable "rules" {
  description = "A map of objects with EventBridge Rule definitions."
  type        = map(any)
  default     = {}
}

variable "targets" {
  description = "A map of objects with EventBridge Target definitions."
  type        = any
  default     = {}
}

variable "archives" {
  description = "A map of objects with the EventBridge Archive definitions."
  type        = map(any)
  default     = {}
}

variable "permissions" {
  description = "A map of objects with EventBridge Permission definitions."
  type        = map(any)
  default     = {}
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}


###########
## Label
###########
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}
variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`,`application`."
}


variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-aws-eventbridge"
  description = "Terraform current module repo"

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^https://", var.repository))
    error_message = "The module-repo value must be a valid Git repo link."
  }
}
