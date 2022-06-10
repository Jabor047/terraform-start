terraform {
    required_versions = ">= 0.13.0" 
    required_providers {
        gcp = {
            source = "hashicorp/google-cloud-provider"
            version = "~> 4.9.0"
        }
    }
}