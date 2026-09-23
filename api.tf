resource "docker_image" "api" {
  name         = "nmatsui/hello-world-api:latest"
}

resource "docker_container" "api" {
  name  = "api-${terraform.workspace}"
  image = docker_image.api.image_id

  networks_advanced {
    name = docker_network.frontend_api.name
  }

  networks_advanced {
    name = docker_network.api_db.name
  }

  ports {
    internal = 3000
    external = var.api_server_port[terraform.workspace]
  }
}