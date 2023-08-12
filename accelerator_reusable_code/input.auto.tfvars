accelerator_structure = {
  project_details_1 = {
    project = "cloud-exponence-295312"
    accelerator_details = {
      accelerator1 = {
        region             = "us-central1"
        zone               = "us-central1-c"
        pubsub_topic_name1 = "is-vmON"
        pubsub_topic_name2 = "is-vmOFF"

        scheduler_name1        = "is1"
        scheduler_description1 = "Cloud Scheduler to turn on labeled VMs"
        cron_pattern_start     = "*/5 * * * *"

        scheduler_name2        = "is2"
        scheduler_description2 = "Cloud Scheduler to turn off labeled VMs to save on cost and reduce risk."
        cron_pattern_stop      = "*/7 * * * *"

        time_zone = "Asia/Kolkata"

        scheduler_function_bucket = "is-bucket-vm9645"
        bucket_location           = "US"
        object_name1              = "start.zip"
        object_source1            = "/home/kalyanbabu_u/accelerator_reusable_code/cloud_fun_scripts/start/start_vm11.zip"
        object_name2              = "stop.zip"
        object_source2            = "/home/kalyanbabu_u/accelerator_reusable_code/cloud_fun_scripts/stop/stop_vm11.zip"
        sa_acc_id                 = "is-srva-vm"
        sa_display_name           = "is-srva-vm"

        custom_role_id          = "is.vm"
        custom_role_title       = "Instance Scheduler Role for vm"
        custom_role_description = "Ability to turn off instances with a specific label at a specific time."
        custom_role_permissions = ["compute.instances.list", "compute.instances.stop", "compute.instances.start", "compute.zones.list", ]

        cloudfunc_name1               = "is-start-fun"
        cloudfunc_description1        = "Cloud function to do the heavy lifting"
        cloudfunc_avl_memory_mb1      = 128
        cloudfunc_runtime1            = "python37"
        cloudfunc_trigger_event_type1 = "google.pubsub.topic.publish"
        cloudfunc_trigger_retry1      = false
        cloudfunc_timeout1            = 120
        cloudfunc_entry_point1        = "vm_scheduler_start"

        cloudfunc_name2               = "is-stop-fun"
        cloudfunc_description2        = "Cloud function to do the heavy lifting"
        cloudfunc_avl_memory_mb2      = 128
        cloudfunc_runtime2            = "python37"
        cloudfunc_trigger_event_type2 = "google.pubsub.topic.publish"
        cloudfunc_trigger_retry2      = false
        cloudfunc_timeout2            = 120
        cloudfunc_entry_point2        = "vm_scheduler_stop"

        label_key   = "instance-scheduler"
        label_value = "stop"

      }
    }
  }

}

