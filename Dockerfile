# Etapa 1: Compilação com Java 25 e Gradle Wrapper
FROM eclipse-temurin:25-jdk AS build
WORKDIR /app
COPY . .
RUN chmod +x gradlew
RUN ./gradlew bootJar -x test

# Etapa 2: Imagem final para execução
FROM eclipse-temurin:25-jdk
WORKDIR /app
COPY --from=build /app/build/libs/*-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
