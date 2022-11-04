resource "google_compute_network" "myvpc" {
  name                    = "myvpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  mtu                     = 1460
}