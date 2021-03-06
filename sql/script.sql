USE [master]
GO
/****** Object:  Database [Project]    Script Date: 07/11/2021 1:57:34 SA ******/
CREATE DATABASE [Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Project.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Project_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Project] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project] SET  MULTI_USER 
GO
ALTER DATABASE [Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Project] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Project]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 07/11/2021 1:57:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NULL,
	[role] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 07/11/2021 1:57:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[image] [nvarchar](max) NULL,
	[user] [nvarchar](100) NOT NULL,
	[ProductID] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[user] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 07/11/2021 1:57:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[brand] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 07/11/2021 1:57:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[UserName] [nvarchar](100) NOT NULL,
	[Fullname] [nvarchar](100) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 07/11/2021 1:57:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07/11/2021 1:57:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[user] [nvarchar](100) NULL,
	[OrderDate] [date] NULL,
	[Total] [int] NULL,
 CONSTRAINT [PK__Orders__3214EC271322EAE1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 07/11/2021 1:57:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[ProductModel] [nvarchar](max) NULL,
	[Manufacturer] [nvarchar](max) NULL,
	[Price] [int] NULL,
	[image] [nvarchar](max) NULL,
	[ReleaseDate] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[cid] [int] NULL,
 CONSTRAINT [PK__Product__B40CC6ED07FF3A3F] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'', N'', N'user')
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'ad', N'123', N'user')
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'admin', N'admin123', N'admin')
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'adsa', NULL, N'user')
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'sa', N'123', N'user')
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'zc', N'123', N'user')
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'zx', N'123', N'user')
INSERT [dbo].[Cart] ([image], [user], [ProductID], [quantity], [price]) VALUES (N'images/rift.jpg', N'sa', 3, 2, 20000000)
INSERT [dbo].[Category] ([id], [brand]) VALUES (1, N'Oculus')
INSERT [dbo].[Category] ([id], [brand]) VALUES (2, N'Windows Mixed Reality')
INSERT [dbo].[Category] ([id], [brand]) VALUES (3, N'Vive')
INSERT [dbo].[Category] ([id], [brand]) VALUES (4, N'Valve')
INSERT [dbo].[Customer] ([UserName], [Fullname], [Phone], [Address], [Email]) VALUES (N'', N'', N'', N'', N'')
INSERT [dbo].[Customer] ([UserName], [Fullname], [Phone], [Address], [Email]) VALUES (N'sa', N'Chau', N'0943661382', N'C4-C203', N'unknowquest@yahoo.com')
INSERT [dbo].[Customer] ([UserName], [Fullname], [Phone], [Address], [Email]) VALUES (N'zc', N'', N'053625', N'km 29 đại lộ thăng long', N'VjnhLux@fpt.edu')
INSERT [dbo].[Customer] ([UserName], [Fullname], [Phone], [Address], [Email]) VALUES (N'zx', N'', N'614', N'km', N'Vjnhvjp@fpt.edu')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (2, 5, 1, 8900000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (6, 5, 1, 9900000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (6, 7, 1, 16000000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (7, 3, 1, 20000000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (8, 12, 1, 39000000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (9, 4, 1, 8900000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (10, 12, 1, 39000000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (11, 8, 1, 25000000)
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [user], [OrderDate], [Total]) VALUES (1, N'sa', CAST(N'2021-07-15' AS Date), 8900000)
INSERT [dbo].[Orders] ([ID], [user], [OrderDate], [Total]) VALUES (2, N'sa', CAST(N'2021-07-15' AS Date), 8900000)
INSERT [dbo].[Orders] ([ID], [user], [OrderDate], [Total]) VALUES (3, N'sa', CAST(N'2021-07-15' AS Date), 9900000)
INSERT [dbo].[Orders] ([ID], [user], [OrderDate], [Total]) VALUES (4, N'sa', CAST(N'2021-07-15' AS Date), 16000000)
INSERT [dbo].[Orders] ([ID], [user], [OrderDate], [Total]) VALUES (5, N'sa', CAST(N'2021-07-15' AS Date), 8900000)
INSERT [dbo].[Orders] ([ID], [user], [OrderDate], [Total]) VALUES (6, N'sa', CAST(N'2021-07-20' AS Date), 25900000)
INSERT [dbo].[Orders] ([ID], [user], [OrderDate], [Total]) VALUES (7, N'sa', CAST(N'2021-07-21' AS Date), 20000000)
INSERT [dbo].[Orders] ([ID], [user], [OrderDate], [Total]) VALUES (8, N'sa', CAST(N'2021-07-21' AS Date), 39000000)
INSERT [dbo].[Orders] ([ID], [user], [OrderDate], [Total]) VALUES (9, N'sa', CAST(N'2021-07-21' AS Date), 8900000)
INSERT [dbo].[Orders] ([ID], [user], [OrderDate], [Total]) VALUES (10, N'sa', CAST(N'2021-07-21' AS Date), 39000000)
INSERT [dbo].[Orders] ([ID], [user], [OrderDate], [Total]) VALUES (11, N'sa', CAST(N'2021-07-21' AS Date), 25000000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (1, N'Oculus Quest', N'Oculus', N'Facebook', 14900000, N'images/quest.jpg', N'2019-04-12', N'Quest', 3, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (2, N'Oculus Quest 2', N'Oculus', N'Facebook', 8900000, N'images/quest 2.jpg', N'2020-11-20', N'Oculus Quest', 7, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (3, N'Oculus Rift', N'Oculus', N'Facebook', 20000000, N'images/rift.jpg', N'2015-05-06', N'Oculus Rift.', 4, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (4, N'Oculus Rift S', N'Oculus', N'Facebook', 8900000, N'images/rifts.jpg', N'2019-03-20', N'Facebook Technologies Announced in March 2019 and released that May it is a successor to the original Oculus Rift CV1 model with noted changes including a new inside-out positional tracking system with cameras embedded inside the headset unit', 5, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (5, N'HP Mixed Reality', N'Windows Mixed Reality', N'HP', 9900000, N'images/HP.jpg', N'2018-06-05', N'The HP Windows Mixed Reality Headset', 6, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (6, N'HP Reverb', N'Windows Mixed Reality', N'HP', 14000000, N'images/HP Reverb.jpg', N'2019-06-18', N'The HP Reverb is the companys next entry into the world of virtual reality VR using the Windows Mixed Reality MR platform The headset may not look much different from some of the other products on the market but it has some high-end specs that help it stand out However while we find the headsets resolution to be super sharp we also find its software setup to be rather difficult That said the hardware itself is easy to get ready for play and it feels light on your head which is only hampered by tracking issues As you can see already the HP Reverb is definitely a mixed bag for what it costs', 4, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (7, N'HP Reverb G2', N'Windows Mixed Reality', N'HP', 16000000, N'images/HPG2.jpg', N'2020-11-10', N'The Reverb G2 is the first Windows Mixed Reality headset with four tracking sensors Previous WMR devices only had two which made it difficult for them to know where your controllers were at all times Thats the last thing you want as tracking issues can easily break the illusion of VR especially in fast-paced games or experiences where your hands are all over the place By increasing its sensor count HP can now keep up with the Quest 2 and Rift S which have four and five sensors respectively', 5, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (8, N'HTC Vive', N'Vive', N'HTC', 25000000, N'images/Vive.jpg', N'2016-04-05', N'The HTC Vive is a virtual reality headset developed by HTC and Valve. The headset uses room scale tracking technology allowing the user to move in 3D space and use motiontracked handheld controllers to interact with the environment The HTC Vive was unveiled during HTC''s Mobile World Congress keynote in March 2015 Development kits were sent out in August and September 2015 and the first consumer version of the device was released in April 2016 ', 6, 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (9, N'HTC Vive Pro', N'Vive', N'HTC', 36000000, N'images/VivePro.jpg', N'2018-04-05', N'HTC Vive Pro also known as HTC Vive 1.5 is the 2018 update to the first consumer version of the HTC Vive (Platform) Virtual Reality HMD developed by HTC It is part of the SteamVR ecosystem created by Valve Indeed it was the partnership between the two notable technology companies that led to a quality product and made possible the integration of the VR headset with the SteamVR platform ', 8, 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (10, N'HTC Vive Cosmos', N'Vive', N'HTC', 18900000, N'images/ViveCosmos.jpg', N'2019-10-09', N'HTCs Vive headset helped create virtual reality as we know it today The Vive was the first big consumer headset to ship with motion controllers and it normalized the idea that VR was about physical movement not just visual immersion Now three years after the Vives release HTC is ready to move on Its replacing the consumer Vive with a headset called the Vive Cosmos which started shipping last week Where the original Vive was a groundbreaking product though the Cosmos is playing catch-up in a crowded field', 4, 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (11, N'HTC Vive Focus', N'Vive', N'HTC', 21000000, N'images/ViveFocus.jpg', N'2019-03-25', N'The HTC VIVE Focus is a standalone VR headset made by HTC a world-famous technology manufacturer from Taiwan HTCs VIVE Focus is one of the first standalone VR headsets to have 6DoF 6 Degrees of Freedom VIVE Focus users have access to VIVE Wave HTCs open content platform This platform integrates the content that is already present on the HTC VIVEPORT platform', 4, 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (12, N'Valve Index', N'Valve', N'Valve', 39000000, N'images/index.jpg', N'2019-06-28', N'The headset uses an IPS fast switching[7] 1440×1600 LCD panel for each eye for a combined resolution of 2880×1600. The panels are full RGB and can operate at refresh rates of 80 Hz, 90 Hz, 120 Hz, or a currently experimental 144 Hz mode.[3] The specified field of view is 130° but users report a practical field of view of 120°'',.-0=.[8]', 3, 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (13, N'Lenovo Explorer', N'Windows Mixed Reality', N'Lenovo', 8900000, N'images/Lenovo.jpg ', N'2017-10-04', N'In a bid to deliver immersive virtual reality experience without complicated setup various vendors have been developing Windows Mixed Reality compliant headsets Lenovo Explorer is one of the latest devices to join the fray after being revealed at IFA 2017 Developed by computing giant Lenovo this virtual reality headset is released for purchase in October 2017 and is priced at $399 for a set of Lenovo explorer headset and a couple of motion controllers', 7, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (14, N'Dell Visor', N'Windows Mixed Reality', N'Dell', 8900000, N'images/Dell.jpg', N'2017-10-12', N'Dell has placed great effort on the ergonomics aspect of the headset with the Dell Visor spotting an elegant white and features the best ideas from Playstation VR That includes the front of the visor that can be flipped up allowing the user convenience in switching between digital and the real world The design is made so that the Dell Visor can be worn comfortably over your glasses A dual 1440 x 1440 resolution 2 inch LCD Display provides a clear and pleasing virtual reality environment for the user A 90 Hz refresh rate and 110 degree field of view puts it on par with competing VR headsets Clear and sharp visuals are reported from users who have tried out the Dell Visor As with any Microsoft Windows Mixed Reality headset it features a dual camera that is used for positional tracking Without the complication of having an external tracker the Dell Visor only requires a USB and HDMI connection to the PC to be functional ', 4, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductModel], [Manufacturer], [Price], [image], [ReleaseDate], [Description], [quantity], [cid]) VALUES (15, N'Acer Windows Mixed Reality', N'Windows Mixed Reality', N'Acer', 9900000, N'images/Acer.jpg', N'2017-07-08', N'Acer Windows Hảo Hán', 5, 2)
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer] FOREIGN KEY([user])
REFERENCES [dbo].[Customer] ([UserName])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [fk_user] FOREIGN KEY([UserName])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [fk_user]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [fk_orderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [fk_orderID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [fk_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [fk_ProductID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_order] FOREIGN KEY([user])
REFERENCES [dbo].[Customer] ([UserName])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_order]
GO
USE [master]
GO
ALTER DATABASE [Project] SET  READ_WRITE 
GO
