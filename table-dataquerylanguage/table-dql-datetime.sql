-- Filter DataType - DateTime
SELECT [Name], [CreatedDate], [UpdatedDate]
FROM [dbo].[tblProduct]
WHERE CreatedDate <= '2023-12-04 12:29:46' OR CreatedDate <= '2024-03-21'

-- Filters & Group data based on Month and Year
SELECT CAST(CreatedDate AS DATE) AS AddedDateOnly, count(*) as [Rows]
FROM tblProduct
WHERE MONTH (CreatedDate) = 11 AND YEAR(CreatedDate) = 2023
group by CAST (CreatedDate AS DATE)
ORDER BY AddedDateOnly ASC