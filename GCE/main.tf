provider "google" {
  credentials = var.scalr_google_credentials
  project     = var.scalr_google_project
  region =  "us-central1"
  }

resource "google_compute_instance" "default" {
  name         = "tf-test-gce"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"
   network_interface {
    # A default network is created for all GCP projects
    network       = "scalr-network"
    access_config {
    }
   }
  labels = {
    owner = "revizor"  
   }
boot_disk {
 initialize_params {
    image = "chef-centos7-devel"
   }
  }
 }

data "google_client_config" "current" {}

data "google_container_engine_versions" "default" {
  project = "scalr-labs"
  location = "us-central1-a"
}
