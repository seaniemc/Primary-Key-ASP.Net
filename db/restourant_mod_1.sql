USE [master]
GO
/****** Object:  Database [primary_quey_restourant]    Script Date: 19/04/2016 12:33:52 ******/
CREATE DATABASE [primary_quey_restourant] ON  PRIMARY 
( NAME = N'primary_quey_restourant', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\primary_quey_restourant.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'primary_quey_restourant_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\primary_quey_restourant_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [primary_quey_restourant] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [primary_quey_restourant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [primary_quey_restourant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET ARITHABORT OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [primary_quey_restourant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [primary_quey_restourant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET  DISABLE_BROKER 
GO
ALTER DATABASE [primary_quey_restourant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [primary_quey_restourant] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [primary_quey_restourant] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [primary_quey_restourant] SET  MULTI_USER 
GO
ALTER DATABASE [primary_quey_restourant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [primary_quey_restourant] SET DB_CHAINING OFF 
GO
USE [primary_quey_restourant]
GO
/****** Object:  Table [dbo].[countys]    Script Date: 19/04/2016 12:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[countys](
	[id] [int] IDENTITY(201,1) NOT NULL,
	[county] [varchar](50) NOT NULL,
 CONSTRAINT [PK_countys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login]    Script Date: 19/04/2016 12:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[userid] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](16) NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[meals]    Script Date: 19/04/2016 12:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[meals](
	[mealid] [int] IDENTITY(6001,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [text] NULL,
	[price] [money] NOT NULL,
	[sideid] [int] NULL,
 CONSTRAINT [PK_meals] PRIMARY KEY CLUSTERED 
(
	[mealid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order]    Script Date: 19/04/2016 12:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[orderid] [int] IDENTITY(40001,1) NOT NULL,
	[userid] [int] NOT NULL,
	[price] [money] NOT NULL,
	[orderdate] [datetime] NOT NULL,
	[complete] [bit] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderlist]    Script Date: 19/04/2016 12:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderlist](
	[id] [int] IDENTITY(500001,1) NOT NULL,
	[orderid] [int] NOT NULL,
	[mealid] [int] NOT NULL,
	[qty] [int] NOT NULL,
 CONSTRAINT [PK_orderlist] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sides]    Script Date: 19/04/2016 12:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sides](
	[id] [int] IDENTITY(701,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_sides] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 19/04/2016 12:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1001,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[age] [int] NOT NULL,
	[email] [varchar](60) NOT NULL,
	[phone] [bigint] NOT NULL,
	[street1] [varchar](100) NOT NULL,
	[street2] [varchar](100) NULL,
	[city] [varchar](60) NOT NULL,
	[countyid] [int] NOT NULL,
	[isadmin] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[countys] ON 

INSERT [dbo].[countys] ([id], [county]) VALUES (201, N'Antrim')
INSERT [dbo].[countys] ([id], [county]) VALUES (202, N'Armagh')
INSERT [dbo].[countys] ([id], [county]) VALUES (203, N'Carlow')
INSERT [dbo].[countys] ([id], [county]) VALUES (204, N'Cavan')
INSERT [dbo].[countys] ([id], [county]) VALUES (205, N'Clare')
INSERT [dbo].[countys] ([id], [county]) VALUES (206, N'Cork')
INSERT [dbo].[countys] ([id], [county]) VALUES (207, N'Donegal')
INSERT [dbo].[countys] ([id], [county]) VALUES (208, N'Down')
INSERT [dbo].[countys] ([id], [county]) VALUES (209, N'Dublin')
INSERT [dbo].[countys] ([id], [county]) VALUES (210, N'Fermanagh')
INSERT [dbo].[countys] ([id], [county]) VALUES (211, N'Galway')
INSERT [dbo].[countys] ([id], [county]) VALUES (212, N'Kerry')
INSERT [dbo].[countys] ([id], [county]) VALUES (213, N'Kildare')
INSERT [dbo].[countys] ([id], [county]) VALUES (214, N'Kilkenny')
INSERT [dbo].[countys] ([id], [county]) VALUES (215, N'Laois')
INSERT [dbo].[countys] ([id], [county]) VALUES (216, N'Leitrim')
INSERT [dbo].[countys] ([id], [county]) VALUES (217, N'Limerick')
INSERT [dbo].[countys] ([id], [county]) VALUES (218, N'Londonderry')
INSERT [dbo].[countys] ([id], [county]) VALUES (219, N'Longford')
INSERT [dbo].[countys] ([id], [county]) VALUES (220, N'Louth')
INSERT [dbo].[countys] ([id], [county]) VALUES (221, N'Mayo')
INSERT [dbo].[countys] ([id], [county]) VALUES (222, N'Meath')
INSERT [dbo].[countys] ([id], [county]) VALUES (223, N'Monaghan')
INSERT [dbo].[countys] ([id], [county]) VALUES (224, N'Offaly')
INSERT [dbo].[countys] ([id], [county]) VALUES (225, N'Roscommon')
INSERT [dbo].[countys] ([id], [county]) VALUES (226, N'Sligo')
INSERT [dbo].[countys] ([id], [county]) VALUES (227, N'Tipperary')
INSERT [dbo].[countys] ([id], [county]) VALUES (228, N'Tyrone')
INSERT [dbo].[countys] ([id], [county]) VALUES (229, N'Waterford')
INSERT [dbo].[countys] ([id], [county]) VALUES (230, N'Westmeath')
INSERT [dbo].[countys] ([id], [county]) VALUES (231, N'Wexford')
INSERT [dbo].[countys] ([id], [county]) VALUES (232, N'Wicklow')
SET IDENTITY_INSERT [dbo].[countys] OFF
INSERT [dbo].[login] ([userid], [username], [password]) VALUES (1001, N'g00196984', N'1234567890')
INSERT [dbo].[login] ([userid], [username], [password]) VALUES (1006, N'username', N'userpassword')
INSERT [dbo].[login] ([userid], [username], [password]) VALUES (1018, N'alona', N'00000000')
INSERT [dbo].[login] ([userid], [username], [password]) VALUES (1019, N'sophia', N'111111111')
INSERT [dbo].[login] ([userid], [username], [password]) VALUES (1020, N'jdfjkfjfjf', N'22222222')
INSERT [dbo].[login] ([userid], [username], [password]) VALUES (1021, N'kjhghjkjhg', N'33333333')
INSERT [dbo].[login] ([userid], [username], [password]) VALUES (1022, N'pupsboy', N'444444444')
INSERT [dbo].[login] ([userid], [username], [password]) VALUES (1023, N'k,uimnbrgfbthnt', N'0101010101')
SET IDENTITY_INSERT [dbo].[meals] ON 

INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6001, N'Prawn Cocktail', N'A selection of Galway Bay prawns, marinated in Marie Rose sauce and served on a bed of lettuce.', 7.8500, 701)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6002, N'Vegetable Soup', N'A wonderful assortment of country vegetables.', 5.9500, 701)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6003, N'Bruschetta', N'Thick slices of bread grilled, rubbed with garlic, drizzled with olive, topped with tomatoes and herbs', 7.5000, 701)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6004, N'Chicken and Mushroom vol–au–vent', N'A baked patty shell filled with chicken and mushrooms', 7.0000, 701)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6005, N'Caprese Salad', N'A salad consisting of slices of mozzarella and tomatoes, basil, and olive oil or Italian dressing', 8.5000, 701)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6006, N'Fresh Cod and Chips', N'Freshly caught Cod served with a side of chips and tartar sauce.', 14.5000, 702)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6007, N'10oz Sirloin Steak ', N'Beautiful Irish beef, cooked to order, severed with chunky chips, mushrooms and onions ', 23.9500, 702)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6008, N'Chicken and Veg Mexican Torillias', N'Succulent chicken strips, with roasted Veg, severed in homemade Torillias and salsa sauce.', 16.9500, 702)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6009, N'Vegetarian Lasagne ', N'We use Tender vegetables, a light tomato sauce and lots of cheese make this vegetable lasagne recipe', 16.5000, 702)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6010, N'Chicken Breast Sandwich ', N'Succulent chicken breast chargrilled, severed on a homemade patty, with caramelized onions, lettuce, baby tomatoes, melted cheese and homemade garlic mayo. And comes with chunky Chips.', 13.5000, 702)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6011, N'Lamb Shanks', N'Beautiful Connemara Lamb Shanks, slow roasted, served with mash potatoes, vegetables and a red wine jus.', 22.5000, 702)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6012, N'Stuffed Roast Duck', N'Wonderfully prepared Roast duck stuffed with wild vegetables and garlic, served with mashed potatoes and a red wine sauce. ', 22.5000, 702)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6013, N'Fresh Seabass', N'Fresh Atlantic Seabass, Pan fried in a lemon sauce with a selection of fresh green veg.', 27.0000, 702)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6014, N'Bailey’s Cheesecake', N'Homemade Bailey’s cheesecake, topped with chocolate flakes and severed with a side of cream.', 8.0000, 703)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6015, N'Crème Brulee', N'Caramelised Custard ', 9.5000, 703)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6016, N'Apple Tart and Cream ', N'Homemade warm Apple tart served with fresh cream. ', 6.5000, 703)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6017, N'Chocolate Fondant', N'A gooey, decadent dessert-a hot pudding with a molten middle--irresistible', 7.5000, 703)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6018, N'Fresh Strawberries and cream', N'Fresh Wexford strawberries and cream.', 6.5000, 703)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6019, N'Coca Cola Can', N'', 1.0000, 704)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6020, N'Coca Cola Bottle', N'', 1.7000, 704)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6021, N'7-Up Can', N'', 1.0000, 704)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6022, N'7-Up Bottle', N'', 1.7000, 704)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6023, N'Club Orange Can', N'', 1.0000, 704)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6024, N'Club Orange Bottle', N'', 1.7000, 704)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6025, N'Strawberry Milkshake', N'', 4.0000, 704)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6026, N'Chocolate Milkshake', N'', 4.0000, 704)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6027, N'Vanila Minlshake', N'', 4.0000, 704)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6028, N'Tea', N'', 2.7000, 705)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6029, N'Espresso', N'', 2.7000, 705)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6030, N'Americano', N'', 2.7000, 705)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6031, N'Latte', N'', 2.7000, 705)
INSERT [dbo].[meals] ([mealid], [name], [description], [price], [sideid]) VALUES (6032, N'Cappuccino ', N'', 2.7000, 705)
SET IDENTITY_INSERT [dbo].[meals] OFF
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40003, 1006, 56.2100, CAST(N'2016-04-14T15:55:13.233' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40004, 1001, 56.2100, CAST(N'2016-04-14T16:03:26.513' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40005, 1007, 55.2100, CAST(N'2016-04-14T16:03:26.517' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40006, 1008, 26.2100, CAST(N'2016-04-14T16:03:26.517' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40007, 1009, 15.2100, CAST(N'2016-04-14T16:03:26.517' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40008, 1010, 92.2100, CAST(N'2016-04-14T16:03:26.517' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40009, 1006, 82.2100, CAST(N'2016-04-14T16:03:26.517' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40010, 1012, 35.2100, CAST(N'2016-04-14T16:03:26.517' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40011, 1001, 28.3000, CAST(N'2016-04-16T20:56:37.400' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40012, 1001, 0.0000, CAST(N'2016-04-16T21:01:52.440' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40013, 1001, 21.3000, CAST(N'2016-04-16T21:02:55.513' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40014, 1001, 24.8500, CAST(N'2016-04-16T21:31:36.473' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40015, 1001, 14.8500, CAST(N'2016-04-16T21:33:18.230' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40016, 1001, 66.6500, CAST(N'2016-04-16T21:36:56.680' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40017, 1001, 33.5000, CAST(N'2016-04-16T21:42:42.980' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40018, 1001, 95.6000, CAST(N'2016-04-17T07:25:09.033' AS DateTime), 0)
INSERT [dbo].[order] ([orderid], [userid], [price], [orderdate], [complete]) VALUES (40019, 0, 0.0000, CAST(N'2016-04-18T18:14:25.827' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[order] OFF
SET IDENTITY_INSERT [dbo].[orderlist] ON 

INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500002, 40016, 6001, 1)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500003, 40016, 6004, 2)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500004, 40016, 6001, 2)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500005, 40016, 6010, 2)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500006, 40016, 6007, 1)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500007, 40016, 6018, 1)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500008, 40017, 6004, 5)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500009, 40017, 6001, 1)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500010, 40017, 6008, 1)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500011, 40017, 6022, 3)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500012, 40018, 6002, 2)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500013, 40018, 6005, 3)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500014, 40018, 6007, 1)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500016, 40018, 6013, 1)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500017, 40018, 6027, 1)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500018, 40018, 6021, 1)
INSERT [dbo].[orderlist] ([id], [orderid], [mealid], [qty]) VALUES (500019, 40018, 6030, 3)
SET IDENTITY_INSERT [dbo].[orderlist] OFF
SET IDENTITY_INSERT [dbo].[sides] ON 

INSERT [dbo].[sides] ([id], [name]) VALUES (701, N'Starters')
INSERT [dbo].[sides] ([id], [name]) VALUES (702, N'Mains')
INSERT [dbo].[sides] ([id], [name]) VALUES (703, N'Deserts')
INSERT [dbo].[sides] ([id], [name]) VALUES (704, N'Cold Drinks')
INSERT [dbo].[sides] ([id], [name]) VALUES (705, N'Hot Beverages')
SET IDENTITY_INSERT [dbo].[sides] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1001, N'Andrej Lavrinovic', 33, N'andrei.lavrinovic@gmail.com', 863011480, N'189 Fearann Ri', N'Doughiska', N'Galway', 211, 1)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1006, N'ghghnghn', 45, N'dbfb', 4527827, N'fbfgbfgbfgfbf', N'fgbfgb', N'fbfgb', 211, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1007, N'Petja', 25, N'petja@noemail.com', 861234567, N'kfjvkjdfvndkfv', N'kjfdnvidvnlkfvm', N'Galway', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1008, N'Tanja', 26, N'tanja@noemail.com', 253691245, N'nvkdfnvikvnkdf', N'kdjfnvkefvnefk', N'Galway', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1009, N'kdjfvnkdjvn', 25, N'dfvdfvdfvdfv', 213515415, N'kdjfnvkdjvkjnv', N'kanfvkdndkvn', N'Sligo', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1010, N'Alan', 25, N'alan@noemail.com', 123456789, N'lksdjfnv;invn', N'Dublin Rd', N'Galway', 211, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1011, N'Bran', 33, N'brat@noemail.com', 9876543210, N'kjaenfvkjbn', N'kfjnvkdnvnlemv', N'Galway', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1012, N'Boris', 45, N'boris@email.com', 741185529, N'kfjnvignoeop', N'molfngork[rjg', N'Dublin', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1013, N'Boris', 23, N'boris@email.com', 9876543210, N'lksdjfnv;invn', N'rbrrverbrtbtgreg', N'Dublin', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1014, N'Boris', 21, N'alan@noemail.com', 123456789, N'gmit', N'Dublin Rd', N'Galway', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1015, N'abc', 34, N'abc@email.com', 258963147, N'ikafnvon', N'ksjnfblsmb', N'Galway', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1016, N'def', 33, N'def@email.com', 1478523369, N'fgbnbvhnbg', N'nbvnuykuyjtybr', N'Galway', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1017, N'asdf', 32, N'asdf@email.com', 123654123, N'iefuhbpemvlwb', N'lkmbkjuihieruf', N'Galway', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1018, N'Alona', 23, N'alona@email.com', 741185529, N'ajlfv;n;fnv', N'rbrrverbrtbtgreg', N'Galway', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1019, N'Sophia', 34, N'sophia@email.com', 784512963, N'ghtujhrgrgt', N'jhtrgthyjyhtg', N'Galway', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1020, N'1', 34, N'wrthgrwgerg@email.com', 985698569, N'srthyujtyrgb', N'rtheyjyht', N'Limerick', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1021, N'lkjhgfd', 23, N'kjhgf@email.com', 1254125411, N'kjnorvmemv', N'krngbkjgnblvmep', N'Limerick', 201, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1022, N'Pups', 23, N'pups@email.com', 753951741, N'jnomvmklmlk', N'skfmbrmlmbfgpbb', N'Limerick', 217, 0)
INSERT [dbo].[users] ([id], [name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (1023, N'Boris', 34, N'jgjfkfhgnr@email.com', 456789456, N'humjthbhntyhbr', N'ymntbrthujht', N'Dublin', 209, 0)
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_price]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_irderdate]  DEFAULT (getdate()) FOR [orderdate]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_complete]  DEFAULT ((0)) FOR [complete]
GO
ALTER TABLE [dbo].[orderlist] ADD  CONSTRAINT [DF_orderlist_qty]  DEFAULT ((1)) FOR [qty]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_isadmin]  DEFAULT ((0)) FOR [isadmin]
GO
ALTER TABLE [dbo].[countys]  WITH CHECK ADD  CONSTRAINT [FK_countys_countys] FOREIGN KEY([id])
REFERENCES [dbo].[countys] ([id])
GO
ALTER TABLE [dbo].[countys] CHECK CONSTRAINT [FK_countys_countys]
GO
ALTER TABLE [dbo].[login]  WITH CHECK ADD  CONSTRAINT [FK_login_users] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[login] CHECK CONSTRAINT [FK_login_users]
GO
ALTER TABLE [dbo].[meals]  WITH CHECK ADD  CONSTRAINT [FK_meals_sides] FOREIGN KEY([sideid])
REFERENCES [dbo].[sides] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[meals] CHECK CONSTRAINT [FK_meals_sides]
GO
ALTER TABLE [dbo].[order]  WITH NOCHECK ADD  CONSTRAINT [FK_order_users] FOREIGN KEY([orderid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[order] NOCHECK CONSTRAINT [FK_order_users]
GO
ALTER TABLE [dbo].[orderlist]  WITH CHECK ADD  CONSTRAINT [FK_orderlist_meals] FOREIGN KEY([mealid])
REFERENCES [dbo].[meals] ([mealid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[orderlist] CHECK CONSTRAINT [FK_orderlist_meals]
GO
ALTER TABLE [dbo].[orderlist]  WITH CHECK ADD  CONSTRAINT [FK_orderlist_orders] FOREIGN KEY([orderid])
REFERENCES [dbo].[order] ([orderid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orderlist] CHECK CONSTRAINT [FK_orderlist_orders]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_countys] FOREIGN KEY([countyid])
REFERENCES [dbo].[countys] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_countys]
GO
USE [master]
GO
ALTER DATABASE [primary_quey_restourant] SET  READ_WRITE 
GO
