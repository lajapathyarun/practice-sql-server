-- CONTRAINT - NON NULLABLE
ALTER TABLE [dbo].[tblProduct] 
ADD [Description] [NVARCHAR](500) NOT NULL;

-- CONTRAINT - DEFAULT
ALTER TABLE [dbo].[tblCategory] 
ADD CONSTRAINT [DF_tblCategory_CreatedDate]  
	DEFAULT (GETDATE()) FOR [CreatedDate]

ALTER TABLE [dbo].[tblProduct] 
ADD CONSTRAINT [DF_tblProduct_Id]  
	DEFAULT (NEWID()) FOR [Id]

ALTER TABLE [dbo].[tblProduct] 
ADD CONSTRAINT [DF_tblProduct_Id]  
	DEFAULT (NEWSEQUENTIALID()) FOR [Id]

ALTER TABLE [dbo].[tblProduct] 
ADD CONSTRAINT [DF_tblProduct_Id]  
	DEFAULT NEXT VALUE FOR [productSequence] FOR [Id]

-- CONTRAINT - UNIQUE
ALTER TABLE [dbo].[tblProduct] 
ADD CONSTRAINT UC_tblProduct_Name UNIQUE (Name);

-- CONTRAINT - CHECK
ALTER TABLE [dbo].[tblProduct]
ADD CONSTRAINT CHK_tblProduct_Price CHECK (Price > 0 );

-- DROP CONTRAINT
ALTER TABLE [dbo].[tblProduct]
DROP CONSTRAINT PK_tblProduct;