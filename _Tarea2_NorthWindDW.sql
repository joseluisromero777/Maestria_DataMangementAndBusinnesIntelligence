USE [master]
GO
/****** Objeto: Database [NorthWindDW] Fecha de script: 8/5/2026 10:20:08 PM ******/
CREATE DATABASE [NorthWindDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NorthWindDW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\NorthWindDW.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NorthWindDW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\NorthWindDW_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [NorthWindDW] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NorthWindDW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NorthWindDW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NorthWindDW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NorthWindDW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NorthWindDW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NorthWindDW] SET ARITHABORT OFF 
GO
ALTER DATABASE [NorthWindDW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NorthWindDW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NorthWindDW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NorthWindDW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NorthWindDW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NorthWindDW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NorthWindDW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NorthWindDW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NorthWindDW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NorthWindDW] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NorthWindDW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NorthWindDW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NorthWindDW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NorthWindDW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NorthWindDW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NorthWindDW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NorthWindDW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NorthWindDW] SET RECOVERY FULL 
GO
ALTER DATABASE [NorthWindDW] SET  MULTI_USER 
GO
ALTER DATABASE [NorthWindDW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NorthWindDW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NorthWindDW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NorthWindDW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NorthWindDW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NorthWindDW] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [NorthWindDW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NorthWindDW', N'ON'
GO
ALTER DATABASE [NorthWindDW] SET QUERY_STORE = ON
GO
ALTER DATABASE [NorthWindDW] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [NorthWindDW]
GO
/****** Objeto: Schema [staging] Fecha de script: 8/5/2026 10:20:09 PM ******/
CREATE SCHEMA [staging]
GO
/****** Objeto: Table [dbo].[DimCustomer] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerSK] [int] NOT NULL,
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[CustomerDesc] [nvarchar](max) NULL,
 CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[DimDate] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDate] [date] NOT NULL,
	[DayNumberOfWeek] [tinyint] NOT NULL,
	[DayNameOfWeek] [nvarchar](10) NOT NULL,
	[DayNumberOfMonth] [tinyint] NOT NULL,
	[DayNumberOfYear] [smallint] NOT NULL,
	[WeekNumberOfYear] [tinyint] NOT NULL,
	[MonthName] [nvarchar](10) NOT NULL,
	[MonthNumberOfYear] [tinyint] NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarSemester] [tinyint] NOT NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[DimEmployee] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEmployee](
	[EmployeeSK] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[HomePhone] [nvarchar](24) NULL,
	[Extension] [nvarchar](4) NULL,
	[Photo] [image] NULL,
	[Notes] [nvarchar](max) NULL,
	[ReportsTo] [int] NULL,
	[PhotoPath] [nvarchar](255) NULL,
	[TerritoryDescription] [nchar](50) NULL,
	[RegionDescription] [nchar](50) NULL,
 CONSTRAINT [PK_DimEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[DimProduct] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductSK] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierName] [nvarchar](40) NULL,
	[CategoryName] [nvarchar](15) NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
 CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED 
(
	[ProductSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[DimShipper] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimShipper](
	[ShipperSK] [int] IDENTITY(1,1) NOT NULL,
	[ShipperID] [int] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Phone] [nvarchar](24) NULL,
 CONSTRAINT [PK_DimShipper] PRIMARY KEY CLUSTERED 
(
	[ShipperSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[FactOrders] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactOrders](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[RequiredDateKey] [int] NOT NULL,
	[ShippedDateKey] [int] NOT NULL,
	[CustomerSK] [int] NULL,
	[EmployeeSK] [int] NULL,
	[ShipperSK] [int] NULL,
	[ProductSK] [int] NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
	[ExtendedPrice] [decimal](18, 2) NOT NULL,
	[Freight] [money] NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
 CONSTRAINT [PK_FactOrders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[PackageConfig] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageConfig](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NOT NULL,
	[LastRowVersion] [bigint] NULL,
 CONSTRAINT [PK_PackageConfig] PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [staging].[customer] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[customer](
	[CustomerSK] [int] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[CustomerDesc] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Objeto: Table [staging].[employee] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[employee](
	[EmployeeSK] [int] NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[HomePhone] [nvarchar](24) NULL,
	[Extension] [nvarchar](4) NULL,
	[Photo] [image] NULL,
	[Notes] [nvarchar](max) NULL,
	[ReportsTo] [int] NULL,
	[PhotoPath] [nvarchar](255) NULL,
	[TerritoryDescription] [nchar](50) NULL,
	[RegionDescription] [nchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Objeto: Table [staging].[orders] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[orders](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[RequiredDateKey] [int] NOT NULL,
	[ShippedDateKey] [int] NOT NULL,
	[CustomerSK] [nchar](5) NULL,
	[EmployeeSK] [int] NULL,
	[ShipperSK] [int] NULL,
	[ProductSK] [int] NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
	[ExtendedPrice] [decimal](18, 2) NOT NULL,
	[Freight] [money] NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Objeto: Table [staging].[product] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[product](
	[ProductSK] [int] NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierName] [nvarchar](40) NULL,
	[CategoryName] [nvarchar](15) NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NULL
) ON [PRIMARY]
GO
/****** Objeto: Table [staging].[shipper] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[shipper](
	[ShipperSK] [int] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Phone] [nvarchar](24) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimCustomer1] FOREIGN KEY([CustomerSK])
REFERENCES [dbo].[DimCustomer] ([CustomerSK])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimCustomer1]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimDate_OrderDate] FOREIGN KEY([OrderDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimDate_OrderDate]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimDate_RequiredDate] FOREIGN KEY([RequiredDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimDate_RequiredDate]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimDate_ShippedDate] FOREIGN KEY([ShippedDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimDate_ShippedDate]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimEmployee] FOREIGN KEY([EmployeeSK])
REFERENCES [dbo].[DimEmployee] ([EmployeeSK])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimEmployee]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimProduct] FOREIGN KEY([ProductSK])
REFERENCES [dbo].[DimProduct] ([ProductSK])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimProduct]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimShipper] FOREIGN KEY([ShipperSK])
REFERENCES [dbo].[DimShipper] ([ShipperSK])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimShipper]
GO
/****** Objeto: StoredProcedure [dbo].[DW_MergeDimCustomer] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- 5. PROCEDIMIENTOS ALMACENADOS DE MERGE / CARGA DW
-- ===================================================================

CREATE   PROCEDURE [dbo].[DW_MergeDimCustomer]
AS
BEGIN
	UPDATE dc
	SET [CompanyName]  = sc.[CompanyName]
	   ,[ContactName]  = sc.[ContactName]
	   ,[ContactTitle] = sc.[ContactTitle]
	   ,[Address]      = sc.[Address]
	   ,[City]         = sc.[City]
	   ,[Region]       = sc.[Region]
	   ,[PostalCode]   = sc.[PostalCode]
	   ,[Country]      = sc.[Country]
	   ,[Phone]        = sc.[Phone]
	   ,[Fax]          = sc.[Fax]
	   ,[CustomerDesc] = sc.[CustomerDesc]
	FROM [dbo].[DimCustomer]        dc
	INNER JOIN [staging].[customer] sc ON (dc.[CustomerSK] = sc.[CustomerSK]);
END
GO
/****** Objeto: StoredProcedure [dbo].[DW_MergeDimEmployee] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[DW_MergeDimEmployee]
AS
BEGIN
	UPDATE de
	SET [LastName]             = se.[LastName]
	   ,[FirstName]            = se.[FirstName]
	   ,[Title]                = se.[Title]
	   ,[TitleOfCourtesy]      = se.[TitleOfCourtesy]
	   ,[BirthDate]            = se.[BirthDate]
	   ,[HireDate]             = se.[HireDate]
	   ,[Address]              = se.[Address]
	   ,[City]                 = se.[City]
	   ,[Region]               = se.[Region]
	   ,[PostalCode]           = se.[PostalCode]
	   ,[Country]              = se.[Country]
	   ,[HomePhone]            = se.[HomePhone]
	   ,[Extension]            = se.[Extension]
	   ,[Photo]                = se.[Photo]
	   ,[Notes]                = se.[Notes]
	   ,[ReportsTo]            = se.[ReportsTo]
	   ,[PhotoPath]            = se.[PhotoPath]
	   ,[TerritoryDescription] = se.[TerritoryDescription]
	   ,[RegionDescription]    = se.[RegionDescription]
	FROM [dbo].[DimEmployee]        de
	INNER JOIN [staging].[employee] se ON (de.[EmployeeSK] = se.[EmployeeSK]);
END
GO
/****** Objeto: StoredProcedure [dbo].[DW_MergeDimProduct] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[DW_MergeDimProduct]
AS
BEGIN
	UPDATE dp
	SET [ProductName]     = sp.[ProductName]
	   ,[SupplierName]    = sp.[SupplierName]
	   ,[CategoryName]    = sp.[CategoryName]
	   ,[QuantityPerUnit] = sp.[QuantityPerUnit]
	   ,[UnitPrice]       = sp.[UnitPrice]
	   ,[UnitsInStock]    = sp.[UnitsInStock]
	   ,[UnitsOnOrder]    = sp.[UnitsOnOrder]
	   ,[ReorderLevel]    = sp.[ReorderLevel]
	   ,[Discontinued]    = sp.[Discontinued]
	FROM [dbo].[DimProduct]        dp
	INNER JOIN [staging].[product] sp ON (dp.[ProductSK] = sp.[ProductSK]);
END
GO
/****** Objeto: StoredProcedure [dbo].[DW_MergeDimShipper] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- 5. PROCEDIMIENTOS ALMACENADOS DE MERGE / CARGA DW
-- ===================================================================

CREATE   PROCEDURE [dbo].[DW_MergeDimShipper]
AS
BEGIN
	UPDATE dc
	SET [CompanyName]  = sc.[CompanyName]
	         ,[Phone]  = sc.[Phone]
	FROM [dbo].[DimShipper]        dc
	INNER JOIN [staging].[Shipper] sc ON (dc.[ShipperSK] = sc.[ShipperSK]);
END


GO
/****** Objeto: StoredProcedure [dbo].[DW_MergeFactOrders] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[DW_MergeFactOrders]
AS
BEGIN
	UPDATE fo
	SET [OrderDateKey]    = so.[OrderDateKey]
	   ,[RequiredDateKey] = so.[RequiredDateKey]
	   ,[ShippedDateKey]  = so.[ShippedDateKey]
	   ,[CustomerSK]      = so.[CustomerSK]
	   ,[EmployeeSK]      = so.[EmployeeSK]
	   ,[ShipperSK]       = so.[ShipperSK]
	   ,[ProductSK]       = so.[ProductSK]
	   ,[UnitPrice]       = so.[UnitPrice]
	   ,[Quantity]        = so.[Quantity]
	   ,[Discount]        = so.[Discount]
	   ,[ExtendedPrice]   = so.[ExtendedPrice]
	   ,[Freight]         = so.[Freight]
	   ,[OrderDate]       = so.[OrderDate]
	   ,[RequiredDate]    = so.[RequiredDate]
	   ,[ShippedDate]     = so.[ShippedDate]
	FROM [dbo].[FactOrders]        fo
	INNER JOIN [staging].[orders] so ON (fo.[OrderID] = so.[OrderID] AND fo.[ProductID] = so.[ProductID]);
END
GO
/****** Objeto: StoredProcedure [dbo].[GetLastPackageRowVersion] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimientos para control de deltas (RowVersion)
CREATE   PROCEDURE [dbo].[GetLastPackageRowVersion]
(
	@tableName VARCHAR(50)
)
AS
BEGIN
	SELECT LastRowVersion
	FROM [dbo].[PackageConfig]
	WHERE TableName = @tableName;
END
GO
/****** Objeto: StoredProcedure [dbo].[UpdateLastPackageRowVersion] Fecha de script: 8/5/2026 10:20:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[UpdateLastPackageRowVersion]
(
	@tableName VARCHAR(50)
	,@lastRowVersion BIGINT
)
AS
BEGIN
	UPDATE [dbo].[PackageConfig]
	SET LastRowVersion = @lastRowVersion
	WHERE TableName = @tableName;
END
GO
USE [master]
GO
ALTER DATABASE [NorthWindDW] SET  READ_WRITE 
GO
