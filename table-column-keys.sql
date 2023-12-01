-- PRIMARY COLUMN - SINGLE COLUMN


-- FOREIGN KEY - WITH CHECK
ALTER TABLE [dbo].[tblProduct] 
WITH CHECK ADD CONSTRAINT [FK_tblProduct_tblCategory] 
	FOREIGN KEY ([CategoryId]) 
	REFERENCES [dbo].[tblCategory] ([Id])

-- FOREIGN KEY - WITH NO CHECK
ALTER TABLE [dbo].[tblProduct] 
WITH NOCHECK ADD CONSTRAINT [FK_tblProduct_tblCategory] 
	FOREIGN KEY ([CategoryId]) 
	REFERENCES [dbo].[tblCategory] ([Id])