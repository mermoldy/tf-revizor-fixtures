provider "google" {
  credentials = var.scalr_google_credentials
  project     = var.scalr_google_project
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}


resource "google_compute_instance" "default" {
  name         = "TF-test"
  machine_type = "n1-standard-1"
  zone         = "asia-northeast1"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "gce-uefi-images/windows-1803-core"
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_compute_subnetwork" "default" {
  name                     = "test-network"
  ip_cidr_range            = "10.127.0.0/20"
  network                  = "${google_compute_network.default.self_link}"
  region                   = "us-central1-a"
  private_ip_google_access = true
}

data "google_client_config" "current" {}

data "google_container_engine_versions" "default" {
  project = "scalr-labs"
  zone = "us-central1-a"
}

resource "google_compute_disk" "default" {
  name  = "test-disk"
  labels = {
    environment = "dev"
  }
  image = "gce-uefi-images/windows-1803-core"
  physical_block_size_bytes = 4096
}
