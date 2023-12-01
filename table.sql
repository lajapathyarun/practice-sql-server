-- RENAME TABLE
EXEC sp_rename @objname = N'[dbo].[Category]', @newname = N'tblCategory', @objtype = N'OBJECT'

