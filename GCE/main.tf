provider "google" {
  credentials = var.scalr_google_credentials
  project     = var.scalr_google_project
  }

resource "google_compute_instance" "default" {
  name         = "tf-test-gce"
  machine_type = "n1-standard-1"
  regio        = "us-central1"
   network_interface {
    network       = "terraform-network"
    subnetwork    = "terraform-subnetwork"
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
