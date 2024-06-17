variable "project_id" {
  type = string
}
variable "region" {
  type    = string
  default = "asia-southeast2"
}
variable "zone" {
  type    = string
  default = "asia-southeast2-a"
}
variable "haproxy_image" {
  type    = string
  default = "haproxy-base-image"
}

variable "machine_type" {
  type    = string
  default = "e2-small"
}

variable "haproxy_name" {
  type    = string
  default = "haproxy-server"
}

variable "haproxy_static_ip" {
  type = string
}

resource "google_compute_address" "haproxy_static_ip" {
  name = "ipv4-address"
}
