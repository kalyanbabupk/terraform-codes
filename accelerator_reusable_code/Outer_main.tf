locals {
  accelerator_details = flatten([
    for project_details in var.accelerator_structure : [
      for accelerator_details in project_details.accelerator_details : {
        project                       = project_details.project
        region                        = accelerator_details.region
        zone                          = accelerator_details.zone
        pubsub_topic_name1            = accelerator_details.pubsub_topic_name1
        pubsub_topic_name2            = accelerator_details.pubsub_topic_name2
        scheduler_name1               = accelerator_details.scheduler_name1
        scheduler_description1        = accelerator_details.scheduler_description1
        cron_pattern_start            = accelerator_details.cron_pattern_start
        scheduler_name2               = accelerator_details.scheduler_name2
        scheduler_description2        = accelerator_details.scheduler_description2
        cron_pattern_stop             = accelerator_details.cron_pattern_stop
        time_zone                     = accelerator_details.time_zone
        scheduler_function_bucket     = accelerator_details.scheduler_function_bucket
        bucket_location               = accelerator_details.bucket_location
        object_name1                  = accelerator_details.object_name1
        object_source1                = accelerator_details.object_source1
        object_name2                  = accelerator_details.object_name2
        object_source2                = accelerator_details.object_source2
        sa_acc_id                     = accelerator_details.sa_acc_id
        sa_display_name               = accelerator_details.sa_display_name
        custom_role_id                = accelerator_details.custom_role_id
        custom_role_title             = accelerator_details.custom_role_title
        custom_role_description       = accelerator_details.custom_role_description
        custom_role_permissions       = accelerator_details.custom_role_permissions
        cloudfunc_name1               = accelerator_details.cloudfunc_name1
        cloudfunc_description1        = accelerator_details.cloudfunc_description1
        cloudfunc_avl_memory_mb1      = accelerator_details.cloudfunc_avl_memory_mb1
        cloudfunc_runtime1            = accelerator_details.cloudfunc_runtime1
        cloudfunc_trigger_event_type1 = accelerator_details.cloudfunc_trigger_event_type1
        cloudfunc_trigger_retry1      = accelerator_details.cloudfunc_trigger_retry1
        cloudfunc_timeout1            = accelerator_details.cloudfunc_timeout1
        cloudfunc_entry_point1        = accelerator_details.cloudfunc_entry_point1
        cloudfunc_name2               = accelerator_details.cloudfunc_name2
        cloudfunc_description2        = accelerator_details.cloudfunc_description2
        cloudfunc_avl_memory_mb2      = accelerator_details.cloudfunc_avl_memory_mb2
        cloudfunc_runtime2            = accelerator_details.cloudfunc_runtime1
        cloudfunc_trigger_event_type2 = accelerator_details.cloudfunc_trigger_event_type2
        cloudfunc_trigger_retry2      = accelerator_details.cloudfunc_trigger_retry2
        cloudfunc_timeout2            = accelerator_details.cloudfunc_timeout2
        cloudfunc_entry_point2        = accelerator_details.cloudfunc_entry_point2
        label_key                     = accelerator_details.label_key
        label_value                   = accelerator_details.label_value

      }
    ]
  ])
}


module "accelerator_creation" {
  source = "./cloud_func_inner"
  for_each = {
    for acce in local.accelerator_details : "${acce.project}-${acce.pubsub_topic_name1}" => acce
  }

  project                       = each.value.project
  region                        = each.value.region
  zone                          = each.value.zone
  pubsub_topic_name1            = each.value.pubsub_topic_name1
  pubsub_topic_name2            = each.value.pubsub_topic_name2
  scheduler_name1               = each.value.scheduler_name1
  scheduler_description1        = each.value.scheduler_description1
  cron_pattern_start            = each.value.cron_pattern_start
  scheduler_name2               = each.value.scheduler_name2
  scheduler_description2        = each.value.scheduler_description2
  cron_pattern_stop             = each.value.cron_pattern_stop
  time_zone                     = each.value.time_zone
  scheduler_function_bucket     = each.value.scheduler_function_bucket
  bucket_location               = each.value.bucket_location
  object_name1                  = each.value.object_name1
  object_source1                = each.value.object_source1
  object_name2                  = each.value.object_name2
  object_source2                = each.value.object_source2
  sa_acc_id                     = each.value.sa_acc_id
  sa_display_name               = each.value.sa_display_name
  custom_role_id                = each.value.custom_role_id
  custom_role_title             = each.value.custom_role_title
  custom_role_description       = each.value.custom_role_description
  custom_role_permissions       = each.value.custom_role_permissions
  cloudfunc_name1               = each.value.cloudfunc_name1
  cloudfunc_description1        = each.value.cloudfunc_description1
  cloudfunc_avl_memory_mb1      = each.value.cloudfunc_avl_memory_mb1
  cloudfunc_runtime1            = each.value.cloudfunc_runtime1
  cloudfunc_trigger_event_type1 = each.value.cloudfunc_trigger_event_type1
  cloudfunc_trigger_retry1      = each.value.cloudfunc_trigger_retry1
  cloudfunc_timeout1            = each.value.cloudfunc_timeout1
  cloudfunc_entry_point1        = each.value.cloudfunc_entry_point1
  cloudfunc_name2               = each.value.cloudfunc_name2
  cloudfunc_description2        = each.value.cloudfunc_description2
  cloudfunc_avl_memory_mb2      = each.value.cloudfunc_avl_memory_mb2
  cloudfunc_runtime2            = each.value.cloudfunc_runtime1
  cloudfunc_trigger_event_type2 = each.value.cloudfunc_trigger_event_type2
  cloudfunc_trigger_retry2      = each.value.cloudfunc_trigger_retry2
  cloudfunc_timeout2            = each.value.cloudfunc_timeout2
  cloudfunc_entry_point2        = each.value.cloudfunc_entry_point2
  label_key                     = each.value.label_key
  label_value                   = each.value.label_value

}