data "azurerm_location" "current" {
  location = "CentralIndia"
}
variable "ENV" {
  description = "Environment Name"
  type        = string
}

variable "env" {
  description = "Environment Name in small case"
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
  description = "Project Name in small case"
  type        = string
}

variable "PREFIX" {
  description = "Prefix for QA VMs"
  type        = string
}

variable "os_password" {
  type      = string
  sensitive = true
}

variable "domainpass" {
  type      = string
  sensitive = true
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
variable "sql_db" {
  description = "The database name"
  type        = string
}

variable "sql_host" {
  description = "The database host name"
  type        = string
}

variable "sql_password" {
  description = "The database password name"
  type        = string
}

variable "sql_port" {
  description = "The database port"
  type        = string
}

variable "sql_user" {
  description = "The database user name"
  type        = string
}

variable "snowflake_resource_id" {
  description = "The resource id of the snowflake"
  type        = string
}