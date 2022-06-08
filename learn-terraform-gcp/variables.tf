variable "project_id" {
  description = "The Google Cloud project ID in which to provision the resources."
  type        = string
}

variable "region" {
  description = "The Google Cloud region in which to provision the resources."
  type        = string
  default = "europe-west2"
}

variable "zone" {
  description = "The Google Cloud zone in which to provision the resources."
  type        = string
  default = "europe-west2-a"
}