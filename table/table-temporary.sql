
-- Temporary Table
CREATE TABLE #tempdata
(
    Id UNIQUEIDENTIFIER PRIMARY KEY
);

INSERT INTO #apps (Id)
Select Id from dbo.tblproduct

DROP TABLE IF EXISTS #tempdata;

-- Temporary Table Variable
DECLARE @TableCounts TABLE ([Id] UNIQUEIDENTIFIER PRIMARY KEY, [Name] NVARCHAR(50) NOT NULL, [Count] INT NOT NULL)

INSERT INTO @TableCounts
SELECT  NEWID() AS [Id], 'tblProduct' AS [Name], COUNT(*) AS [Count] 
FROM dbo.tblProduct WITH (NOLOCK) 
GROUP by [CategoryId]

SELECT * FROM  @TableCounts