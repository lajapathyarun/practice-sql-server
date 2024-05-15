-- https://www.mssqltips.com/sqlservertip/6091/how-to-use-rowcount-in-sql-server/
-- @@rowcount,  SET NOCOUNT AND SET ROWCOUNT
CREATE OR Alter PROC spTestParam
    (@Id INT)
AS
BEGIN
    PRINT 'PRE ' + CAST(@Id AS VARCHAR(10))
    SELECT NEWID();
    PRINT 'POST'

    IF EXISTS (SELECT *
    FROM dbo.tblProduct
    WHERE id = @Id)
	BEGIN
        --IF NOT(@Id > 10)
        IF (@Id > 10)
			BEGIN
            PRINT 'Id Greater than 10'
        END
		ELSE
			BEGIN
            PRINT 'Id Less than 10'
        END
    END

    DECLARE @productCount AS INT = (SELECT COUNT(1)
    FROM dbo.tblProduct)

    DECLARE @productName AS VARCHAR(max)
    DECLARE @categoryId AS INT

    SELECT TOP 1
        @productName = Name, @categoryId = CategoryId
    FROM dbo.tblProduct

    PRINT @productCount
    PRINT @productName
    PRINT @categoryId
END;

GO

EXEC spTestParam @Id= 20

GO

EXEC spTest

GO

CREATE OR Alter PROC spTestParam
    (@Id INT)
AS
BEGIN
    PRINT 'PRE ' + CAST(@Id AS VARCHAR(10))
    SELECT NEWID();
    PRINT 'POST'

    DECLARE @productCount AS INT = (SELECT COUNT(1)
    FROM dbo.tblProduct)

    DECLARE @productName AS VARCHAR(max)
    DECLARE @categoryId AS INT

    SELECT TOP 1
        @productName = Name, @categoryId = CategoryId
    FROM dbo.tblProduct

    PRINT @productCount
    PRINT @productName
    PRINT @categoryId
END;

GO

EXEC spTestParam @Id= 9 

GO

CREATE OR Alter PROC spTestExceptionHandling
    (@Id INT)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
		IF @id = 9
		BEGIN
        -- Custom Exception will not propagate to next line
        --THROW 50010, 'Id cannot be 9', 1

        -- Custom Exception will  propagate to next line
        RAISERROR('Id cannot be 9',16, 1)
        PRINT 'Error propagated'
    END
	   --SELECT 10/0 
	END TRY
	BEGIN CATCH
		IF ERROR_NUMBER() = 8134
		BEGIN
        PRINT 'Custom Error Message: Divide by zero error encountered'
    END

		PRINT 'Error Message: ' + ERROR_MESSAGE()
		SELECT ERROR_MESSAGE() AS ErrorMessage, ERROR_PROCEDURE() AS ErrorProcedure

	END CATCH
END;

GO

EXEC spTestExceptionHandling @Id= 9 

GO

CREATE OR Alter PROC spWhileLoopTest
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @IntialValue AS INT = 1
    -- CONTINUE & BREAK could be used based on scenario.
    WHILE (@IntialValue < 5)
	BEGIN
        PRINT @IntialValue
        SET @IntialValue = @IntialValue + 1
    END
END;

GO

EXEC spWhileLoopTest

GO

CREATE OR Alter PROC spTestReturn
    (@Id INT,
    @rowCount INT OUTPUT)
AS
BEGIN
    IF EXISTS (SELECT *
    FROM dbo.tblProduct
    WHERE id = @Id)
	BEGIN
        SELECT *
        FROM dbo.tblProduct
        SET @rowCount = @@ROWCOUNT
        RETURN 100
    END
	ELSE
	BEGIN
        SET @rowCount = 0
        RETURN 0
    END
    PRINT 'Last Line'
END;

GO

DECLARE @rowCountVar AS INT
DECLARE @retrunStatus AS INT

EXEC @retrunStatus = spTestReturn  @Id= 16, @rowCount = @rowCountVar OUTPUT
SELECT @rowCountVar, @retrunStatus 