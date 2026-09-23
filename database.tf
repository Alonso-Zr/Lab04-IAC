resource "docker_image" "postgres" {
  name = "postgres:16-alpine"
}

resource "docker_container" "db" {
  name  = "bd-${terraform.workspace}"
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_PASSWORD=${var.db_password}"
  ]

  ports {
    internal = 5432
    external = var.database_port[terraform.workspace]
  }
}