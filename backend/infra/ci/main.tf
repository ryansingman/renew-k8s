provider "google" {
  project = var.project_id
  region  = var.region
}

provider "github" {}

# Create a user account for the CI pipelines
resource "google_service_account" "backend_ci_sa" {
  account_id   = "backend-ci-sa"
  display_name = "Backend CI Service Account"
}

# Allow CI pipelines to administrate GKE clusters, push to GCR, and deploy to GKE
resource "google_project_iam_member" "backend_ci_iam" {
  project = "renew-k8s"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.backend_ci_sa.email}"
}

resource "google_service_account_key" "backend_ci_sa_key" {
  service_account_id = google_service_account.backend_ci_sa.id
}

# Create a GitHub Actions secret for the service account key + email
resource "github_actions_secret" "backend_ci_sa_key" {
  repository = "renew-k8s"
  secret_name = "BACKEND_CI_SA_KEY"
  plaintext_value = google_service_account_key.backend_ci_sa_key.private_key
}

resource "github_actions_secret" "backend_ci_sa_email" {
  repository = "renew-k8s"
  secret_name = "BACKEND_CI_SA_EMAIL"
  plaintext_value = google_service_account.backend_ci_sa.email
}
