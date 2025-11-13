resource "google_compute_network" "sirclo_vpc_1" {
  name                    = "sirclo-vpc-1"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sirclo_subnet_public" {
  name          = "sirclo-subnet-public"
  ip_cidr_range = "10.20.0.0/24"
  region        = var.gcp_region
  network       = google_compute_network.sirclo_vpc_1.id
}