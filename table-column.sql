
-- ADD COLUMN - NULLABLE
ALTER TABLE [dbo].[tblProduct] ADD [Description] [NVARCHAR](500) NULL;

-- ADD COLUMN - NON NULLABLE
ALTER TABLE [dbo].[tblProduct] ADD [Description] [NVARCHAR](500) NOT NULL;

--	MODIFY COLUMN
ALTER TABLE [dbo].[tblProduct] ALTER COLUMN [Description] [NVARCHAR](1000);

-- RENAME COLUMN
EXEC sp_rename @objname = '[dbo].[tblProduct].[Description]', @newname = 'Summary', @objtype = 'COLUMN';

-- DROP COLUMN
ALTER TABLE [dbo].[tblProduct] DROP COLUMN [Description];