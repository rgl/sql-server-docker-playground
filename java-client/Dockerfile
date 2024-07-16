FROM gradle:8.9.0-jdk21 AS build
WORKDIR /build
COPY . .
# NB gradle build would also work, but having a fat jar is nicier for
#    distribution.
RUN gradle shadowJar --no-daemon

FROM eclipse-temurin:21
WORKDIR /app
COPY --from=build /build/build/libs/example-1.0.0-all.jar .
ENTRYPOINT ["java", "-jar", "example-1.0.0-all.jar"]
