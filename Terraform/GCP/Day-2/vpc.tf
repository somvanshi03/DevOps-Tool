resource "google_compute_network" "terraform-vpc" {
  name                    = "terraform-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "terraform-subnet" {
  name          = "terraform-subnet"
  network       = google_compute_network.terraform-vpc.self_link
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
}

resource "google_compute_firewall" "terraform-firewall" {
  name    = "terraform-firewall"
  network = google_compute_network.terraform-vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["22", "3389", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
