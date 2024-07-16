import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Example {
    public static void main(String[] args) throws Exception {
        String connectionString = System.getenv("MSSQL_CONNECTION_STRING");

        if (connectionString == null) {
            throw new Exception("You MUST set the MSSQL_CONNECTION_STRING environment variable.");
        }

        System.out.println("SQL Server Version:");
        System.out.println(queryScalar(connectionString, "select @@version"));

        System.out.println("Random Quote:");
        System.out.println(queryScalar(connectionString, "select top 1 Text + ' -- ' + Author from Quotes order by newid()"));
    }

    private static String queryScalar(String connectionString, String sql) throws Exception {
        try (Connection connection = DriverManager.getConnection(connectionString)) {
            try (Statement statement = connection.createStatement()) {
                try (ResultSet resultSet = statement.executeQuery(sql)) {
                    if (resultSet.next()) {
                        return resultSet.getString(1);
                    }
                    return null;
                }
            }
        }
    }
}
