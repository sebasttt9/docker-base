# ---------- STAGE 1: BUILD ----------
FROM eclipse-temurin:21-jdk AS builder
WORKDIR /app

# Copiamos archivos de Maven para aprovechar cache
COPY pom.xml ./
COPY mvnw ./
COPY .mvn .mvn

# Descarga dependencias (optimiza builds futuros)
RUN chmod +x mvnw
RUN ./mvnw -B dependency:go-offline

# Copiamos el código fuente
COPY src src

# Compilamos el proyecto (crea el JAR en target/)
RUN ./mvnw -B package -DskipTests


# ---------- STAGE 2: RUNTIME (ligero y seguro) ----------
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

# Crear usuario no-root (mejora seguridad)
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser
USER appuser

# Copiar el jar desde builder
COPY --from=builder /app/target/*.jar app.jar

# Puerto que expone Spring Boot (puede ser 8080)
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
