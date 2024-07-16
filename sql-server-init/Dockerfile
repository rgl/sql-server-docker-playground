# see https://github.com/microsoft/mssql-docker
# see https://hub.docker.com/r/microsoft/mssql-server
FROM mcr.microsoft.com/mssql/server:2022-latest
WORKDIR /opt
COPY --chmod=755 init.sh /opt/
COPY --chmod=444 init.sql /opt/
ENTRYPOINT ["./init.sh"]
