resource "google_compute_firewall" "allowssh" {

  source_ranges = ["0.0.0.0/0"]
  name    = "allowssh"
  network = google_compute_network.myvpc.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  depends_on = [google_compute_network.myvpc,
  google_compute_subnetwork.restrictedsubnet,
  google_compute_subnetwork.managementsubnet
  ]
}