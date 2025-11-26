# syntax=docker/dockerfile:1.20

FROM gradle:9.2.1-jdk21 AS build
WORKDIR /build
COPY . .
# NB gradle build would also work, but having a fat jar is nicer for
#    distribution.
RUN gradle shadowJar --no-daemon

FROM eclipse-temurin:21
WORKDIR /app
COPY --from=build /build/build/libs/example-1.0.0-all.jar .
ENTRYPOINT ["java", "-jar", "example-1.0.0-all.jar"]
