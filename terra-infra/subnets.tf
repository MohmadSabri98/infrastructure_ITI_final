resource "google_compute_subnetwork" "managementsubnet" {
  name          = "managementsubnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  private_ip_google_access = true
  network       = google_compute_network.myvpc.id
}

resource "google_compute_subnetwork" "restrictedsubnet" {
  name          = "restrictedsubnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  private_ip_google_access = true
  network       = google_compute_network.myvpc.id
}