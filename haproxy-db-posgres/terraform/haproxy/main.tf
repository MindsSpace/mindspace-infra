provider "google" {
  credentials = file("../../ssl/account.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_compute_instance" "haproxy_instance" {
  name         = var.haproxy_name
  machine_type = var.machine_type
  tags         = ["haproxy"]

  boot_disk {
    device_name = "haproxy-device"
    initialize_params {
      image = "haproxy-base-image"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"

    access_config {
      nat_ip = google_compute_address.haproxy_static_ip.address
    }
  }

  metadata_startup_script = "/home/ubuntu/haproxy_setup.sh"

  lifecycle {
    create_before_destroy = true
  }

  service_account {
    scopes = [
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.read",
      "https://www.googleapis.com/auth/logging.write",
    ]
  }
}
