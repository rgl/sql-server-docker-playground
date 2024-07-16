import os
import pyodbc

# see http://mkleehammer.github.io/pyodbc/
def sql_execute_scalar(connection_string, sql):
    with pyodbc.connect(connection_string) as connection:
        with connection.cursor() as cursor:
            cursor.execute(sql)
            return cursor.fetchval()

connection_string = os.environ.get('MSSQL_CONNECTION_STRING')

if not connection_string:
    raise Exception('You MUST set the MSSQL_CONNECTION_STRING environment variable.')

print('SQL Server Version:')
print(sql_execute_scalar(connection_string, 'select @@version'))

print('Random Quote:')
print(sql_execute_scalar(connection_string, "select top 1 Text + ' -- ' + Author from Quotes order by newid()"))
