resource "docker_network" "frontend_api" {
  name = "frontend-api-${terraform.workspace}"
}

resource "docker_network" "api_db" {
  name = "api-bd-${terraform.workspace}"
}
