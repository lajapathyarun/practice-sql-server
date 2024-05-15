
-- Group BY - Count (Find the duplicate data)
SELECT [name], COUNT(*) FROM [dbo].[tblProduct]
GROUP BY [name] HAVING COUNT(*) > 1
ORDER BY [name] asc

-- PARTITION BY & OVER Clause - (Get Top 1 record from each group)
WITH duplicateData AS (
  SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY [NAME] ORDER BY [NAME] ASC) AS rownumber
  FROM ApplicationSummaryDataUpload
)
SELECT * FROM duplicateData
WHERE rownumber = 1;