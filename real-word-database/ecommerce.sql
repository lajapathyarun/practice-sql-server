-- CREATE TABLE - PRODUCT
CREATE TABLE [dbo].[tblProduct]
(
	[Id] [UNIQUEIDENTIFIER] NOT NULL,
	[Name] [NVARCHAR](50) NOT NULL,
	[CreatedDate] [DATETIME2](7) NOT NULL,
	[UpdatedDate] [DATETIME2](7) NULL,
	[CreatedBy] [NVARCHAR](50) NOT NULL,
	[UpdatedBy] [NVARCHAR](50) NULL,
	[Description] [NVARCHAR](1000) NULL,
	[CategoryId] [INT] NOT NULL,
	[Price] [INT] NULL,
	CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED ([Id] ASC)
)

 -- CREATE TABLE - CATEGORY

 -- INSERT DATA
INSERT INTO [dbo].[tblProduct]
    (Id,
    Name,
    CreatedDate,
    UpdatedDate,
    CreatedBy,
    UpdatedBy,
    CategoryId)
VALUES
    (3, 'Product 1', GETDATE(), NULL, 'user1', NULL, 4)