USE [master]
GO
/****** Object:  Database [Babloos]    Script Date: 9/5/2023 4:56:50 PM ******/
CREATE DATABASE [Babloos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Babloos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Babloos.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Babloos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Babloos_log.ldf' , SIZE = 3840KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Babloos] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Babloos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Babloos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Babloos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Babloos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Babloos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Babloos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Babloos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Babloos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Babloos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Babloos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Babloos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Babloos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Babloos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Babloos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Babloos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Babloos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Babloos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Babloos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Babloos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Babloos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Babloos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Babloos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Babloos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Babloos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Babloos] SET  MULTI_USER 
GO
ALTER DATABASE [Babloos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Babloos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Babloos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Babloos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Babloos] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Babloos', N'ON'
GO
ALTER DATABASE [Babloos] SET QUERY_STORE = OFF
GO
USE [Babloos]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 9/5/2023 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[SpecialDescription] [varchar](500) NULL,
	[ImagePath] [varchar](200) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
 CONSTRAINT [PK_MenuCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 9/5/2023 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[Description] [varchar](500) NULL,
	[SpecialDescription] [varchar](500) NULL,
	[Instructions] [varchar](500) NULL,
	[Rate] [numeric](18, 2) NOT NULL,
	[ImagePath] [varchar](500) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_MenuItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/5/2023 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[Email] [varchar](50) NOT NULL,
	[Title] [varchar](20) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Address1] [varchar](500) NOT NULL,
	[Address2] [varchar](500) NULL,
	[City] [varchar](50) NOT NULL,
	[TotalAmount] [numeric](18, 2) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DeliveryOption] [varchar](100) NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[Instructions] [varchar](500) NULL,
	[OrderStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/5/2023 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[MenuItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[Amount] [numeric](18, 2) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DeliveryDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 9/5/2023 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](10) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[AlternativePhone] [varchar](50) NULL,
	[Address1] [varchar](200) NOT NULL,
	[Address2] [varchar](200) NULL,
	[City] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[UserType] [int] NOT NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (3, N'Zinger Burger', N'Zinger Burger', N'Zinger Burger', N'Images/menu/burger.png', 1, CAST(N'2015-08-26T11:52:27.780' AS DateTime), 1, CAST(N'2015-08-26T11:52:27.780' AS DateTime), 1, 1, 28)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (4, N'Chicken Patty Burger', N'Chicken Patty Burger', N'Chicken Patty Burger', N'Images/menu/burger.png', 1, CAST(N'2015-08-26T11:52:27.783' AS DateTime), 1, CAST(N'2015-08-26T11:52:27.783' AS DateTime), 1, 1, 28)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (5, N'Chicken Doner Burger', N'Chicken Doner Burger', N'Chicken Doner Burger', N'Images/menu/burger.png', 1, CAST(N'2015-08-26T11:52:27.787' AS DateTime), 1, CAST(N'2015-08-26T11:52:27.787' AS DateTime), 1, 1, 28)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (6, N'Chicken Peri Peri Burger', N'Chicken Peri Peri Burger', N'Chicken Peri Peri Burger', N'Images/menu/burger.png', 1, CAST(N'2015-08-26T11:52:27.787' AS DateTime), 1, CAST(N'2015-08-26T11:52:27.787' AS DateTime), 1, 1, 28)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (8, N'Fish Burger', N'Fish Burger', N'Fish Burger', N'Images/menu/burger.png', 1, CAST(N'2015-08-26T11:52:27.790' AS DateTime), 1, CAST(N'2015-08-26T11:52:27.790' AS DateTime), 1, 1, 28)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (9, N'Grilled Maxican Burger', N'Grilled Maxican Burger', N'Grilled Maxican Burger', N'Images/menu/burger.png', 1, CAST(N'2015-08-26T11:52:27.790' AS DateTime), 1, CAST(N'2015-08-26T11:52:27.790' AS DateTime), 1, 1, 28)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (10, N'Chicken Fillet Burger', N'Chicken Fillet Burger', N'Chicken Fillet Burger', N'Images/menu/burger.png', 1, CAST(N'2015-08-26T11:52:27.793' AS DateTime), 1, CAST(N'2015-08-26T11:52:27.793' AS DateTime), 1, 1, 28)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (11, N'Chicken Pakora Burger', N'Chicken Pakora Burger', N'Chicken Pakora Burger', N'Images/menu/burger.png', 1, CAST(N'2015-08-26T11:52:27.797' AS DateTime), 1, CAST(N'2015-08-26T11:52:27.797' AS DateTime), 1, 1, 28)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (12, N'Chicken Tikka Burger', N'Chicken Tikka Burger', N'Chicken Tikka Burger', N'Images/menu/burger.png', 1, CAST(N'2015-08-26T11:52:27.797' AS DateTime), 1, CAST(N'2015-08-26T11:52:27.797' AS DateTime), 1, 1, 28)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (14, N'Margherita (Cheese Lover)', N'Massive layer of melted 100% real cheese', N'Massive layer of melted 100% real cheese', N'Images/menu/pizza.png', 1, CAST(N'2015-08-26T13:57:58.010' AS DateTime), 1, CAST(N'2015-08-26T13:57:58.010' AS DateTime), 1, 1, 27)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (15, N'Garlic Bread', N'Garlic Bread', N'Garlic Bread', N'Images/menu/pizza.png', 1, CAST(N'2015-08-26T13:57:58.020' AS DateTime), 1, CAST(N'2015-08-26T13:57:58.020' AS DateTime), 1, 1, 27)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (16, N'Chicken Tandoori Pizza', N'Chicken Tandoori + Tomato + Green Chilli', N'Chicken Tandoori + Tomato + Green Chilli', N'Images/menu/pizza.png', 1, CAST(N'2015-08-26T13:57:58.020' AS DateTime), 1, CAST(N'2015-08-26T13:57:58.020' AS DateTime), 1, 1, 27)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (17, N'Chicken Tikka Pizza', N'Chicken Tikka + Red Onion + White Onion + Green Pepper + Tomatos + Green Chilli', N'Chicken Tikka + Red Onion + White Onion + Green Pepper + Tomatos + Green Chilli', N'Images/menu/pizza.png', 1, CAST(N'2015-08-26T13:57:58.023' AS DateTime), 1, CAST(N'2015-08-26T13:57:58.023' AS DateTime), 1, 1, 27)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (18, N'Chicken Doner', N'Chicken Doner + Red Onion + White Onion + Tomatos + Green Chilli', N'Chicken Doner + Red Onion + White Onion + Tomatos + Green Chilli', N'Images/menu/pizza.png', 1, CAST(N'2015-08-26T13:57:58.027' AS DateTime), 1, CAST(N'2015-08-26T13:57:58.027' AS DateTime), 1, 1, 27)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (19, N'Meat Feast', N'Chicken Tandoori + Mutton + Beef Qeema + Chicken Doner + Chicken Tikka', N'Chicken Tandoori + Mutton + Beef Qeema + Chicken Doner + Chicken Tikka', N'Images/menu/pizza.png', 1, CAST(N'2015-08-26T13:57:58.027' AS DateTime), 1, CAST(N'2015-08-26T13:57:58.027' AS DateTime), 1, 1, 27)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (20, N'English Special', N'Chicken Tandoori + Red Onion + White Onion + Green Pepper + Tomatos + Green Chilli', N'Chicken Tandoori + Red Onion + White Onion + Green Pepper + Tomatos + Green Chilli', N'Images/menu/pizza.png', 1, CAST(N'2015-08-26T13:57:58.030' AS DateTime), 1, CAST(N'2015-08-26T13:57:58.030' AS DateTime), 1, 1, 27)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (21, N'French Special', N'Chicken Tandoori + Red Onion + White Onion + Sweet Corn + Tomatos + Green Chilli', N'Chicken Tandoori + Red Onion + White Onion + Sweet Corn + Tomatos + Green Chilli', N'Images/menu/pizza.png', 1, CAST(N'2015-08-26T13:57:58.030' AS DateTime), 1, CAST(N'2015-08-26T13:57:58.030' AS DateTime), 1, 1, 27)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (22, N'Vegetable Pizza', N'Red Onion + White Onion + Green Pepper + Sweet Corns + Pineapple + Olives + Jalapeno + Tomatos + Green Chilli', N'Red Onion + White Onion + Green Pepper + Sweet Corns + Pineapple + Olives + Jalapeno + Tomatos + Green Chilli', N'Images/menu/pizza.png', 1, CAST(N'2015-08-26T13:57:58.030' AS DateTime), 1, CAST(N'2015-08-26T13:57:58.030' AS DateTime), 1, 1, 27)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (23, N'Babloo''s Special I', N'Chicken Tandoori + Mutton + Red Onion + White Onion + Green Pepper + Sweet Corns + Pineapple + Tomatos + Green Chilli', N'Chicken Tandoori + Mutton + Red Onion + White Onion + Green Pepper + Sweet Corns + Pineapple + Tomatos + Green Chilli', N'Images/menu/pizza.png', 1, CAST(N'2015-08-26T13:57:58.033' AS DateTime), 1, CAST(N'2015-08-26T13:57:58.033' AS DateTime), 1, 1, 27)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (24, N'Babloo''s Special II', N'Chicken Tandoori + Mutton + Red Onion + White Onion + Sweet Corns + Jalapeno + Tomatos + Green Chilli', N'Chicken Tandoori + Mutton + Red Onion + White Onion + Sweet Corns + Jalapeno + Tomatos + Green Chilli', N'Images/menu/pizza.png', 1, CAST(N'2015-08-26T13:57:58.033' AS DateTime), 1, CAST(N'2015-08-26T13:57:58.033' AS DateTime), 1, 1, 27)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (25, N'Babloo''s Special III', N'Chicken Tandoori + Mutton + Red Onion + White Onion + Green Pepper + Sweet Corns + Pineapple + Olives + Jalapeno + Tomatos + Green Chilli', N'Chicken Tandoori + Mutton + Red Onion + White Onion + Green Pepper + Sweet Corns + Pineapple + Olives + Jalapeno + Tomatos + Green Chilli', N'Images/menu/pizza.png', 1, CAST(N'2015-08-26T13:57:58.037' AS DateTime), 1, CAST(N'2015-08-26T13:57:58.037' AS DateTime), 1, 1, 27)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (26, N'Deals', N'Deals', N'Deals', N'Images/menu/deals.png', 1, CAST(N'2015-08-26T11:52:27.780' AS DateTime), 1, CAST(N'2015-08-26T11:52:27.780' AS DateTime), 1, 1, 0)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (27, N'Pizza', N'Pizza', N'Pizza', N'Images/menu/pizza.png', 1, CAST(N'2015-08-26T11:52:27.780' AS DateTime), 1, CAST(N'2015-08-26T11:52:27.780' AS DateTime), 1, 1, 0)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (28, N'Burger', N'Burger', N'Burger', N'Images/menu/burger.png', 1, CAST(N'2015-08-26T11:52:27.780' AS DateTime), 1, CAST(N'2015-08-26T11:52:27.780' AS DateTime), 1, 1, 0)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (29, N'Misc.', N'Misc.', N'Misc.', N'Images/menu/deals.png', 1, CAST(N'2015-08-26T11:52:27.780' AS DateTime), 1, CAST(N'2015-08-26T11:52:27.780' AS DateTime), 1, 1, 0)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (42, N'Chicken Doner', N'Chicken Doner', N'Chicken Doner', NULL, 1, CAST(N'2015-08-26T15:43:56.823' AS DateTime), NULL, CAST(N'2015-08-26T15:43:56.823' AS DateTime), 1, 1, 29)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (43, N'Chicken Fajita', N'Chicken Fajita', N'Chicken Fajita', NULL, 1, CAST(N'2015-08-26T15:43:56.827' AS DateTime), NULL, CAST(N'2015-08-26T15:43:56.827' AS DateTime), 1, 1, 29)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (44, N'Chicken Piece', N'Chicken Piece', N'Chicken Piece', NULL, 1, CAST(N'2015-08-26T15:43:56.830' AS DateTime), NULL, CAST(N'2015-08-26T15:43:56.830' AS DateTime), 1, 1, 29)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (45, N'Chicken Nuggets', N'Chicken Nuggets', N'Chicken Nuggets', NULL, 1, CAST(N'2015-08-26T15:43:56.830' AS DateTime), NULL, CAST(N'2015-08-26T15:43:56.830' AS DateTime), 1, 1, 29)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (46, N'Hot Wings', N'Hot Wings', N'Hot Wings', NULL, 1, CAST(N'2015-08-26T15:43:56.830' AS DateTime), NULL, CAST(N'2015-08-26T15:43:56.830' AS DateTime), 1, 1, 29)
INSERT [dbo].[Menu] ([Id], [Title], [Description], [SpecialDescription], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder], [ParentId]) VALUES (47, N'Fries', N'Fries', N'Fries', NULL, 1, CAST(N'2015-08-26T15:43:56.833' AS DateTime), NULL, CAST(N'2015-08-26T15:43:56.833' AS DateTime), 1, 1, 29)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuItems] ON 

INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (1, 26, N'Deal 1', N'3 Large Pizzas + 1.5 Ltr. Coke', N'3 Large Pizzas + 1.5 Ltr. Coke', NULL, CAST(1600.00 AS Numeric(18, 2)), N'/images/menu/deal-1.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (2, 26, N'Deal 2', N'2 Large Pizzas + 1 Ltr. Coke', NULL, NULL, CAST(1200.00 AS Numeric(18, 2)), N'images/menu/deal-2.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (3, 26, N'Deal 3', N'2 Medium Pizzas + 1 Ltr. Coke', NULL, NULL, CAST(900.00 AS Numeric(18, 2)), N'images/menu/deal-3.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (4, 26, N'Deal 4', N'2 Zinger Burgers + 1/2 Ltr. Coke + Reg. Fries', NULL, NULL, CAST(390.00 AS Numeric(18, 2)), N'images/menu/deal-4.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (5, 26, N'Deal 5', N'5 Zinger Burgers + 1.5 Ltr. Coke + Large Fries', NULL, NULL, CAST(900.00 AS Numeric(18, 2)), N'images/menu/deal-5.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (6, 26, N'Deal 6', N'2 Grilled Mexican Burgers + 1/2 Ltr. Coke + Reg. Fries', NULL, NULL, CAST(375.00 AS Numeric(18, 2)), N'images/menu/deal-6.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (7, 26, N'Deal 7', N'5 Grilled Mexican Burgers + 1.5 Ltr. Coke + Large Fries', NULL, NULL, CAST(875.00 AS Numeric(18, 2)), N'images/menu/deal-7.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (8, 26, N'Deal 8', N'2 Chicken Tikka Burgers + 1/2 Ltr. Coke + Reg. Fries', NULL, NULL, CAST(375.00 AS Numeric(18, 2)), N'images/menu/deal-8.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (9, 26, N'Deal 9', N'5 Chicken Tikka Burgers + 1/2 Ltr. Coke + Large Fries', NULL, NULL, CAST(875.00 AS Numeric(18, 2)), N'images/menu/deal-9.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (10, 14, N'Small Pizza (7 inch) + Reg. Coke', N'Small Pizza (7 inch) + Reg. Coke', NULL, NULL, CAST(270.00 AS Numeric(18, 2)), N'/images/menu/small-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (11, 14, N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', NULL, NULL, CAST(550.00 AS Numeric(18, 2)), N'/images/menu/medium-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (12, 14, N'Large Pizza (13 inch) + 1.5 Ltr. Coke', N'Large Pizza (13 inch) + 1.5 Ltr. Coke', NULL, NULL, CAST(700.00 AS Numeric(18, 2)), N'/images/menu/large-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (13, 15, N'Small Pizza (7 inch) + Reg. Coke', N'Small Pizza (7 inch) + Reg. Coke', NULL, NULL, CAST(200.00 AS Numeric(18, 2)), N'/images/menu/small-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (14, 15, N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', NULL, NULL, CAST(275.00 AS Numeric(18, 2)), N'/images/menu/medium-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (15, 15, N'Large Pizza (13 inch) + 1.5 Ltr. Coke', N'Large Pizza (13 inch) + 1.5 Ltr. Coke', NULL, NULL, CAST(350.00 AS Numeric(18, 2)), N'/images/menu/large-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (16, 16, N'Small Pizza (7 inch) + Reg. Coke', N'Small Pizza (7 inch) + Reg. Coke', NULL, NULL, CAST(270.00 AS Numeric(18, 2)), N'/images/menu/small-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (17, 16, N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', NULL, NULL, CAST(550.00 AS Numeric(18, 2)), N'/images/menu/medium-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (18, 16, N'Large Pizza (13 inch) + 1.5 Ltr. Coke', N'Large Pizza (13 inch) + 1.5 Ltr. Coke', NULL, NULL, CAST(700.00 AS Numeric(18, 2)), N'/images/menu/large-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (19, 17, N'Small Pizza (7 inch) + Reg. Coke', N'Small Pizza (7 inch) + Reg. Coke', NULL, NULL, CAST(270.00 AS Numeric(18, 2)), N'/images/menu/small-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (20, 17, N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', NULL, NULL, CAST(550.00 AS Numeric(18, 2)), N'/images/menu/medium-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (21, 17, N'Large Pizza (13 inch) + 1.5 Ltr. Coke', N'Large Pizza (13 inch) + 1.5 Ltr. Coke', NULL, NULL, CAST(700.00 AS Numeric(18, 2)), N'/images/menu/large-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (22, 18, N'Small Pizza (7 inch) + Reg. Coke', N'Small Pizza (7 inch) + Reg. Coke', NULL, NULL, CAST(270.00 AS Numeric(18, 2)), N'/images/menu/small-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (23, 18, N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', NULL, NULL, CAST(550.00 AS Numeric(18, 2)), N'/images/menu/medium-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (24, 18, N'Large Pizza (13 inch) + 1.5 Ltr. Coke', N'Large Pizza (13 inch) + 1.5 Ltr. Coke', NULL, NULL, CAST(700.00 AS Numeric(18, 2)), N'/images/menu/large-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (25, 19, N'Small Pizza (7 inch) + Reg. Coke', N'Small Pizza (7 inch) + Reg. Coke', NULL, NULL, CAST(270.00 AS Numeric(18, 2)), N'/images/menu/small-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (26, 19, N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', NULL, NULL, CAST(550.00 AS Numeric(18, 2)), N'/images/menu/medium-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (27, 19, N'Large Pizza (13 inch) + 1.5 Ltr. Coke', N'Large Pizza (13 inch) + 1.5 Ltr. Coke', NULL, NULL, CAST(700.00 AS Numeric(18, 2)), N'/images/menu/large-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (28, 20, N'Small Pizza (7 inch) + Reg. Coke', N'Small Pizza (7 inch) + Reg. Coke', NULL, NULL, CAST(270.00 AS Numeric(18, 2)), N'/images/menu/small-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (29, 20, N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', NULL, NULL, CAST(550.00 AS Numeric(18, 2)), N'/images/menu/medium-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (30, 20, N'Large Pizza (13 inch) + 1.5 Ltr. Coke', N'Large Pizza (13 inch) + 1.5 Ltr. Coke', NULL, NULL, CAST(700.00 AS Numeric(18, 2)), N'/images/menu/large-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (31, 21, N'Small Pizza (7 inch) + Reg. Coke', N'Small Pizza (7 inch) + Reg. Coke', NULL, NULL, CAST(270.00 AS Numeric(18, 2)), N'/images/menu/small-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (32, 21, N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', NULL, NULL, CAST(550.00 AS Numeric(18, 2)), N'/images/menu/medium-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (33, 21, N'Large Pizza (13 inch) + 1.5 Ltr. Coke', N'Large Pizza (13 inch) + 1.5 Ltr. Coke', NULL, NULL, CAST(700.00 AS Numeric(18, 2)), N'/images/menu/large-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (34, 22, N'Small Pizza (7 inch) + Reg. Coke', N'Small Pizza (7 inch) + Reg. Coke', NULL, NULL, CAST(270.00 AS Numeric(18, 2)), N'/images/menu/small-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (35, 22, N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', NULL, NULL, CAST(550.00 AS Numeric(18, 2)), N'/images/menu/medium-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (36, 22, N'Large Pizza (13 inch) + 1.5 Ltr. Coke', N'Large Pizza (13 inch) + 1.5 Ltr. Coke', NULL, NULL, CAST(700.00 AS Numeric(18, 2)), N'/images/menu/large-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (37, 23, N'Small Pizza (7 inch) + Reg. Coke', N'Small Pizza (7 inch) + Reg. Coke', NULL, NULL, CAST(300.00 AS Numeric(18, 2)), N'/images/menu/small-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (38, 23, N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', NULL, NULL, CAST(600.00 AS Numeric(18, 2)), N'/images/menu/medium-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (39, 23, N'Large Pizza (13 inch) + 1.5 Ltr. Coke', N'Large Pizza (13 inch) + 1.5 Ltr. Coke', NULL, NULL, CAST(750.00 AS Numeric(18, 2)), N'/images/menu/large-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (40, 24, N'Small Pizza (7 inch) + Reg. Coke', N'Small Pizza (7 inch) + Reg. Coke', NULL, NULL, CAST(300.00 AS Numeric(18, 2)), N'/images/menu/small-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (41, 24, N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', NULL, NULL, CAST(600.00 AS Numeric(18, 2)), N'/images/menu/medium-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (42, 24, N'Large Pizza (13 inch) + 1.5 Ltr. Coke', N'Large Pizza (13 inch) + 1.5 Ltr. Coke', NULL, NULL, CAST(750.00 AS Numeric(18, 2)), N'/images/menu/large-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (43, 25, N'Small Pizza (7 inch) + Reg. Coke', N'Small Pizza (7 inch) + Reg. Coke', NULL, NULL, CAST(300.00 AS Numeric(18, 2)), N'/images/menu/small-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (44, 25, N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', N'Medium Pizza (10 inch) + 1/2 Ltr. Coke', NULL, NULL, CAST(600.00 AS Numeric(18, 2)), N'/images/menu/medium-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (45, 25, N'Large Pizza (13 inch) + 1.5 Ltr. Coke', N'Large Pizza (13 inch) + 1.5 Ltr. Coke', NULL, NULL, CAST(750.00 AS Numeric(18, 2)), N'/images/menu/large-pizza.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (49, 3, N'Zinger Burger (Single)', NULL, NULL, NULL, CAST(160.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (50, 3, N'Zinger Burger + Reg. Coke', NULL, NULL, NULL, CAST(190.00 AS Numeric(18, 2)), N'images/menu/burger-coke.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (51, 3, N'Zinger Burger + Reg. Fries', NULL, NULL, NULL, CAST(210.00 AS Numeric(18, 2)), N'images/menu/burger-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (52, 3, N'Zinger Burger + Reg. Fries + Reg. Coke', NULL, NULL, NULL, CAST(240.00 AS Numeric(18, 2)), N'images/menu/burger-coke-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (53, 4, N'Chicken Patty Burger (Single)', NULL, NULL, NULL, CAST(120.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (54, 4, N'Chicken Patty Burger + Reg. Coke', NULL, NULL, NULL, CAST(150.00 AS Numeric(18, 2)), N'images/menu/burger-coke.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (55, 4, N'Chicken Patty Burger + Reg. Fries', NULL, NULL, NULL, CAST(170.00 AS Numeric(18, 2)), N'images/menu/burger-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (56, 4, N'Chicken Patty Burger + Reg. Fries + Reg. Coke', NULL, NULL, NULL, CAST(200.00 AS Numeric(18, 2)), N'images/menu/burger-coke-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (57, 5, N'Chicken Doner Burger (Single)', NULL, NULL, NULL, CAST(150.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (58, 5, N'Chicken Doner Burger + Reg. Coke', NULL, NULL, NULL, CAST(180.00 AS Numeric(18, 2)), N'images/menu/burger-coke.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (59, 5, N'Chicken Doner Burger + Reg. Fries', NULL, NULL, NULL, CAST(200.00 AS Numeric(18, 2)), N'images/menu/burger-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (60, 5, N'Chicken Doner Burger + Reg. Fries + Reg. Coke', NULL, NULL, NULL, CAST(230.00 AS Numeric(18, 2)), N'images/menu/burger-coke-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (61, 6, N'Chicken Peri Peri Burger (Single)', NULL, NULL, NULL, CAST(200.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (62, 6, N'Chicken Peri Peri Burger + Reg. Coke', NULL, NULL, NULL, CAST(230.00 AS Numeric(18, 2)), N'images/menu/burger-coke.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (63, 6, N'Chicken Peri Peri Burger + Reg. Fries', NULL, NULL, NULL, CAST(250.00 AS Numeric(18, 2)), N'images/menu/burger-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (64, 6, N'Chicken Peri Peri Burger + Reg. Fries + Reg. Coke', NULL, NULL, NULL, CAST(280.00 AS Numeric(18, 2)), N'images/menu/burger-coke-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (65, 8, N'Fish Burger (Single)', NULL, NULL, NULL, CAST(250.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (66, 8, N'Fish Burger + Reg. Coke', NULL, NULL, NULL, CAST(280.00 AS Numeric(18, 2)), N'images/menu/burger-coke.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (67, 8, N'Fish Burger + Reg. Fries', NULL, NULL, NULL, CAST(300.00 AS Numeric(18, 2)), N'images/menu/burger-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (68, 8, N'Fish Burger + Reg. Fries + Reg. Coke', NULL, NULL, NULL, CAST(330.00 AS Numeric(18, 2)), N'images/menu/burger-coke-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (69, 9, N'Grilled Mexican Burger (Single)', NULL, NULL, NULL, CAST(150.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (70, 9, N'Grilled Mexican Burger + Reg. Coke', NULL, NULL, NULL, CAST(180.00 AS Numeric(18, 2)), N'images/menu/burger-coke.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (71, 9, N'Grilled Mexican Burger + Reg. Fries', NULL, NULL, NULL, CAST(200.00 AS Numeric(18, 2)), N'images/menu/burger-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (72, 9, N'Grilled Mexican Burger + Reg. Fries + Reg. Coke', NULL, NULL, NULL, CAST(230.00 AS Numeric(18, 2)), N'images/menu/burger-coke-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (73, 9, N'1/2 Pounder Grilled Mexican Burger (Single)', NULL, NULL, NULL, CAST(225.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (74, 9, N'1/2 Pounder Grilled Mexican Burger + Reg. Coke', NULL, NULL, NULL, CAST(255.00 AS Numeric(18, 2)), N'images/menu/burger-coke.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (75, 9, N'1/2 Pounder Grilled Mexican Burger + Reg. Fries', NULL, NULL, NULL, CAST(275.00 AS Numeric(18, 2)), N'images/menu/burger-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (76, 9, N'1/2 Pounder Grilled Mexican Burger + Reg. Fries + Reg. Coke', NULL, NULL, NULL, CAST(300.00 AS Numeric(18, 2)), N'images/menu/burger-coke-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (77, 10, N'Chicken Fillet Burger (Single)', NULL, NULL, NULL, CAST(160.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (78, 10, N'Chicken Fillet Burger + Reg. Coke', NULL, NULL, NULL, CAST(190.00 AS Numeric(18, 2)), N'images/menu/burger-coke.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (79, 10, N'Chicken Fillet Burger + Reg. Fries', NULL, NULL, NULL, CAST(210.00 AS Numeric(18, 2)), N'images/menu/burger-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (80, 10, N'Chicken Fillet Burger + Reg. Fries + Reg. Coke', NULL, NULL, NULL, CAST(240.00 AS Numeric(18, 2)), N'images/menu/burger-coke-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (81, 10, N'1/2 Pounder Chicken Fillet Burger (Single)', NULL, NULL, NULL, CAST(240.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (82, 10, N'1/2 Pounder Chicken Fillet Burger + Reg. Coke', NULL, NULL, NULL, CAST(270.00 AS Numeric(18, 2)), N'images/menu/burger-coke.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (83, 10, N'1/2 Pounder Chicken Fillet Burger + Reg. Fries', NULL, NULL, NULL, CAST(290.00 AS Numeric(18, 2)), N'images/menu/burger-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (84, 10, N'1/2 Pounder Chicken Fillet Burger + Reg. Fries + Reg. Coke', NULL, NULL, NULL, CAST(320.00 AS Numeric(18, 2)), N'images/menu/burger-coke-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (85, 11, N'Chicken Pakora Burger (Single)', NULL, NULL, NULL, CAST(120.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (86, 11, N'Chicken Pakora Burger + Reg. Coke', NULL, NULL, NULL, CAST(150.00 AS Numeric(18, 2)), N'images/menu/burger-coke.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (87, 11, N'Chicken Pakora Burger + Reg. Fries', NULL, NULL, NULL, CAST(170.00 AS Numeric(18, 2)), N'images/menu/burger-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (88, 11, N'Chicken Pakora Burger + Reg. Fries + Reg. Coke', NULL, NULL, NULL, CAST(200.00 AS Numeric(18, 2)), N'images/menu/burger-coke-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (89, 12, N'Chicken Tikka Burger (Single)', NULL, NULL, NULL, CAST(150.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (90, 12, N'Chicken Tikka Burger + Reg. Coke', NULL, NULL, NULL, CAST(180.00 AS Numeric(18, 2)), N'images/menu/burger-coke.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (91, 12, N'Chicken Tikka Burger + Reg. Fries', NULL, NULL, NULL, CAST(200.00 AS Numeric(18, 2)), N'images/menu/burger-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (92, 12, N'Chicken Tikka Burger + Reg. Fries + Reg. Coke', NULL, NULL, NULL, CAST(230.00 AS Numeric(18, 2)), N'images/menu/burger-coke-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (93, 12, N'1/2 pounder Chicken Tikka Burger (Single)', NULL, NULL, NULL, CAST(200.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (94, 12, N'1/2 pounder Chicken Tikka Burger + Reg. Coke', NULL, NULL, NULL, CAST(230.00 AS Numeric(18, 2)), N'images/menu/burger-coke.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (95, 12, N'1/2 pounder Chicken Tikka Burger + Reg. Fries', NULL, NULL, NULL, CAST(250.00 AS Numeric(18, 2)), N'images/menu/burger-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (96, 12, N'1/2 pounder Chicken Tikka Burger + Reg. Fries + Reg. Coke', NULL, NULL, NULL, CAST(280.00 AS Numeric(18, 2)), N'images/menu/burger-coke-fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (97, 43, N'Chicken Fajita', NULL, NULL, NULL, CAST(175.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (98, 43, N'Chicken Fajita + Fries', NULL, NULL, NULL, CAST(175.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (99, 43, N'Chicken Fajita + Pitta Bread', NULL, NULL, NULL, CAST(175.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (100, 42, N'Small Chicken Doner (Salad + Yogurt + Chilli Sauce)', NULL, NULL, NULL, CAST(150.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (101, 42, N'Large Chicken Doner (Salad + Yogurt + Chilli Sauce)', NULL, NULL, NULL, CAST(225.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (102, 42, N'Small Chicken Doner + Fries', NULL, NULL, NULL, CAST(150.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
GO
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (103, 42, N'Large Chicken Doner + Fries', NULL, NULL, NULL, CAST(225.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (104, 42, N'Small Chicken Doner + Pitta Bread', NULL, NULL, NULL, CAST(150.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (105, 42, N'Large Chicken Doner + Pitta Bread', NULL, NULL, NULL, CAST(225.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (106, 44, N'1 Piece Chicken', NULL, NULL, NULL, CAST(100.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (107, 44, N'5 Pieces Chicken', NULL, NULL, NULL, CAST(450.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (108, 45, N'Chicken Nuggets (5 Pieces)', NULL, NULL, NULL, CAST(125.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (109, 45, N'Chicken Nuggets (10 Pieces)', NULL, NULL, NULL, CAST(225.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (110, 46, N'Hot Wings (5 Pieces)', NULL, NULL, NULL, CAST(125.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (111, 46, N'Hot Wings (10 Pieces)', NULL, NULL, NULL, CAST(225.00 AS Numeric(18, 2)), N'images/menu/burger.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (112, 47, N'Regular Fries', NULL, NULL, NULL, CAST(50.00 AS Numeric(18, 2)), N'images/menu/fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (113, 47, N'Family Fries', NULL, NULL, NULL, CAST(100.00 AS Numeric(18, 2)), N'images/menu/fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (114, 47, N'Regular Cheesy Fries', NULL, NULL, NULL, CAST(80.00 AS Numeric(18, 2)), N'images/menu/fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (115, 47, N'Family Cheesy Fries', NULL, NULL, NULL, CAST(150.00 AS Numeric(18, 2)), N'images/menu/fries.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
INSERT [dbo].[MenuItems] ([Id], [MenuId], [Title], [Description], [SpecialDescription], [Instructions], [Rate], [ImagePath], [CreatedBy], [CreationDate], [ModifiedBy], [ModifiedDate], [IsActive], [SortOrder]) VALUES (116, 47, N'Cheese Slice (Each)', NULL, NULL, NULL, CAST(30.00 AS Numeric(18, 2)), N'images/menu/cheese.png', 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, CAST(N'2015-08-26T14:18:13.047' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[MenuItems] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([Id], [Title], [FirstName], [LastName], [Phone], [AlternativePhone], [Address1], [Address2], [City], [EmailAddress], [Password], [IsActive], [CreationDate], [UserType]) VALUES (1, N'Mr.', N'Waheed', N'Iqbal', N'00000000', N'0000000', N'Jhang', NULL, N'Jhang', N'admin@innovativewhiz.com', N'111111', 1, CAST(N'2015-08-26T11:43:27.060' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_MenuCategory_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_MenuCategory_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_MenuCategory_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[MenuItems] ADD  CONSTRAINT [DF_MenuItems_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[MenuItems] ADD  CONSTRAINT [DF_MenuItems_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[MenuItems] ADD  CONSTRAINT [DF_MenuItems_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MenuItems] ADD  CONSTRAINT [DF_MenuItems_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_DeliveryDate]  DEFAULT (getdate()) FOR [DeliveryDate]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_MenuItems_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[MenuItems] CHECK CONSTRAINT [FK_MenuItems_Menu]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserInfo] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInfo] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserInfo]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_MenuItems] FOREIGN KEY([MenuItemId])
REFERENCES [dbo].[MenuItems] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_MenuItems]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
USE [master]
GO
ALTER DATABASE [Babloos] SET  READ_WRITE 
GO
