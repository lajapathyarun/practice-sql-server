-- CREATE USER
USE [ECommerce]
GO
CREATE USER [user1] FOR LOGIN [loginuser1]
GO

-- ASSIGN USER to ROLES
USE [ECommerce]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user1]
GO

-- ASSIGN USER PERMISSION - Object Level
USE [ECommerce]
GO
GRANT INSERT ON [dbo].[tblProduct] TO [@user]
GRANT SELECT ON [dbo].[tblProduct] TO [@user]
GO

-- ASSIGN USER PERMISSION - Database Level
USE [ECommerce]
GO
GRANT INSERT TO [@user]
GRANT SELECT TO [@user]
GO

