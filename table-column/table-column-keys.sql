-- PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
-- FOREIGN KEY - Prevents actions that would destroy links between tables

-- PRIMARY COLUMN - SINGLE COLUMN
ALTER TABLE [dbo].[tblProduct]
ADD CONSTRAINT PK_tblProduct PRIMARY KEY ([Id]);

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

-- FOREIGN KEY - UDPATE
ALTER TABLE [dbo].[tblProduct] 
WITH CHECK ADD CONSTRAINT [FK_tblProduct_tblCategory] 
	FOREIGN KEY ([CategoryId]) 
	REFERENCES [dbo].[tblCategory] ([Id])
	ON UPDATE NO ACTION
--ON UPDATE CASCADE


-- FOREIGN KEY - UDPATE
ALTER TABLE [dbo].[tblProduct] 
WITH CHECK ADD CONSTRAINT [FK_tblProduct_tblCategory] 
	FOREIGN KEY ([CategoryId]) 
	REFERENCES [dbo].[tblCategory] ([Id])
	ON DELETE NO ACTION
	-- ON DELETE CASCADE
	-- ON DELETE SET NULL
	-- ON DELETE SET DEFAULT