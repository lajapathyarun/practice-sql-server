-- UPDATE SIMPLE
UPDATE [dbo].[tblProduct]
SET NAME = 'product new 1'
WHERE Id= 1

-- CTE UPDATE JOIN - CTE plus Join Multiple Tables (Update sync changes to tblCategorySync for Id = 1)
WITH
    updatedata
    AS
    (
        SELECT *
        FROM [dbo].[tblCategory]
        Where Id = 1
    )
update u
set c.Name =  u.Name
FROM [dbo].[tblCategorySync] c
    LEFT JOIN updatedata u ON p.Id = c.Id