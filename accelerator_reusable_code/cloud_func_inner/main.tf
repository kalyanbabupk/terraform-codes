/*
provider "google" {
  project = var.project
  region  = var.region   //"us-central1"
  zone    = var.zone      //"us-central1-c"
  version = "4.43.1"
}
*/
resource "google_pubsub_topic" "topic" {
  name    = var.pubsub_topic_name1 //"instance-scheduler-vmON"
  project = var.project
}
resource "google_pubsub_topic" "topic2" {
  name    = var.pubsub_topic_name2 //"instance-scheduler-vmOFF"
  project = var.project
}

resource "google_cloud_scheduler_job" "job" {
  name        = var.scheduler_name1        //"instance-scheduler"
  description = var.scheduler_description1 //"Cloud Scheduler to turn on labeled VMs"
  schedule    = var.cron_pattern_start
  time_zone   = var.time_zone //"Asia/Kolkata"
  region      = var.region
  project     = var.project

  pubsub_target {
    topic_name = google_pubsub_topic.topic.id
    data       = base64encode("i am a robot...beep boop beep boop")
  }
}

resource "google_cloud_scheduler_job" "job2" {
  name        = var.scheduler_name2
  description = var.scheduler_description2 //"Cloud Scheduler to turn off labeled VMs to save on cost and reduce risk."
  schedule    = var.cron_pattern_stop
  time_zone   = var.time_zone //"Asia/Kolkata"
  region      = var.region
  project     = var.project

  pubsub_target {
    topic_name = google_pubsub_topic.topic2.id
    data       = base64encode("i am a robot...beep boop beep boop")
  }
}

resource "google_storage_bucket" "bucket" {
  name     = var.scheduler_function_bucket
  project  = var.project
  location = var.bucket_location //"US"
}

resource "google_storage_bucket_object" "archive" {
  name   = var.object_name1 //"start.zip"
  bucket = google_storage_bucket.bucket.name
  source = var.object_source1 //"start/start.zip"
}

resource "google_storage_bucket_object" "archive2" {
  name   = var.object_name2 //"stop.zip"
  bucket = google_storage_bucket.bucket.name
  source = var.object_source2 //"stop/stop.zip"
}


resource "google_service_account" "sa" {
  account_id   = var.sa_acc_id       //"instance-scheduler-srva-vm"
  display_name = var.sa_display_name //"instance-scheduler-srva-vm"
  project      = var.project
}

resource "google_project_iam_custom_role" "sa_custom_role" {
  role_id     = var.custom_role_id          //"instance.schedulerforvm"
  title       = var.custom_role_title       //"Instance Scheduler Role for vm"
  description = var.custom_role_description //"Ability to turn off instances with a specific label at a specific time."
  permissions = var.custom_role_permissions //["compute.instances.list","compute.instances.stop","compute.instances.start","compute.zones.list",]
  project     = var.project
}

resource "google_project_iam_member" "sa-iam-member" {
  project = var.project
  role    = "projects/${var.project}/roles/${google_project_iam_custom_role.sa_custom_role.role_id}"
  member  = "serviceAccount:${google_service_account.sa.email}"

  depends_on = [
    google_service_account.sa
  ]
}

resource "google_cloudfunctions_function" "function" {
  name                  = var.cloudfunc_name1          //"instance-scheduler-function"
  description           = var.cloudfunc_description1   //"Cloud function to do the heavy lifting"
  available_memory_mb   = var.cloudfunc_avl_memory_mb1 //128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  runtime               = var.cloudfunc_runtime1 //"python37"
  region                = var.region
  project               = var.project

  event_trigger {
    event_type = var.cloudfunc_trigger_event_type1 //"google.pubsub.topic.publish"
    resource   = google_pubsub_topic.topic.name
    failure_policy {
      retry = var.cloudfunc_trigger_retry1 //false
    }
  }

  timeout               = var.cloudfunc_timeout1     //120
  entry_point           = var.cloudfunc_entry_point1 //"instance_scheduler_start"
  service_account_email = google_service_account.sa.email

  environment_variables = {
    PROJECT     = var.project
    LABEL_KEY   = var.label_key
    LABEL_VALUE = var.label_value
  }
  depends_on = [
    google_service_account.sa
  ]
}

resource "google_cloudfunctions_function" "functiontwo" {
  name                  = var.cloudfunc_name2          //"instance-scheduler-funtwo"
  description           = var.cloudfunc_description2   //"Cloud function to do the heavy lifting"
  available_memory_mb   = var.cloudfunc_avl_memory_mb2 //128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive2.name
  runtime               = var.cloudfunc_runtime2 //"python37"
  region                = var.region
  project               = var.project

  event_trigger {
    event_type = var.cloudfunc_trigger_event_type2 //"google.pubsub.topic.publish"
    resource   = google_pubsub_topic.topic2.name
    failure_policy {
      retry = var.cloudfunc_trigger_retry2 //false
    }
  }

  timeout               = var.cloudfunc_timeout2     //120
  entry_point           = var.cloudfunc_entry_point2 //"instance_scheduler_start"
  service_account_email = google_service_account.sa.email

  environment_variables = {
    PROJECT     = var.project
    LABEL_KEY   = var.label_key
    LABEL_VALUE = var.label_value
  }
  depends_on = [
    google_service_account.sa
  ]
}