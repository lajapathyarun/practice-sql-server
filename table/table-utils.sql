-- CLONE / BACKUP TABLE

DECLARE @sourceTable AS NVARCHAR(max) = N'ECommerce.dbo.tblproduct'
DECLARE @bkpTable AS NVARCHAR(max) = CONCAT('DataBackup.bkp.',REPLACE(@sourceTable, '.','_'), FORMAT(GetDate(), 'yyyyMMdd_hhmmss'))

DECLARE @bkpTableCountSql AS NVARCHAR(max) = CONCAT('SELECT COUNT(*) FROM ', @bkpTable)
DECLARE @sourceTableCountSql AS NVARCHAR(max) = CONCAT('SELECT COUNT(*) FROM ', @sourceTable)

DECLARE @sql AS NVARCHAR(max) = 'SELECT * INTO @bkpTable FROM @sourceTable'
SET @sql = REPLACE(@sql,'@sourceTable', @sourceTable)
SET @sql = REPLACE(@sql,'@bkpTable', @bkpTable)

print @sql
print @bkpTableCountSql
print @sourceTableCountSql

EXECUTE sp_executesql @sql
EXECUTE sp_executesql @bkpTableCountSql
EXECUTE sp_executesql @sourceTableCountSql