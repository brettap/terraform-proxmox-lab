variable "proxmox_endpoint" {
  description = "URL of the Proxmox API"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}