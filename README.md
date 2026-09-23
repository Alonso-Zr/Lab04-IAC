# Lab 04 IaC
# Laboratorio 

Despliega dos entornos, **DEV** y **QA**. Cada uno tiene un frontend Nginx, una API y una base de datos PostgreSQL.

## Requisitos

- Terraform instalado
- Docker Desktop abierto y en funcionamiento

## Despliegue

Clona el repositorio y entra en la carpeta del proyecto:

```bash
git clone URL_DEL_REPOSITORIO
cd NOMBRE_DEL_REPOSITORIO
```

En macOS, indica a Terraform dónde encontrar Docker:

```bash
export DOCKER_HOST="unix://${HOME}/.docker/run/docker.sock"
```

Inicializa Terraform y despliega DEV:

```bash
terraform init
terraform workspace new dev
terraform apply
```

Despliega QA:

```bash
terraform workspace new qa
terraform apply
```

Si un workspace ya existe, usa `terraform workspace select dev` o `terraform workspace select qa` en lugar de `new`. En cada `apply`, introduce la contraseña de PostgreSQL cuando Terraform la solicite y confirma con `yes`.

## Puertos

| Servicio | DEV | QA |
|---|---:|---:|
| Frontend | localhost:4001 | localhost:5001 |
| API | localhost:4002 | localhost:5002 |
| PostgreSQL | localhost:4003 | localhost:5003 |

Comprueba los seis contenedores con:

```bash
docker ps
```

Cada entorno tiene sus propios contenedores y redes. Ambos usan las mismas imágenes como base; esta replicación de entornos no replica los datos de PostgreSQL. Las imágenes de ejemplo no implementan por sí solas las consultas entre frontend, API y base de datos.