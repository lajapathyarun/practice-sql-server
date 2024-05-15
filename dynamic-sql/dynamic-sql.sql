DECLARE @sql AS NVARCHAR(MAX) = N'SELECT * FROM tblProduct'
EXECUTE(@sql)

DECLARE @sql AS NVARCHAR(MAX) = N'SELECT * FROM tblProduct WHERE Id = @Id'
DECLARE @id AS INT = 10
EXECUTE sp_executesql @sql, N'@Id INT', @id