data "azurerm_location" "current" {
  location = "CentralIndia"
}
variable "ENV" {
  description = "Environment Name"
  type        = string
}

variable "env" {
  description = "Environment Name"
  type        = string
}

variable "COSTCENTER" {
  description = "Cost Center Name"
  type        = string
}

variable "DEPARTMENT" {
  description = "Department Name"
  type        = string
}

variable "OWNER" {
  description = "Owner Name"
  type        = string
}

variable "PROJECT" {
  description = "Project Name"
  type        = string
}

variable "project" {
  description = "Project Name"
  type        = string
}

variable "NETWORK_CIDR" {
  description = "The CIDR block for the network"
  type        = string
}

variable "APP_SUBNET_CIDR" {
  description = "The CIDR block for the application subnet"
  type        = string

}

variable "PRIVATE_ENDPOINT_SUBNET_CIDR" {
  description = "The CIDR block for the private endpoint subnet"
  type        = string
}
