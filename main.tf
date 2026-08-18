terraform {
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

# Configurarea providerului GCP folosind ID-ul tău real de proiect
provider "google" {
  project     = "project-1f84e1ec-fa9e-4a59-9ba" 
  region      = "europe-west1"             
}

# Crearea Bucket-ului în Google Cloud Storage (Numele trebuie să fie unic global)
resource "google_storage_bucket" "resume_bucket" {
  name          = "danielone1987-cloud-resume-2026" 
  location      = "EUROPE-WEST1"
  force_destroy = true

  # Setarea bucket-ului ca site web static
  website {
    main_page_suffix = "index.html"
    not_found_page   = "index.html"
  }
}

# Permisiuni Publice pentru ca oricine să poată vizualiza CV-ul (Read-Only)
resource "google_storage_bucket_iam_member" "public_rule" {
  bucket = google_storage_bucket.resume_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

# Output corectat pentru afișarea link-ului public direct după rulare
output "website_url" {
  value       = "https://googleapis.com{google_storage_bucket.resume_bucket.name}/index.html"
  description = "URL-ul public al CV-ului tău găzduit în Google Cloud"
}

