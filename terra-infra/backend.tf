terraform {
  backend "gcs" {
    bucket  = "mohmadsabri98"
    prefix  = "terraform/state"
  }
}
