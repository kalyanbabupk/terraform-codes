# resource "google_compute_instance" "default" {
#   for_each     = var.instance
#   name         = each.value.name
#   machine_type = each.value.machine_type
#   zone         = each.value.zone


#   tags = ["project"]

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#       labels = {
#         my_label = "value"
#       }
#     }
#   }
#   network_interface {
#     network = "default"
#   }
# }