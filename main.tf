terraform {
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  # Fixed backend storage token provider routing
  backend "gcs" {
    bucket                      = "tf-state-project-1f84e1ec-fa9e-4a59-9ba"
    prefix                      = "terraform/state"
    impersonate_service_account = "github-actions-deployer@://gserviceaccount.com"
  }
}

# The rest of your main.tf stays exactly the same below...


# The rest of your main.tf remains exactly the same below...
provider "google" {
  project     = "project-1f84e1ec-fa9e-4a59-9ba" 
  region      = "europe-west1"             
}

resource "google_storage_bucket" "resume_bucket" {
  name          = "danielone1987-cloud-resume-2026" 
  location      = "EUROPE-WEST1"
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "index.html"
  }
}

resource "google_storage_bucket_iam_member" "public_rule" {
  bucket = google_storage_bucket.resume_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

output "website_url" {
  value       = "https://googleapis.com{google_storage_bucket.resume_bucket.name}/index.html"
  description = "URL-ul public al CV-ului tău găzduit în Google Cloud"
}


