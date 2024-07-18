package main

import (
	"database/sql"
	"fmt"
	"log"
	"os"

	_ "github.com/microsoft/go-mssqldb"
)

func sqlExecuteScalar(connectionString string, sqlStatement string) string {
	db, err := sql.Open("sqlserver", connectionString)
	if err != nil {
		log.Fatal("Open connection failed:", err.Error())
	}
	defer db.Close()

	err = db.Ping()
	if err != nil {
		log.Fatal("Ping failed:", err.Error())
	}

	var scalar string

	err = db.QueryRow(sqlStatement).Scan(&scalar)
	if err != nil {
		log.Fatal("Scan failed:", err.Error())
	}

	return scalar
}

func main() {
	connectionString := os.Getenv("MSSQL_CONNECTION_STRING")
	if connectionString == "" {
		log.Fatal("You MUST set the MSSQL_CONNECTION_STRING environment variable.")
	}

	fmt.Println("SQL Server Version:")
	fmt.Println(sqlExecuteScalar(connectionString, "select @@version"))

	fmt.Println("Random Quote:")
	fmt.Println(sqlExecuteScalar(connectionString, "select top 1 Text + ' -- ' + Author from Quotes order by newid()"))
}
