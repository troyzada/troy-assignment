resource "google_compute_firewall" "allow_ssh" {
  name    = "sirclo-vpc-1-allow-ssh"
  network = google_compute_network.sirclo_vpc_1.name
  
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_http" {
  name    = "sirclo-vpc-1-allow-http"
  network = google_compute_network.sirclo_vpc_1.name

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_mysql" {
  name    = "sirclo-vpc-1-allow-mysql"
  network = google_compute_network.sirclo_vpc_1.name

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }
  source_ranges = ["10.20.0.0/24"]
}