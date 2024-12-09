variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "cloud-devops-udacity-project-1"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "southeastasia"
}

variable "username" {
  description = "The VM users name."
  default = "minhnt47"
}

variable "password" {
  description = "The VM users password:"
  sensitive = true
}

variable "number_of_vms" {
  description = "The number of Virtual Machines to be deployed."
  type        = number
  default     = "2"
}

variable "packer_image" {
  description = "The ID of the image created by packer tool."
  default = "/subscriptions/54b6fbed-31ed-43dd-bfe4-56564b4724dc/resourceGroups/minhng130300_rg_0085/providers/Microsoft.Compute/images/udacity-packer-image"
}

variable "subscription" {
  description = "The subscription for which the resources are going to be deployed."
  default = "/subscriptions/54b6fbed-31ed-43dd-bfe4-56564b4724dc"
}