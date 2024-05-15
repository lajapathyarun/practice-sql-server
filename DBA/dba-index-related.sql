-- DMV (INDEX RELATED)

--sys.dm_db_index_usage_stats
SELECT
    DB_NAME(ddius.database_id) AS DatabaseName,
    OBJECT_NAME(ddius.object_id) AS TableName,
    i.name AS IndexName,
    ddius.*
FROM sys.dm_db_index_usage_stats ddius
    JOIN sys.indexes i ON i.object_id = ddius.object_id AND i.index_id = ddius.index_id
WHERE ddius.database_id = DB_ID()


-- sys.dm_db_index_physical_stats()
SELECT
    DB_NAME(ddips.database_id) AS DatabaseName,
    OBJECT_NAME(ddips.object_id) AS TableName,
    i.name AS IndexName,
    ddips.*
FROM sys.dm_db_index_physical_stats(DB_ID(), OBJECT_ID('tblProduct'), NULL, NULL, 'DETAILED') ddips
    JOIN sys.indexes i ON i.object_id = ddips.object_id AND i.index_id = ddips.index_id
WHERE ddips.database_id = DB_ID()

--sys.dm_db_missing_index_details
SELECT
    DB_NAME(ddmid.database_id) AS DatabaseName,
    OBJECT_NAME(ddmid.object_id) AS TableName,
    ddmid.*
FROM sys.dm_db_missing_index_details ddmid
WHERE ddmid.database_id = DB_ID()

SELECT
    DB_NAME(mid.database_id) AS DatabaseName,
    OBJECT_NAME(mid.object_id) AS TableName,
    mig.*, mid.statement AS TableName, mic.column_name, mic.column_usage
FROM sys.dm_db_missing_index_details mid
CROSS APPLY sys.dm_db_missing_index_columns(mid.index_handle) mic
    INNER JOIN sys.dm_db_missing_index_groups AS mig ON mig.index_handle = mid.index_handle
WHERE mid.database_id = DB_ID()