-- IF NOT EXITS
IF NOT EXISTS (SELECT name FROM dbo.tblProduct)
BEGIN
    PRINT 'NOT EXIST'
END
ELSE
BEGIN
    PRINT 'EXIST'
END

-- IF EXITS
IF EXISTS (SELECT serviceid
from tblservice)
BEGIN
    PRINT 'EXIST'
END