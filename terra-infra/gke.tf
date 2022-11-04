resource "google_container_cluster" "private-cluster" {
  name                     = "private-cluster"
  location                 = "us-central1-a"
  remove_default_node_pool = true
  initial_node_count       = 3
  network                  = google_compute_network.myvpc.id
  subnetwork               = google_compute_subnetwork.restrictedsubnet.id



  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.0.0/24"
      display_name = "managment-cidr-range"
    }
  }

  ip_allocation_policy {

  }
  

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

}
resource "google_container_node_pool" "nodepool" {
  name       = "nodepool"
  location   = "us-central1-a"
  cluster    = google_container_cluster.private-cluster.id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    # custom service account
    service_account = google_service_account.node-service-account.email
    oauth_scopes = [
         "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
        "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
