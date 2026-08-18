# Cloud & DevOps Resume CI/CD Pipeline

This project hosts a responsive, modern engineering resume on Google Cloud Platform (GCP) using an automated GitOps workflow. It demonstrates core DevOps practices: Infrastructure as Code (IaC), Continuous Integration/Continuous Deployment (CI/CD), and modern Cloud Security.

## 🌍 Live Project URL
👉 **[https://storage.googleapis.com/danielone1987-cloud-resume-2026/index.html](https://storage.googleapis.com/danielone1987-cloud-resume-2026/index.html)**

---

## 🏗️ Architecture Overview

The system architecture consists of three main components:
1. **Frontend Hosting:** A high-performance, cost-effective static website hosted natively on a public Google Cloud Storage (GCS) bucket.
2. **Infrastructure as Code (IaC):** A complete **Terraform** architecture blueprint that provisions the web hosting infrastructure and maintains a permanent remote state tracker inside a secure GCS state bucket.
3. **CI/CD Automation:** A automated **GitHub Actions** deployment pipeline that triggers on every `git push` to compile, validate, and synchronize production assets.

---

## 🛠️ Tech Stack & Skills Demonstrated

* **Cloud Provider:** Google Cloud Platform (GCP)
* **Cloud Infrastructure Services:** Google Cloud Storage (GCS)
* **Infrastructure as Code (IaC):** Terraform (v1.9.x)
* **CI/CD Engine:** GitHub Actions
* **Cloud Security Implementation:** OpenID Connect (OIDC) & Workload Identity Federation (Keyless/Passwordless authentication via GCP IAM)
* **Frontend Tech:** Native HTML5 / CSS3 (No heavy external frameworks)

---

## 🔒 Security Implementation (Workload Identity Federation)

To maintain modern cloud security best practices, this pipeline **does not use static password keys or JSON credential files** stored inside GitHub Secrets. 

Instead, it implements **Workload Identity Federation (OIDC)**:
* GitHub Actions requests a short-lived, encrypted OAuth2 access token directly from Google Cloud IAM.
* GCP verifies the incoming token signature against the target repository identity (`danielone1987/cloud-resume-pipeline`).
* The runner assume the administrative role securely to execute configuration updates, significantly lowering the project attack surface.
