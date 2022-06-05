# Variables for naming convention
variable "service_name" {
  description = "List of resources that will be used in the project to generate the resource name according to the Azure CAF naming convention"
  type        = set(string)
  default     = ["azurerm_resource_group","azurerm_application_insights","azurerm_app_service_plan","azurerm_app_service","azurerm_storage_account"]
}
variable "app_name" {  
  description = "This variable defines the application name"
  type        = string
  default     = "app1"
  validation {
    condition     = length(var.app_name) > 2 && length(var.app_name) < 11
    error_message = "Application name must not be less than 3 characters and not more than 10"
  }
}
variable "environment" {
  description = "This variable defines the application environment" 
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "qa", "prod"], var.environment)
    error_message = "Please check the enironment name, it must be dev,qa or prod."
  }
}
variable "max_length_name" {
  description = "Max length for resource name"
  type        = string
  default = 24
}
variable "convention_method" {
  description = "Methods for CAF naming convention. It can be cafclassic, cafrandom, random or passthrough"
  type        = string
  default     = "cafrandom"
}

# General infrastructure variables
variable "location" {
  description = "Azure Region where all these resources will be provisioned"
  type        = string
  default     = "East US 2"
}

# Application Insight variables
variable "appi_type" {
  description = "Application Insight type"
  type        = string
  default     = "web"
}

# Application plan variables
variable "plan_platform" {
  description = "Platform for application plan"
  type        = string
  default     = "Windows"
}
variable "plan_sku" {
  description = "SKU for application plan"
  type        = string
  default     = "B1"
}

# Storage Account variables
variable "st_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}
variable "st_replication" {
  description = "Replication Type"
  type        = string
  default     = "GRS"
}