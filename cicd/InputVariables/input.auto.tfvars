########## COMMON INPUTS ############
main = {
  project     = "cloud-exponence-295312"
  region      = "europe-west1"
  env         = "dev"
  data_source = "test"
}

############ BUCKET INPUTS ##########

# bucket = {
#   bucket_name = {
#     name                     = "bucket-from-cicd-kalyan-6269"
#     description              = "The name of the bucket"
#     location                 = "europe-west1"
#     storage_class            = "STANDARD"
#     force_destroy            = true
#     public_access_prevention = "enforced"
#   }
# }
########### SERVICE ACCOUNT INPUTS #############
# updater = {
#   sa = {
#     account_id   = "sa-from-tf-using-cicd-kb"
#     display_name = "sa-from-cicd"
#   }
# }

############ VM INSTANCE INPUTS ##################
# instance = {
#   vm = {
#     name         = "vm-from-cicd-kb"
#     machine_type = "e2-medium"
#     zone         = "europe-west1-b"
#   }
# }

########### VPC INPUTS  #################
# vpc = {
#   vpc1 = {
#     name                    = "vpc-from-cicd-kb"
#     auto_create_subnetworks = true
#   }
# }
########### SUBNETS INPUTS  ################
# subnets = {
#   subnet1 = {
#     name          = "subnet1-from-cicd-kb"
#     ip_cidr_range = "10.0.1.0/24"
#     region        = "us-central1"
#   }
#    subnet2 = {
#     name          = "subnet2-from-cicd-kb"
#     ip_cidr_range = "10.0.2.0/24"
#     region        = "us-central1"
#   }
# }
