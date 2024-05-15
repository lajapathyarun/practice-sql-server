sp_help 'tblProduct'


SELECT * FROM sys.tables
SELECT * FROM sys.objects WHERE LOWER(name) LIKE '%product%'
-- DATABASE
SELECT * FROM sys.databases
SELECT * FROM sys.sysfilegroups
SELECT * FROM sys.sysfiles

-- BLOCKING
SELECT * FROM sys.dm_exec_sessions where [status] not in ('sleeping')

-- INDEX
SELECT * FROM sys.indexes WHERE OBJECT_ID = 1

-- SECURITY
select name, * from sys.syslogins



