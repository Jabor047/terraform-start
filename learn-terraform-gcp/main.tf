terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.9.0"
    }
  }
}

provider "google" {
  credentials = file("~/Projects/mlflow-deployment-gcp/key.json")

  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags = ["web", "dev"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {

    }
  }
}