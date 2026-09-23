resource "docker_image" "api" {
  name = "nmatsui/hello-world-api:latest"
}

resource "docker_container" "api" {
  name  = "api-${terraform.workspace}"
  image = docker_image.api.image_id

  ports {
    internal = 3000
    external = var.api_server_port[terraform.workspace]
  }
}
