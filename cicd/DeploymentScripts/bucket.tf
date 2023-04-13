# resource "google_storage_bucket" "step-bucket" {
#   for_each                 = var.bucket
#   name                     = each.value.name
#   location                 = each.value.location
#   storage_class            = each.value.storage_class
#   force_destroy            = each.value.force_destroy
#   public_access_prevention = each.value.public_access_prevention
# }