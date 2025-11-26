# About

This is a SQL Server Docker playground.

Also see the SQL Server Windows playground at https://github.com/rgl/sql-server-vagrant.

# Usage

Install `docker` and `docker compose`.

Create the environment:

```bash
docker compose up --build --remove-orphans
```

In another shell, see the logs:

```bash
docker compose logs sql-server-init
docker compose logs dotnet-client
docker compose logs go-client
docker compose logs java-client
docker compose logs python-client
```

Destroy the environment:

```bash
docker compose down --volumes --remove-orphans --timeout=0
```

# Reference

* https://github.com/microsoft/mssql-docker
* https://hub.docker.com/r/microsoft/mssql-server
* [TDS 8.0](https://learn.microsoft.com/en-us/sql/relational-databases/security/networking/tds-8?view=sql-server-ver17) and [TLS 1.3 support](https://learn.microsoft.com/en-us/sql/relational-databases/security/networking/tls-1-3?view=sql-server-ver17)
