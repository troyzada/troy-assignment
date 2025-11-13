resource "google_compute_instance" "sirclo_vm_wordpress" {
  name         = "sirclo-vm-wordpress"
  machine_type = "e2-micro"
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network    = google_compute_network.sirclo_vpc_1.id
    subnetwork = google_compute_subnetwork.sirclo_subnet_public.id

    access_config {}
  }

  tags = ["allow-ssh", "allow-http-8080"]

  metadata_startup_script = templatefile("${path.module}/startup-script.sh.tftpl", {
    repo_url     = var.git_repo_url
    db_name      = var.mysql_database
    db_user      = var.mysql_user
    db_pass      = var.mysql_password
    db_root_pass = var.mysql_root_password
})
  allow_stopping_for_update = true
}
output "vm_external_ip" {
  description = "IP publik VM WordPress"
  value       = google_compute_instance.sirclo_vm_wordpress.network_interface[0].access_config[0].nat_ip
}