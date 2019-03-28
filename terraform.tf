provider "google" {
  credentials = "${file(var.gcp_credentials_file)}"
  project     = "${var.gcp_project}"
  region      = "asia-east1"
}

resource "google_container_cluster" "primary" {
  name               = "example-cloud-armor"
  location           = "asia-east1-b"
  initial_node_count = 1

  master_auth {
    username = ""
    password = ""
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}

resource "google_compute_global_address" "load_balancer" {
  name = "example-cloud-armor"
}

resource "google_compute_security_policy" "policy" {
  name = "example-cloud-armor"

  rule {
    action   = "allow"
    priority = "0"

    match {
      versioned_expr = "SRC_IPS_V1"

      config {
        src_ip_ranges = ["${var.allow_ips}"]
      }
    }
  }

  rule {
    action   = "deny(403)"
    priority = "2147483647"

    match {
      versioned_expr = "SRC_IPS_V1"

      config {
        src_ip_ranges = ["*"]
      }
    }

    description = "Default rule: deny all"
  }
}
