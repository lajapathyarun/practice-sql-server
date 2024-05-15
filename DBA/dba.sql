
EXECUTE sp_who
DBCC OPENTRAN WITH TABLERESULTS

-- Fragmentation - Find Row data and Index Data
DECLARE @dbId AS int = Db_id('ECommerce')
DECLARE @objectId AS int = Object_id('tblProduct')
DECLARE @indexId AS int = 8

SELECT a.index_id, NAME, avg_fragmentation_in_percent, fragment_count, avg_fragment_size_in_pages
FROM sys.dm_db_index_physical_stats(@dbId, @objectId, @indexId, NULL, NULL) AS a
    INNER JOIN sys.indexes b ON a.object_id = b.object_id AND a.index_id = b.index_id;

-- INDEX
ALTER INDEX [IX_tblProduct_Name] ON [dbo].[tblProduct] REORGANIZE;
ALTER INDEX [IX_tblProduct_Name] ON [dbo].[tblProduct] REBUILD;

-- DBCC CHECKTABLE
DBCC CHECKTABLE('tblProduct', 8 )
DBCC CHECKTABLE('tblProduct', REPAIR_ALLOW_DATA_LOSS )

--  Change - Single / Multi User
ALTER DATABASE [ECommerce] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DBCC CHECKTABLE('tblProduct', REPAIR_REBUILD)
ALTER DATABASE [ECommerce] SET MULTI_USER