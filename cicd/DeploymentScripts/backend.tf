terraform {
  backend "gcs" {
    bucket = "bucket-from-tf-using-sa-kb"
    prefix = "terraform/state/cicd"
  }
}