########## COMMON VARIABLES ############
variable "main" {
  type = object({
    project     = string
    region      = string
    env         = string
    data_source = string
  })
}


# ##### BUCKET VARIABLES ########

# variable "bucket" {
#   type = map(object({
#     name                     = string
#     description              = string
#     location                 = string
#     storage_class            = string
#     force_destroy            = bool
#     public_access_prevention = string
#   }))
# }

#########SERVICE ACCOUNT VARIABLES ##########
# variable "updater" {
#   type = map(object({
#     # name         = string
#     # location     = string
#     account_id   = string
#     display_name = string
#     #schedule  = string
#     #region    = string
#     #time_zone = string
#   }))
# }

############# SA ROLES VARIABLES ########################
# variable "roles" {
#   type = map(object({
#     role = string
#     #member = string
#   }))
# }

###########  VM INSTANCE VARIABLES  ##########################
# variable "instance" {
#   type = map(object({
#     name         = string
#     machine_type = string
#     zone         = string
#   }))
# }

######## VPC INPUT VARIABLES ######################
# variable "vpc" {
#   type = map(object({
#     name                    = string
#     auto_create_subnetworks = bool
#   }))

# }

######## SUBNETS VARIABLES ######################
# variable "subnets" {
#   type = map(object({
#     name          = string
#     ip_cidr_range = string
#     region        = string
#   }))

# }

