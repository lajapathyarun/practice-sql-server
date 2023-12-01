-- CONTRAINT - DEFAULT
ALTER TABLE [dbo].[tblCategory] 
ADD CONSTRAINT [DF_tblCategory_CreatedDate]  
	DEFAULT (GETDATE()) FOR [CreatedDate]