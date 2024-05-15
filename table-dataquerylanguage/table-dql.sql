-- CTE - Simple Select (Distinct data)
WITH distinctdata AS (
  SELECT distinct * FROM [dbo].[tblProduct]
)
SELECT * FROM distinctdata


-- LIKE Operator
SELECT * FROM [dbo].[tblProduct] WHERE [NAME] LIKE '%product 1%'

-- Function - Select Clause, Where Clause
SELECT REPLACE(NAME,' ', '') AS name1, * FROM [dbo].[tblProduct] WHERE REPLACE(NAME,' ', '') = UPPER('product 1')