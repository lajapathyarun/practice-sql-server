-- TRUNCATE DATA
Truncate Table [dbo].[tblProduct]

-- DELETE SIMPLE
DELETE FROM [dbo].[tblProduct]
WHERE Id = 1

-- DELETE JOIN - Join Multiple Tables (Delete Products mapped to removed category)
DELETE del FROM tblProduct p
    LEFT JOIN dbo.tblCategory c
    ON p.CategoryId = c.Id
			  WHERE c.Id IS NULL