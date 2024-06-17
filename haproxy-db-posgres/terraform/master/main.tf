provider "google" {
  credentials = file("../../ssl/account.json")
  project     = var.project_id
  region      = var.region
}

resource "google_compute_instance" "master_instance" {
  name         = var.master_name
  zone         = var.zone
  machine_type = var.machine_type

  boot_disk {
    device_name = "master-device"

    initialize_params {
      image = "master-base-image"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"

    access_config {
      nat_ip = google_compute_address.master_static_ip.address
    }
  }

  metadata_startup_script = "/home/ubuntu/master.sh"

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

resource "google_compute_address" "master_static_ip" {
  name   = "master-static-ip"
  region = var.region
}
