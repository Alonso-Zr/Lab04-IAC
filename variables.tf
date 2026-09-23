variable "web_server_port" {
  description = "Puerto externo de Nginx por workspace."
  type        = map(number)

  default = {
    default = 3000
    dev     = 4001
    qa      = 5001
  }
}

variable "api_server_port" {
  description = "Puerto externo de Node.js por workspace."
  type        = map(number)

  default = {
    default = 3001
    dev     = 4002
    qa      = 5002
  }
}

variable "database_port" {
  description = "Puerto externo de PostgreSQL por workspace."
  type        = map(number)

  default = {
    default = 3002
    dev     = 4003
    qa      = 5003
  }
}

variable "db_password" {
  description = "Contraseña de PostgreSQL. Se proporciona al ejecutar Terraform."
  type        = string
  sensitive   = true
}