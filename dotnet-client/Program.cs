using System;
using Microsoft.Data.SqlClient;

class Program
{
    static void Main(string[] args)
    {
        var connectionString = Environment.GetEnvironmentVariable("MSSQL_CONNECTION_STRING");

        if (string.IsNullOrEmpty(connectionString))
        {
            throw new ApplicationException("You MUST set the MSSQL_CONNECTION_STRING environment variable.");
        } 

        Console.WriteLine("SQL Server Version:");
        Console.WriteLine(SqlExecuteScalar(connectionString, "select @@version"));

        Console.WriteLine("Random Quote:");
        Console.WriteLine(SqlExecuteScalar(connectionString, "select top 1 Text + ' -- ' + Author from Quotes order by newid()"));
    }

    private static object SqlExecuteScalar(string connectionString, string sql)
    {
        using var connection = new SqlConnection(connectionString);

        connection.Open();

        using var command = connection.CreateCommand();

        command.CommandText = sql;

        return command.ExecuteScalar();
    }
}
