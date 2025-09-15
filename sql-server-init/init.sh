#!/bin/bash
set -eu

result="$(/opt/mssql-tools18/bin/sqlcmd \
    -C \
    -S sql-server \
    -U sa \
    -P "$MSSQL_SA_PASSWORD" \
    -d master \
    -b \
    -Q "select 1 from sys.databases where name = 'example'" \
    | tail -1)"

if [ "$result" != '(0 rows affected)' ]; then
    echo 'Database "example" already exists. Skipping the database initialization.';
    exit 0
fi

echo 'Initializing the database...'
/opt/mssql-tools18/bin/sqlcmd \
    -C \
    -S sql-server \
    -U sa \
    -P "$MSSQL_SA_PASSWORD" \
    -d master \
    -b \
    -i init.sql
