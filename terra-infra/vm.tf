resource "google_compute_instance" "management-instance" {
  name                      = "management-instance"
  machine_type              = "e2-medium"
  zone                      = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = "10"
    }
  }

  network_interface {
    network    = google_compute_network.myvpc.id
    subnetwork = google_compute_subnetwork.managementsubnet.id
  }

  service_account {
    email  = google_service_account.vm-service-account.email
    scopes = ["cloud-platform"]
  }
}