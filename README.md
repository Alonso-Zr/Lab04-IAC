# Lab 04 IaC
# Laboratorio 

Este proyecto utiliza Terraform y Docker para desplegar dos entornos independientes: **DEV** y **QA**. Cada entorno reproduce la misma arquitectura de tres servicios:

| Servicio | Función | DEV | QA |
|---|---|---:|---:|
| Frontend | Servidor web Nginx | `4001:80` | `5001:80` |
| Backend | API Node.js | `4002:3000` | `5002:3000` |
| Base de datos | PostgreSQL | `4003:5432` | `5003:5432` |

Terraform utiliza *workspaces* para crear una instancia de cada servicio por entorno. Los nombres y puertos cambian según el workspace, mientras que las imágenes Docker se reutilizan.

Cada entorno tiene dos redes: una conecta el frontend con la API y otra conecta la API con PostgreSQL. DEV y QA tienen sus propios contenedores y redes.

**Alcance:** la replicación corresponde a la arquitectura de los entornos; no incluye replicación de datos entre las bases de datos. Los servicios de ejemplo tampoco implementan una integración funcional entre sí.