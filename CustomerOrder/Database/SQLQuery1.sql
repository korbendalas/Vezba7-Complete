PRINT N'Creating Sales.PK_Customer_CustID...';
GO
ALTER TABLE [Sales].[Customer]
ADD CONSTRAINT [PK_Customer_CustID] PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO
PRINT N'Creating Sales.PK_Orders_OrderID...';
GO
ALTER TABLE [Sales].[Orders]
ADD CONSTRAINT [PK_Orders_OrderID] PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO
PRINT N'Creating Sales.FK_Orders_Customer _CustID...';
GO
ALTER TABLE [Sales].[Orders]
ADD CONSTRAINT [FK_Orders_Customer_CustID] FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customer] ([CustomerID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO