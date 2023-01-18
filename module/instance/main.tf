resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  labels = list(map(string))
  tags = var.tags
  deletion_protection = var.deletion_protection
  min_cpu_platform = var.min_cpu_platform
  enable_display = var.enable_display
  allow_stopping_for_update = var.allow_stopping_for_update
  network_interface {
    network = var.network
    subnetwork =var.subnet
    network_ip = var.network_ip
    network_tier =var.network_tier


  }
  boot_disk {

    auto_delete = var.auto_delete
      device_name = var.device_name
      mode = var.mode
      
    initialize_params {
      size = var.size
      type = var.type
      image = var.image
      labels = {
        my_label = var.my_label
      }
    }
  }

  attached_disk {
    
    source = var.source
    device_name = var.device_name
    mode = var.mode
  }

 service_account {
   email = var.email
   scopes = var.scopes
 }

 shielded_instance_config {
   enable_secure_boot = var.enable_secure_boot
   enable_vtpm = var.enable_vtpm
   enable_integrity_monitoring = var.enable_integrity_monitoring
 }
  // Local SSD disk
  scratch_disk {
    interface = var.interface
  }

  network_interface {
    network = var.network

    access_config {
      // Ephemeral public IP
    }
  }
}