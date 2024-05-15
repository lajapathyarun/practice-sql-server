-- RENAME TABLE
EXEC sp_rename @objname = N'[dbo].[Product]', @newname = N'tblProduct', @objtype = N'OBJECT'

-- DROP TABLE
DROP TABLE IF EXISTS dbo.tblProduct
DROP TABLE dbo.tblProduct



