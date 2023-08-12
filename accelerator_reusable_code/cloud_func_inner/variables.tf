variable "project" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}

variable "zone" {
  type    = string
  default = ""
}

variable "pubsub_topic_name1" {
  type    = string
  default = ""
}

variable "pubsub_topic_name2" {
  type    = string
  default = ""
}

variable "scheduler_name1" {
  type    = string
  default = ""
}


variable "scheduler_description1" {
  type    = string
  default = ""
}

variable "time_zone" {
  type    = string
  default = ""
}
/*
variable "scheduler_target_topic1" {
  type        = string
  default     = ""
}
*/
variable "scheduler_name2" {
  type    = string
  default = ""
}


variable "scheduler_description2" {
  type    = string
  default = ""
}
/*
variable "time_zone2" {
  type        = string
  default     = ""
}

variable "scheduler_target_topic2" {
  type        = string
  default     = ""
}
*/
variable "scheduler_function_bucket" {
  type    = string
  default = ""
}

variable "bucket_location" {
  type    = string
  default = ""
}

variable "object_name1" {
  type    = string
  default = ""
}

variable "object_source1" {
  type    = string
  default = ""
}

variable "object_name2" {
  type    = string
  default = ""
}

variable "object_source2" {
  type    = string
  default = ""
}

variable "sa_acc_id" {
  type    = string
  default = ""
}

variable "sa_display_name" {
  type    = string
  default = ""
}

variable "custom_role_id" {
  type    = string
  default = ""
}

variable "custom_role_title" {
  type    = string
  default = ""
}

variable "custom_role_description" {
  type    = string
  default = ""
}

variable "custom_role_permissions" {
  type    = list(string)
  default = []
}

variable "cloudfunc_name1" {
  type    = string
  default = ""
}

variable "cloudfunc_description1" {
  type    = string
  default = ""
}

variable "cloudfunc_avl_memory_mb1" {
  type    = number
  default = null
}

variable "cloudfunc_runtime1" {
  type    = string
  default = ""
}

variable "cloudfunc_trigger_event_type1" {
  type    = string
  default = ""
}

variable "cloudfunc_trigger_retry1" {
  type    = bool
  default = null
}

variable "cloudfunc_timeout1" {
  type    = string
  default = ""
}

variable "cloudfunc_entry_point1" {
  type    = string
  default = ""
}

variable "cloudfunc_name2" {
  type    = string
  default = ""
}

variable "cloudfunc_description2" {
  type    = string
  default = ""
}

variable "cloudfunc_avl_memory_mb2" {
  type    = number
  default = null
}

variable "cloudfunc_runtime2" {
  type    = string
  default = ""
}

variable "cloudfunc_trigger_event_type2" {
  type    = string
  default = ""
}

variable "cloudfunc_trigger_retry2" {
  type    = bool
  default = null
}

variable "cloudfunc_timeout2" {
  type    = string
  default = ""
}

variable "cloudfunc_entry_point2" {
  type    = string
  default = ""
}

variable "cron_pattern_start" {
  type    = string
  default = ""
}

variable "cron_pattern_stop" {
  type    = string
  default = ""
}

variable "label_key" {
  default = "instance-scheduler"
}

variable "label_value" {
  default = "stop"
}
/*
variable "label_key1" {
  default = "instancescheduler"
}

variable "label_value1" {
  default = "start"
}


variable "scheduler_function_bucket" {
  default = "cloud-exponence-vmscheduler"
}
*/