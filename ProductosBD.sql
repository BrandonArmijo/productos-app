USE [master]
GO
/****** Object:  Database [ProductosBD]    Script Date: 2/10/2024 13:44:07 ******/
CREATE DATABASE [ProductosBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductosBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProductosBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductosBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProductosBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProductosBD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductosBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductosBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductosBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductosBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductosBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductosBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductosBD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProductosBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductosBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductosBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductosBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductosBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductosBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductosBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductosBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductosBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProductosBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductosBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductosBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductosBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductosBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductosBD] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ProductosBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductosBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductosBD] SET  MULTI_USER 
GO
ALTER DATABASE [ProductosBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductosBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductosBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductosBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductosBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductosBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProductosBD] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProductosBD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProductosBD]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/10/2024 13:44:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoDetalles]    Script Date: 2/10/2024 13:44:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoDetalles](
	[ProductoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_ProductoDetalles] PRIMARY KEY CLUSTERED 
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/10/2024 13:44:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241002031334_Primera Migracion', N'7.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241002173043_Segunda Migracion', N'7.0.20')
GO
SET IDENTITY_INSERT [dbo].[ProductoDetalles] ON 

INSERT [dbo].[ProductoDetalles] ([ProductoId], [Nombre], [Precio], [Stock]) VALUES (1, N'PlayStation 5', CAST(2999.99 AS Decimal(18, 2)), 100)
INSERT [dbo].[ProductoDetalles] ([ProductoId], [Nombre], [Precio], [Stock]) VALUES (2, N'Celular Huawei', CAST(500.00 AS Decimal(18, 2)), 200)
INSERT [dbo].[ProductoDetalles] ([ProductoId], [Nombre], [Precio], [Stock]) VALUES (4, N'Laptop ASUS', CAST(3000.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[ProductoDetalles] ([ProductoId], [Nombre], [Precio], [Stock]) VALUES (5, N'Microondas', CAST(120.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[ProductoDetalles] ([ProductoId], [Nombre], [Precio], [Stock]) VALUES (7, N'Cocina Indurama', CAST(350.00 AS Decimal(18, 2)), 79)
INSERT [dbo].[ProductoDetalles] ([ProductoId], [Nombre], [Precio], [Stock]) VALUES (8, N'Zapatillas Vans', CAST(369.99 AS Decimal(18, 2)), 3)
INSERT [dbo].[ProductoDetalles] ([ProductoId], [Nombre], [Precio], [Stock]) VALUES (9, N'Monitor HP', CAST(200.00 AS Decimal(18, 2)), 23)
INSERT [dbo].[ProductoDetalles] ([ProductoId], [Nombre], [Precio], [Stock]) VALUES (10, N'Celular POCO', CAST(600.00 AS Decimal(18, 2)), 80)
INSERT [dbo].[ProductoDetalles] ([ProductoId], [Nombre], [Precio], [Stock]) VALUES (11, N'Router TP-Link', CAST(50.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[ProductoDetalles] ([ProductoId], [Nombre], [Precio], [Stock]) VALUES (12, N'Plancha Indurama', CAST(200.00 AS Decimal(18, 2)), 20)
INSERT [dbo].[ProductoDetalles] ([ProductoId], [Nombre], [Precio], [Stock]) VALUES (13, N'Zapatos Zara', CAST(199.99 AS Decimal(18, 2)), 2)
INSERT [dbo].[ProductoDetalles] ([ProductoId], [Nombre], [Precio], [Stock]) VALUES (14, N'Xbox Series S', CAST(2000.00 AS Decimal(18, 2)), 5)
SET IDENTITY_INSERT [dbo].[ProductoDetalles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Username], [Password]) VALUES (1, N'Brandon', N'BrandonArmijo', N'$2a$11$ES703Z0iUv3nshjOm.ui3ehcrfP5ZG/57Kxn984IZYMCxvJRPoVpy')
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password]) VALUES (2, N'Raul', N'RaulBlanco', N'$2a$11$ghPyHPbbfkerYHD9a5FiIesgza0YKvqQw3ri3zDkl0W0Qq56NVGN2')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 2/10/2024 13:44:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductosBajoStock]    Script Date: 2/10/2024 13:44:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProductosBajoStock]
    @FiltroStock int
AS   
BEGIN
    SET NOCOUNT ON;
    SELECT ProductoId, Nombre, Precio, Stock
    FROM ProductoDetalles
    WHERE Stock < @FiltroStock;
END
GO
USE [master]
GO
ALTER DATABASE [ProductosBD] SET  READ_WRITE 
GO
