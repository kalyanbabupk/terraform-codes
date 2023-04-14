# resource "google_service_account" "service_account" {
#   for_each     = var.updater
#   account_id   = /*"sa-from-terraform-kb"*/ each.value.account_id
#   display_name = /*"sa-from-tf"*/ each.value.display_name
# }
# resource "google_project_iam_member" "sa-role" {
#   for_each = var.roles
#   project  = var.main.project
#   role     = each.value.role //"roles/run.admin"
#   member   = "serviceAccount:${(google_service_account.service_account.*.sa.account_id)[0]}@cloud-exponence-295312.iam.gserviceaccount.com" #Need to add index value becuse it generates tuple dataype
#   depends_on = [
#     google_service_account.service_account
#   ]
# }
