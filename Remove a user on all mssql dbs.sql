--Drop the schema's. They WILL NOT get dropped if schema had objects
EXEC sp_MSForEachDB 'USE [?];
        IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N''USER_TO_DROP'')
        DROP SCHEMA [USER_TO_DROP]; '
 
--Drop the database users
EXEC sp_MSForEachDB 'USE [?];
        IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N''EU\USUBOLS'')
        DROP USER [USER_TO_DROP]; '


--Drop the login
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'USER_TO_DROP')
    DROP LOGIN [USER_TO_DROP];
