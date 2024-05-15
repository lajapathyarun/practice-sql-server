-- INSERT SIMPLE - SIGNLE/MULTIPLE DATA
INSERT INTO [dbo].[tblProduct]
    (Id,
    Name)
VALUES
    (3, 'Product 1'),
    (3, 'Product 2')


--CTE INSERT JOIN - CTE plus Join Multiple Tables (Insert sync changes to tblCategorySync for Id = 1)
WITH
    insertdata
    AS
    (
        SELECT *
        FROM [dbo].[tblProduct]
        Where CategoryId = 1
    )
INSERT INTO dbo.tblCategorySync
    (Id, Name)
SELECT c.Id, c.Name
FROM insertdata p
    LEFT JOIN [dbo].[tblCategory] c ON p.CategoryId = c.Id
WHERE p.Id IS not null







