-- CREATE LOGIN- Windows Group, Windows User
DECLARE @loginName AS NVARCHAR(255) = N'domain\loginuser1'
DECLARE @defaultDatabase AS NVARCHAR(255) = 'ECommerce'

DECLARE @sql AS NVARCHAR(255) = REPLACE(REPLACE('
        USE [master]
		CREATE LOGIN [@loginName] FROM WINDOWS WITH DEFAULT_DATABASE=[@defaultDatabase]','@loginName'
, @loginName),'@defaultDatabase',@defaultDatabase)

PRINT @sql
EXECUTE sp_executesql @sql

-- CREATE USER - Support for EntraID Email, Windows Group, Windows User
DECLARE @user AS NVARCHAR(255) = N''
DECLARE @db AS NVARCHAR(255) = 'ECommerce'

DECLARE @createUserSql AS NVARCHAR(255) = REPLACE(REPLACE('
        USE [@db]
		CREATE USER [@user] FROM LOGIN [@user]',
        '@user', @user),'@db',@db)

PRINT @createUserSql
EXECUTE sp_executesql @createUserSql

-- ASSIGN ROLES TO USER - Support for EntraID Email, Windows Group, Windows User
DECLARE @user AS NVARCHAR(255) = N''
DECLARE @db AS NVARCHAR(255) = 'ECommerce'

DECLARE @readerAccessSql AS NVARCHAR(255) = REPLACE(REPLACE('
        USE [@db]
		ALTER ROLE db_datareader ADD MEMBER [@user]','@user'
, @user),'@db',@db)

PRINT @readerAccessSql
EXECUTE sp_executesql @readerAccessSql

-- ASSIGN USER PERMISSION- Support for EntraID Email, Windows Group, Windows User
DECLARE @user AS NVARCHAR(255) = N''
DECLARE @db AS NVARCHAR(255) = 'ECommerce'

DECLARE @readerAccessSql AS NVARCHAR(max) = REPLACE(REPLACE('
        USE [@db]
		GRANT SELECT ON [dbo].[tblProduct] TO [@user]
		','@user', @user),'@db',@db)

PRINT @readerAccessSql
EXECUTE sp_executesql @readerAccessSql

