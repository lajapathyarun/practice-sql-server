-- INSERT - BackUp to existing table - Partial or full data
INSERT INTO [bkp].[tblProduct]
SELECT *
FROM [dbo].[tblProduct] p
WHERE p.CategoryId = 1

--CLONE - BackUp as new table - Partial or full data
SELECT *
INTO [bkp].[tblProduct]
FROM [dbo].[tblProduct] p
WHERE p.CategoryId = 1

-- COPY NOT EXISTS Data 
INSERT INTO [dbo].[tblProduct]
SELECT *
FROM [stage].[tblProduct] stage
WHERE NOT EXISTS ( SELECT 0/0
FROM dbo.[tblProduct] existing
where existing.Id = stage.Id)

-- COPY Specific Columns Data to Another Table
INSERT INTO [stage].[tblProduct]
    (Id,Name)
SELECT Id,
    Name
FROM dbo.tblProduct
WHERE Id = 3;

-- COPY All Columns Data to Another Table
INSERT INTO [stage].[tblProduct]
SELECT *
FROM dbo.tblProduct

-- CREATE TABLE & COPY All Columns Data.
SELECT *
INTO [bkp].[tblProduct]
FROM [dbo].[tblProduct];

-- CREATE TABLE & COPY SPECIFIC Columns Data.
SELECT Id,
    Name
INTO [bkp].[tblProduct]
FROM [dbo].[tblProduct];

-- CREATE TABLE & COPY SPECIFIC Columns Data based on Filter.
SELECT Id,
    Name
INTO [bkp].[tblProduct]
FROM [dbo].[tblProduct]
WHERE Id = 3;

-- CREATE TABLE & COPY SPECIFIC Columns Data based on Mutiple Tables.
SELECT tp.Name AS ProductName, tc.Name AS CategoryName
INTO [bkp].[tblProduct]
FROM [dbo].[tblProduct] tp JOIN [dbo].[tblCategory] tc ON tp.CategoryId = tc.Id
WHERE Id = 3;

-- CREATE EMPTY TABLE.
SELECT *
INTO [bkp].[tblProduct]
FROM [dbo].[tblProduct]
WHERE 1 = 0;
