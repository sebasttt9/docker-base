Práctica servidor web
1. Título

Automatización del despliegue de una aplicación backend con Docker, Docker Compose, PostgreSQL y pgAdmin en un entorno local

2. Tiempo de duración

60 minutos (1 hora), incluyendo instalación, configuración, pruebas y documentación.

3. Fundamentos

Para automatizar el despliegue de una aplicación backend moderna es fundamental comprender tecnologías como Docker, Docker Compose y la arquitectura multi-contenedor. Docker permite empaquetar aplicaciones y sus dependencias dentro de “contenedores”, que son entornos ligeros, portables y aislados del sistema operativo anfitrión. Esto garantiza que la aplicación funcionará igual en cualquier máquina, eliminando errores por diferencias entre entornos.

Docker Compose complementa esta herramienta permitiendo definir múltiples contenedores en un solo archivo YAML, facilitando crear redes internas, volúmenes persistentes y la orquestación completa de una aplicación. En esta práctica, se automatiza el despliegue de una aplicación Java Spring Boot junto con una base de datos PostgreSQL y su panel de administración pgAdmin.

PostgreSQL es un gestor de bases de datos relacional robusto y ampliamente utilizado en entornos empresariales. Para acceder visualmente a él, se emplea pgAdmin, una herramienta web que facilita la administración de bases, usuarios, roles y consultas. Ambos servicios se levantan mediante Docker Compose, conectados entre sí a través de una red interna.

Otro concepto fundamental es Dockerfile, que define cómo construir la imagen de la aplicación backend. Aquí se utiliza una técnica importante llamada multi-stage build, la cual permite crear imágenes más ligeras separando el proceso de construcción del entorno final donde correrá la aplicación. En el primer “stage”, se compila el código (por ejemplo, usando Maven o Gradle), y en el segundo solo se copia el artefacto final, reduciendo significativamente el tamaño de la imagen.

Esta automatización permite que el despliegue sea reproducible, rápido y confiable. El usuario solo necesita ejecutar un comando:
docker compose up --build -d, y todo el sistema se levanta automáticamente.


4. Conocimientos previos

Para realizar esta práctica, se usaron los comandos aprendidos en clases pregrabadas

Comandos básicos de Linux (cd, ls, mkdir, cat, etc.)

Manejo básico de Git y GitHub

Uso general de navegadores web

Conceptos iniciales de backend (APIs REST)

Nociones básicas de contenedores

Instalación de software en Windows/Linux/Mac

Funcionamiento general de Docker Desktop

5. Objetivos a alcanzar

Implementar contenedores con PostgreSQL y pgAdmin usando Docker Compose.

Crear la imagen de una aplicación backend con Dockerfile.

Levantar los contenedores de forma automatizada.

Manipular archivos de configuración en YAML.

Asegurar la persistencia de datos mediante volúmenes.

Establecer redes internas para comunicación entre contenedores.

Aplicar técnicas de multi-stage build para optimización.

6. Equipo necesario

Computador con Windows / Linux / macOS.

Docker Desktop instalado (versión recomendada: 4.x o superior).

Docker Engine 20+.

Docker Compose V2.

Editor de código (VS Code recomendado).

Acceso a Git para clonar el repositorio.

Navegador web moderno (Chrome / Firefox).

7. Material de apoyo

Documentación oficial de Docker

Guía de asignatura

Cheat sheet de comandos Linux

Documentación de PostgreSQL

Documentación de pgAdmin

Documentación de Spring Boot (si aplica)

8. Procedimiento
Paso 1: Clonar el proyecto base
git clone https://github.com/maguaman2/tendencias-mar22-security.git

Paso 2: Crear el archivo docker-compose.yml

Se definieron tres servicios:

postgres

pgadmin

backend (aplicación personalizada)

Paso 3: Configurar volúmenes y redes

Se creó:

Volumen persistente para PostgreSQL

Red interna “backend-net”

Paso 4: Generar el Dockerfile de la aplicación backend

Se implementó un Dockerfile multi-stage:

Etapa 1: construcción de la aplicación

Etapa 2: ejecución del artefacto final

Paso 5: Crear archivo .env

Incluyendo:

POSTGRES_USER

POSTGRES_PASSWORD

PGADMIN_EMAIL

PGADMIN_PASSWORD

DB_HOST

DB_NAME

Paso 6: Levantar todo el entorno

Ejecutar:

docker compose up --build -d

Paso 7: Acceso a pgAdmin

Abrir en navegador:

http://localhost:5050

Ingresar credenciales del .env

Conectar a PostgreSQL usando el host interno postgres

Paso 8: Probar el backend

Acceder a:

http://localhost:8080

9. Resultados esperados

Al finalizar la práctica, el usuario debe obtener:

Los tres contenedores funcionando: backend, PostgreSQL y pgAdmin.

La base de datos con persistencia garantizada mediante volúmenes.

Acceso a pgAdmin vía navegador para administración visual.

La aplicación backend comunicándose correctamente con PostgreSQL.

Un despliegue completamente automatizado usando Docker Compose.

Imagen del backend optimizada mediante multi-stage build.

10. Bibliografía

Álvarez, J. (2023). Introducción a Docker y contenedores. TechBooks.

Docker Inc. (2024). Docker documentation. https://docs.docker.com

PostgreSQL Global Development Group. (2023). PostgreSQL documentation. https://www.postgresql.org/docs/

pgAdmin Team. (2024). pgAdmin documentation. https://www.pgadmin.org/docs/

Richardson, C. (2018). Microservices Patterns. Manning.

Turnbull, J. (2021). The Docker Book: Containerization is the new virtualization.
