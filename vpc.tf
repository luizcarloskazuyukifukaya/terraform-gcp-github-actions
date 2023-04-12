# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  #name                    = "${var.project_id}-vpc-2"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  #name          = "${var.project_id}-subnet-2"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}

# Firewall rule
resource "google_compute_firewall" "sg_appliance" {
  name    = "${var.project_id}-app-firewall"
  network       = google_compute_network.vpc.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = [ "22", "443", "31000", "31001", "8080", "8081" ]
  }
   source_ranges = [ "0.0.0.0/0" ] // Only for test purpose (not secure)
   //source_ranges = [ "10.0.0.0/24" ] // Only within the subnet range
   //source_ranges = ["${var.restricted_src_address}"]  // for real
}
