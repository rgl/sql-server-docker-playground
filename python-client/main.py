import os
import mssql_python

# see https://github.com/microsoft/mssql-python
# see https://github.com/microsoft/mssql-python/wiki/Connection-to-SQL-Database
def sql_execute_scalar(connection_string, sql):
    with mssql_python.connect(connection_string) as connection:
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
