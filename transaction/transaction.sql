-- Transaction - Without Name
BEGIN TRAN 
ROLLBACK
COMMIT
SELECT @@TRANCOUNT

-- Transaction - With Name and Error Handling
BEGIN TRANSACTION [Tran1]
BEGIN TRY
    INSERT INTO [dbo].[tblProduct] (Id, Name)
    VALUES (1, 'Product 1'), (1, 'Product 2')

    INSERT INTO [dbo].[tblCategory] (Id, Name)
    VALUES (1, 'Category 1'), (1, 'Category 2')

    COMMIT TRANSACTION [Tran1]
END TRY
BEGIN CATCH
  PRINT 'Error to Log.'
  ROLLBACK TRANSACTION [Tran1]
END CATCH