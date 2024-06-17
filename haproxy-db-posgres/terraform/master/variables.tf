variable "project_id" {
  type = string
}
variable "region" {
  type    = string
  default = "value"
}
variable "zone" {
  type    = string
  default = "asia-southeast2-a"
}
variable "master_image" {
  type    = string
  default = "master-base-image"
}

variable "machine_type" {
  type    = string
  default = "e2-small"
}

variable "master_name" {
  type    = string
  default = "master-server"
}

variable "master_static_ip" {
  type = string
}

resource "google_compute_address" "master_static_ip" {
  name = "ipv4-address"
}
