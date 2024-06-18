output "slave1_ip" {
  value = google_compute_instance.slave1_instance.network_interface.0.access_config.0.nat_ip
}

output "slave2_ip" {
  value = google_compute_instance.slave2_instance.network_interface.0.access_config.0.nat_ip
}
