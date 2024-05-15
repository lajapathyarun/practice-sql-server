-- TABLE Scan- Scan to end OF the table
-- INDEX seek - few number OF ROWS based ON the INDEX (WHERE clause)
-- INDEX scan - going through entire TABLE (NO WHERE clause)
-- Unique or Non Unique (Clustered | NonClustered)
-- Filtered Indices

--Unique Clustered Index
CREATE UNIQUE CLUSTERED INDEX idx_tblProduct
ON [dbo].[tblProduct] ([Id])

-- Index Seek
SELECT *
FROM [dbo].[tblProduct]
WHERE Id = 1

-- Non Clustered Index - Single Column
CREATE NONCLUSTERED INDEX idx_tblProduct_CategoryId
ON [dbo].[tblProduct] ([CategoryId])

-- Index Seek
SELECT CategoryId
FROM [dbo].[tblProduct]
WHERE CategoryId = 1

CREATE NONCLUSTERED INDEX idx_tblProduct_CreatedDate
ON [dbo].[tblProduct] ([CreatedDate])

-- Index Seek
SELECT CreatedDate, CategoryId
FROM [dbo].[tblProduct]
WHERE [CreatedDate] < GETDATE()

-- Non Clustered Index - Multiple Column
CREATE NONCLUSTERED INDEX idx_tblProduct_CreatedDate_CategoryId
ON [dbo].[tblProduct] ([CreatedDate],[CategoryId])

-- Filtered Indices
CREATE NONCLUSTERED INDEX idx_tblProduct_Name_Where_CategoryId
ON [dbo].[tblProduct] ([Name]) WHERE CategoryId = 1

-- Include
CREATE NONCLUSTERED INDEX idx_tblProduct_CategoryId
ON [dbo].[tblProduct1] ([CategoryId])
INCLUDE ([Name], [CreatedDate], [UpdatedDate])

-- Index Seek
SELECT [Name], [CreatedDate], [UpdatedDate]
FROM [dbo].[tblProduct1]
WHERE CategoryId BETWEEN 1 AND 3
