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
  zone    = var.region
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}