PRINT N'Creating Sales...';
GO
CREATE SCHEMA [Sales]
	AUTHORIZATION [dbo];
	GO

PRINT N'Creating Sales.Customer...';
GO
CREATE TABLE [Sales].[Customer] (
	[CustomerID]	INT				IDENTITY (1, 1) NOT NULL,
	[CustomerName]	NVARCHAR (40)	NOT NULL,
	[YTDOrders]		INT				NOT NULL,
	[YTDSales]		INT				NOT NULL
);

GO
PRINT N'Creating Sales.Orders...';
CREATE TABLE [Sales].[Orders] (
	[CustomerID] INT		NOT NULL,
	[OrderID]	INT		IDENTITY (1, 1) NOT NULL,
	[OrderDate]	DATETIME	NOT NULL,
	[FilledDate] DATETIME	NULL,
	[Status]	CHAR (1)	NOT NULL,
	[Amount]	INT		NOT NULL
);








GO

PRINT N'Creating Sales.Def_Customer_YTDOrders...';
GO
ALTER TABLE [Sales].[Customer]
	ADD CONSTRAINT [Def_Customer_YTDOrders] DEFAULT 0 FOR [YTDOrders];
GO
ALTER TABLE [Sales].[Customer]
	ADD CONSTRAINT [Def_Customer_YTDSales] DEFAULT 0 FOR [YTDSales];
GO
ALTER TABLE [Sales].[Orders]
	ADD CONSTRAINT [Def_Orders_OrderDate] DEFAULT GetDate() FOR [OrderDate];
GO
ALTER TABLE [Sales].[Orders]
	ADD CONSTRAINT [Def_Orders_Status] DEFAULT 'O' FOR [Status];
GO
ALTER TABLE [Sales].[Customer]
	ADD CONSTRAINT [PK_Customer_CustID] PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO
ALTER TABLE [Sales].[Orders]
	ADD CONSTRAINT [PK_Orders_OrderID] PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO
ALTER TABLE [Sales].[Orders]
	ADD CONSTRAINT [FK_Orders_Customer_CustID] FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customer] ([CustomerID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [Sales].[Orders]
	ADD CONSTRAINT [CK_Orders_FilledDate] CHECK ((FilledDate >= OrderDate) AND (FilledDate < '01/01/2020'));
GO
ALTER TABLE [Sales].[Orders]
	ADD CONSTRAINT [CK_Orders_OrderDate] CHECK ((OrderDate > '01/01/2005') AND (OrderDate < '01/01/2020'));

