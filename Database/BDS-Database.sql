USE [master]
GO
/****** Object:  Database [dbBatDongSan]    Script Date: 09/01/2017 12:44:26 CH ******/
CREATE DATABASE [dbBatDongSan]

GO
USE [dbBatDongSan]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[Content] [nvarchar](1000) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Criteria]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Criteria](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](500) NULL,
	[Score] [float] NULL,
	[GroupID] [int] NULL,
	[Type] [int] NULL,
	[Description] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Criteria] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailProject]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailProject](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectID] [bigint] NULL,
	[CriteriaID] [int] NULL,
	[Value] [int] NULL,
 CONSTRAINT [PK_DetailProject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[District]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[District](
	[ID] [varchar](5) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Type] [nvarchar](30) NULL,
	[Location] [varchar](30) NULL,
	[ProvinceID] [varchar](5) NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroupCriteria]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupCriteria](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_GroupCriteria] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Image]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectID] [bigint] NULL,
	[CommentID] [bigint] NULL,
	[Name] [nvarchar](150) NULL,
	[Url] [nvarchar](200) NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Like]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectID] [bigint] NULL,
	[UserID] [bigint] NULL,
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parameter]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parameter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParaKey] [varchar](50) NULL,
	[Value] [nvarchar](150) NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Parameter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Contact] [ntext] NULL,
	[Price] [float] NULL,
	[UnitPrice] [nvarchar](20) NULL,
	[Acreage] [float] NULL,
	[Status] [nvarchar](50) NULL,
	[Deadline] [datetime] NULL,
	[Description] [ntext] NULL,
	[Lat] [varchar](50) NULL,
	[Long] [varchar](50) NULL,
	[TypeID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Province]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Province](
	[ID] [varchar](5) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Save]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Save](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Save] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeProject]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypeProject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_TypeProject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/01/2017 12:44:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[RoleID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](150) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([ID], [ProjectID], [UserID], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (1, 10022, 5, N'Không gian ngôi nhà rộng rãi, thoáng mát', CAST(0x0000A6EC013AC8C6 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Comment] ([ID], [ProjectID], [UserID], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (2, 10022, 2, N'Ngôi nhà này không được tốt', CAST(0x0000A6EC013AF6AB AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Comment] ([ID], [ProjectID], [UserID], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (3, 10022, 5, N'noi dung', CAST(0x0000A6EC015829A7 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Comment] ([ID], [ProjectID], [UserID], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (4, 10022, 5, N'noi dung', CAST(0x0000A6EC01586053 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Comment] ([ID], [ProjectID], [UserID], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (5, 10022, 5, N'test noi dung', CAST(0x0000A6EC015E44C4 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Comment] ([ID], [ProjectID], [UserID], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (6, 10022, 5, N'noi dung', CAST(0x0000A6EC01603C16 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Comment] ([ID], [ProjectID], [UserID], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (7, 10022, 5, N'noi dung', CAST(0x0000A6EC0160EE0D AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Comment] ([ID], [ProjectID], [UserID], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (8, 10021, 5, N'noi dung', CAST(0x0000A6EC01630F97 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Comment] ([ID], [ProjectID], [UserID], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (9, 10021, 5, N'noi dung ', CAST(0x0000A6EC01649DF6 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Comment] ([ID], [ProjectID], [UserID], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (10, 10021, 5, N'ngoi nha rat dep', CAST(0x0000A6EC01656841 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Comment] ([ID], [ProjectID], [UserID], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (11, 10019, 5, N'noi dung', CAST(0x0000A6EC016E9869 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Comment] ([ID], [ProjectID], [UserID], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (12, 10018, 5, N'noi dung', CAST(0x0000A6EC0177260B AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Criteria] ON 

INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (1, N'TKTU-01', N'Ít nhất một cửa sổ hướng Đông', 0.1, 1, 1, NULL, CAST(0x0000A6E10127BF13 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (2, N'TKTU-02', N'Ban công rộng 1-1.5m liền kề với phòng khách', 0.1, 1, 1, NULL, CAST(0x0000A6E10128F192 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (3, N'TKTU-03', N'Không gian mở riêng biệt như hiên nhà, sàn, sân.', 0.1, 1, 1, NULL, CAST(0x0000A6E101293DD8 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (4, N'TKTU-04', N'Cách âm tốt trong từng phòng và các nhà.', 0.1, 1, 1, NULL, CAST(0x0000A6E10129ABB7 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (5, N'TKTU-05', N'Thiết kế không lãng phí không gian trong căn nhà.', 0.5, 1, 1, NULL, CAST(0x0000A6E10129E0BA AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (6, N'KNTC-01', N'Tạo điểm nhấn kiến trúc khi bước vào dự án hay khu phố', 0.2, 1, 2, NULL, CAST(0x0000A6E1012BCB30 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (7, N'KNTC-02', N'Nơi đậu xe cách khu vực ở một khoảng đi bộ 2-10m', 0.1, 1, 2, NULL, CAST(0x0000A6E1012BEEB5 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (8, N'KNTC-03', N'Dự án có đường kết nối từ cổng vào với khu vực ở và cũng như kết nối với các tiện ích.', 0.2, 1, 2, NULL, CAST(0x0000A6E1012C1857 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (9, N'KNTC-04', N'Dự án có chỗ đậu xe và đường đi cho người già và ngưới khuyết tật.', 0.1, 1, 2, NULL, CAST(0x0000A6E1012C402D AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (10, N'KNTC-05', N'Khu vực để xe của khách cách cổng chính tối đa 15m .', 0.2, 1, 2, NULL, CAST(0x0000A6E1012C7746 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (11, N'KNTN-01', N'Nhà ở có Thiết kế Phòng khách, phòng ăn và bếp liên hoàn.', 0.2, 1, 3, NULL, CAST(0x0000A6E1012CBFB1 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (12, N'KNTN-02', N'Các phòng ngủ phải liền kề vách để dễ dàng cải tạo liên thông khi cần thiết.', 0.2, 1, 3, NULL, CAST(0x0000A6E1012CDE54 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (13, N'KNTN-03', N'Cầu thang được thiết kế về 1 phía trước hoặc sau cùng của ngôi nhà.', 0.2, 1, 3, NULL, CAST(0x0000A6E1012CF876 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (14, N'KNTN-04', N'Đường ống kĩ thuật toàn nhà gom về 1 trục theo phương đứng.', 0.2, 1, 3, NULL, CAST(0x0000A6E1012D1EAC AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (15, N'KNTN-05', N'Bố trí không gian ở có thể chuyển đổi thành không gian kinh doanh.', 0.2, 1, 3, NULL, CAST(0x0000A6E1012D7057 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (16, N'KNTN-06', N'Từ hiện trạng có thể dễ dàng mở rộng cơi nới phía trên, xuống dưới và ngang.', 1, 1, 3, NULL, CAST(0x0000A6E1012D9477 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (17, N'BTKG-01', N'Kích thước phòng ngủ', 1, 1, 4, NULL, CAST(0x0000A6E1012EAB28 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (18, N'BTKG-02', N'Kích thước toilet', 1, 1, 4, NULL, CAST(0x0000A6E1012ECCD5 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (19, N'BTKG-03', N'Kích thước phòng khách', 1, 1, 4, NULL, CAST(0x0000A6E1012EE6D9 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (20, N'BTKG-04', N'Số lượng phòng ngủ', 1, 1, 4, NULL, CAST(0x0000A6E1012FA41C AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (21, N'BTKG-05', N'Số lượng toilet chung', 1, 1, 4, NULL, CAST(0x0000A6E1012FCCEC AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (22, N'BTKG-06', N'Số lượng toilet riêng', 1, 1, 4, NULL, CAST(0x0000A6E1012FD537 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (23, N'HTME-01', N'Nước sinh hoạt được cung cấp trực tiếp từ hệ thống cấp nước đô thị, hệ thống thoát nước đấu nối trực tiếp vào hệ thống thoát thải địa phương.', 0.5, 1, 5, NULL, CAST(0x0000A6E10130622E AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (24, N'HTME-02', N'Có bể chứa nước ngầm dự trữ, Có hố ga thu nước thải độc lập cho từng căn nhà độc lập', 0.25, 1, 5, NULL, CAST(0x0000A6E101308976 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (25, N'HTME-03', N'Hệ thống đường ống cấp thoát nước có độ bền cao, hệ thống ngăn mùi từ hố ga hiệu quả', 0.25, 1, 5, NULL, CAST(0x0000A6E10130A186 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (26, N'HTME-04', N'Hệ thống cung cấp điện đúng tiêu chuẩn.', 0.2, 1, 5, NULL, CAST(0x0000A6E10130D52F AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (27, N'HTME-05', N'Có máy phát điện.', 0.2, 1, 5, NULL, CAST(0x0000A6E10130E99D AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (28, N'HTME-06', N'Có hệ thống báo cháy, chữa cháy tự động', 0.2, 1, 5, NULL, CAST(0x0000A6E10130FF77 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (29, N'HTME-07', N'Vệ sinh môi trường tương đối sạch sẽ, rác thải được thu gom định kỳ trong ngày', 0.2, 1, 5, NULL, CAST(0x0000A6E10131130C AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (30, N'HTME-08', N'Hệ thống gom rác thuận tiện và dễ dàng.', 0.2, 1, 5, NULL, CAST(0x0000A6E1013125CC AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (31, N'HTME-09', N'Bãi đậu xe đúng tiếu chuẩn.', 0.2, 1, 5, NULL, CAST(0x0000A6E101313D5B AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (32, N'VLXD-01', N'Vật liệu tốt, hạn chế việc bảo trì.', 0.5, 1, 6, NULL, CAST(0x0000A6E101318023 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (33, N'VLXD-02', N'Dễ dàng khi bảo trì.', 0.5, 1, 6, NULL, CAST(0x0000A6E1013194CF AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (34, N'VLXD-03', N'Vật liệu không hoá chất độc hại.', 0.5, 1, 6, NULL, CAST(0x0000A6E10131CAEC AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (35, N'TDXH-01', N'Nhà ở cách nơi làm việc dưới 2km', 1, 2, 1, NULL, CAST(0x0000A6E1013228E9 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (36, N'TDXH-02', N'Gần chợ hoặc siêu thị hay tạp hóa dưới 500m', 0.25, 2, 1, NULL, CAST(0x0000A6E101325304 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (37, N'TDXH-03', N'Cách trường học dưới 2 km.', 0.25, 2, 1, NULL, CAST(0x0000A6E10132655D AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (38, N'TDXH-04', N'Cách phòng khám bệnh dưới 2km', 0.25, 2, 1, NULL, CAST(0x0000A6E1013276F6 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (39, N'TDXH-05', N'Cách cơ sở xã hội,văn hoá thể thao dưới 1.2km', 0.25, 2, 1, NULL, CAST(0x0000A6E101328810 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (40, N'HTHT-01', N'Đảm bảo khả năng đi lại dễ dàng bằng phương tiện cá nhân', 0.5, 2, 2, NULL, CAST(0x0000A6E10132DDE8 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (41, N'HTHT-02', N'Trạm xe bus ,metro cách 400m hoặc 5 phút đi bộ.', 0.25, 2, 2, NULL, CAST(0x0000A6E1013301D5 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (42, N'HTHT-03', N'Quy hoạch tổng thể và quy hoạch hạ tầng giao thông dự kiến phát triển của khu vực xung quanh đồng bộ.', 0.25, 2, 2, NULL, CAST(0x0000A6E101332203 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (43, N'YTPT-01', N'Lịch sử căn nhà hoặc khu đất', 0.3, 2, 3, NULL, CAST(0x0000A6E10133C296 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (44, N'YTPT-02', N'Thế đất và hình dáng đất', 0.3, 2, 3, NULL, CAST(0x0000A6E10133DFA6 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (45, N'YTPT-03', N'Phía đối diện căn nhà và Bên phải bên trái nhà.', 0.3, 2, 3, NULL, CAST(0x0000A6E101340CE7 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (46, N'YTPT-04', N'Cửa chính căn hộ đối diện với cầu thang đi lên ở bên ngoài', 0.2, 2, 3, NULL, CAST(0x0000A6E1013435EF AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (47, N'YTPT-05', N'Cửa chính căn hộ đối diện với góc tường', 0.2, 2, 3, NULL, CAST(0x0000A6E1013453E9 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (48, N'YTPT-06', N'Bên ngoài cửa là cầu thang bộ hoặc cầu thang máy', 0.2, 2, 3, NULL, CAST(0x0000A6E101347BA8 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (49, N'YTPT-07', N'Nhà vệ sinh liền bếp', 0.5, 2, 3, NULL, CAST(0x0000A6E10134A7FF AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (50, N'YTPT-08', N'Nhà vệ sinh nằm ở trung tâm', 0.5, 2, 3, NULL, CAST(0x0000A6E10134BE2D AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (51, N'YTPT-09', N'Mở cửa thấy ngay bếp', 0.5, 2, 3, NULL, CAST(0x0000A6E10134DBE2 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (52, N'KVCN-01', N'Nằm trong tổng thể quy hoạch thiết kế có yêu cầu về diện tích cây xanh cho từng nhà ở, khu phố.', 1, 3, 1, NULL, CAST(0x0000A6E4010759F3 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (53, N'KVCN-02', N'Khu vực yên tĩnh, tiện cho việc nghỉ ngơi, tịnh dưỡng', 1, 3, 1, NULL, CAST(0x0000A6E40107711E AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (54, N'KVCN-03', N'Nhìn ra công viên, gần hồ nước, sát biển,…', 1, 3, 1, NULL, CAST(0x0000A6E401078765 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (55, N'TIXQ-01', N'Chợ', 0.25, 3, 2, NULL, CAST(0x0000A6E40107B150 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (56, N'TIXQ-02', N'Trường học', 0.25, 3, 2, NULL, CAST(0x0000A6E40107C465 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (57, N'TIXQ-03', N'Phòng khám', 0.25, 3, 2, NULL, CAST(0x0000A6E40107DA7B AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (58, N'TIXQ-04', N'Cơ sở văn hóa, thể thao', 0.25, 3, 2, NULL, CAST(0x0000A6E4010807FB AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (59, N'MTXQ-01', N'Môi trường sạch sẽ, thoáng mát, đường giao thông và các không gian công cộng được vệ sinh thường xuyên hàng ngày.', 0.5, 3, 3, NULL, CAST(0x0000A6E401084143 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (60, N'MTXQ-02', N'Trồng cây để giảm tiếng ồn', 0.5, 3, 3, NULL, CAST(0x0000A6E40108692E AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (61, N'HXXQ-01', N'Nghề nghiệp ', 0.25, 3, 4, NULL, CAST(0x0000A6E4010897AF AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (62, N'HXXQ-02', N'Trình độ học vấn', 0.25, 3, 4, NULL, CAST(0x0000A6E40108B408 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (63, N'HXXQ-03', N'Mức thu nhập', 0.25, 3, 4, NULL, CAST(0x0000A6E40108D91B AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (64, N'HXXQ-04', N'Ý thức cộng đồng', 0.25, 3, 4, NULL, CAST(0x0000A6E40108F2EA AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (65, N'KVAN-01', N'Định vị nơi đậu xe có thể giám sát xe', 0.2, 3, 5, NULL, CAST(0x0000A6E401093DE4 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (66, N'KVAN-02', N'Gắn camera giám sát trong nhà', 0.2, 3, 5, NULL, CAST(0x0000A6E401097405 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (67, N'KVAN-03', N'Chiếu sáng ban đêm', 0.2, 3, 5, NULL, CAST(0x0000A6E40109A4DF AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (68, N'KVAN-04', N'Có nhân viên bảo vệ an ninh trật tự riêng cho từng khu vực.', 0.2, 3, 5, NULL, CAST(0x0000A6E40109C2D9 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (69, N'KVAN-05', N'Cung cấp các hệ thống báo cháy, lối thoát hiểm, vòi nước, bình chữa cháy, vòi phun nước tại các vị trí thuận tiện và khoảng thời gian.', 0.2, 3, 5, NULL, CAST(0x0000A6E40109DA86 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (70, N'TC-01', N'Số tiền thanh toán ban đầu', 1, 4, 1, NULL, CAST(0x0000A6E4010A2921 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (71, N'TC-02', N'Số tiền ngân hàng cho vay tối đa', 1, 4, 1, NULL, CAST(0x0000A6E4010A4F1E AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (72, N'TC-03', N'Lãi suất cho vay', 1, 4, 1, NULL, CAST(0x0000A6E4010A60E5 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (73, N'TC-04', N'Thời gian cho vay của ngân hàng', 1, 4, 1, NULL, CAST(0x0000A6E4010A736D AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (74, N'TC-05', N'Số tiền cho vay phải trả hàng tháng', 1, 4, 1, NULL, CAST(0x0000A6E4010A8495 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (75, N'DT-01', N'Tổng tiền phải bỏ ra để có được 

', 0.5, 5, 1, NULL, CAST(0x0000A6E4010ADF23 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (76, N'DT-02', N'Chi phí sẽ phải bỏ ra trong tương lai: bảo trì và chi phí quản lý hàng tháng', 0.5, 5, 1, NULL, CAST(0x0000A6E4010AF7EB AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (77, N'TDDA-01', N'Thời gian rao bán của căn nhà trên thị trường bất động sản.', 0.5, 5, 2, NULL, CAST(0x0000A6E4010B1139 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (78, N'TDDA-02', N'Tiến độ dự án hiện tại đúng tiến độ đề ra', 0.5, 5, 2, NULL, CAST(0x0000A6E4010B2423 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (79, N'QC-01', N'Nội dung quảng cáo giới thiệu căn nhà đến anh/chị chân thực 

', 0.5, 5, 3, NULL, CAST(0x0000A6E4010B9058 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (80, N'QC-02', N'Khách hàng được đối thoại trực tiếp với chủ đầu tư', 0.5, 5, 3, NULL, CAST(0x0000A6E4010BA471 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (81, N'DGTN-01', N'Thực tế những dự án chủ đầu tư đã xây dựng trước đây và bàn giao', 0.25, 5, 4, NULL, CAST(0x0000A6E4010BCF61 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (82, N'DGTN-02', N'Dự án trước đây hoặc hiện tại có sai phạm về pháp lý', 0.5, 5, 4, NULL, CAST(0x0000A6E4010BEAFA AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (83, N'DGTN-03', N'Chất lượng xây dựng', 0.25, 5, 4, NULL, CAST(0x0000A6E4010C058B AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (84, N'DGTN-04', N'Đánh giá tín nhiệm của chủ đầu tư về tài chính', 1, 5, 4, NULL, CAST(0x0000A6E4010CBFBB AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (85, N'DGTN-05', N'Thương hiệu và uy tín về thiết kế

', 0.25, 5, 4, NULL, CAST(0x0000A6E4010CE425 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (86, N'DGTN-06', N'Thương hiệu và uy tín xây dựng

', 0.25, 5, 4, NULL, CAST(0x0000A6E4010CF773 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (87, N'DGTN-07', N'Thương hiệu và uy tín giám sát

', 0.25, 5, 4, NULL, CAST(0x0000A6E4010D07BA AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (88, N'DGTN-08', N'Kế hoạch triển khai tương lai gần của chủ đầu tư
Phù hợp với năng lực của chủ đầu tư
', 1, 5, 4, NULL, CAST(0x0000A6E4010D34C4 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (89, N'UT-01', N'Các khen thưởng nếu có

', 1, 5, 5, NULL, CAST(0x0000A6E4010D598D AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (90, N'UT-02', N'Chủ đầu tư đã thực hiện như theo đúng cam kết với khách hàng.', 0.2, 5, 5, NULL, CAST(0x0000A6E4010D7957 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (91, N'PL-01', N'Có quy hoạch 1/500', 1, 6, 1, NULL, CAST(0x0000A6E4010E0AF4 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (92, N'PL-02', N'Giấy phép xây dựng', 1, 6, 1, NULL, CAST(0x0000A6E4010E62C4 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (93, N'PL-03', N'Đã nghiệm thu', 1, 6, 1, NULL, CAST(0x0000A6E4010E7E37 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (94, N'PL-04', N'Hợp đồng giao dịch rõ ràng, minh bạch.', 1, 6, 1, N'<h1><strong>HTML</strong> inside <code>the</code> <em>tooltip</em></h1>', CAST(0x0000A6E4010EA464 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (95, N'CB-01', N'Địa chỉ', 1, 8, 1, NULL, CAST(0x0000A6E8014F5B6C AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (96, N'CB-02', N'Giá', 1, 8, 1, NULL, CAST(0x0000A6E8014F7188 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Criteria] ([ID], [Code], [Name], [Score], [GroupID], [Type], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (97, N'CB-03', N'Diện tích', 1, 8, 1, NULL, CAST(0x0000A6E8014F85CC AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Criteria] OFF
SET IDENTITY_INSERT [dbo].[DetailProject] ON 

INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10018, 10018, 3, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10019, 10018, 5, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10020, 10018, 18, 2)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10021, 10018, 20, 2)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10022, 10018, 21, 2)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10023, 10018, 36, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10024, 10018, 37, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10025, 10018, 52, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10026, 10018, 55, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10027, 10018, 56, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10028, 10018, 57, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10029, 10018, 58, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10030, 10018, 66, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10031, 10018, 94, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10032, 10018, 95, 76279)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10033, 10018, 96, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10034, 10018, 97, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10035, 10019, 2, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10036, 10019, 3, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10037, 10019, 5, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10038, 10019, 35, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10039, 10019, 36, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10040, 10019, 38, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10041, 10019, 39, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10042, 10019, 40, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10043, 10019, 49, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10044, 10019, 52, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10045, 10019, 53, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10046, 10019, 55, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10047, 10019, 56, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10048, 10019, 57, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10049, 10019, 58, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10050, 10019, 66, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10051, 10019, 91, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10052, 10019, 94, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10053, 10019, 95, 76279)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10054, 10019, 96, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10055, 10019, 97, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10056, 10020, 2, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10057, 10020, 3, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10058, 10020, 5, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10059, 10020, 17, 15)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10060, 10020, 20, 3)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10061, 10020, 21, 2)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10062, 10020, 35, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10063, 10020, 36, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10064, 10020, 38, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10065, 10020, 39, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10066, 10020, 40, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10067, 10020, 49, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10068, 10020, 52, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10069, 10020, 53, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10070, 10020, 55, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10071, 10020, 56, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10072, 10020, 57, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10073, 10020, 58, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10074, 10020, 66, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10075, 10020, 91, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10076, 10020, 94, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10077, 10020, 95, 77179)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10078, 10020, 96, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10079, 10020, 97, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10080, 10021, 3, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10081, 10021, 4, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10082, 10021, 17, 20)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10083, 10021, 18, 3)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10084, 10021, 20, 2)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10085, 10021, 21, 2)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10086, 10021, 35, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10087, 10021, 37, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10088, 10021, 38, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10089, 10021, 43, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10090, 10021, 44, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10091, 10021, 46, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10092, 10021, 66, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10093, 10021, 67, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10094, 10021, 91, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10095, 10021, 94, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10096, 10021, 95, 76279)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10097, 10021, 96, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10098, 10021, 97, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10099, 10022, 3, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10100, 10022, 4, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10101, 10022, 19, 30)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10102, 10022, 20, 3)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10103, 10022, 21, 2)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10104, 10022, 35, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10105, 10022, 37, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10106, 10022, 38, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10107, 10022, 43, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10108, 10022, 44, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10109, 10022, 46, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10110, 10022, 66, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10111, 10022, 67, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10112, 10022, 91, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10113, 10022, 94, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10114, 10022, 95, 76279)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10115, 10022, 96, 0)
INSERT [dbo].[DetailProject] ([ID], [ProjectID], [CriteriaID], [Value]) VALUES (10116, 10022, 97, 0)
GO
SET IDENTITY_INSERT [dbo].[DetailProject] OFF
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'001', N'Ba Đình', N'Quận', N'21 02 08N, 105 49 38E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'002', N'Hoàn Kiếm', N'Quận', N'21 01 53N, 105 51 09E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'003', N'Tây Hồ', N'Quận', N'21 04 10N, 105 49 07E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'004', N'Long Biên', N'Quận', N'21 02 21N, 105 53 07E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'005', N'Cầu Giấy', N'Quận', N'21 01 52N, 105 47 20E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'006', N'Đống Đa', N'Quận', N'21 00 56N, 105 49 06E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'007', N'Hai Bà Trưng', N'Quận', N'21 00 27N, 105 51 35E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'008', N'Hoàng Mai', N'Quận', N'20 58 33N, 105 51 22E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'009', N'Thanh Xuân', N'Quận', N'20 59 44N, 105 48 56E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'016', N'Sóc Sơn', N'Huyện', N'21 16 55N, 105 49 46E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'017', N'Đông Anh', N'Huyện', N'21 08 16N, 105 49 38E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'018', N'Gia Lâm', N'Huyện', N'21 01 28N, 105 56 54E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'019', N'Từ Liêm', N'Huyện', N'21 02 39N, 105 45 32E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'020', N'Thanh Trì', N'Huyện', N'20 56 32N, 105 50 55E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'024', N'Hà Giang', N'Thị Xã', N'22 46 23N, 105 02 39E', N'02')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'026', N'Đồng Văn', N'Huyện', N'23 14 34N, 105 15 48E', N'02')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'027', N'Mèo Vạc', N'Huyện', N'23 09 10N, 105 26 38E', N'02')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'028', N'Yên Minh', N'Huyện', N'23 04 20N, 105 10 13E', N'02')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'029', N'Quản Bạ', N'Huyện', N'23 04 03N, 104 58 05E', N'02')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'030', N'Vị Xuyên', N'Huyện', N'22 45 50N, 104 56 26E', N'02')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'031', N'Bắc Mê', N'Huyện', N'22 45 48N, 105 16 26E', N'02')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'032', N'Hoàng Su Phì', N'Huyện', N'22 41 37N, 104 40 06E', N'02')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'033', N'Xín Mần', N'Huyện', N'22 38 05N, 104 28 35E', N'02')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'034', N'Bắc Quang', N'Huyện', N'22 23 42N, 104 55 06E', N'02')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'035', N'Quang Bình', N'Huyện', N'22 23 07N, 104 37 11E', N'02')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'040', N'Cao Bằng', N'Thị Xã', N'22 39 20N, 106 15 20E', N'04')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'042', N'Bảo Lâm', N'Huyện', N'22 52 37N, 105 27 28E', N'04')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'043', N'Bảo Lạc', N'Huyện', N'22 52 31N, 105 42 41E', N'04')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'044', N'Thông Nông', N'Huyện', N'22 49 09N, 105 57 05E', N'04')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'045', N'Hà Quảng', N'Huyện', N'22 53 42N, 106 06 32E', N'04')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'046', N'Trà Lĩnh', N'Huyện', N'22 48 14N, 106 19 47E', N'04')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'047', N'Trùng Khánh', N'Huyện', N'22 49 31N, 106 33 58E', N'04')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'048', N'Hạ Lang', N'Huyện', N'22 42 37N, 106 41 42E', N'04')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'049', N'Quảng Uyên', N'Huyện', N'22 40 15N, 106 27 42E', N'04')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'050', N'Phục Hoà', N'Huyện', N'22 33 52N, 106 30 02E', N'04')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'051', N'Hoà An', N'Huyện', N'22 41 20N, 106 02 05E', N'04')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'052', N'Nguyên Bình', N'Huyện', N'22 38 52N, 105 57 02E', N'04')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'053', N'Thạch An', N'Huyện', N'22 28 51N, 106 19 51E', N'04')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'058', N'Bắc Kạn', N'Thị Xã', N'22 08 00N, 105 51 10E', N'06')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'060', N'Pác Nặm', N'Huyện', N'22 35 46N, 105 40 25E', N'06')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'061', N'Ba Bể', N'Huyện', N'22 23 54N, 105 43 30E', N'06')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'062', N'Ngân Sơn', N'Huyện', N'22 25 50N, 106 01 00E', N'06')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'063', N'Bạch Thông', N'Huyện', N'22 12 04N, 105 51 01E', N'06')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'064', N'Chợ Đồn', N'Huyện', N'22 11 18N, 105 34 43E', N'06')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'065', N'Chợ Mới', N'Huyện', N'21 57 56N, 105 51 29E', N'06')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'066', N'Na Rì', N'Huyện', N'22 09 48N, 106 05 09E', N'06')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'070', N'Tuyên Quang', N'Thị Xã', N'21 49 40N, 105 13 12E', N'08')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'072', N'Nà Hang', N'Huyện', N'22 28 34N, 105 21 03E', N'08')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'073', N'Chiêm Hóa', N'Huyện', N'22 12 49N, 105 14 32E', N'08')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'074', N'Hàm Yên', N'Huyện', N'22 05 46N, 105 00 13E', N'08')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'075', N'Yên Sơn', N'Huyện', N'21 51 53N, 105 18 14E', N'08')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'076', N'Sơn Dương', N'Huyện', N'21 40 22N, 105 22 57E', N'08')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'080', N'Lào Cai', N'Thành Phố', N'22 25 07N, 103 58 43E', N'10')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'082', N'Bát Xát', N'Huyện', N'22 35 50N, 103 44 49E', N'10')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'083', N'Mường Khương', N'Huyện', N'22 41 05N, 104 08 26E', N'10')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'084', N'Si Ma Cai', N'Huyện', N'22 39 46N, 104 16 05E', N'10')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'085', N'Bắc Hà', N'Huyện', N'22 30 08N, 104 18 54E', N'10')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'086', N'Bảo Thắng', N'Huyện', N'22 22 47N, 104 10 00E', N'10')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'087', N'Bảo Yên', N'Huyện', N'22 17 38N, 104 25 02E', N'10')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'088', N'Sa Pa', N'Huyện', N'22 18 54N, 103 54 18E', N'10')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'089', N'Văn Bàn', N'Huyện', N'22 03 48N, 104 10 59E', N'10')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'094', N'Điện Biên Phủ', N'Thành Phố', N'21 24 52N, 103 02 31E', N'11')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'095', N'Mường Lay', N'Thị Xã', N'22 01 47N, 103 07 10E', N'11')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'096', N'Mường Nhé', N'Huyện', N'22 06 11N, 102 30 54E', N'11')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'097', N'Mường Chà', N'Huyện', N'21 50 31N, 103 03 15E', N'11')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'098', N'Tủa Chùa', N'Huyện', N'21 58 19N, 103 23 01E', N'11')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'099', N'Tuần Giáo', N'Huyện', N'21 38 03N, 103 21 06E', N'11')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'100', N'Điện Biên', N'Huyện', N'21 15 19N, 103 03 19E', N'11')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'101', N'Điện Biên Đông', N'Huyện', N'21 14 07N, 103 15 19E', N'11')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'102', N'Mường Ảng', N'Huyện', N'', N'11')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'104', N'Lai Châu', N'Thị Xã', N'22 23 15N, 103 24 22E', N'12')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'106', N'Tam Đường', N'Huyện', N'22 20 16N, 103 32 53E', N'12')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'107', N'Mường Tè', N'Huyện', N'22 24 16N, 102 43 11E', N'12')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'108', N'Sìn Hồ', N'Huyện', N'22 17 21N, 103 18 12E', N'12')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'109', N'Phong Thổ', N'Huyện', N'22 38 24N, 103 22 38E', N'12')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'110', N'Than Uyên', N'Huyện', N'21 59 35N, 103 45 30E', N'12')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'111', N'Tân Uyên', N'Huyện', N'', N'12')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'116', N'Sơn La', N'Thành Phố', N'21 20 39N, 103 54 52E', N'14')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'118', N'Quỳnh Nhai', N'Huyện', N'21 46 34N, 103 39 02E', N'14')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'119', N'Thuận Châu', N'Huyện', N'21 24 54N, 103 39 46E', N'14')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'120', N'Mường La', N'Huyện', N'21 31 38N, 104 02 48E', N'14')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'121', N'Bắc Yên', N'Huyện', N'21 13 23N, 104 22 09E', N'14')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'122', N'Phù Yên', N'Huyện', N'21 13 33N, 104 41 51E', N'14')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'123', N'Mộc Châu', N'Huyện', N'20 49 21N, 104 43 10E', N'14')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'124', N'Yên Châu', N'Huyện', N'20 59 33N, 104 19 51E', N'14')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'125', N'Mai Sơn', N'Huyện', N'21 10 08N, 103 59 36E', N'14')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'126', N'Sông Mã', N'Huyện', N'21 06 04N, 103 43 56E', N'14')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'127', N'Sốp Cộp', N'Huyện', N'20 52 46N, 103 30 38E', N'14')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'132', N'Yên Bái', N'Thành Phố', N'21 44 28N, 104 53 42E', N'15')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'133', N'Nghĩa Lộ', N'Thị Xã', N'21 35 58N, 104 29 22E', N'15')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'135', N'Lục Yên', N'Huyện', N'22 06 44N, 104 43 12E', N'15')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'136', N'Văn Yên', N'Huyện', N'21 55 55N, 104 33 51E', N'15')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'137', N'Mù Cang Chải', N'Huyện', N'21 48 22N, 104 09 01E', N'15')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'138', N'Trấn Yên', N'Huyện', N'21 42 20N, 104 48 56E', N'15')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'139', N'Trạm Tấu', N'Huyện', N'21 30 40N, 104 28 03E', N'15')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'140', N'Văn Chấn', N'Huyện', N'21 34 15N, 104 35 19E', N'15')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'141', N'Yên Bình', N'Huyện', N'21 52 24N, 104 55 16E', N'15')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'148', N'Hòa Bình', N'Thành Phố', N'20 50 36N, 105 19 20E', N'17')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'150', N'Đà Bắc', N'Huyện', N'20 55 58N, 105 04 52E', N'17')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'151', N'Kỳ Sơn', N'Huyện', N'20 54 06N, 105 23 18E', N'17')
GO
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'152', N'Lương Sơn', N'Huyện', N'20 53 16N, 105 30 55E', N'17')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'153', N'Kim Bôi', N'Huyện', N'20 40 34N, 105 32 15E', N'17')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'154', N'Cao Phong', N'Huyện', N'20 41 23N, 105 17 48E', N'17')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'155', N'Tân Lạc', N'Huyện', N'20 36 44N, 105 15 03E', N'17')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'156', N'Mai Châu', N'Huyện', N'20 40 56N, 104 59 46E', N'17')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'157', N'Lạc Sơn', N'Huyện', N'20 29 59N, 105 24 57E', N'17')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'158', N'Yên Thủy', N'Huyện', N'20 25 42N, 105 37 59E', N'17')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'159', N'Lạc Thủy', N'Huyện', N'20 29 12N, 105 44 06E', N'17')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'164', N'Thái Nguyên', N'Thành Phố', N'21 33 20N, 105 48 26E', N'19')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'165', N'Sông Công', N'Thị Xã', N'21 29 14N, 105 48 47E', N'19')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'167', N'Định Hóa', N'Huyện', N'21 53 50N, 105 38 01E', N'19')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'168', N'Phú Lương', N'Huyện', N'21 45 57N, 105 43 22E', N'19')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'169', N'Đồng Hỷ', N'Huyện', N'21 41 10N, 105 55 43E', N'19')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'170', N'Võ Nhai', N'Huyện', N'21 47 14N, 106 02 29E', N'19')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'171', N'Đại Từ', N'Huyện', N'21 36 17N, 105 37 28E', N'19')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'172', N'Phổ Yên', N'Huyện', N'21 27 08N, 105 45 19E', N'19')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'173', N'Phú Bình', N'Huyện', N'21 29 36N, 105 57 42E', N'19')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'178', N'Lạng Sơn', N'Thành Phố', N'21 51 19N, 106 44 50E', N'20')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'180', N'Tràng Định', N'Huyện', N'22 18 09N, 106 26 32E', N'20')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'181', N'Bình Gia', N'Huyện', N'22 03 56N, 106 19 01E', N'20')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'182', N'Văn Lãng', N'Huyện', N'22 01 59N, 106 34 17E', N'20')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'183', N'Cao Lộc', N'Huyện', N'21 53 05N, 106 50 34E', N'20')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'184', N'Văn Quan', N'Huyện', N'21 51 04N, 106 33 04E', N'20')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'185', N'Bắc Sơn', N'Huyện', N'21 48 57N, 106 15 28E', N'20')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'186', N'Hữu Lũng', N'Huyện', N'21 34 33N, 106 20 33E', N'20')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'187', N'Chi Lăng', N'Huyện', N'21 40 05N, 106 37 24E', N'20')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'188', N'Lộc Bình', N'Huyện', N'21 40 41N, 106 58 12E', N'20')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'189', N'Đình Lập', N'Huyện', N'21 32 07N, 107 07 25E', N'20')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'193', N'Hạ Long', N'Thành Phố', N'20 52 24N, 107 05 23E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'194', N'Móng Cái', N'Thành Phố', N'21 26 31N, 107 55 09E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'195', N'Cẩm Phả', N'Thị Xã', N'21 03 42N, 107 17 22E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'196', N'Uông Bí', N'Thị Xã', N'21 04 33N, 106 45 07E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'198', N'Bình Liêu', N'Huyện', N'21 33 07N, 107 26 24E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'199', N'Tiên Yên', N'Huyện', N'21 22 24N, 107 22 50E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'200', N'Đầm Hà', N'Huyện', N'21 21 23N, 107 34 32E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'201', N'Hải Hà', N'Huyện', N'21 25 50N, 107 41 26E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'202', N'Ba Chẽ', N'Huyện', N'21 15 40N, 107 09 52E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'203', N'Vân Đồn', N'Huyện', N'20 56 17N, 107 28 02E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'204', N'Hoành Bồ', N'Huyện', N'21 06 30N, 107 02 43E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'205', N'Đông Triều', N'Huyện', N'21 07 10N, 106 34 36E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'206', N'Yên Hưng', N'Huyện', N'20 55 40N, 106 51 05E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'207', N'Cô Tô', N'Huyện', N'21 05 01N, 107 49 10E', N'22')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'213', N'Bắc Giang', N'Thành Phố', N'21 17 36N, 106 11 18E', N'24')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'215', N'Yên Thế', N'Huyện', N'21 31 29N, 106 09 27E', N'24')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'216', N'Tân Yên', N'Huyện', N'21 23 23N, 106 05 55E', N'24')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'217', N'Lạng Giang', N'Huyện', N'21 21 58N, 106 15 21E', N'24')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'218', N'Lục Nam', N'Huyện', N'21 18 16N, 106 29 24E', N'24')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'219', N'Lục Ngạn', N'Huyện', N'21 26 15N, 106 39 09E', N'24')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'220', N'Sơn Động', N'Huyện', N'21 19 42N, 106 51 09E', N'24')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'221', N'Yên Dũng', N'Huyện', N'21 12 22N, 106 14 12E', N'24')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'222', N'Việt Yên', N'Huyện', N'21 16 16N, 106 04 59E', N'24')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'223', N'Hiệp Hòa', N'Huyện', N'21 15 51N, 105 57 30E', N'24')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'227', N'Việt Trì', N'Thành Phố', N'21 19 01N, 105 23 35E', N'25')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'228', N'Phú Thọ', N'Thị Xã', N'21 24 54N, 105 13 46E', N'25')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'230', N'Đoan Hùng', N'Huyện', N'21 36 56N, 105 08 42E', N'25')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'231', N'Hạ Hoà', N'Huyện', N'21 35 13N, 105 00 22E', N'25')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'232', N'Thanh Ba', N'Huyện', N'21 27 04N, 105 09 10E', N'25')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'233', N'Phù Ninh', N'Huyện', N'21 26 59N, 105 18 13E', N'25')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'234', N'Yên Lập', N'Huyện', N'21 22 21N, 105 01 25E', N'25')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'235', N'Cẩm Khê', N'Huyện', N'21 23 04N, 105 05 25E', N'25')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'236', N'Tam Nông', N'Huyện', N'21 18 24N, 105 14 59E', N'25')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'237', N'Lâm Thao', N'Huyện', N'21 19 37N, 105 18 09E', N'25')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'238', N'Thanh Sơn', N'Huyện', N'21 08 32N, 105 04 40E', N'25')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'239', N'Thanh Thuỷ', N'Huyện', N'21 07 26N, 105 17 18E', N'25')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'240', N'Tân Sơn', N'Huyện', N'', N'25')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'243', N'Vĩnh Yên', N'Thành Phố', N'21 18 26N, 105 35 33E', N'26')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'244', N'Phúc Yên', N'Thị Xã', N'21 18 55N, 105 43 54E', N'26')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'246', N'Lập Thạch', N'Huyện', N'21 24 45N, 105 25 39E', N'26')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'247', N'Tam Dương', N'Huyện', N'21 21 40N, 105 33 36E', N'26')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'248', N'Tam Đảo', N'Huyện', N'21 27 34N, 105 35 09E', N'26')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'249', N'Bình Xuyên', N'Huyện', N'21 19 48N, 105 39 43E', N'26')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'250', N'Mê Linh', N'Huyện', N'21 10 53N, 105 42 05E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'251', N'Yên Lạc', N'Huyện', N'21 13 17N, 105 34 44E', N'26')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'252', N'Vĩnh Tường', N'Huyện', N'21 14 58N, 105 29 37E', N'26')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'253', N'Sông Lô', N'Huyện', N'', N'26')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'256', N'Bắc Ninh', N'Thành Phố', N'21 10 48N, 106 03 58E', N'27')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'258', N'Yên Phong', N'Huyện', N'21 12 40N, 105 59 36E', N'27')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'259', N'Quế Võ', N'Huyện', N'21 08 44N, 106 11 06E', N'27')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'260', N'Tiên Du', N'Huyện', N'21 07 37N, 106 02 19E', N'27')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'261', N'Từ Sơn', N'Thị Xã', N'21 07 12N, 105 57 26E', N'27')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'262', N'Thuận Thành', N'Huyện', N'21 02 24N, 106 04 10E', N'27')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'263', N'Gia Bình', N'Huyện', N'21 03 55N, 106 12 53E', N'27')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'264', N'Lương Tài', N'Huyện', N'21 01 33N, 106 13 28E', N'27')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'268', N'Hà Đông', N'Quận', N'20 57 25N, 105 45 21E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'269', N'Sơn Tây', N'Thị Xã', N'21 05 51N, 105 28 27E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'271', N'Ba Vì', N'Huyện', N'21 09 40N, 105 22 43E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'272', N'Phúc Thọ', N'Huyện', N'21 06 32N, 105 34 52E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'273', N'Đan Phượng', N'Huyện', N'21 07 13N, 105 40 49E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'274', N'Hoài Đức', N'Huyện', N'21 01 25N, 105 42 03E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'275', N'Quốc Oai', N'Huyện', N'20 58 45N, 105 36 43E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'276', N'Thạch Thất', N'Huyện', N'21 02 17N, 105 33 05E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'277', N'Chương Mỹ', N'Huyện', N'20 52 46N, 105 39 01E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'278', N'Thanh Oai', N'Huyện', N'20 51 44N, 105 46 18E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'279', N'Thường Tín', N'Huyện', N'20 49 59N, 105 22 19E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'280', N'Phú Xuyên', N'Huyện', N'20 43 37N, 105 53 43E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'281', N'Ứng Hòa', N'Huyện', N'20 42 41N, 105 47 58E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'282', N'Mỹ Đức', N'Huyện', N'20 41 53N, 105 43 31E', N'01')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'288', N'Hải Dương', N'Thành Phố', N'20 56 14N, 106 18 21E', N'30')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'290', N'Chí Linh', N'Huyện', N'21 07 47N, 106 23 46E', N'30')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'291', N'Nam Sách', N'Huyện', N'21 00 15N, 106 20 26E', N'30')
GO
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'292', N'Kinh Môn', N'Huyện', N'21 00 04N, 106 30 23E', N'30')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'293', N'Kim Thành', N'Huyện', N'20 55 40N, 106 30 33E', N'30')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'294', N'Thanh Hà', N'Huyện', N'20 53 19N, 106 25 43E', N'30')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'295', N'Cẩm Giàng', N'Huyện', N'20 57 05N, 106 12 29E', N'30')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'296', N'Bình Giang', N'Huyện', N'20 52 36N, 106 11 24E', N'30')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'297', N'Gia Lộc', N'Huyện', N'20 51 01N, 106 17 34E', N'30')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'298', N'Tứ Kỳ', N'Huyện', N'20 49 05N, 106 24 05E', N'30')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'299', N'Ninh Giang', N'Huyện', N'20 45 13N, 106 20 09E', N'30')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'300', N'Thanh Miện', N'Huyện', N'20 46 02N, 106 12 26E', N'30')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'303', N'Hồng Bàng', N'Quận', N'20 52 37N, 106 38 32E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'304', N'Ngô Quyền', N'Quận', N'20 51 13N, 106 41 57E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'305', N'Lê Chân', N'Quận', N'20 50 12N, 106 40 30E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'306', N'Hải An', N'Quận', N'20 49 38N, 106 45 57E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'307', N'Kiến An', N'Quận', N'20 48 26N, 106 38 03E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'308', N'Đồ Sơn', N'Quận', N'20 42 41N, 106 44 54E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'309', N'Kinh Dương', N'Quận', N'', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'311', N'Thuỷ Nguyên', N'Huyện', N'20 56 36N, 106 39 38E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'312', N'An Dương', N'Huyện', N'20 53 06N, 106 35 36E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'313', N'An Lão', N'Huyện', N'20 47 54N, 106 33 19E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'314', N'Kiến Thụy', N'Huyện', N'20 45 13N, 106 41 47E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'315', N'Tiên Lãng', N'Huyện', N'20 42 23N, 106 36 03E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'316', N'Vĩnh Bảo', N'Huyện', N'20 40 56N, 106 29 57E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'317', N'Cát Hải', N'Huyện', N'20 47 09N, 106 58 07E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'318', N'Bạch Long Vĩ', N'Huyện', N'20 08 41N, 107 42 51E', N'31')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'323', N'Hưng Yên', N'Thành Phố', N'20 39 38N, 106 03 08E', N'33')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'325', N'Văn Lâm', N'Huyện', N'20 58 31N, 106 02 51E', N'33')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'326', N'Văn Giang', N'Huyện', N'20 55 51N, 105 57 14E', N'33')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'327', N'Yên Mỹ', N'Huyện', N'20 53 45N, 106 01 21E', N'33')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'328', N'Mỹ Hào', N'Huyện', N'20 55 35N, 106 05 34E', N'33')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'329', N'Ân Thi', N'Huyện', N'20 48 49N, 106 05 30E', N'33')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'330', N'Khoái Châu', N'Huyện', N'20 49 53N, 105 58 28E', N'33')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'331', N'Kim Động', N'Huyện', N'20 44 47N, 106 01 47E', N'33')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'332', N'Tiên Lữ', N'Huyện', N'20 40 05N, 106 07 59E', N'33')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'333', N'Phù Cừ', N'Huyện', N'20 42 51N, 106 11 30E', N'33')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'336', N'Thái Bình', N'Thành Phố', N'20 26 45N, 106 19 56E', N'34')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'338', N'Quỳnh Phụ', N'Huyện', N'20 38 57N, 106 21 16E', N'34')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'339', N'Hưng Hà', N'Huyện', N'20 35 38N, 106 12 42E', N'34')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'340', N'Đông Hưng', N'Huyện', N'20 32 50N, 106 20 15E', N'34')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'341', N'Thái Thụy', N'Huyện', N'20 32 33N, 106 32 32E', N'34')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'342', N'Tiền Hải', N'Huyện', N'20 21 05N, 106 32 45E', N'34')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'343', N'Kiến Xương', N'Huyện', N'20 23 52N, 106 25 22E', N'34')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'344', N'Vũ Thư', N'Huyện', N'20 25 29N, 106 16 43E', N'34')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'347', N'Phủ Lý', N'Thành Phố', N'20 32 19N, 105 54 55E', N'35')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'349', N'Duy Tiên', N'Huyện', N'20 37 33N, 105 58 01E', N'35')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'350', N'Kim Bảng', N'Huyện', N'20 34 19N, 105 50 41E', N'35')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'351', N'Thanh Liêm', N'Huyện', N'20 27 31N, 105 55 09E', N'35')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'352', N'Bình Lục', N'Huyện', N'20 29 23N, 106 02 52E', N'35')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'353', N'Lý Nhân', N'Huyện', N'20 32 55N, 106 04 48E', N'35')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'356', N'Nam Định', N'Thành Phố', N'20 25 07N, 106 09 54E', N'36')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'358', N'Mỹ Lộc', N'Huyện', N'20 27 21N, 106 07 56E', N'36')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'359', N'Vụ Bản', N'Huyện', N'20 22 57N, 106 05 35E', N'36')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'360', N'Ý Yên', N'Huyện', N'20 19 48N, 106 01 55E', N'36')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'361', N'Nghĩa Hưng', N'Huyện', N'20 05 37N, 106 08 59E', N'36')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'362', N'Nam Trực', N'Huyện', N'20 20 08N, 106 12 54E', N'36')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'363', N'Trực Ninh', N'Huyện', N'20 14 42N, 106 12 45E', N'36')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'364', N'Xuân Trường', N'Huyện', N'20 17 53N, 106 21 43E', N'36')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'365', N'Giao Thủy', N'Huyện', N'20 14 45N, 106 28 39E', N'36')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'366', N'Hải Hậu', N'Huyện', N'20 06 26N, 106 16 29E', N'36')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'369', N'Ninh Bình', N'Thành Phố', N'20 14 45N, 105 58 24E', N'37')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'370', N'Tam Điệp', N'Thị Xã', N'20 09 42N, 103 52 43E', N'37')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'372', N'Nho Quan', N'Huyện', N'20 18 46N, 105 42 48E', N'37')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'373', N'Gia Viễn', N'Huyện', N'20 19 50N, 105 52 20E', N'37')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'374', N'Hoa Lư', N'Huyện', N'20 15 04N, 105 55 52E', N'37')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'375', N'Yên Khánh', N'Huyện', N'20 11 26N, 106 04 33E', N'37')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'376', N'Kim Sơn', N'Huyện', N'20 02 07N, 106 05 27E', N'37')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'377', N'Yên Mô', N'Huyện', N'20 07 45N, 105 59 45E', N'37')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'380', N'Thanh Hóa', N'Thành Phố', N'19 48 26N, 105 47 37E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'381', N'Bỉm Sơn', N'Thị Xã', N'20 05 21N, 105 51 48E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'382', N'Sầm Sơn', N'Thị Xã', N'19 45 11N, 105 54 03E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'384', N'Mường Lát', N'Huyện', N'20 30 42N, 104 37 27E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'385', N'Quan Hóa', N'Huyện', N'20 29 15N, 104 56 35E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'386', N'Bá Thước', N'Huyện', N'20 22 48N, 105 14 50E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'387', N'Quan Sơn', N'Huyện', N'20 15 17N, 104 51 58E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'388', N'Lang Chánh', N'Huyện', N'20 08 58N, 105 07 40E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'389', N'Ngọc Lặc', N'Huyện', N'20 04 08N, 105 22 39E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'390', N'Cẩm Thủy', N'Huyện', N'20 12 20N, 105 27 22E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'391', N'Thạch Thành', N'Huyện', N'21 12 41N, 105 36 38E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'392', N'Hà Trung', N'Huyện', N'20 03 20N, 105 51 20E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'393', N'Vĩnh Lộc', N'Huyện', N'20 02 29N, 105 39 28E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'394', N'Yên Định', N'Huyện', N'20 00 31N, 105 37 44E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'395', N'Thọ Xuân', N'Huyện', N'19 55 39N, 105 29 14E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'396', N'Thường Xuân', N'Huyện', N'19 54 55N, 105 10 46E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'397', N'Triệu Sơn', N'Huyện', N'19 48 11N, 105 34 03E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'398', N'Thiệu Hoá', N'Huyện', N'19 53 56N, 105 40 57E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'399', N'Hoằng Hóa', N'Huyện', N'19 51 59N, 105 51 34E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'400', N'Hậu Lộc', N'Huyện', N'19 56 02N, 105 53 19E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'401', N'Nga Sơn', N'Huyện', N'20 00 16N, 105 59 26E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'402', N'Như Xuân', N'Huyện', N'19 5 55N, 105 20 22E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'403', N'Như Thanh', N'Huyện', N'19 35 19N, 105 33 09E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'404', N'Nông Cống', N'Huyện', N'19 36 58N, 105 40 54E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'405', N'Đông Sơn', N'Huyện', N'19 47 44N, 105 42 19E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'406', N'Quảng Xương', N'Huyện', N'19 40 53N, 105 48 01E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'407', N'Tĩnh Gia', N'Huyện', N'19 27 13N, 105 43 38E', N'38')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'412', N'Vinh', N'Thành Phố', N'18 41 06N, 105 42 05E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'413', N'Cửa Lò', N'Thị Xã', N'18 47 26N, 105 43 31E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'414', N'Thái Hoà', N'Thị Xã', N'', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'415', N'Quế Phong', N'Huyện', N'19 42 25N, 104 54 21E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'416', N'Quỳ Châu', N'Huyện', N'19 32 16N, 105 03 18E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'417', N'Kỳ Sơn', N'Huyện', N'19 24 36N, 104 09 45E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'418', N'Tương Dương', N'Huyện', N'19 19 15N, 104 35 41E', N'40')
GO
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'419', N'Nghĩa Đàn', N'Huyện', N'19 21 19N, 105 26 33E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'420', N'Quỳ Hợp', N'Huyện', N'19 19 24N, 105 09 12E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'421', N'Quỳnh Lưu', N'Huyện', N'19 14 01N, 105 37 00E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'422', N'Con Cuông', N'Huyện', N'19 03 50N, 107 47 15E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'423', N'Tân Kỳ', N'Huyện', N'19 06 11N, 105 14 14E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'424', N'Anh Sơn', N'Huyện', N'18 58 04N, 105 04 30E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'425', N'Diễn Châu', N'Huyện', N'19 01 20N, 105 34 13E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'426', N'Yên Thành', N'Huyện', N'19 01 25N, 105 26 17E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'427', N'Đô Lương', N'Huyện', N'18 55 00N, 105 21 03E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'428', N'Thanh Chương', N'Huyện', N'18 44 11N, 105 12 59E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'429', N'Nghi Lộc', N'Huyện', N'18 47 41N, 105 31 30E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'430', N'Nam Đàn', N'Huyện', N'18 40 28N, 105 30 32E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'431', N'Hưng Nguyên', N'Huyện', N'18 41 13N, 105 37 41E', N'40')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'436', N'Hà Tĩnh', N'Thành Phố', N'18 21 20N, 105 54 00E', N'42')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'437', N'Hồng Lĩnh', N'Thị Xã', N'18 32 05N, 105 42 40E', N'42')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'439', N'Hương Sơn', N'Huyện', N'18 26 47N, 105 19 36E', N'42')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'440', N'Đức Thọ', N'Huyện', N'18 29 23N, 105 36 39E', N'42')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'441', N'Vũ Quang', N'Huyện', N'18 19 30N, 105 26 38E', N'42')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'442', N'Nghi Xuân', N'Huyện', N'18 38 46N, 105 46 17E', N'42')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'443', N'Can Lộc', N'Huyện', N'18 26 39N, 105 46 13E', N'42')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'444', N'Hương Khê', N'Huyện', N'18 11 36N, 105 41 24E', N'42')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'445', N'Thạch Hà', N'Huyện', N'18 19 29N, 105 52 43E', N'42')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'446', N'Cẩm Xuyên', N'Huyện', N'18 11 32N, 106 00 04E', N'42')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'447', N'Kỳ Anh', N'Huyện', N'18 05 15N, 106 15 49E', N'42')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'448', N'Lộc Hà', N'Huyện', N'', N'42')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'450', N'Đồng Hới', N'Thành Phố', N'17 26 53N, 106 35 15E', N'44')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'452', N'Minh Hóa', N'Huyện', N'17 44 03N, 105 51 45E', N'44')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'453', N'Tuyên Hóa', N'Huyện', N'17 54 04N, 105 58 17E', N'44')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'454', N'Quảng Trạch', N'Huyện', N'17 50 04N, 106 22 24E', N'44')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'455', N'Bố Trạch', N'Huyện', N'17 29 13N, 106 06 54E', N'44')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'456', N'Quảng Ninh', N'Huyện', N'17 15 15N, 106 32 31E', N'44')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'457', N'Lệ Thủy', N'Huyện', N'17 07 35N, 106 41 47E', N'44')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'461', N'Đông Hà', N'Thành Phố', N'16 48 12N, 107 05 12E', N'45')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'462', N'Quảng Trị', N'Thị Xã', N'16 44 37N, 107 11 20E', N'45')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'464', N'Vĩnh Linh', N'Huyện', N'17 01 35N, 106 53 49E', N'45')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'465', N'Hướng Hóa', N'Huyện', N'16 42 19N, 106 40 14E', N'45')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'466', N'Gio Linh', N'Huyện', N'16 54 49N, 106 56 16E', N'45')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'467', N'Đa Krông', N'Huyện', N'16 33 58N, 106 55 49E', N'45')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'468', N'Cam Lộ', N'Huyện', N'16 47 09N, 106 57 52E', N'45')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'469', N'Triệu Phong', N'Huyện', N'16 46 32N, 107 09 12E', N'45')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'470', N'Hải Lăng', N'Huyện', N'16 41 07N, 107 13 34E', N'45')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'471', N'Cồn Cỏ', N'Huyện', N'19 09 39N, 107 19 58E', N'45')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'474', N'Huế', N'Thành Phố', N'16 27 16N, 107 34 29E', N'46')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'476', N'Phong Điền', N'Huyện', N'16 32 42N, 106 16 37E', N'46')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'477', N'Quảng Điền', N'Huyện', N'16 35 21N, 107 29 31E', N'46')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'478', N'Phú Vang', N'Huyện', N'16 27 20N, 107 42 28E', N'46')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'479', N'Hương Thủy', N'Huyện', N'16 19 27N, 107 37 26E', N'46')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'480', N'Hương Trà', N'Huyện', N'16 25 49N, 107 28 37E', N'46')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'481', N'A Lưới', N'Huyện', N'16 13 59N, 107 16 12E', N'46')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'482', N'Phú Lộc', N'Huyện', N'16 17 16N, 107 55 25E', N'46')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'483', N'Nam Đông', N'Huyện', N'16 07 11N, 107 41 25E', N'46')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'490', N'Liên Chiểu', N'Quận', N'16 07 26N, 108 07 04E', N'48')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'491', N'Thanh Khê', N'Quận', N'16 03 28N, 108 11 00E', N'48')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'492', N'Hải Châu', N'Quận', N'16 03 38N, 108 11 46E', N'48')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'493', N'Sơn Trà', N'Quận', N'16 06 13N, 108 16 26E', N'48')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'494', N'Ngũ Hành Sơn', N'Quận', N'16 00 30N, 108 15 09E', N'48')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'495', N'Cẩm Lệ', N'Quận', N'', N'48')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'497', N'Hoà Vang', N'Huyện', N'16 03 59N, 108 01 57E', N'48')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'498', N'Hoàng Sa', N'Huyện', N'16 21 36N, 111 57 01E', N'48')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'502', N'Tam Kỳ', N'Thành Phố', N'15 34 37N, 108 29 52E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'503', N'Hội An', N'Thành Phố', N'15 53 20N, 108 20 42E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'504', N'Tây Giang', N'Huyện', N'15 53 46N, 107 25 52E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'505', N'Đông Giang', N'Huyện', N'15 54 44N, 107 47 06E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'506', N'Đại Lộc', N'Huyện', N'15 50 10N, 107 58 27E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'507', N'Điện Bàn', N'Huyện', N'15 54 15N, 108 13 38E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'508', N'Duy Xuyên', N'Huyện', N'15 47 58N, 108 13 27E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'509', N'Quế Sơn', N'Huyện', N'15 41 03N, 108 05 34E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'510', N'Nam Giang', N'Huyện', N'15 36 37N, 107 33 52E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'511', N'Phước Sơn', N'Huyện', N'15 23 17N, 107 50 22E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'512', N'Hiệp Đức', N'Huyện', N'15 31 09N, 108 05 56E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'513', N'Thăng Bình', N'Huyện', N'15 42 29N, 108 22 04E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'514', N'Tiên Phước', N'Huyện', N'15 29 30N, 108 15 28E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'515', N'Bắc Trà My', N'Huyện', N'15 08 00N, 108 05 32E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'516', N'Nam Trà My', N'Huyện', N'15 16 40N, 108 12 15E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'517', N'Núi Thành', N'Huyện', N'15 26 53N, 108 34 49E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'518', N'Phú Ninh', N'Huyện', N'15 30 43N, 108 24 43E', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'519', N'Nông Sơn', N'Huyện', N'', N'49')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'522', N'Quảng Ngãi', N'Thành Phố', N'15 07 17N, 108 48 24E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'524', N'Bình Sơn', N'Huyện', N'15 18 45N, 108 45 35E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'525', N'Trà Bồng', N'Huyện', N'15 13 30N, 108 29 57E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'526', N'Tây Trà', N'Huyện', N'15 11 13N, 108 22 23E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'527', N'Sơn Tịnh', N'Huyện', N'15 11 49N, 108 45 03E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'528', N'Tư Nghĩa', N'Huyện', N'15 05 25N, 108 45 23E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'529', N'Sơn Hà', N'Huyện', N'14 58 35N, 108 29 09E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'530', N'Sơn Tây', N'Huyện', N'14 58 11N, 108 21 22E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'531', N'Minh Long', N'Huyện', N'14 56 49N, 108 40 19E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'532', N'Nghĩa Hành', N'Huyện', N'14 58 06N, 108 46 05E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'533', N'Mộ Đức', N'Huyện', N'11 59 13N, 108 52 21E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'534', N'Đức Phổ', N'Huyện', N'14 44 59N, 108 56 58E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'535', N'Ba Tơ', N'Huyện', N'14 42 52N, 108 43 44E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'536', N'Lý Sơn', N'Huyện', N'15 22 50N, 109 06 56E', N'51')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'540', N'Qui Nhơn', N'Thành Phố', N'13 47 15N, 109 12 48E', N'52')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'542', N'An Lão', N'Huyện', N'14 32 10N, 108 47 52E', N'52')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'543', N'Hoài Nhơn', N'Huyện', N'14 30 56N, 109 01 56E', N'52')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'544', N'Hoài Ân', N'Huyện', N'14 20 51N, 108 54 04E', N'52')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'545', N'Phù Mỹ', N'Huyện', N'14 14 41N, 109 05 43E', N'52')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'546', N'Vĩnh Thạnh', N'Huyện', N'14 14 26N, 108 44 08E', N'52')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'547', N'Tây Sơn', N'Huyện', N'13 56 47N, 108 53 06E', N'52')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'548', N'Phù Cát', N'Huyện', N'14 03 48N, 109 03 57E', N'52')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'549', N'An Nhơn', N'Huyện', N'13 51 28N, 109 04 02E', N'52')
GO
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'550', N'Tuy Phước', N'Huyện', N'13 46 30N, 109 05 38E', N'52')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'551', N'Vân Canh', N'Huyện', N'13 40 35N, 108 57 52E', N'52')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'555', N'Tuy Hòa', N'Thành Phố', N'13 05 42N, 109 15 50E', N'54')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'557', N'Sông Cầu', N'Thị Xã', N'13 31 40N, 109 12 39E', N'54')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'558', N'Đồng Xuân', N'Huyện', N'13 24 59N, 108 56 46E', N'54')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'559', N'Tuy An', N'Huyện', N'13 15 19N, 109 12 21E', N'54')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'560', N'Sơn Hòa', N'Huyện', N'13 12 16N, 108 57 17E', N'54')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'561', N'Sông Hinh', N'Huyện', N'12 54 19N, 108 53 38E', N'54')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'562', N'Tây Hoà', N'Huyện', N'', N'54')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'563', N'Phú Hoà', N'Huyện', N'13 04 07N, 109 11 24E', N'54')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'564', N'Đông Hoà', N'Huyện', N'', N'54')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'568', N'Nha Trang', N'Thành Phố', N'12 15 40N, 109 10 40E', N'56')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'569', N'Cam Ranh', N'Thị Xã', N'11 59 05N, 108 08 17E', N'56')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'570', N'Cam Lâm', N'Huyện', N'', N'56')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'571', N'Vạn Ninh', N'Huyện', N'12 43 10N, 109 11 18E', N'56')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'572', N'Ninh Hòa', N'Huyện', N'12 32 54N, 109 06 11E', N'56')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'573', N'Khánh Vĩnh', N'Huyện', N'12 17 50N, 108 51 56E', N'56')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'574', N'Diên Khánh', N'Huyện', N'12 13 19N, 109 02 16E', N'56')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'575', N'Khánh Sơn', N'Huyện', N'12 02 17N, 108 53 47E', N'56')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'576', N'Trường Sa', N'Huyện', N'9 07 27N, 114 15 00E', N'56')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'582', N'Phan Rang-Tháp Chàm', N'Thành Phố', N'11 36 11N, 108 58 34E', N'58')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'584', N'Bác Ái', N'Huyện', N'11 54 45N, 108 51 29E', N'58')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'585', N'Ninh Sơn', N'Huyện', N'11 42 36N, 108 44 55E', N'58')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'586', N'Ninh Hải', N'Huyện', N'11 42 46N, 109 05 41E', N'58')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'587', N'Ninh Phước', N'Huyện', N'11 28 56N, 108 50 34E', N'58')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'588', N'Thuận Bắc', N'Huyện', N'', N'58')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'589', N'Thuận Nam', N'Huyện', N'', N'58')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'593', N'Phan Thiết', N'Thành Phố', N'10 54 16N, 108 03 44E', N'60')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'594', N'La Gi', N'Thị Xã', N'', N'60')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'595', N'Tuy Phong', N'Huyện', N'11 20 26N, 108 41 15E', N'60')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'596', N'Bắc Bình', N'Huyện', N'11 15 52N, 108 21 33E', N'60')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'597', N'Hàm Thuận Bắc', N'Huyện', N'11 09 18N, 108 03 07E', N'60')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'598', N'Hàm Thuận Nam', N'Huyện', N'10 56 20N, 107 54 38E', N'60')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'599', N'Tánh Linh', N'Huyện', N'11 08 26N, 107 41 22E', N'60')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'600', N'Đức Linh', N'Huyện', N'11 11 43N, 107 31 34E', N'60')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'601', N'Hàm Tân', N'Huyện', N'10 44 41N, 107 41 33E', N'60')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'602', N'Phú Quí', N'Huyện', N'10 33 13N, 108 57 46E', N'60')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'608', N'Kon Tum', N'Thành Phố', N'14 20 32N, 107 58 04E', N'62')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'610', N'Đắk Glei', N'Huyện', N'15 08 13N, 107 44 03E', N'62')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'611', N'Ngọc Hồi', N'Huyện', N'14 44 23N, 107 38 49E', N'62')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'612', N'Đắk Tô', N'Huyện', N'14 46 49N, 107 55 36E', N'62')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'613', N'Kon Plông', N'Huyện', N'14 48 13N, 108 20 05E', N'62')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'614', N'Kon Rẫy', N'Huyện', N'14 32 56N, 108 13 09E', N'62')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'615', N'Đắk Hà', N'Huyện', N'14 36 50N, 107 59 55E', N'62')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'616', N'Sa Thầy', N'Huyện', N'14 16 02N, 107 36 30E', N'62')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'617', N'Tu Mơ Rông', N'Huyện', N'', N'62')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'622', N'Pleiku', N'Thành Phố', N'13 57 42N, 107 58 03E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'623', N'An Khê', N'Thị Xã', N'14 01 24N, 108 41 29E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'624', N'Ayun Pa', N'Thị Xã', N'', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'625', N'Kbang', N'Huyện', N'14 18 08N, 108 29 17E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'626', N'Đăk Đoa', N'Huyện', N'14 07 02N, 108 09 36E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'627', N'Chư Păh', N'Huyện', N'14 13 30N, 107 56 33E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'628', N'Ia Grai', N'Huyện', N'13 59 25N, 107 43 16E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'629', N'Mang Yang', N'Huyện', N'13 57 26N, 108 18 37E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'630', N'Kông Chro', N'Huyện', N'13 45 47N, 108 36 04E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'631', N'Đức Cơ', N'Huyện', N'13 46 16N, 107 38 26E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'632', N'Chư Prông', N'Huyện', N'13 35 39N, 107 47 36E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'633', N'Chư Sê', N'Huyện', N'13 37 04N, 108 06 56E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'634', N'Đăk Pơ', N'Huyện', N'13 55 47N, 108 36 16E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'635', N'Ia Pa', N'Huyện', N'13 31 37N, 108 30 34E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'637', N'Krông Pa', N'Huyện', N'13 14 13N, 108 39 12E', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'638', N'Phú Thiện', N'Huyện', N'', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'639', N'Chư Pưh', N'Huyện', N'', N'64')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'643', N'Buôn Ma Thuột', N'Thành Phố', N'12 39 43N, 108 10 40E', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'644', N'Buôn Hồ', N'Thị Xã', N'', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'645', N'Ea H''leo', N'Huyện', N'13 13 52N, 108 12 30E', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'646', N'Ea Súp', N'Huyện', N'13 10 59N, 107 46 49E', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'647', N'Buôn Đôn', N'Huyện', N'12 52 45N, 107 45 20E', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'648', N'Cư M''gar', N'Huyện', N'12 53 47N, 108 04 16E', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'649', N'Krông Búk', N'Huyện', N'12 56 27N, 108 13 54E', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'650', N'Krông Năng', N'Huyện', N'12 59 41N, 108 23 42E', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'651', N'Ea Kar', N'Huyện', N'12 48 17N, 108 32 42E', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'652', N'M''đrắk', N'Huyện', N'12 42 14N, 108 47 09E', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'653', N'Krông Bông', N'Huyện', N'12 27 08N, 108 27 01E', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'654', N'Krông Pắc', N'Huyện', N'12 41 20N, 108 18 42E', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'655', N'Krông A Na', N'Huyện', N'12 31 51N, 108 05 03E', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'656', N'Lắk', N'Huyện', N'12 19 20N, 108 12 17E', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'657', N'Cư Kuin', N'Huyện', N'', N'66')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'660', N'Gia Nghĩa', N'Thị Xã', N'', N'67')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'661', N'Đắk Glong', N'Huyện', N'12 01 53N, 107 50 37E', N'67')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'662', N'Cư Jút', N'Huyện', N'12 40 56N, 107 44 44E', N'67')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'663', N'Đắk Mil', N'Huyện', N'12 31 08N, 107 42 24E', N'67')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'664', N'Krông Nô', N'Huyện', N'12 22 16N, 107 53 49E', N'67')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'665', N'Đắk Song', N'Huyện', N'12 14 04N, 107 36 30E', N'67')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'666', N'Đắk R''lấp', N'Huyện', N'12 02 30N, 107 25 59E', N'67')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'667', N'Tuy Đức', N'Huyện', N'', N'67')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'672', N'Đà Lạt', N'Thành Phố', N'11 54 33N, 108 27 08E', N'68')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'673', N'Bảo Lộc', N'Thị Xã', N'11 32 48N, 107 47 37E', N'68')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'674', N'Đam Rông', N'Huyện', N'12 02 35N, 108 10 26E', N'68')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'675', N'Lạc Dương', N'Huyện', N'12 08 30N, 108 27 48E', N'68')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'676', N'Lâm Hà', N'Huyện', N'11 55 26N, 108 11 31E', N'68')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'677', N'Đơn Dương', N'Huyện', N'11 48 26N, 108 32 48E', N'68')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'678', N'Đức Trọng', N'Huyện', N'11 41 50N, 108 18 58E', N'68')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'679', N'Di Linh', N'Huyện', N'11 31 10N, 108 05 23E', N'68')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'680', N'Bảo Lâm', N'Huyện', N'11 38 31N, 107 43 25E', N'68')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'681', N'Đạ Huoai', N'Huyện', N'11 27 11N, 107 38 08E', N'68')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'682', N'Đạ Tẻh', N'Huyện', N'11 33 46N, 107 32 00E', N'68')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'683', N'Cát Tiên', N'Huyện', N'11 39 38N, 107 23 27E', N'68')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'688', N'Phước Long', N'Thị Xã', N'', N'70')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'689', N'Đồng Xoài', N'Thị Xã', N'11 31 01N, 106 50 21E', N'70')
GO
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'690', N'Bình Long', N'Thị Xã', N'', N'70')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'691', N'Bù Gia Mập', N'Huyện', N'11 56 57N, 106 59 21E', N'70')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'692', N'Lộc Ninh', N'Huyện', N'11 49 28N, 106 35 11E', N'70')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'693', N'Bù Đốp', N'Huyện', N'11 59 08N, 106 49 54E', N'70')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'694', N'Hớn Quản', N'Huyện', N'11 37 37N, 106 36 02E', N'70')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'695', N'Đồng Phù', N'Huyện', N'11 28 45N, 106 57 07E', N'70')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'696', N'Bù Đăng', N'Huyện', N'11 46 09N, 107 14 14E', N'70')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'697', N'Chơn Thành', N'Huyện', N'11 28 45N, 106 39 26E', N'70')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'703', N'Tây Ninh', N'Thị Xã', N'11 21 59N, 106 07 47E', N'72')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'705', N'Tân Biên', N'Huyện', N'11 35 14N, 105 57 53E', N'72')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'706', N'Tân Châu', N'Huyện', N'11 34 49N, 106 17 48E', N'72')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'707', N'Dương Minh Châu', N'Huyện', N'11 22 04N, 106 16 58E', N'72')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'708', N'Châu Thành', N'Huyện', N'11 19 02N, 106 00 15E', N'72')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'709', N'Hòa Thành', N'Huyện', N'11 15 31N, 106 08 44E', N'72')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'710', N'Gò Dầu', N'Huyện', N'11 09 39N, 106 14 42E', N'72')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'711', N'Bến Cầu', N'Huyện', N'11 07 50N, 106 08 25E', N'72')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'712', N'Trảng Bàng', N'Huyện', N'11 06 18N, 106 23 12E', N'72')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'718', N'Thủ Dầu Một', N'Thị Xã', N'11 00 01N, 106 38 56E', N'74')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'720', N'Dầu Tiếng', N'Huyện', N'11 19 07N, 106 26 59E', N'74')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'721', N'Bến Cát', N'Huyện', N'11 12 42N, 106 36 28E', N'74')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'722', N'Phú Giáo', N'Huyện', N'11 20 21N, 106 47 48E', N'74')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'723', N'Tân Uyên', N'Huyện', N'11 06 31N, 106 49 02E', N'74')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'724', N'Dĩ An', N'Huyện', N'10 55 03N, 106 47 09E', N'74')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'725', N'Thuận An', N'Huyện', N'10 55 58N, 106 41 59E', N'74')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'731', N'Biên Hòa', N'Thành Phố', N'10 56 31N, 106 50 50E', N'75')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'732', N'Long Khánh', N'Thị Xã', N'10 56 24N, 107 14 29E', N'75')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'734', N'Tân Phú', N'Huyện', N'11 22 51N, 107 21 35E', N'75')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'735', N'Vĩnh Cửu', N'Huyện', N'11 14 31N, 107 00 06E', N'75')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'736', N'Định Quán', N'Huyện', N'11 12 41N, 107 17 03E', N'75')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'737', N'Trảng Bom', N'Huyện', N'10 58 39N, 107 00 52E', N'75')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'738', N'Thống Nhất', N'Huyện', N'10 58 29N, 107 09 26E', N'75')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'739', N'Cẩm Mỹ', N'Huyện', N'10 47 05N, 107 14 36E', N'75')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'740', N'Long Thành', N'Huyện', N'10 47 38N, 106 59 42E', N'75')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'741', N'Xuân Lộc', N'Huyện', N'10 55 39N, 107 24 21E', N'75')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'742', N'Nhơn Trạch', N'Huyện', N'10 39 18N, 106 53 18E', N'75')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'747', N'Vũng Tầu', N'Thành Phố', N'10 24 08N, 107 07 05E', N'77')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'748', N'Bà Rịa', N'Thị Xã', N'10 30 33N, 107 10 47E', N'77')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'750', N'Châu Đức', N'Huyện', N'10 39 23N, 107 15 08E', N'77')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'751', N'Xuyên Mộc', N'Huyện', N'10 37 46N, 107 29 39E', N'77')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'752', N'Long Điền', N'Huyện', N'10 26 47N, 107 12 53E', N'77')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'753', N'Đất Đỏ', N'Huyện', N'10 28 40N, 107 18 27E', N'77')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'754', N'Tân Thành', N'Huyện', N'10 34 50N, 107 05 06E', N'77')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'755', N'Côn Đảo', N'Huyện', N'8 42 25N, 106 36 05E', N'77')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'760', N'1', N'Quận', N'10 46 34N, 106 41 45E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'761', N'12', N'Quận', N'10 51 43N, 106 39 32E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'762', N'Thủ Đức', N'Quận', N'10 51 20N, 106 45 05E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'763', N'9', N'Quận', N'10 49 49N, 106 49 03E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'764', N'Gò Vấp', N'Quận', N'10 50 12N, 106 39 52E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'765', N'Bình Thạnh', N'Quận', N'10 48 46N, 106 42 57E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'766', N'Tân Bình', N'Quận', N'10 48 13N, 106 39 03E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'767', N'Tân Phú', N'Quận', N'10 47 32N, 106 37 31E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'768', N'Phú Nhuận', N'Quận', N'10 48 06N, 106 40 39E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'769', N'2', N'Quận', N'10 46 51N, 106 45 25E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'770', N'3', N'Quận', N'10 46 48N, 106 40 46E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'771', N'10', N'Quận', N'10 46 25N, 106 40 02E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'772', N'11', N'Quận', N'10 46 01N, 106 38 44E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'773', N'4', N'Quận', N'10 45 42N, 106 42 09E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'774', N'5', N'Quận', N'10 45 24N, 106 40 00E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'775', N'6', N'Quận', N'10 44 46N, 106 38 10E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'776', N'8', N'Quận', N'10 43 24N, 106 37 40E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'777', N'Bình Tân', N'Quận', N'10 46 16N, 106 35 26E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'778', N'7', N'Quận', N'10 44 19N, 106 43 35E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'783', N'Củ Chi', N'Huyện', N'11 02 17N, 106 30 20E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'784', N'Hóc Môn', N'Huyện', N'10 52 42N, 106 35 33E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'785', N'Bình Chánh', N'Huyện', N'10 45 01N, 106 30 45E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'786', N'Nhà Bè', N'Huyện', N'10 39 06N, 106 43 35E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'787', N'Cần Giờ', N'Huyện', N'10 30 43N, 106 52 50E', N'79')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'794', N'Tân An', N'Thành Phố', N'10 31 36N, 106 24 06E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'796', N'Tân Hưng', N'Huyện', N'10 49 05N, 105 39 26E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'797', N'Vĩnh Hưng', N'Huyện', N'10 52 54N, 105 45 58E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'798', N'Mộc Hóa', N'Huyện', N'10 47 09N, 105 57 56E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'799', N'Tân Thạnh', N'Huyện', N'10 37 44N, 105 57 07E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'800', N'Thạnh Hóa', N'Huyện', N'10 41 37N, 106 11 08E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'801', N'Đức Huệ', N'Huyện', N'10 51 57N, 106 15 48E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'802', N'Đức Hòa', N'Huyện', N'10 53 04N, 106 23 58E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'803', N'Bến Lức', N'Huyện', N'10 41 40N, 106 26 28E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'804', N'Thủ Thừa', N'Huyện', N'10 39 41N, 106 20 12E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'805', N'Tân Trụ', N'Huyện', N'10 31 47N, 106 30 06E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'806', N'Cần Đước', N'Huyện', N'10 32 21N, 106 36 33E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'807', N'Cần Giuộc', N'Huyện', N'10 34 43N, 106 38 35E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'808', N'Châu Thành', N'Huyện', N'10 27 52N, 106 30 00E', N'80')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'815', N'Mỹ Tho', N'Thành Phố', N'10 22 14N, 106 21 52E', N'82')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'816', N'Gò Công', N'Thị Xã', N'10 21 55N, 106 40 24E', N'82')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'818', N'Tân Phước', N'Huyện', N'10 30 36N, 106 13 02E', N'82')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'819', N'Cái Bè', N'Huyện', N'10 24 21N, 105 56 01E', N'82')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'820', N'Cai Lậy', N'Huyện', N'10 24 20N, 106 06 05E', N'82')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'821', N'Châu Thành', N'Huyện', N'20 25 21N, 106 16 57E', N'82')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'822', N'Chợ Gạo', N'Huyện', N'10 23 45N, 106 26 53E', N'82')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'823', N'Gò Công Tây', N'Huyện', N'10 19 55N, 106 35 02E', N'82')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'824', N'Gò Công Đông', N'Huyện', N'10 20 42N, 106 42 54E', N'82')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'825', N'Tân Phú Đông', N'Huyện', N'', N'82')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'829', N'Bến Tre', N'Thành Phố', N'10 14 17N, 106 22 26E', N'83')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'831', N'Châu Thành', N'Huyện', N'10 17 24N, 106 17 45E', N'83')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'832', N'Chợ Lách', N'Huyện', N'10 13 26N, 106 09 08E', N'83')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'833', N'Mỏ Cày Nam', N'Huyện', N'10 06 56N, 106 19 40E', N'83')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'834', N'Giồng Trôm', N'Huyện', N'10 08 46N, 106 28 12E', N'83')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'835', N'Bình Đại', N'Huyện', N'10 09 56N, 106 37 46E', N'83')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'836', N'Ba Tri', N'Huyện', N'10 04 08N, 106 35 10E', N'83')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'837', N'Thạnh Phú', N'Huyện', N'9 55 53N, 106 32 45E', N'83')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'838', N'Mỏ Cày Bắc', N'Huyện', N'', N'83')
GO
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'842', N'Trà Vinh', N'Thị Xã', N'9 57 09N, 106 20 39E', N'84')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'844', N'Càng Long', N'Huyện', N'9 58 18N, 106 12 52E', N'84')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'845', N'Cầu Kè', N'Huyện', N'9 51 23N, 106 03 33E', N'84')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'846', N'Tiểu Cần', N'Huyện', N'9 48 37N, 106 12 06E', N'84')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'847', N'Châu Thành', N'Huyện', N'9 52 57N, 106 24 12E', N'84')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'848', N'Cầu Ngang', N'Huyện', N'9 47 14N, 106 29 19E', N'84')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'849', N'Trà Cú', N'Huyện', N'9 42 06N, 106 16 24E', N'84')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'850', N'Duyên Hải', N'Huyện', N'9 39 58N, 106 26 23E', N'84')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'855', N'Vĩnh Long', N'Thành Phố', N'10 15 09N, 105 56 08E', N'86')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'857', N'Long Hồ', N'Huyện', N'10 13 58N, 105 55 47E', N'86')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'858', N'Mang Thít', N'Huyện', N'10 10 58N, 106 05 13E', N'86')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'859', N'Vũng Liêm', N'Huyện', N'10 03 32N, 106 10 35E', N'86')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'860', N'Tam Bình', N'Huyện', N'10 03 58N, 105 58 03E', N'86')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'861', N'Bình Minh', N'Huyện', N'10 05 45N, 105 47 21E', N'86')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'862', N'Trà Ôn', N'Huyện', N'9 59 20N, 105 57 56E', N'86')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'863', N'Bình Tân', N'Huyện', N'', N'86')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'866', N'Cao Lãnh', N'Thành Phố', N'10 27 38N, 105 37 21E', N'87')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'867', N'Sa Đéc', N'Thị Xã', N'10 19 22N, 105 44 31E', N'87')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'868', N'Hồng Ngự', N'Thị Xã', N'', N'87')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'869', N'Tân Hồng', N'Huyện', N'10 52 48N, 105 29 21E', N'87')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'870', N'Hồng Ngự', N'Huyện', N'10 48 13N, 105 19 00E', N'87')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'871', N'Tam Nông', N'Huyện', N'10 44 06N, 105 30 58E', N'87')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'872', N'Tháp Mười', N'Huyện', N'10 33 36N, 105 47 13E', N'87')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'873', N'Cao Lãnh', N'Huyện', N'10 29 03N, 105 41 40E', N'87')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'874', N'Thanh Bình', N'Huyện', N'10 36 38N, 105 28 51E', N'87')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'875', N'Lấp Vò', N'Huyện', N'10 21 27N, 105 36 06E', N'87')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'876', N'Lai Vung', N'Huyện', N'10 14 43N, 105 38 40E', N'87')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'877', N'Châu Thành', N'Huyện', N'10 13 27N, 105 48 38E', N'87')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'883', N'Long Xuyên', N'Thành Phố', N'10 22 22N, 105 25 33E', N'89')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'884', N'Châu Đốc', N'Thị Xã', N'10 41 20N, 105 05 15E', N'89')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'886', N'An Phú', N'Huyện', N'10 50 12N, 105 05 33E', N'89')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'887', N'Tân Châu', N'Thị Xã', N'10 49 11N, 105 11 18E', N'89')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'888', N'Phú Tân', N'Huyện', N'10 40 26N, 105 14 40E', N'89')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'889', N'Châu Phú', N'Huyện', N'10 34 12N, 105 12 13E', N'89')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'890', N'Tịnh Biên', N'Huyện', N'10 33 30N, 105 00 17E', N'89')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'891', N'Tri Tôn', N'Huyện', N'10 24 41N, 104 56 58E', N'89')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'892', N'Châu Thành', N'Huyện', N'10 25 39N, 105 15 31E', N'89')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'893', N'Chợ Mới', N'Huyện', N'10 27 23N, 105 26 57E', N'89')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'894', N'Thoại Sơn', N'Huyện', N'10 16 45N, 105 15 59E', N'89')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'899', N'Rạch Giá', N'Thành Phố', N'10 01 35N, 105 06 20E', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'900', N'Hà Tiên', N'Thị Xã', N'10 22 54N, 104 30 10E', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'902', N'Kiên Lương', N'Huyện', N'10 20 21N, 104 39 46E', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'903', N'Hòn Đất', N'Huyện', N'10 14 20N, 104 55 57E', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'904', N'Tân Hiệp', N'Huyện', N'10 05 18N, 105 14 04E', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'905', N'Châu Thành', N'Huyện', N'9 57 37N, 105 10 16E', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'906', N'Giồng Giềng', N'Huyện', N'9 56 05N, 105 22 06E', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'907', N'Gò Quao', N'Huyện', N'9 43 17N, 105 17 06E', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'908', N'An Biên', N'Huyện', N'9 48 37N, 105 03 18E', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'909', N'An Minh', N'Huyện', N'9 40 24N, 104 59 05E', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'910', N'Vĩnh Thuận', N'Huyện', N'9 33 25N, 105 11 30E', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'911', N'Phú Quốc', N'Huyện', N'10 13 44N, 103 57 25E', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'912', N'Kiên Hải', N'Huyện', N'9 48 31N, 104 37 48E', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'913', N'U Minh Thượng', N'Huyện', N'', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'914', N'Giang Thành', N'Huyện', N'', N'91')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'916', N'Ninh Kiều', N'Quận', N'10 01 58N, 105 45 34E', N'92')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'917', N'Ô Môn', N'Quận', N'10 07 28N, 105 37 51E', N'92')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'918', N'Bình Thuỷ', N'Quận', N'10 03 42N, 105 43 17E', N'92')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'919', N'Cái Răng', N'Quận', N'9 59 57N, 105 46 56E', N'92')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'923', N'Thốt Nốt', N'Quận', N'10 14 23N, 105 32 02E', N'92')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'924', N'Vĩnh Thạnh', N'Huyện', N'10 11 35N, 105 22 45E', N'92')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'925', N'Cờ Đỏ', N'Huyện', N'10 02 48N, 105 29 46E', N'92')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'926', N'Phong Điền', N'Huyện', N'9 59 57N, 105 39 35E', N'92')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'927', N'Thới Lai', N'Huyện', N'', N'92')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'930', N'Vị Thanh', N'Thị Xã', N'9 45 15N, 105 24 50E', N'93')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'931', N'Ngã Bảy', N'Thị Xã', N'', N'93')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'932', N'Châu Thành A', N'Huyện', N'9 55 50N, 105 38 31E', N'93')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'933', N'Châu Thành', N'Huyện', N'9 55 22N, 105 48 37E', N'93')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'934', N'Phụng Hiệp', N'Huyện', N'9 47 20N, 105 43 29E', N'93')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'935', N'Vị Thuỷ', N'Huyện', N'9 48 05N, 105 32 13E', N'93')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'936', N'Long Mỹ', N'Huyện', N'9 40 47N, 105 30 53E', N'93')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'941', N'Sóc Trăng', N'Thành Phố', N'9 36 39N, 105 59 00E', N'94')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'942', N'Châu Thành', N'Huyện', N'', N'94')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'943', N'Kế Sách', N'Huyện', N'9 49 30N, 105 57 25E', N'94')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'944', N'Mỹ Tú', N'Huyện', N'9 38 21N, 105 49 52E', N'94')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'945', N'Cù Lao Dung', N'Huyện', N'9 37 36N, 106 12 13E', N'94')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'946', N'Long Phú', N'Huyện', N'9 34 38N, 106 06 07E', N'94')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'947', N'Mỹ Xuyên', N'Huyện', N'9 28 16N, 105 55 51E', N'94')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'948', N'Ngã Năm', N'Huyện', N'9 31 38N, 105 37 22E', N'94')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'949', N'Thạnh Trị', N'Huyện', N'9 28 05N, 105 43 02E', N'94')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'950', N'Vĩnh Châu', N'Huyện', N'9 20 50N, 105 59 58E', N'94')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'951', N'Trần Đề', N'Huyện', N'', N'94')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'954', N'Bạc Liêu', N'Thị Xã', N'9 16 05N, 105 45 08E', N'95')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'956', N'Hồng Dân', N'Huyện', N'9 30 37N, 105 24 25E', N'95')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'957', N'Phước Long', N'Huyện', N'9 23 13N, 105 24 41E', N'95')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'958', N'Vĩnh Lợi', N'Huyện', N'9 16 51N, 105 40 54E', N'95')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'959', N'Giá Rai', N'Huyện', N'9 15 51N, 105 23 18E', N'95')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'960', N'Đông Hải', N'Huyện', N'9 08 11N, 105 24 42E', N'95')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'961', N'Hoà Bình', N'Huyện', N'', N'95')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'964', N'Cà Mau', N'Thành Phố', N'9 10 33N, 105 11 11E', N'96')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'966', N'U Minh', N'Huyện', N'9 22 30N, 104 57 00E', N'96')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'967', N'Thới Bình', N'Huyện', N'9 22 50N, 105 07 35E', N'96')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'968', N'Trần Văn Thời', N'Huyện', N'9 07 36N, 104 57 27E', N'96')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'969', N'Cái Nước', N'Huyện', N'9 00 31N, 105 03 23E', N'96')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'970', N'Đầm Dơi', N'Huyện', N'8 57 48N, 105 13 56E', N'96')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'971', N'Năm Căn', N'Huyện', N'8 46 59N, 104 58 20E', N'96')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'972', N'Phú Tân', N'Huyện', N'8 52 47N, 104 53 35E', N'96')
INSERT [dbo].[District] ([ID], [Name], [Type], [Location], [ProvinceID]) VALUES (N'973', N'Ngọc Hiển', N'Huyện', N'8 40 47N, 104 57 58E', N'96')
SET IDENTITY_INSERT [dbo].[GroupCriteria] ON 

INSERT [dbo].[GroupCriteria] ([ID], [Code], [Name]) VALUES (1, N'VLKT', N'Vật lý kiến trúc')
INSERT [dbo].[GroupCriteria] ([ID], [Code], [Name]) VALUES (2, N'VT', N'Vị trí')
INSERT [dbo].[GroupCriteria] ([ID], [Code], [Name]) VALUES (3, N'MT', N'Môi trường')
INSERT [dbo].[GroupCriteria] ([ID], [Code], [Name]) VALUES (4, N'TC', N'Tài chính')
INSERT [dbo].[GroupCriteria] ([ID], [Code], [Name]) VALUES (5, N'MK', N'Marketing')
INSERT [dbo].[GroupCriteria] ([ID], [Code], [Name]) VALUES (6, N'PL', N'Pháp lý')
INSERT [dbo].[GroupCriteria] ([ID], [Code], [Name]) VALUES (7, N'CS', N'Chính sách')
INSERT [dbo].[GroupCriteria] ([ID], [Code], [Name]) VALUES (8, N'CB', N'Cơ bản')
SET IDENTITY_INSERT [dbo].[GroupCriteria] OFF
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10029, 10018, NULL, N'08-35-40_hinh-1.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10030, 10018, NULL, N'08-35-40_hình-2.png', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10031, 10018, NULL, N'08-35-40_hinh-3.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10032, 10018, NULL, N'08-35-40_hinh-4.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10033, 10018, NULL, N'08-35-40_hình-5.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10034, 10018, NULL, N'08-35-40_hinh-6.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10035, 10018, NULL, N'08-35-40_hinh-7.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10036, 10018, NULL, N'08-35-40_hinh-8.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10037, 10018, NULL, N'08-35-40_hinh-9.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10038, 10018, NULL, N'08-35-40_hinh-10.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10039, 10019, NULL, N'08-42-13_hinh-1.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10040, 10019, NULL, N'08-42-13_hinh-2.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10041, 10019, NULL, N'08-42-13_hình-3.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10042, 10019, NULL, N'08-42-13_hinh-4.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10043, 10019, NULL, N'08-42-13_hinh-5.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10044, 10019, NULL, N'08-42-13_hình-6.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10045, 10019, NULL, N'08-42-13_hình-7.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10046, 10020, NULL, N'08-44-39_hinh-4.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10047, 10020, NULL, N'08-44-39_hinh-5.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10048, 10020, NULL, N'08-44-39_hình-6.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10049, 10020, NULL, N'08-44-39_hình-7.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10050, 10, NULL, N'08-44-39_hình-7.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10051, 10021, NULL, N'08-50-23_1.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10052, 10021, NULL, N'08-50-23_2.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10053, 10021, NULL, N'08-50-23_3.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10054, 10021, NULL, N'08-50-23_4.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10055, 10021, NULL, N'08-50-23_5.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10056, 10021, NULL, N'08-50-23_6.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10057, 10021, NULL, N'08-50-23_7.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10058, 10022, NULL, N'08-51-27_2.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10059, 10022, NULL, N'08-51-27_3.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10060, 10022, NULL, N'08-51-27_5.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10061, 10022, NULL, N'08-51-27_6.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (10062, 10022, NULL, N'08-51-27_7.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (20029, NULL, 1, N'08-51-27_7.jpg', N'/Images/Project/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (20030, NULL, 5, N'21-14-21_3.jpg', N'/Images/Comment/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (20031, NULL, 6, N'21-22-26_2.jpg', N'/Images/Comment/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (20032, NULL, 7, N'21-24-58_2.jpg', N'/Images/Comment/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (20033, NULL, 8, N'21-32-44_1.jpg', N'/Images/Comment/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (20034, NULL, 9, N'21-38-24_1.jpg', N'/Images/Comment/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (20035, NULL, 10, N'21-41-16_hình-7.jpg', N'/Images/Comment/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (20036, NULL, 11, N'22-14-22_hình-6.jpg', N'/Images/Comment/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (20037, NULL, 11, N'22-14-36_hình-7.jpg', N'/Images/Comment/')
INSERT [dbo].[Image] ([ID], [ProjectID], [CommentID], [Name], [Url]) VALUES (20038, NULL, 12, N'22-45-43_hình-7.jpg', N'/Images/Comment/')
SET IDENTITY_INSERT [dbo].[Image] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([ID], [Name], [Address], [Contact], [Price], [UnitPrice], [Acreage], [Status], [Deadline], [Description], [Lat], [Long], [TypeID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (10, N'Bán căn hộ chung cư tại Đạt Gia Residence Thủ Đức', N'511/19 Huỳnh Văn Bánh, Phường 14, Quận Phú Nhuận ,Hồ Chí Minh', N'<p><strong><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#055699">LH 0901391869 Ms Hồng</span></span></span></strong></p>
', 850, N'triệu', 60, NULL, CAST(0x0000A6E500000000 AS DateTime), N'<p><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black">Căn hộ cao cấp nội thất th&ocirc;ng minh liền kề mặt tiền </span></span></span><a href="http://batdongsan.com.vn/ban-can-ho-chung-cu-duong-pham-van-dong-71"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#055699">Phạm Văn Đồng</span></span></span></a><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black"> - gần cầu B&igrave;nh Triệu - TT Thủ Đức - hồ bơi nghỉ dưỡng - 240 triệu/căn/2PN - 0902670393<br />
Từ 240 triệu bạn đ&atilde; sở hữu ngay căn hộ 2 ph&ograve;ng ngủ - trả g&oacute;p 3 - 5 triệu/th&aacute;ng.<br />
Hotline PKD: 0902670393.<br />
Hotline CSKH: 01638220526.<br />
*** Tặng ngay nội thất th&ocirc;ng minh:<br />
- Tặng ngay tủ kệ bếp tr&ecirc;n + dưới: gỗ tự nhi&ecirc;n<br />
- Tặng ngay nội thất th&ocirc;ng minh cơ bản: uPVC chống ồn chống bụi. thiết bị Inax 7 m&oacute;n,...<br />
- Tặng thẻ từ thang m&aacute;y, camera an ninh, m&aacute;y h&uacute;t m&ugrave;i, hệ thống ống đồng m&aacute;y lạnh cho to&agrave;n căn hộ.<br />
- Mua qu&agrave; to - rinh qu&agrave; khủng.<br />
1/ Đơn vị triển khai uy t&iacute;n - chuy&ecirc;n nghiệp:</span></span></span><br />
<span style="font-size:13.0pt"><span style="font-family:&quot;MS Mincho&quot;,&quot;serif&quot;"><span style="color:black">➡</span></span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black"> CĐT uy t&iacute;n - Nh&agrave; thầu x&acirc;y dựng danh tiếng (V&otilde; Đ&igrave;nh Construction).<br />
- Dự &aacute;n gồm: 3 block trong đ&oacute; 1 block thương mại cao 7 tầng v&agrave; 2 block căn hộ ở v&agrave; Shophouse tầng trệt.</span></span></span><br />
<span style="font-size:13.0pt"><span style="font-family:&quot;MS Mincho&quot;,&quot;serif&quot;"><span style="color:black">➡</span></span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black"> Tiến độ: Đang x&acirc;y dựng đang ho&agrave;n thiện 90% v&agrave; sắp b&agrave;n giao nh&agrave;.<br />
<br />
2/ Vị tr&iacute;</span></span></span><br />
<span style="font-size:13.0pt"><span style="font-family:&quot;MS Mincho&quot;,&quot;serif&quot;"><span style="color:black">➡</span></span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black"> Vị tr&iacute; cực kỳ đắc địa v&agrave; l&agrave; căn hộ 4 mặt tiền đường lớn &ndash; Liền kề Phạm Văn Đồng.<br />
- Về B&igrave;nh Thạnh mất 5 ph&uacute;t.<br />
- Về quận 1 mất 15 ph&uacute;t.<br />
- Về s&acirc;n bay T&acirc;n Sơn Nhất 15 ph&uacute;t.<br />
<br />
3/ Tiện &iacute;ch<br />
- Khu thương mại si&ecirc;u thị sầm uất.<br />
- Khu thẩm mỹ, spa đạt ti&ecirc;u chuẩn chất lượng.<br />
- Nh&agrave; trẻ đạt chuẩn quốc tế.<br />
- Khu vui chơi giải tr&iacute; d&agrave;nh cho trẻ em.<br />
- Ph&ograve;ng tập gym sang trọng, nhiều thiết bị hiện đại.<br />
- C&ocirc;ng vi&ecirc;n c&acirc;y xanh 14000m2, đường chạy bộ - nội khu,...<br />
- Hệ thống camera, an ninh 24/24.<br />
<br />
4/ Gi&aacute; v&agrave; diện t&iacute;ch<br />
- Gi&aacute; Gốc CĐT 240 triệu/căn.<br />
- Diện t&iacute;ch th&ocirc;ng thủy:<br />
Từ 47m2 - 54m2 - 70m2 - 80m2 (2 PN)- ph&ugrave; hợp nhu cầu đại đa số<br />
- Sắp giao nh&agrave; v&agrave; sổ hồng<br />
5/ M&ocirc;i trường xung quanh<br />
- Chỉ 3 - 5 ph&uacute;t đến trường học, chợ, si&ecirc;u thị Co. Opmart, điện m&aacute;y Thi&ecirc;n H&ograve;a, Big C, Padora, Aeon - Mall &hellip;.<br />
- Khu c&ocirc;ng vi&ecirc;n c&acirc;y xanh bao quanh 14000m2, mang đến kh&ocirc;ng kh&iacute; trong l&agrave;nh v&agrave; ấm &aacute;p.<br />
- S&acirc;n chơi trẻ em, s&acirc;n tennis, khu sinh hoạt chung,...<br />
- Mật độ x&acirc;y dựng thấp (24%), đem lại kh&ocirc;ng gian xanh cho bạn tầng hưởng.<br />
- Căn hộ c&oacute; 1 tầng hầm, 7 tầng thương mại v&agrave; shophouse tầng trệt đảm bảo điều kiện sống thuận tiện nhất.<br />
- Ngay chợ, đ&ocirc;ng d&acirc;n cư, ph&aacute;p l&yacute; sổ hồng ri&ecirc;ng vĩnh viễn. Ngay chợ Thủ Đức, CK 5 - 30%, ng&acirc;n h&agrave;ng cho vay 70 - 90% Với LS 0%<br />
<br />
7/Ph&aacute;p l&yacute;:<br />
- Cam kết b&agrave;n giao sổ hồng đ&uacute;ng thời hạn (tương đương với thời hạn b&agrave;n giao căn hộ).<br />
- Nếu kh&ocirc;ng đ&uacute;ng thời hạn chủ đầu tư phải chịu ho&agrave;n to&agrave;n tr&aacute;ch nhiệm trước ph&aacute;p luật (theo khoản 1,2,3 điều 56 luật kinh doanh BĐS 2014.<br />
<br />
Li&ecirc;n hệ xem nh&agrave; mẫu v&agrave; nhận ưu đ&atilde;i<br />
Hotline PKD: 0902670393<br />
Hotline CSKH: 01638220526.</span></span></span></p>
', N'10.791276', N'106.66936099999998', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([ID], [Name], [Address], [Contact], [Price], [UnitPrice], [Acreage], [Status], [Deadline], [Description], [Lat], [Long], [TypeID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (10018, N'Bán căn hộ chung cư tại Đạt Gia Residence Thủ Đức', N'Thủ Đức,Hồ Chí Minh', N'<p><u><em><strong>Liện hệ:</strong></em></u></p>

<p>&nbsp;<strong>SĐT:</strong>&nbsp;<strong>0901391869 </strong></p>

<p>Gặp <strong>Ms Hồng</strong></p>
', 850, N'triệu', 60, NULL, CAST(0x0000A6F800000000 AS DateTime), N'<p><strong><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#8e8e8e">Th&ocirc;ng tin m&ocirc; tả</span></span></span></strong></p>

<p><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black">Căn hộ cao cấp nội thất th&ocirc;ng minh liền kề mặt tiền </span></span></span><a href="http://batdongsan.com.vn/ban-can-ho-chung-cu-duong-pham-van-dong-71"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#055699">Phạm Văn Đồng</span></span></span></a><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black"> - gần cầu B&igrave;nh Triệu - TT Thủ Đức - hồ bơi nghỉ dưỡng - 240 triệu/căn/2PN - 0902670393<br />
Từ 240 triệu bạn đ&atilde; sở hữu ngay căn hộ 2 ph&ograve;ng ngủ - trả g&oacute;p 3 - 5 triệu/th&aacute;ng.<br />
Hotline PKD: 0902670393.<br />
Hotline CSKH: 01638220526.<br />
*** Tặng ngay nội thất th&ocirc;ng minh:<br />
- Tặng ngay tủ kệ bếp tr&ecirc;n + dưới: gỗ tự nhi&ecirc;n<br />
- Tặng ngay nội thất th&ocirc;ng minh cơ bản: uPVC chống ồn chống bụi. thiết bị Inax 7 m&oacute;n,...<br />
- Tặng thẻ từ thang m&aacute;y, camera an ninh, m&aacute;y h&uacute;t m&ugrave;i, hệ thống ống đồng m&aacute;y lạnh cho to&agrave;n căn hộ.<br />
- Mua qu&agrave; to - rinh qu&agrave; khủng.<br />
1/ Đơn vị triển khai uy t&iacute;n - chuy&ecirc;n nghiệp:</span></span></span><br />
<span style="font-size:13.0pt"><span style="font-family:&quot;MS Mincho&quot;,&quot;serif&quot;"><span style="color:black">➡</span></span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black"> CĐT uy t&iacute;n - Nh&agrave; thầu x&acirc;y dựng danh tiếng (V&otilde; Đ&igrave;nh Construction).<br />
- Dự &aacute;n gồm: 3 block trong đ&oacute; 1 block thương mại cao 7 tầng v&agrave; 2 block căn hộ ở v&agrave; Shophouse tầng trệt.</span></span></span><br />
<span style="font-size:13.0pt"><span style="font-family:&quot;MS Mincho&quot;,&quot;serif&quot;"><span style="color:black">➡</span></span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black"> Tiến độ: Đang x&acirc;y dựng đang ho&agrave;n thiện 90% v&agrave; sắp b&agrave;n giao nh&agrave;.<br />
<br />
2/ Vị tr&iacute;</span></span></span><br />
<span style="font-size:13.0pt"><span style="font-family:&quot;MS Mincho&quot;,&quot;serif&quot;"><span style="color:black">➡</span></span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black"> Vị tr&iacute; cực kỳ đắc địa v&agrave; l&agrave; căn hộ 4 mặt tiền đường lớn &ndash; Liền kề Phạm Văn Đồng.<br />
- Về B&igrave;nh Thạnh mất 5 ph&uacute;t.<br />
- Về quận 1 mất 15 ph&uacute;t.<br />
- Về s&acirc;n bay T&acirc;n Sơn Nhất 15 ph&uacute;t.<br />
<br />
3/ Tiện &iacute;ch<br />
- Khu thương mại si&ecirc;u thị sầm uất.<br />
- Khu thẩm mỹ, spa đạt ti&ecirc;u chuẩn chất lượng.<br />
- Nh&agrave; trẻ đạt chuẩn quốc tế.<br />
- Khu vui chơi giải tr&iacute; d&agrave;nh cho trẻ em.<br />
- Ph&ograve;ng tập gym sang trọng, nhiều thiết bị hiện đại.<br />
- C&ocirc;ng vi&ecirc;n c&acirc;y xanh 14000m2, đường chạy bộ - nội khu,...<br />
- Hệ thống camera, an ninh 24/24.<br />
<br />
4/ Gi&aacute; v&agrave; diện t&iacute;ch<br />
- Gi&aacute; Gốc CĐT 240 triệu/căn.<br />
- Diện t&iacute;ch th&ocirc;ng thủy:<br />
Từ 47m2 - 54m2 - 70m2 - 80m2 (2 PN)- ph&ugrave; hợp nhu cầu đại đa số<br />
- Sắp giao nh&agrave; v&agrave; sổ hồng<br />
5/ M&ocirc;i trường xung quanh<br />
- Chỉ 3 - 5 ph&uacute;t đến trường học, chợ, si&ecirc;u thị Co. Opmart, điện m&aacute;y Thi&ecirc;n H&ograve;a, Big C, Padora, Aeon - Mall &hellip;.<br />
- Khu c&ocirc;ng vi&ecirc;n c&acirc;y xanh bao quanh 14000m2, mang đến kh&ocirc;ng kh&iacute; trong l&agrave;nh v&agrave; ấm &aacute;p.<br />
- S&acirc;n chơi trẻ em, s&acirc;n tennis, khu sinh hoạt chung,...<br />
- Mật độ x&acirc;y dựng thấp (24%), đem lại kh&ocirc;ng gian xanh cho bạn tầng hưởng.<br />
- Căn hộ c&oacute; 1 tầng hầm, 7 tầng thương mại v&agrave; shophouse tầng trệt đảm bảo điều kiện sống thuận tiện nhất.<br />
- Ngay chợ, đ&ocirc;ng d&acirc;n cư, ph&aacute;p l&yacute; sổ hồng ri&ecirc;ng vĩnh viễn. Ngay chợ Thủ Đức, CK 5 - 30%, ng&acirc;n h&agrave;ng cho vay 70 - 90% Với LS 0%<br />
<br />
7/Ph&aacute;p l&yacute;:<br />
- Cam kết b&agrave;n giao sổ hồng đ&uacute;ng thời hạn (tương đương với thời hạn b&agrave;n giao căn hộ).<br />
- Nếu kh&ocirc;ng đ&uacute;ng thời hạn chủ đầu tư phải chịu ho&agrave;n to&agrave;n tr&aacute;ch nhiệm trước ph&aacute;p luật (theo khoản 1,2,3 điều 56 luật kinh doanh BĐS 2014.<br />
<br />
Li&ecirc;n hệ xem nh&agrave; mẫu v&agrave; nhận ưu đ&atilde;i<br />
Hotline PKD: 0902670393<br />
Hotline CSKH: 01638220526.</span></span></span></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h2><span style="color:#555555">Th&ocirc;ng tin dự &aacute;n Đạt Gia Residence Thủ Đức</span></h2>

<p style="margin-left:0cm; margin-right:0cm"><span style="font-size:13.0pt"><span style="color:#555555">Căn hộ Đạt Gia Residence nằm ngay trung t&acirc;m quận Thủ Đức được hỗ trợ bởi g&oacute;i 30 ngh&igrave;n tỷ. Dự &aacute;n c&oacute; 4 mặt tiền đường kết nối trực tiếp với đường c&acirc;y Keo, V&agrave;nh đai 2, đại lộ Phạm Văn Đồng... C&ocirc;ng tr&igrave;nh quy m&ocirc; lớn t&iacute;ch hợp nhiều tiện &iacute;ch cao cấp như trung t&acirc;m thương mại, hồ bơi, spa, gym, trường học... Những căn hộ chung cư được thiết kế sang trọng, tinh tế, đa dạng diện t&iacute;ch th&iacute;ch hợp với nhu cầu an cư của người mua nh&agrave;. Đạt Gia Residence với mục ti&ecirc;u x&acirc;y dựng cộng đồng d&acirc;n cư văn minh kiểu mẫu sẽ l&agrave; sự lựa chọn tuyệt vời d&agrave;nh cho bạn.</span></span></p>

<p style="margin-left:0cm; margin-right:0cm"><span style="font-size:13.0pt"><span style="color:#555555">Đơn vị thi c&ocirc;ng dự &aacute;n l&agrave; C&ocirc;ng ty X&acirc;y dựng V&otilde; Đ&igrave;nh, đơn vị nhiều năm kinh nghiệm trong ng&agrave;nh x&acirc;y dựng.<br />
Đơn vị tư vấn gi&aacute;m s&aacute;t dự &aacute;n l&agrave; Apave của Ph&aacute;p, đơn vị c&oacute; danh tiếng trong ng&agrave;nh, sẽ bảo đảm chất lượng thi c&ocirc;ng cho c&aacute;c căn tại Đạt Gia Residence Thủ Đức.<br />
<br />
Dự &aacute;n căn hộ Đạt Gia Residence Thủ Đức c&oacute; điểm mạnh sau:<br />
Dự &aacute;n c&oacute; ti&ecirc;u ch&iacute; &ldquo;Easy Buy &ndash; Easy For Rent&rdquo; tức l&agrave; Dễ mua v&agrave; Dễ cho thu&ecirc;. Thực vậy, để sở hữu 1 căn hộ tại dự &aacute;n Đạt Gia Thủ Đức rất dễ d&agrave;ng.<br />
Căn hộ 2 ph&ograve;ng ngủ c&oacute; mức gi&aacute; dao động từ 700-800 triệu. Trong khi đ&oacute;, ng&acirc;n h&agrave;ng t&agrave;i trợ cho qu&yacute; kh&aacute;ch tới 70% thậm ch&iacute; l&agrave; 80% gi&aacute; trị căn hộ.</span></span></p>

<p style="margin-left:0cm; margin-right:0cm"><span style="font-size:13.0pt"><span style="color:#555555">Căn hộ Đạt Gia Residence Thủ Đức c&oacute; lợi thế:<br />
- Vị tr&iacute; đắc địa với 4 mặt tiền đường<br />
- Dễ d&agrave;ng sở hữu căn hộ với mức gi&aacute; từ 709 triệu/căn 2 ph&ograve;ng ngủ<br />
- Diện t&iacute;ch th&iacute;ch hợp với những gia đ&igrave;nh trẻ tr&ecirc;n dưới 60m2 d&agrave;nh cho 1 căn hộ<br />
- Ng&acirc;n h&agrave;ng t&agrave;i trợ vốn tối đa v&agrave; nhất l&agrave; g&oacute;i vay 30 ngh&igrave;n tỷ<br />
- Khả năng sinh lợi thuận cao với quy hoạch trung t&acirc;m h&agrave;nh ch&iacute;nh Thủ Đức tại phường Tam Ph&uacute; v&agrave; đường v&agrave;nh đai 2 (đ&atilde; l&agrave;m đến ng&atilde; tư B&igrave;nh Th&aacute;i)<br />
- Tiện &iacute;ch đầy đủ, thiết kế hiện đại với c&ocirc;ng vi&ecirc;n rộng, hồ bơi v&agrave; nhất l&agrave; 1 block căn hộ ri&ecirc;ng d&agrave;nh cho khu thương mại 7 tầng.<br />
- C&oacute; camera quan s&aacute;t, gi&uacute;p kh&aacute;ch h&agrave;ng gi&aacute;m s&aacute;t được tiến độ thi c&ocirc;ng của c&ocirc;ng tr&igrave;nh.</span></span></p>
', N'10.8494094', N'106.75370550000002', 1, CAST(0x0000A6EC008DA1FC AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Project] ([ID], [Name], [Address], [Contact], [Price], [UnitPrice], [Acreage], [Status], [Deadline], [Description], [Lat], [Long], [TypeID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (10019, N'Bán căn hộ chung cư tại Đạt Gia Residence Thủ Đức', N'75, Thủ Đức,Hồ Chí Minh', N'<p><u><em><strong>Liện hệ:</strong></em></u></p>

<p>&nbsp;<strong>SĐT:</strong>&nbsp;<strong>0901391869 </strong></p>

<p>Gặp <strong>Ms Hồng</strong></p>
', 830, N'triệu', 51, NULL, NULL, N'<p><strong><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#8e8e8e">Th&ocirc;ng tin m&ocirc; tả</span></span></span></strong></p>

<p><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black">Th&ocirc;ng tin m&ocirc; tả.<br />
B&aacute;n Căn hộ liền kề đường </span></span></span><a href="http://batdongsan.com.vn/ban-can-ho-chung-cu-duong-pham-van-dong-71"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#055699">Phạm Văn Đồng</span></span></span></a><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black">, Thủ Đức 830triệu/căn.<br />
Thanh to&aacute;n từ 200 - 300 triệu bạn đ&atilde; sở hữu ngay căn hộ 2 ph&ograve;ng ngủ - trả g&oacute;p 6 - 8 triệu/th&aacute;ng.<br />
- Tặng ngay tủ kệ bếp tr&ecirc;n + dưới.<br />
- Tặng ngay nội thất th&ocirc;ng minh cơ bản.<br />
- Tặng thẻ từ thang m&aacute;y, camera an ninh, m&aacute;y h&uacute;t m&ugrave;i, hệ thống ống đồng m&aacute;y lạnh cho to&agrave;n căn hộ.<br />
+ Tiến độ: Đang x&acirc;y dựng v&agrave; Đầu 2017 b&agrave;n giao.<br />
2/ Vị tr&iacute;:<br />
+ Vị tr&iacute; cực kỳ đắc địa v&agrave; l&agrave; căn hộ 4 mặt tiền đường lớn &ndash; Liền kề Phạm Văn Đồng.<br />
- Về B&igrave;nh Thạnh mất 5 ph&uacute;t.<br />
- Về Quận 1 mất 15 ph&uacute;t.<br />
- Về S&acirc;n bay T&acirc;n Sơn Nhất 15 ph&uacute;t.<br />
3/ Tiện &iacute;ch:<br />
- Tiện &iacute;ch cao cấp v&agrave; nội thất th&ocirc;ng minh.<br />
- 7 tầng Trung t&acirc;m thương mại, gym, spa, Hồ bơi Nghỉ dưỡng 500m, nh&agrave; giữ trẻ, Shop thời trang, nh&agrave; h&agrave;ng, Coffee House, Hồ tiểu cảnh, c&ocirc;ng vi&ecirc;n c&acirc;y xanh, Đường chạy bộ nội khu,...<br />
- B&aacute;n k&iacute;nh 500m c&oacute;: Bệnh viện Đa khoa, Bệnh viện Quốc tế, Vincom Thủ Đức, Trường cấp 1,2,3, Đại học, Ng&acirc;n h&agrave;ng, Si&ecirc;u thị, Chợ,...<br />
4/ Gi&aacute; v&agrave; diện t&iacute;ch:<br />
- Gi&aacute; Gốc CĐT 830triệu/căn.<br />
- Diện t&iacute;ch từ: 53m2, 59m2, 62m2,70m2.<br />
- - Trả chậm theo tiến độ.<br />
- Thanh to&aacute;n trước 30%, 70% c&ograve;n lại G&oacute;p 6 - 8 triệu/th&aacute;ng qua Ng&acirc;n h&agrave;ng trong 15 năm.<br />
- Ng&acirc;n h&agrave;ng Đ&ocirc;ng &Aacute; Bank cam kết bảo l&atilde;nh v&agrave; cho vay Dự &aacute;n với l&atilde;i suất thấp nhất thị trường hỗ trợ Kh&aacute;ch h&agrave;ng: 7.5%/năm trong 15 năm.<br />
5/ Ph&aacute;p l&yacute;:<br />
- Cam kết b&agrave;n giao sổ hồng đ&uacute;ng thời hạn (tương đương với thời hạn b&agrave;n giao căn hộ).<br />
Q&uacute;y kh&aacute;ch h&agrave;ng c&oacute; nhu cầu quan t&acirc;m mua ở hoặc đầu tư li&ecirc;n hệ để biết th&ecirc;m th&ocirc;ng tin v&agrave; xem nh&agrave; mẫu:<br />
LH: Ms. Hồng 0902 67 03 93.</span></span></span></p>
', N'10.8389068', N'106.72710189999998', 1, CAST(0x0000A6EC008F6EF9 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Project] ([ID], [Name], [Address], [Contact], [Price], [UnitPrice], [Acreage], [Status], [Deadline], [Description], [Lat], [Long], [TypeID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (10020, N'Bán căn hộ chung cư tại Đạt Gia Residence Thủ Đức', N'quận 10,Hồ Chí Minh', N'<p><u><em><strong>Liện hệ:</strong></em></u></p>

<p>&nbsp;<strong>SĐT:</strong>&nbsp;<strong>0901391869 </strong></p>

<p>Gặp <strong>Ms Hồng</strong></p>
', 900, N'triệu', 88, NULL, CAST(0x0000A6EE00000000 AS DateTime), N'<p><strong><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#8e8e8e">Th&ocirc;ng tin m&ocirc; tả</span></span></span></strong></p>

<p><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black">Th&ocirc;ng tin m&ocirc; tả.<br />
B&aacute;n Căn hộ liền kề đường </span></span></span><a href="http://batdongsan.com.vn/ban-can-ho-chung-cu-duong-pham-van-dong-71"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#055699">Phạm Văn Đồng</span></span></span></a><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black">, Thủ Đức 830triệu/căn.<br />
Thanh to&aacute;n từ 200 - 300 triệu bạn đ&atilde; sở hữu ngay căn hộ 2 ph&ograve;ng ngủ - trả g&oacute;p 6 - 8 triệu/th&aacute;ng.<br />
- Tặng ngay tủ kệ bếp tr&ecirc;n + dưới.<br />
- Tặng ngay nội thất th&ocirc;ng minh cơ bản.<br />
- Tặng thẻ từ thang m&aacute;y, camera an ninh, m&aacute;y h&uacute;t m&ugrave;i, hệ thống ống đồng m&aacute;y lạnh cho to&agrave;n căn hộ.<br />
+ Tiến độ: Đang x&acirc;y dựng v&agrave; Đầu 2017 b&agrave;n giao.<br />
2/ Vị tr&iacute;:<br />
+ Vị tr&iacute; cực kỳ đắc địa v&agrave; l&agrave; căn hộ 4 mặt tiền đường lớn &ndash; Liền kề Phạm Văn Đồng.<br />
- Về B&igrave;nh Thạnh mất 5 ph&uacute;t.<br />
- Về Quận 1 mất 15 ph&uacute;t.<br />
- Về S&acirc;n bay T&acirc;n Sơn Nhất 15 ph&uacute;t.<br />
3/ Tiện &iacute;ch:<br />
- Tiện &iacute;ch cao cấp v&agrave; nội thất th&ocirc;ng minh.<br />
- 7 tầng Trung t&acirc;m thương mại, gym, spa, Hồ bơi Nghỉ dưỡng 500m, nh&agrave; giữ trẻ, Shop thời trang, nh&agrave; h&agrave;ng, Coffee House, Hồ tiểu cảnh, c&ocirc;ng vi&ecirc;n c&acirc;y xanh, Đường chạy bộ nội khu,...<br />
- B&aacute;n k&iacute;nh 500m c&oacute;: Bệnh viện Đa khoa, Bệnh viện Quốc tế, Vincom Thủ Đức, Trường cấp 1,2,3, Đại học, Ng&acirc;n h&agrave;ng, Si&ecirc;u thị, Chợ,...<br />
4/ Gi&aacute; v&agrave; diện t&iacute;ch:<br />
- Gi&aacute; Gốc CĐT 830triệu/căn.<br />
- Diện t&iacute;ch từ: 53m2, 59m2, 62m2,70m2.<br />
- - Trả chậm theo tiến độ.<br />
- Thanh to&aacute;n trước 30%, 70% c&ograve;n lại G&oacute;p 6 - 8 triệu/th&aacute;ng qua Ng&acirc;n h&agrave;ng trong 15 năm.<br />
- Ng&acirc;n h&agrave;ng Đ&ocirc;ng &Aacute; Bank cam kết bảo l&atilde;nh v&agrave; cho vay Dự &aacute;n với l&atilde;i suất thấp nhất thị trường hỗ trợ Kh&aacute;ch h&agrave;ng: 7.5%/năm trong 15 năm.<br />
5/ Ph&aacute;p l&yacute;:<br />
- Cam kết b&agrave;n giao sổ hồng đ&uacute;ng thời hạn (tương đương với thời hạn b&agrave;n giao căn hộ).<br />
Q&uacute;y kh&aacute;ch h&agrave;ng c&oacute; nhu cầu quan t&acirc;m mua ở hoặc đầu tư li&ecirc;n hệ để biết th&ecirc;m th&ocirc;ng tin v&agrave; xem nh&agrave; mẫu:<br />
LH: Ms. Hồng 0902 67 03 93.</span></span></span></p>
', N'10.8230989', N'106.6296638', NULL, CAST(0x0000A6EC00901A91 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Project] ([ID], [Name], [Address], [Contact], [Price], [UnitPrice], [Acreage], [Status], [Deadline], [Description], [Lat], [Long], [TypeID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (10021, N'Bán căn hộ chung cư tại Căn hộ Linh Tây', N'11,Thủ Đức,Hồ Chí Minh', N'<p>LH 0909323552</p>
', 915, N'triệu', 65, NULL, CAST(0x0000A6EE00000000 AS DateTime), N'<p><strong><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#8e8e8e">Th&ocirc;ng tin m&ocirc; tả</span></span></span></strong></p>

<p><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black">Linh T&acirc;y Tower - tất cả d&agrave;nh cho bạn.<br />
1. Vị tr&iacute; đẹp nhất khu vực.<br />
Căn hộ Linh T&acirc;y c&oacute; vị tr&iacute; đắc địa ngay trung t&acirc;m Quận Thủ Đức, nằm liền kề đường T&acirc;n Sơn Nhất &ndash; B&igrave;nh Lợi. Một tuyến đường huyết mạch của Th&agrave;nh Phố.<br />
+ Liền Kề đường T&acirc;n Sơn Nhất &ndash; B&igrave;nh Lợi.<br />
+ Di chuyển về S&acirc;n bay nhanh ch&oacute;ng chỉ 10 ph&uacute;t.<br />
+ Kết nối về Quận 1 chỉ 15 ph&uacute;t.<br />
+ Kết nối về bến xe Miền Đ&ocirc;ng mới chỉ 5 ph&uacute;t.<br />
+ Kết nối về l&agrave;ng Đại Học chỉ 10 ph&uacute;t.<br />
2. Căn hộ chuẩn mực với c&aacute;c tiện &iacute;ch đẳng cấp.<br />
+ Tổng quy m&ocirc; Linh T&acirc;y Tower: 8.000 m2, với 3 Block gồm: TTTM (2 tầng) v&agrave; căn hộ (16 tầng).<br />
Mật độ x&acirc;y dựng to&agrave;n khu: 46.2%. Phần c&ograve;n lại l&agrave; c&ocirc;ng vi&ecirc;n c&acirc;y xanh, hồ bơi, lối đi bộ.<br />
+ Tiện &iacute;ch ho&agrave;n hảo: 2 tầng trung t&acirc;m thương mại, dịch vụ đa tiện &iacute;ch: c&ocirc;ng vi&ecirc;n nội khu, cafe s&acirc;n thượng, khu mua sắm, gym, spa, khu vui chơi thiếu nhi, hệ thống gi&aacute;o dục liền kề, hệ thống an ninh 24/24h, hệ thống camera quan s&aacute;t to&agrave;n khu vực v&agrave; hệ thống intercom nhận &hellip;.<br />
3. Thiết kế căn hộ th&ocirc;ng minh theo chuẩn Singapore.<br />
+ Căn hộ Linh T&acirc;y c&oacute; thiết kế rất hợp l&yacute;. C&aacute;c loại diện t&iacute;ch ph&ugrave; hợp với nhu cầu của thị trường hiện tại. C&aacute;c lại diện t&iacute;ch: 59m2 - 82m2.<br />
+ Tất cả c&aacute;c ph&ograve;ng trong căn hộ đều c&oacute; ban c&ocirc;ng v&agrave; cửa sổ hướng ra ngo&agrave;i tạo cho căn hộ rất th&ocirc;ng tho&aacute;ng gi&uacute;p tiết kiệm điện.<br />
+ Điểm đặc biệt l&agrave; c&aacute;c căn hộ từ 59m2 trở l&ecirc;n đều c&oacute; 2 ph&ograve;ng ngủ, 2 WC....<br />
4. Gi&aacute; b&aacute;n hợp l&yacute; nhất trong khu vực:<br />
+ Với mức gi&aacute; được ch&agrave;o b&aacute;n từ 12.9 triệu/m2 được xem l&agrave; hấp dẫn v&agrave; cạnh tranh nhất.<br />
+ Mặt bằng gi&aacute; thấp hơn từ 15 - 20% so với c&aacute;c đối thủ cạnh tranh trong c&ugrave;ng khu vực.<br />
+ Phương thức thanh to&aacute;n linh hoạt tạo cơ hội cho nh&agrave; đầu tư.<br />
+ Đợt 1 chỉ thanh to&aacute;n 30% gi&aacute; trị hợp đồng.<br />
5. Nhận nh&agrave; trong năm nay.<br />
Hiện tại căn hộ Linh T&acirc;y đ&atilde; cất n&oacute;c, đang trong qu&aacute; tr&igrave;nh ho&agrave;n thiện. Sắp b&agrave;n giao nh&agrave; trong Qu&yacute; IV/2016, tốc độ thi c&ocirc;ng nhanh ch&oacute;ng 3 ca/ng&agrave;y, cam kết chất lượng c&ocirc;ng tr&igrave;nh.<br />
Số lượng căn hộ c&ograve;n lại c&oacute; hạn, Qu&yacute; kh&aacute;ch h&agrave;ng n&ecirc;n nhanh tay chọn cho m&igrave;nh một căn hộ Linh T&acirc;y ph&ugrave; hợp.<br />
Th&ocirc;ng tin chi tiết vui l&ograve;ng li&ecirc;n hệ PKD: 0909323552 (Ms. Hằng).</span></span></span></p>
', N'10.8625887', N'106.7338403', 1, CAST(0x0000A6EC0091AD8A AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Project] ([ID], [Name], [Address], [Contact], [Price], [UnitPrice], [Acreage], [Status], [Deadline], [Description], [Lat], [Long], [TypeID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (10022, N'Bán căn hộ chung cư tại Căn hộ Linh Tây', N'33,Thủ Đức,Hồ Chí Minh', N'<p>LH 0909323552</p>
', 700, N'triệu', 55, NULL, CAST(0x0000A6E700000000 AS DateTime), N'<p><strong><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#8e8e8e">Th&ocirc;ng tin m&ocirc; tả</span></span></span></strong></p>

<p><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:black">Linh T&acirc;y Tower - tất cả d&agrave;nh cho bạn.<br />
1. Vị tr&iacute; đẹp nhất khu vực.<br />
Căn hộ Linh T&acirc;y c&oacute; vị tr&iacute; đắc địa ngay trung t&acirc;m Quận Thủ Đức, nằm liền kề đường T&acirc;n Sơn Nhất &ndash; B&igrave;nh Lợi. Một tuyến đường huyết mạch của Th&agrave;nh Phố.<br />
+ Liền Kề đường T&acirc;n Sơn Nhất &ndash; B&igrave;nh Lợi.<br />
+ Di chuyển về S&acirc;n bay nhanh ch&oacute;ng chỉ 10 ph&uacute;t.<br />
+ Kết nối về Quận 1 chỉ 15 ph&uacute;t.<br />
+ Kết nối về bến xe Miền Đ&ocirc;ng mới chỉ 5 ph&uacute;t.<br />
+ Kết nối về l&agrave;ng Đại Học chỉ 10 ph&uacute;t.<br />
2. Căn hộ chuẩn mực với c&aacute;c tiện &iacute;ch đẳng cấp.<br />
+ Tổng quy m&ocirc; Linh T&acirc;y Tower: 8.000 m2, với 3 Block gồm: TTTM (2 tầng) v&agrave; căn hộ (16 tầng).<br />
Mật độ x&acirc;y dựng to&agrave;n khu: 46.2%. Phần c&ograve;n lại l&agrave; c&ocirc;ng vi&ecirc;n c&acirc;y xanh, hồ bơi, lối đi bộ.<br />
+ Tiện &iacute;ch ho&agrave;n hảo: 2 tầng trung t&acirc;m thương mại, dịch vụ đa tiện &iacute;ch: c&ocirc;ng vi&ecirc;n nội khu, cafe s&acirc;n thượng, khu mua sắm, gym, spa, khu vui chơi thiếu nhi, hệ thống gi&aacute;o dục liền kề, hệ thống an ninh 24/24h, hệ thống camera quan s&aacute;t to&agrave;n khu vực v&agrave; hệ thống intercom nhận &hellip;.<br />
3. Thiết kế căn hộ th&ocirc;ng minh theo chuẩn Singapore.<br />
+ Căn hộ Linh T&acirc;y c&oacute; thiết kế rất hợp l&yacute;. C&aacute;c loại diện t&iacute;ch ph&ugrave; hợp với nhu cầu của thị trường hiện tại. C&aacute;c lại diện t&iacute;ch: 59m2 - 82m2.<br />
+ Tất cả c&aacute;c ph&ograve;ng trong căn hộ đều c&oacute; ban c&ocirc;ng v&agrave; cửa sổ hướng ra ngo&agrave;i tạo cho căn hộ rất th&ocirc;ng tho&aacute;ng gi&uacute;p tiết kiệm điện.<br />
+ Điểm đặc biệt l&agrave; c&aacute;c căn hộ từ 59m2 trở l&ecirc;n đều c&oacute; 2 ph&ograve;ng ngủ, 2 WC....<br />
4. Gi&aacute; b&aacute;n hợp l&yacute; nhất trong khu vực:<br />
+ Với mức gi&aacute; được ch&agrave;o b&aacute;n từ 12.9 triệu/m2 được xem l&agrave; hấp dẫn v&agrave; cạnh tranh nhất.<br />
+ Mặt bằng gi&aacute; thấp hơn từ 15 - 20% so với c&aacute;c đối thủ cạnh tranh trong c&ugrave;ng khu vực.<br />
+ Phương thức thanh to&aacute;n linh hoạt tạo cơ hội cho nh&agrave; đầu tư.<br />
+ Đợt 1 chỉ thanh to&aacute;n 30% gi&aacute; trị hợp đồng.<br />
5. Nhận nh&agrave; trong năm nay.<br />
Hiện tại căn hộ Linh T&acirc;y đ&atilde; cất n&oacute;c, đang trong qu&aacute; tr&igrave;nh ho&agrave;n thiện. Sắp b&agrave;n giao nh&agrave; trong Qu&yacute; IV/2016, tốc độ thi c&ocirc;ng nhanh ch&oacute;ng 3 ca/ng&agrave;y, cam kết chất lượng c&ocirc;ng tr&igrave;nh.<br />
Số lượng căn hộ c&ograve;n lại c&oacute; hạn, Qu&yacute; kh&aacute;ch h&agrave;ng n&ecirc;n nhanh tay chọn cho m&igrave;nh một căn hộ Linh T&acirc;y ph&ugrave; hợp.<br />
Th&ocirc;ng tin chi tiết vui l&ograve;ng li&ecirc;n hệ PKD: 0909323552 (Ms. Hằng).</span></span></span></p>
', N'10.8568197', N'106.74723970000002', 1, CAST(0x0000A6EC0091F82D AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Project] OFF
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'01', N'Hà Nội', N'Thành Phố')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'02', N'Hà Giang', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'04', N'Cao Bằng', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'06', N'Bắc Kạn', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'08', N'Tuyên Quang', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'10', N'Lào Cai', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'11', N'Điện Biên', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'12', N'Lai Châu', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'14', N'Sơn La', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'15', N'Yên Bái', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'17', N'Hòa Bình', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'19', N'Thái Nguyên', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'20', N'Lạng Sơn', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'22', N'Quảng Ninh', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'24', N'Bắc Giang', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'25', N'Phú Thọ', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'26', N'Vĩnh Phúc', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'27', N'Bắc Ninh', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'30', N'Hải Dương', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'31', N'Hải Phòng', N'Thành Phố')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'33', N'Hưng Yên', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'34', N'Thái Bình', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'35', N'Hà Nam', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'36', N'Nam Định', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'37', N'Ninh Bình', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'38', N'Thanh Hóa', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'40', N'Nghệ An', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'42', N'Hà Tĩnh', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'44', N'Quảng Bình', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'45', N'Quảng Trị', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'46', N'Thừa Thiên Huế', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'48', N'Đà Nẵng', N'Thành Phố')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'49', N'Quảng Nam', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'51', N'Quảng Ngãi', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'52', N'Bình Định', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'54', N'Phú Yên', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'56', N'Khánh Hòa', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'58', N'Ninh Thuận', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'60', N'Bình Thuận', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'62', N'Kon Tum', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'64', N'Gia Lai', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'66', N'Đắk Lắk', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'67', N'Đắk Nông', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'68', N'Lâm Đồng', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'70', N'Bình Phước', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'72', N'Tây Ninh', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'74', N'Bình Dương', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'75', N'Đồng Nai', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'77', N'Bà Rịa - Vũng Tàu', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'79', N'Hồ Chí Minh', N'Thành Phố')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'80', N'Long An', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'82', N'Tiền Giang', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'83', N'Bến Tre', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'84', N'Trà Vinh', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'86', N'Vĩnh Long', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'87', N'Đồng Tháp', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'89', N'An Giang', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'91', N'Kiên Giang', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'92', N'Cần Thơ', N'Thành Phố')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'93', N'Hậu Giang', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'94', N'Sóc Trăng', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'95', N'Bạc Liêu', N'Tỉnh')
INSERT [dbo].[Province] ([ID], [Name], [Type]) VALUES (N'96', N'Cà Mau', N'Tỉnh')
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name], [Description]) VALUES (1, N'Admin', N'Quản trị viên')
INSERT [dbo].[Role] ([ID], [Name], [Description]) VALUES (2, N'Người dùng', N'Người dùng')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[TypeProject] ON 

INSERT [dbo].[TypeProject] ([ID], [Code], [Name]) VALUES (1, N'CC', N'Chung cư')
SET IDENTITY_INSERT [dbo].[TypeProject] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [RoleID], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (1, N'admin', N'e10adc3949ba59abbe56e057f20f883e', 1, N'Quản trị viên', N'KTX', NULL, NULL, CAST(0x0000A6EC004EFBCF AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [RoleID], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (2, N'user', N'e10adc3949ba59abbe56e057f20f883e', 2, N'Người dùng', N'KTX', NULL, NULL, CAST(0x0000A6EC004F1D41 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [RoleID], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (3, N'letuananh_tn94@yahoo.com.vn', NULL, NULL, N'Tuấn Anh  Lê', NULL, N'letuananh_tn94@yahoo.com.vn', NULL, CAST(0x0000A6EC0073FEA7 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [RoleID], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (4, NULL, N'e10adc3949ba59abbe56e057f20f883e', NULL, N'Lê Tuấn Anh', N'KTX', N'letuananhuit@gmail.com', NULL, CAST(0x0000A6EC007E634B AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [RoleID], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Active]) VALUES (5, N'tuananh', N'e10adc3949ba59abbe56e057f20f883e', 2, N'Tuấn Anh', N'KTX', N'anh@gmail.com', NULL, CAST(0x0000A6EC00801B24 AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Criteria] ADD  CONSTRAINT [DF_Criteria_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Criteria] ADD  CONSTRAINT [DF_Criteria_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF_Image_CreatedDate]  DEFAULT (getdate()) FOR [Url]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_Acreage]  DEFAULT ((0)) FOR [Acreage]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Save] ADD  CONSTRAINT [DF_Save_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Save] ADD  CONSTRAINT [DF_Save_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Project]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Criteria]  WITH CHECK ADD  CONSTRAINT [FK_Criteria_GroupCriteria] FOREIGN KEY([GroupID])
REFERENCES [dbo].[GroupCriteria] ([ID])
GO
ALTER TABLE [dbo].[Criteria] CHECK CONSTRAINT [FK_Criteria_GroupCriteria]
GO
ALTER TABLE [dbo].[DetailProject]  WITH CHECK ADD  CONSTRAINT [FK_DetailProject_Criteria] FOREIGN KEY([CriteriaID])
REFERENCES [dbo].[Criteria] ([ID])
GO
ALTER TABLE [dbo].[DetailProject] CHECK CONSTRAINT [FK_DetailProject_Criteria]
GO
ALTER TABLE [dbo].[DetailProject]  WITH CHECK ADD  CONSTRAINT [FK_DetailProject_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
ALTER TABLE [dbo].[DetailProject] CHECK CONSTRAINT [FK_DetailProject_Project]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ID])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_Province]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Comment] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comment] ([ID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Comment]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Project]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Project]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_User]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_TypeProject] FOREIGN KEY([TypeID])
REFERENCES [dbo].[TypeProject] ([ID])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_TypeProject]
GO
ALTER TABLE [dbo].[Save]  WITH CHECK ADD  CONSTRAINT [FK_Save_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
ALTER TABLE [dbo].[Save] CHECK CONSTRAINT [FK_Save_Project]
GO
ALTER TABLE [dbo].[Save]  WITH CHECK ADD  CONSTRAINT [FK_Save_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Save] CHECK CONSTRAINT [FK_Save_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [dbBatDongSan] SET  READ_WRITE 
GO
