terraform {
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

# Configurarea providerului GCP
provider "google" {
  project     = "ID-UL-PROIECTULUI-TAU-GCP" # Înlocuiește cu ID-ul real al proiectului tău din Google Cloud Console
  region      = "europe-west1"             # Regiune europeană optimă pentru latență mică în Irlanda
}

# Crearea Bucket-ului în Google Cloud Storage
resource "google_storage_bucket" "resume_bucket" {
  name          = "my-unique-gcp-resume-bucket-2026" # Schimbă cu un nume unic la nivel global
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

# Output pentru a vedea link-ul public direct după rulare
output "website_url" {
  value       = "https://googleapis.com{google_storage_bucket.resume_bucket.name}/index.html"
  description = "URL-ul public al CV-ului tău găzduit în Google Cloud"
}
