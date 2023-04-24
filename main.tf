# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
module "vm_compute_instance" {
  source  = "terraform-google-modules/vm/google//modules/compute_instance"
  version = "8.0.0"
  # insert the 1 required variable here
  instance_template = "my-first-template"
  hostname          = "module_instance"
  network           = "terraform-network"
}

