resource "docker_image" "nginx" {
  name = "nginx:1.31.6"
}

resource "docker_container" "web" {
  name  = "web-${terraform.workspace}"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.web_server_port[terraform.workspace]
  }
}
