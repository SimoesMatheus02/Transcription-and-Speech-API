# Etapa 1: Compilação com Java 25 e Gradle Wrapper
FROM eclipse-temurin:25-jdk AS build
WORKDIR /app

# 1. Copia apenas os arquivos do Gradle primeiro para aproveitar o cache de dependências
COPY gradlew .
COPY gradle ./gradle
COPY build.gradle* settings.gradle* ./
RUN chmod +x gradlew
RUN ./gradlew dependencies --no-daemon

# 2. Copia o código-fonte e gera o JAR executável
COPY src ./src
RUN ./gradlew bootJar --no-daemon -x test

# Etapa 2: Imagem final enxuta (JRE em vez de JDK)
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app

COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080

# Otimizado para os 512MB de RAM do plano gratuito do Render + porta dinâmica (${PORT})
ENTRYPOINT ["java", \
  "-Xmx256m", \
  "-Xms128m", \
  "-XX:MaxMetaspaceSize=128m", \
  "-Xss256k", \
  "-XX:+UseSerialGC", \
  "-jar", "app.jar", \
  "--server.port=${PORT:8080}"]
