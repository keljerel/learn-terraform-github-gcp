# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }

  metadata = {
    "ssh-keys" = <<EOT
    kbuxton:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+e5HO//4LPF02HUNlwuLvLRQa6BZhOnPc3DYVrQor7dVJr5QyVX1qmLEReJHzq7bq3qdtQdNS8emJoBtR7BjRCxUS/eI3JAfF/YfJgeperA1LfEtpoTH0O+uDPznWA78hnmaFfrd/KmrAQJ81c0gnDOqHUCpMVeITYeMpV99TavxL3FO+ZTQFKWnuOmIYh8jqSrcx6i6V65AAaEQfPsON+/U1AIjyjw/IyoB1347+NKeIaKgJJZRIeWOtkYENuRe0DgeJ8fIVGNu8x1C7L10duSjIuN5cGwipqHyU5TXqNOGqxvdNjNwohGxFMDGGLJ1rFmuldZURxrPq9ypJXR19 kbuxton
    EOT
  }
}
resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
