#resource "google_service_account" "default" {
#  account_id   = "my-custom-sa"
#  display_name = "Custom SA for VM Instance"
#}

resource "google_compute_instance" "default" {
  name         = "patel-vm2"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["terraform"]

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-2210-kinetic-amd64-v20230126"
      labels = {
        my_label = "terraform"
      }
    }
  }

  // Local SSD disk
  #scratch_disk {
  #  interface = "NVME"
  #}

  network_interface {
    network = "default"

 #   access_config {
  #    // Ephemeral public IP
   # }
  }

  #metadata = {
  #  foo = "Terraform"
  #}

#  metadata_startup_script = "echo hi > /test.txt"

 # service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  ## scopes = ["cloud-platform"]
  }
#}
