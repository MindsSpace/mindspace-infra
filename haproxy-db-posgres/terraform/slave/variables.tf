variable "project_id" {
  type    = string
  default = "mindspace-capstone-project"
}
variable "region" {
  type    = string
  default = "asia-southeast2"
}
variable "zone" {
  type    = string
  default = "asia-southeast2-a"
}
variable "slave_image" {
  type    = string
  default = "slave-base-image"
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "slave1_name" {
  type    = string
  default = "slave1-server"
}

variable "slave2_name" {
  type    = string
  default = "slave2-server"
}

variable "slave1_static_ip" {
  type = string
}

variable "slave2_static_ip" {
  type = string
}

resource "google_compute_address" "slave1_static_ip" {
  name   = "slave1-ipv4-address"
  region = var.region
}
resource "google_compute_address" "slave2_static_ip" {
  name   = "slave2-ipv4-address"
  region = var.region
}
