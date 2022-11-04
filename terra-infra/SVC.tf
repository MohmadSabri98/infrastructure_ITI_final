resource "google_service_account" "node-service-account" {
  account_id = "gcptask"
}

resource "google_project_iam_binding" "node-service-account-iam" {
  project = "lateral-goods-366106"
  role    = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.node-service-account.email}",
  ]
}

resource "google_service_account" "vm-service-account" {
  account_id = "vm-service-account"
}

resource "google_project_iam_binding" "vm-service-account-iam" {
  project = "lateral-goods-366106"
  role    = "roles/container.admin"
  members = [
    "serviceAccount:${google_service_account.vm-service-account.email}",
  ]
}