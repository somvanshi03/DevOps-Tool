resource "google_compute_instance" "ubuntu-vm" {
  name         = "ubuntu-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
      network_tier = "STANDARD"
    }
  }

  service_account { 
  email = "default" 
  scopes = ["cloud-platform"] 
  }
  
  shielded_instance_config {
    enable_integrity_monitoring = false
    enable_secure_boot          = false
    enable_vtpm                 = false
  }
  metadata = {
    ssh-keys = "your-username:ssh-rsa YOUR_SSH_KEY your-username"
  }
}
