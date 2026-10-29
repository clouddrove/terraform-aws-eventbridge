variable "create" {
  description = "Controls whether resources should be created"
  type        = bool
  default     = true
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
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

variable "create_endpoints" {
  description = "Controls whether EventBridge Global Endpoint resources should be created"
  type        = bool
  default     = false
}

variable "bus_name" {
  description = "Optional event bus name. Partner event buses must use their partner event source name. When creating a bus, defaults to the generated label; otherwise defaults to the default bus."
  type        = string
  default     = null
}

variable "bus_description" {
  description = "Description for the event bus created by this module."
  type        = string
  default     = null
}

variable "event_source_name" {
  description = "Partner event source name to associate with the event bus. It must match bus_name."
  type        = string
  default     = null
}

variable "kms_key_identifier" {
  description = "Customer managed KMS key identifier for encrypting events on the event bus."
  type        = string
  default     = null
}

variable "bus_dead_letter_arn" {
  description = "ARN of an SQS queue used as the event bus dead-letter queue."
  type        = string
  default     = null
}

variable "bus_log_config" {
  description = "Optional event bus logging configuration. level accepts OFF, ERROR, INFO, or TRACE; include_detail accepts NONE or FULL. Requires AWS provider 6.6.0 or later."
  type = object({
    level          = optional(string)
    include_detail = optional(string)
  })
  default = null
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

variable "endpoints" {
  description = "Global endpoint definitions. Each endpoint requires exactly two event bus ARNs, a primary Route 53 health check ARN, and a secondary Region."
  type = map(object({
    event_bus_arns           = list(string)
    primary_health_check_arn = string
    secondary_region         = string
    description              = optional(string)
    role_arn                 = optional(string)
    replication_state        = optional(string)
  }))
  default = {}

  validation {
    condition     = alltrue([for endpoint in values(var.endpoints) : length(endpoint.event_bus_arns) == 2])
    error_message = "Each global endpoint must specify exactly two event_bus_arns."
  }
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
