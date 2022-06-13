resource "google_cloud_run_service" "default" {
  name     = "learn-terraform-cloud-run"
  project  = var.project_id
  location = var.region
  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
    metadata {
      annotations = {
        "cloud.google.com/project-id"          = var.project_id
        "autoscaling.knative.dev/maxScale"     = "1000"
        "run.googleapis.com/clousql-instances" = google_sql_database_instance.instance.connection_name
        "run.googleapis.com/client-name"       = "terraform-cloud-run"
      }
    }

  }
  autogenerate_revision_name = true
}

resource "google_sql_database_instance" "instance" {
  name             = "cloud-run-db-3"
  project          = var.project_id
  region           = var.region
  database_version = "MYSQL_5_7"
  settings {
    tier = "db-f1-micro"
  }
}