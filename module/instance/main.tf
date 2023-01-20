resource "google_compute_instance" "default" {
  name                      = var.instance_name
  machine_type              = var.machine_type
  zone                      = var.zone
  labels                    = var.labels
  tags                      = var.tags
  deletion_protection       = var.deletion_protection
  min_cpu_platform          = var.min_cpu_platform
  allow_stopping_for_update = var.allow_stopping_for_update
  network_interface {
    network = var.network
  }
  boot_disk {
    auto_delete = var.auto_delete
    device_name = var.device_name
    mode        = var.mode

    initialize_params {
      size  = var.size
      type  = var.type
      image = var.image
    }
  }

  attached_disk {
    source      = var.source_name
    device_name = var.device_name
    mode        = var.mode
  }

  service_account {
    email  = var.email
    scopes = ["cloud-platform"]
  }
}
