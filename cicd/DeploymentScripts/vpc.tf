# # Create the VPC network
# resource "google_compute_network" "my-vpc" {
#   name                    = "vpc-from-cicd-kb"
#   auto_create_subnetworks = false
# }

# #  Create the subnets
# resource "google_compute_subnetwork" "subnets" {
#   for_each = var.subnets
#   #   count         = length(var.subnet_cidr_ranges)
#   name          = each.value.name
#   ip_cidr_range = each.value.ip_cidr_range
#   network       = google_compute_network.my-vpc.id
#   region        = each.value.region
#   depends_on = [
#     google_compute_network.my-vpc
#   ]
# }

# # Create firewall rules
# resource "google_compute_firewall" "allow-http" {
#   name    = "allow-http"
#   network = google_compute_network.my-vpc.self_link

#   allow {
#     protocol = "tcp"
#     ports    = ["80"]
#   }

#   source_ranges = ["0.0.0.0/0"]
# }

# resource "google_compute_firewall" "allow-ssh" {
#   name    = "allow-ssh"
#   network = google_compute_network.my-vpc.self_link

#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }

#   source_ranges = ["0.0.0.0/0"]
# }

# # Create a route
# resource "google_compute_route" "route" {
#   name                  = "my-route"
#   network               = google_compute_network.my-vpc.self_link
#   dest_range            = "0.0.0.0/0"
#   next_hop_gateway      = "default-internet-gateway" //google_compute_network.my-vpc.gateway_ipv4
#   priority              = 1000
#   tags                  = ["my-tag"]
# }