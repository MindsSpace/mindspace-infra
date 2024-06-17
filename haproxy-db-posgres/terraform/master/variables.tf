variable "project_id" {
  type    = string
  default = "fp-sisop"
}
variable "region" {
  type    = string
  default = "asia-southeast2"
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
