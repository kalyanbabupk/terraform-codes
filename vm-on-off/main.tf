provider "google" {
  project = "cloud-exponence-295312"
  region  = "us-central1"
}

resource "google_pubsub_topic" "topic_on" {
  name    = "On-topic-from-tf-kb"
  project = "cloud-exponence-295312"
}

resource "google_pubsub_topic" "topic_off" {
  name    = "Off-topic-from-tf-kb"
  project = "cloud-exponence-295312"
}

resource "google_cloud_scheduler_job" "job_on" {
  name        = "on-instance-scheduler-kb"
  description = "Cloud Scheduler to turn on labeled VMs"
  schedule    = "*/5 * * * *"
  time_zone   = "Asia/Kolkata"
  region      = "us-central1"
  project     = "cloud-exponence-295312"

  pubsub_target {
    topic_name = google_pubsub_topic.topic_on.id
    data       = base64encode("i am a robot...beep boop beep boop")
  }
}

resource "google_cloud_scheduler_job" "job_off" {
  name        = "off-instance-scheduler-kb"
  description = "Cloud Scheduler to turn on labeled VMs"
  schedule    = "*/7 * * * *"
  time_zone   = "Asia/Kolkata"
  region      = "us-central1"
  project     = "cloud-exponence-295312"

  pubsub_target {
    topic_name = google_pubsub_topic.topic_off.id
    data       = base64encode("i am a robot...beep boop beep boop")
  }
}
resource "google_storage_bucket" "bucket" {
  name     = "bucket-for-cloudfunc-from-tf-kb"
  project  = "cloud-exponence-295312"
  location = "US"
}

resource "google_storage_bucket_object" "archive_start" {
  name   = "start"
  bucket = "bucket-for-cloudfunc-from-tf-kb"
  source = "/home/kalyanbabu_u/kalyan/cloudfunc_test/source/start_vm11.zip"
  depends_on = [
    google_storage_bucket.bucket
  ]
}

resource "google_storage_bucket_object" "archive_stop" {
  name   = "stop"
  bucket = "bucket-for-cloudfunc-from-tf-kb"
  source = "/home/kalyanbabu_u/kalyan/cloudfunc_test/source/stop_vm11.zip"
  depends_on = [
    google_storage_bucket.bucket
  ]
}
##########################TEST###################################
resource "google_cloudfunctions_function" "vm-on-function" {
  name        = "vm-on-function"
  description = "Cloud Function On"
  runtime     = "python37"

  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive_start.name
  service_account_email = "sa-from-terraform-kb@cloud-exponence-295312.iam.gserviceaccount.com"
  entry_point           = "vm_scheduler_start"

  environment_variables = {
    PROJECT     = "cloud-exponence-295312"
    LABEL_KEY   = "instance-scheduler"
    LABEL_VALUE = "true"
  }

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.topic_on.name
  }

  available_memory_mb = 256
  timeout             = 60
}

resource "google_cloudfunctions_function" "vm-off-function" {
  name        = "vm-off-function"
  description = "Cloud Function Off"
  runtime     = "python37"

  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive_stop.name
  service_account_email = "sa-from-terraform-kb@cloud-exponence-295312.iam.gserviceaccount.com"
  entry_point           = "vm_scheduler_stop"

  environment_variables = {
    PROJECT     = "cloud-exponence-295312"
    LABEL_KEY   = "instance-scheduler"
    LABEL_VALUE = "true"
  }

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.topic_off.name
  }

  available_memory_mb = 256
  timeout             = 60
}