variable "project" {
  default     = "nonexistent"
  type        = string
  description = "The google cloud platform project id"
}

variable "region" {
  default     = "europe-west1"
  type        = string
  description = "The default region to manage resources in"
}

variable "zone" {
  default     = "europe-west1-d"
  type        = string
  description = "The default zone to manage resources in"
}

provider "google" {
  project = var.project
  region = var.region
  zone = var.zone
}

provider "google-beta" {
  project = var.project
  region = var.region
  zone = var.zone
}
