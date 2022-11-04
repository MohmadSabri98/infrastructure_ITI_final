resource "google_compute_router" "router" {
  name = "router"
  network = google_compute_network.myvpc.name
  region  = google_compute_subnetwork.managementsubnet.region
}

resource "google_compute_address" "ipnat" {
  name = "ipnat"
  project = "lateral-goods-366106"
  region  = "us-central1"
}
resource "google_compute_router_nat" "nat" {
  name                               = "nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.managementsubnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
  subnetwork {
    name                    = google_compute_subnetwork.restrictedsubnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}