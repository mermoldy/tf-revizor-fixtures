provider "google" {
  credentials = var.scalr_google_credentials
  project     = var.scalr_google_project
  region      = "us-central1"
  }

resource "google_compute_instance" "default" {
  name         = "tf-test-gce"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"
   network_interface {
    # A default network is created for all GCP projects
    network       = "terraform-network"
    access_config {
    }
   }

  tags = ["foo", "bar"]
boot_disk {
 initialize_params {
    image = "gce-uefi-images/windows-1803-core"
   }
  }
 }

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network6660"
  auto_create_subnetworks = "true"
}

resource "google_compute_network" "default" {
  name                    = "test-network000"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name                     = "test-network700"
  ip_cidr_range            = "10.127.0.0/20"
  network                  = "${google_compute_network.default.self_link}"
  region                   = "us-central1"
  private_ip_google_access = true
}

data "google_client_config" "current" {}

data "google_container_engine_versions" "default" {
  project = "scalr-labs"
  location = "us-central1-a"
}



#resource "google_sql_database_instance" "master" {
#	name = "master-instance"
 # 	database_version = "MYSQL_5_6"
  # 	master_instance_name = "kkotovtestqa"
  #	region = "us-central1"
#	
#
 #       settings {
  #  	    tier = "db-f1-micro"
#
 #    	    ip_configuration {
  #     		ipv4_enabled = false
   #    		private_network = "${google_compute_network.default.self_link}"
    #	    }
     #  		
    	#    activation_policy = "ALWAYS"
         #   disk_size = 10
        #    disk_type = "PD_HDD"
         #   backup_configuration {
          #         enabled = false
           # }
#
#		}
#
 #           replica_configuration {
  #          }
   #     }


#resource "google_compute_disk" "default" {
 # zone         = "us-east1-b"
  #name  = "k.kotov-testdisk"
  #labels = {
   # environment = "dev"
  #}
  #image = "gce-uefi-images/windows-1803-core"
  #physical_block_size_bytes = 4096
#}

#resource "google_container_cluster" "terraform_cluster_1" {
 # name               = "terraform-network"
  #location           = "us-east1-b"
#  initial_node_count = 1
 # network            = "${google_compute_subnetwork.default.name}"
 # subnetwork         = "${google_compute_subnetwork.default.name}"
 # enable_legacy_abac = true
  #remove_default_node_pool = true

#  provisioner "local-exec" {
#    when    = "destroy"
#    command = "sleep 90"
#  }
#}
