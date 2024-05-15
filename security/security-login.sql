-- WINDOWS Login
USE [master]
GO
CREATE LOGIN [domain\loginuser1] FROM WINDOWS WITH DEFAULT_DATABASE=[ECommerce]
GO

-- SQL LOGIN
USE [master]
GO
CREATE LOGIN [loginuser2] 
WITH PASSWORD=N'Password',
DEFAULT_DATABASE=[ECommerce], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

-- DROP LOGIN (Windows, SQL, EntraID)
USE [master]
GO
DROP LOGIN [loginuser1]
GO

-- DISABLE LOGIN (Windows, SQL, EntraID)
USE [master]
GO
ALTER LOGIN [loginuser1] DISABLE
GO

-- ENABLE LOGIN (Windows, SQL, EntraID)
USE [master]
GO
ALTER LOGIN [loginuser1] ENABLE
GO