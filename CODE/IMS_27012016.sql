USE [master]
GO
/****** Object:  Database [IMS]    Script Date: 27/01/2016 10:57:11 CH ******/
CREATE DATABASE [IMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\IMS.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\IMS_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IMS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [IMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IMS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [IMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IMS] SET  MULTI_USER 
GO
ALTER DATABASE [IMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [IMS]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
	[Status] [bit] NULL,
	[Fullname] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Identification] [nvarchar](50) NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignedShift]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedShift](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShiftId] [int] NULL,
	[GroupId] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_AssignedShift] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IPAddressPool]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPAddressPool](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [nvarchar](50) NULL,
	[Gateway] [nvarchar](50) NULL,
	[Subnetmask] [nvarchar](50) NULL,
	[StaffId] [int] NULL,
	[RegisteredDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_IPAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[RackId] [int] NULL,
	[RackUnit] [int] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogConfirmedRequest]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogConfirmedRequest](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NULL,
	[StaffId] [int] NULL,
	[ServerId] [int] NULL,
	[IPAddressId] [int] NULL,
	[IsConfirmed] [bit] NULL,
	[LogTime] [datetime] NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_LogConfirmedRequest] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogIPAllocation]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogIPAllocation](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[ServerId] [int] NULL,
	[AssignedIP] [int] NULL,
	[StaffId] [int] NULL,
	[Reason] [nvarchar](max) NULL,
	[LogTime] [datetime] NULL,
 CONSTRAINT [PK_LogIPAllocation] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogIPStatus]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogIPStatus](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[ChangedStatusTime] [datetime] NULL,
	[StaffId] [int] NULL,
	[Reason] [nvarchar](max) NULL,
 CONSTRAINT [PK_LogIPStatus] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogNote]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogNote](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[LogTime] [datetime] NULL,
 CONSTRAINT [PK_LogNote] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogRequestStatus]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogRequestStatus](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NULL,
	[StaffId] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[ChangedStatusTime] [datetime] NULL,
 CONSTRAINT [PK_LogRequestStatus] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogServerDelivery]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogServerDelivery](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[ServerId] [int] NULL,
	[StaffId] [int] NULL,
	[IsOut] [bit] NULL,
	[LogTime] [datetime] NULL,
	[RequestId] [int] NULL,
 CONSTRAINT [PK_LogServerDelivery] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogServerMoving]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogServerMoving](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[ServerId] [int] NULL,
	[StaffId] [int] NULL,
	[MovedLocation] [int] NULL,
	[Reason] [nvarchar](max) NULL,
	[LogTime] [datetime] NULL,
 CONSTRAINT [PK_LogNewServerLocation] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogUpgradedServer]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogUpgradedServer](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[ServerId] [int] NULL,
	[StaffId] [int] NULL,
	[UpgradedContent] [nvarchar](max) NULL,
	[LogTime] [datetime] NULL,
	[RequestId] [int] NULL,
 CONSTRAINT [PK_LogUpgradedServer] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rack]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rack](
	[RackId] [int] IDENTITY(1,1) NOT NULL,
	[RackNumber] [int] NULL,
	[RegisteredDate] [datetime] NULL,
	[MaximumPower] [int] NULL,
	[MaximumOutlet] [int] NULL,
 CONSTRAINT [PK_RegisteredDate] PRIMARY KEY CLUSTERED 
(
	[RackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestId] [int] IDENTITY(1,1) NOT NULL,
	[RequestType] [int] NULL,
	[CustomerId] [int] NULL,
	[AppointmentTime] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[RequestedTime] [datetime] NULL,
 CONSTRAINT [PK_LogRequest] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestType]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestType](
	[RequestTypeId] [int] IDENTITY(1,1) NOT NULL,
	[RequestType] [nvarchar](50) NULL,
 CONSTRAINT [PK_RequestType] PRIMARY KEY CLUSTERED 
(
	[RequestTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Server]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Server](
	[ServerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Maker] [nvarchar](50) NULL,
	[Modern] [nvarchar](50) NULL,
	[Power] [int] NULL,
	[Size] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[DefaultIP] [int] NULL,
	[LocationId] [int] NULL,
	[RegisteredDate] [datetime] NULL,
	[RequestId] [int] NULL,
	[Outlet] [int] NULL,
 CONSTRAINT [PK_Server] PRIMARY KEY CLUSTERED 
(
	[ServerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServerAttribute]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerAttribute](
	[AttributeId] [int] IDENTITY(1,1) NOT NULL,
	[ServerId] [int] NULL,
	[AttributeName] [nvarchar](50) NULL,
	[AttributeValue] [nvarchar](max) NULL,
	[RegisteredDate] [datetime] NULL,
	[RequestId] [int] NULL,
 CONSTRAINT [PK_ServerAttribute_1] PRIMARY KEY CLUSTERED 
(
	[AttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServerIP]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerIP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerId] [int] NOT NULL,
	[CurrentIP] [int] NOT NULL,
 CONSTRAINT [PK_ServerIP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shift]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[ShiftName] [nvarchar](50) NULL,
	[StartedTime] [time](7) NULL,
	[EndedTime] [time](7) NULL,
 CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaffAssignment]    Script Date: 27/01/2016 10:57:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffAssignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NULL,
	[ShiftHeadId] [int] NULL,
	[RequestId] [int] NULL,
	[AssignmentStatus] [nvarchar](50) NULL,
	[ChangedStatusTime] [datetime] NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_StaffAssignment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [Username], [Password], [RoleId], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupId]) VALUES (2, N'haltt', N'123', 1, 1, N'Lê Thi Thu Hà', N'0912345678', N'thuha051093@gmail.com', N'4/33 Văn Chung', N'331717456', 1)
INSERT [dbo].[Account] ([AccountId], [Username], [Password], [RoleId], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupId]) VALUES (3, N'tienhl', N'123', 1, 1, N'Huỳnh Lâm Hà Tiên', N'0935678002', N'tienhuynh@gmail.com', N'Gò Vấp', N'331789456', 2)
INSERT [dbo].[Account] ([AccountId], [Username], [Password], [RoleId], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupId]) VALUES (4, N'namch', N'123', 1, 1, N'Cao Hồng Nam', N'0933412886', N'namcao@gmail.com', N'Nha Trang', N'331818933', 3)
INSERT [dbo].[Account] ([AccountId], [Username], [Password], [RoleId], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupId]) VALUES (5, N'manhnh', N'123', 2, 1, N'Nguyễn Hùng Mạnh', N'0945683220', N'manhnguyen@gmail.com', N'Phạm Văn Hai, Tân Bình, Hồ Chí Minh', N'339867411', 5)
INSERT [dbo].[Account] ([AccountId], [Username], [Password], [RoleId], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupId]) VALUES (6, N'anndh', N'123', 3, 1, N'Ngô Đăng Hà An', N'0964356773', N'anngo@gmail.com', N'Quận 7', N'324578023', 5)
INSERT [dbo].[Account] ([AccountId], [Username], [Password], [RoleId], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupId]) VALUES (7, N'thaohq', N'123', 2, 1, N'Huỳnh Quang Thảo', N'0967345813', N'thaohq@gmail.com', N'Quận 1, Hồ Chí Minh', N'331783556', 5)
INSERT [dbo].[Account] ([AccountId], [Username], [Password], [RoleId], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupId]) VALUES (8, N'namnt', N'123', 2, 1, N'Nguyễn Trung Nam', N'0965834779', N'namnt@gmail.com', N'Quận 9, Hồ Chí Minh', N'378990467', 5)
INSERT [dbo].[Account] ([AccountId], [Username], [Password], [RoleId], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupId]) VALUES (9, N'nhink', N'123', 4, 1, N'Nguyễn Khả Nhi', N'0974456331', N'nhink@gmail.com', N'Quận 3, Hồ Chí Minh', N'356789002', 5)
INSERT [dbo].[Account] ([AccountId], [Username], [Password], [RoleId], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupId]) VALUES (10, N'phuochl', N'123', 4, 0, N'Lâm Hữu Phước', N'0983124456', N'phuochl@gmail.com', N'Quận Phú Nhuận, Hồ Chí Minh', N'3134567931', 1)
INSERT [dbo].[Account] ([AccountId], [Username], [Password], [RoleId], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupId]) VALUES (11, N'hieultt', N'BEXHNP', 4, 1, N'Lê Trần Trung Hiếu', N'0912345679', N'letrantrunghieu@gmail.com', N'4/33 Văn Chung', N'3134567936', 2)
INSERT [dbo].[Account] ([AccountId], [Username], [Password], [RoleId], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupId]) VALUES (12, N'hungnh', N'NXLBXAXUML', 1, 1, N'Nguyễn Huy Hùng', N'0912345672', N'hungnh@fpt.edu.vn', N'Quận 7', N'3134567938', 4)
INSERT [dbo].[Account] ([AccountId], [Username], [Password], [RoleId], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupId]) VALUES (15, NULL, NULL, 1, 1, N'Nguyễn Huy Hùng', N'0912345672', N'hungnh@fpt.edu.vn', N'Quận 8', N'3134567938', 4)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([GroupId], [GroupName]) VALUES (1, N'Group 1')
INSERT [dbo].[Group] ([GroupId], [GroupName]) VALUES (2, N'Group 2')
INSERT [dbo].[Group] ([GroupId], [GroupName]) VALUES (3, N'Group 3')
INSERT [dbo].[Group] ([GroupId], [GroupName]) VALUES (4, N'Group 4')
INSERT [dbo].[Group] ([GroupId], [GroupName]) VALUES (5, N'No Group')
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[IPAddressPool] ON 

INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (1, N'192.168.0.1', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-16 23:17:30.243' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (3, N'192.168.0.2', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-16 23:18:00.927' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (4, N'192.168.0.3', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-16 23:18:31.770' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (5, N'192.168.0.4', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-16 23:19:02.500' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (6, N'128.3.11.228', N'128.3.11.1', N'255.255.254.0', 2, CAST(N'2016-01-16 23:22:00.320' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (7, N'192.168.1.2', N'192.168.1.254', N'255.255.255.0', 3, CAST(N'2016-01-16 23:23:50.990' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (8, N'192.168.0.5', N'192.168.0.253', N'255.255.255.0', 3, CAST(N'2016-01-18 00:57:48.777' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (9, N'192.168.0.6', N'192.168.0.253', N'255.255.255.0', 3, CAST(N'2016-01-18 00:58:58.407' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (10, N'192.168.0.7', N'192.168.0.253', N'255.255.255.0', 3, CAST(N'2016-01-18 00:59:14.447' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (11, N'192.168.0.8', N'192.168.0.253', N'255.255.255.0', 3, NULL, NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (12, N'192.168.0.9', N'192.168.0.253', N'255.255.255.0', 3, CAST(N'2016-01-18 01:00:58.977' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (13, N'192.168.0.10', N'192.168.0.253', N'255.255.255.0', 3, CAST(N'2016-01-18 01:01:11.713' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (14, N'192.168.0.11', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:01:25.193' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (15, N'192.168.0.12', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:01:37.740' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (16, N'192.168.0.13', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:01:56.283' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (17, N'192.168.0.14', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:02:11.347' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (18, N'192.168.0.15', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:02:32.367' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (19, N'192.168.0.16', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:02:45.770' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (20, N'192.168.0.17', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:03:02.780' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (21, N'192.168.0.18', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:03:15.830' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (22, N'192.168.0.19', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:03:29.947' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (23, N'192.168.0.20', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:03:40.750' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (24, N'192.168.0.21', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:04:09.367' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (25, N'192.168.0.22', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:04:26.540' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (26, N'192.168.0.23', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:04:43.087' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (27, N'192.168.0.24', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:04:56.713' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (28, N'192.168.0.25', N'192.168.0.253', N'255.255.255.0', 2, CAST(N'2016-01-18 01:05:09.627' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (29, N'192.168.0.26', N'192.168.0.253', N'255.255.255.0', 4, CAST(N'2016-01-18 01:05:28.560' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (30, N'192.168.0.27', N'192.168.0.253', N'255.255.255.0', 4, CAST(N'2016-01-18 01:05:41.023' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (31, N'192.168.0.28', N'192.168.0.253', N'255.255.255.0', 4, CAST(N'2016-01-18 01:05:52.467' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (32, N'192.168.0.29', N'192.168.0.253', N'255.255.255.0', 4, CAST(N'2016-01-18 01:06:09.107' AS DateTime), NULL)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [StaffId], [RegisteredDate], [Status]) VALUES (33, N'192.168.0.30', N'192.168.0.253', N'255.255.255.0', 4, CAST(N'2016-01-18 01:06:19.617' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[IPAddressPool] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (1, 1, 1, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (2, 1, 2, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (3, 1, 3, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (4, 1, 4, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (5, 1, 5, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (6, 1, 6, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (7, 1, 7, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (8, 1, 8, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (9, 1, 9, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (10, 1, 10, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (11, 1, 11, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (12, 1, 12, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (13, 1, 13, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (14, 1, 14, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (15, 1, 15, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (16, 1, 16, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (17, 1, 17, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (18, 1, 18, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (19, 1, 19, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (20, 1, 20, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (21, 1, 21, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (22, 1, 22, N'Available')
INSERT [dbo].[Location] ([LocationId], [RackId], [RackUnit], [Status]) VALUES (23, 1, 23, N'Available')
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[Rack] ON 

INSERT [dbo].[Rack] ([RackId], [RackNumber], [RegisteredDate], [MaximumPower], [MaximumOutlet]) VALUES (1, 1, CAST(N'2016-01-17 00:33:36.397' AS DateTime), NULL, NULL)
INSERT [dbo].[Rack] ([RackId], [RackNumber], [RegisteredDate], [MaximumPower], [MaximumOutlet]) VALUES (2, 2, CAST(N'2016-01-17 00:33:41.817' AS DateTime), NULL, NULL)
INSERT [dbo].[Rack] ([RackId], [RackNumber], [RegisteredDate], [MaximumPower], [MaximumOutlet]) VALUES (3, 3, CAST(N'2016-01-17 00:33:46.577' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Rack] OFF
SET IDENTITY_INSERT [dbo].[RequestType] ON 

INSERT [dbo].[RequestType] ([RequestTypeId], [RequestType]) VALUES (1, N'Visit center')
INSERT [dbo].[RequestType] ([RequestTypeId], [RequestType]) VALUES (2, N'Set up server')
INSERT [dbo].[RequestType] ([RequestTypeId], [RequestType]) VALUES (3, N'Register new server')
INSERT [dbo].[RequestType] ([RequestTypeId], [RequestType]) VALUES (4, N'Bring server out')
INSERT [dbo].[RequestType] ([RequestTypeId], [RequestType]) VALUES (5, N'Bring server in')
INSERT [dbo].[RequestType] ([RequestTypeId], [RequestType]) VALUES (6, N'Upgrade server at center')
INSERT [dbo].[RequestType] ([RequestTypeId], [RequestType]) VALUES (7, N'Withdraw server')
INSERT [dbo].[RequestType] ([RequestTypeId], [RequestType]) VALUES (8, N'Change IP address')
INSERT [dbo].[RequestType] ([RequestTypeId], [RequestType]) VALUES (9, N'Allocate new IP address')
SET IDENTITY_INSERT [dbo].[RequestType] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Shift Head')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Customer')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Manager')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (4, N'Staff')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Server] ON 

INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (2, 5, N'DELL ', N'POWEREDGE C2100', 750, 2, N'Activate', 1, NULL, CAST(N'2016-01-16 23:26:41.550' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (3, 5, N'DELL ', N'POWEREDGE C1100', 650, 1, N'Deactivate', 5, NULL, CAST(N'2016-01-16 23:28:23.020' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (4, 5, N'DELL ', N'R710 - 6', 717, 2, N'Activate', 32, NULL, CAST(N'2016-01-16 23:30:46.997' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (5, 7, N'IBM  ', N'X3650 M3', 675, 2, N'Activate', 33, NULL, CAST(N'2016-01-17 00:01:37.207' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (6, 8, N'HP ', N'DL380 G6 ', 675, 2, N'Activate', 6, NULL, CAST(N'2016-01-17 00:04:39.913' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (7, 8, N'SUPERMICRO ', N'X8DTL-I', 600, 1, N'Activate', 7, NULL, CAST(N'2016-01-18 00:56:26.783' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (8, 8, N'HP ', N'DL380 G5', 675, 2, N'Activate', 8, NULL, CAST(N'2016-01-18 01:10:26.697' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (9, 7, N'DELL ', N'POWEREDGE C6100', 1100, 2, N'Activate', 9, NULL, CAST(N'2016-01-18 01:12:07.160' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (10, 7, N'IBM ', N'X3650 M1', 835, 2, N'Activate', 10, NULL, CAST(N'2016-01-18 01:13:46.210' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (11, 7, N'HP', N'DL 160G6', 500, 1, N'Activate', 11, NULL, CAST(N'2016-01-18 01:14:53.833' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (12, 7, N'INTEL ', N'S1200BT', 600, 1, N'Activate', 12, NULL, CAST(N'2016-01-18 01:15:44.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (13, 7, N'HP ', N'DL 180G6 ', 750, 2, N'Activate', 13, NULL, CAST(N'2016-01-18 01:16:38.707' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (14, 5, N'SUPERMICRO ', N'X8 DTI', 600, 2, N'Activate', 14, NULL, CAST(N'2016-01-18 01:19:12.470' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([ServerId], [CustomerId], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationId], [RegisteredDate], [RequestId], [Outlet]) VALUES (15, 5, N'DELL ', N'R320', 550, 1, N'Activate', 15, NULL, CAST(N'2016-01-18 01:19:49.787' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Server] OFF
SET IDENTITY_INSERT [dbo].[ServerAttribute] ON 

INSERT [dbo].[ServerAttribute] ([AttributeId], [ServerId], [AttributeName], [AttributeValue], [RegisteredDate], [RequestId]) VALUES (1, 2, N'Processors', N'2 INTEL XEON 6 CORE ', CAST(N'2016-01-17 01:02:30.097' AS DateTime), NULL)
INSERT [dbo].[ServerAttribute] ([AttributeId], [ServerId], [AttributeName], [AttributeValue], [RegisteredDate], [RequestId]) VALUES (2, 4, N'Memory', N'16GB (4X 4GB) DDR3 ECC REGISTER MEMORY', CAST(N'2016-01-17 09:31:17.590' AS DateTime), NULL)
INSERT [dbo].[ServerAttribute] ([AttributeId], [ServerId], [AttributeName], [AttributeValue], [RegisteredDate], [RequestId]) VALUES (3, 4, N'Drive Bays', N'6 BAY 3.5"', CAST(N'2016-01-17 09:31:39.647' AS DateTime), NULL)
INSERT [dbo].[ServerAttribute] ([AttributeId], [ServerId], [AttributeName], [AttributeValue], [RegisteredDate], [RequestId]) VALUES (4, 4, N'Raid Controller', N'DELL RAID PERC 6i', CAST(N'2016-01-17 09:33:09.870' AS DateTime), NULL)
INSERT [dbo].[ServerAttribute] ([AttributeId], [ServerId], [AttributeName], [AttributeValue], [RegisteredDate], [RequestId]) VALUES (5, 4, N'Networking', N'DUAL PORT  ETHERNET 1GBE PCI-E NETWORK DAUGHTER CARD', CAST(N'2016-01-17 09:34:59.947' AS DateTime), NULL)
INSERT [dbo].[ServerAttribute] ([AttributeId], [ServerId], [AttributeName], [AttributeValue], [RegisteredDate], [RequestId]) VALUES (6, 4, N'Graphics', N'INTEGRATED 2D MATROX 200', CAST(N'2016-01-17 09:35:20.660' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ServerAttribute] OFF
SET IDENTITY_INSERT [dbo].[ServerIP] ON 

INSERT [dbo].[ServerIP] ([Id], [ServerId], [CurrentIP]) VALUES (1, 2, 1)
INSERT [dbo].[ServerIP] ([Id], [ServerId], [CurrentIP]) VALUES (2, 2, 3)
INSERT [dbo].[ServerIP] ([Id], [ServerId], [CurrentIP]) VALUES (4, 2, 4)
INSERT [dbo].[ServerIP] ([Id], [ServerId], [CurrentIP]) VALUES (7, 5, 33)
INSERT [dbo].[ServerIP] ([Id], [ServerId], [CurrentIP]) VALUES (8, 6, 6)
SET IDENTITY_INSERT [dbo].[ServerIP] OFF
SET IDENTITY_INSERT [dbo].[Shift] ON 

INSERT [dbo].[Shift] ([ShiftId], [ShiftName], [StartedTime], [EndedTime]) VALUES (1, N'Shift 1', CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[Shift] ([ShiftId], [ShiftName], [StartedTime], [EndedTime]) VALUES (2, N'Shift 2', CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time))
INSERT [dbo].[Shift] ([ShiftId], [ShiftName], [StartedTime], [EndedTime]) VALUES (3, N'Shift 3', CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Shift] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([GroupId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Group]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[AssignedShift]  WITH CHECK ADD  CONSTRAINT [FK_AssignedShift_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([GroupId])
GO
ALTER TABLE [dbo].[AssignedShift] CHECK CONSTRAINT [FK_AssignedShift_Group]
GO
ALTER TABLE [dbo].[AssignedShift]  WITH CHECK ADD  CONSTRAINT [FK_AssignedShift_Shift] FOREIGN KEY([ShiftId])
REFERENCES [dbo].[Shift] ([ShiftId])
GO
ALTER TABLE [dbo].[AssignedShift] CHECK CONSTRAINT [FK_AssignedShift_Shift]
GO
ALTER TABLE [dbo].[IPAddressPool]  WITH CHECK ADD  CONSTRAINT [FK_IPAddressPool_Account] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[IPAddressPool] CHECK CONSTRAINT [FK_IPAddressPool_Account]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Rack] FOREIGN KEY([RackId])
REFERENCES [dbo].[Rack] ([RackId])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Rack]
GO
ALTER TABLE [dbo].[LogConfirmedRequest]  WITH CHECK ADD  CONSTRAINT [FK_LogConfirmedRequest_Account] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[LogConfirmedRequest] CHECK CONSTRAINT [FK_LogConfirmedRequest_Account]
GO
ALTER TABLE [dbo].[LogConfirmedRequest]  WITH CHECK ADD  CONSTRAINT [FK_LogConfirmedRequest_IPAddressPool] FOREIGN KEY([IPAddressId])
REFERENCES [dbo].[IPAddressPool] ([Id])
GO
ALTER TABLE [dbo].[LogConfirmedRequest] CHECK CONSTRAINT [FK_LogConfirmedRequest_IPAddressPool]
GO
ALTER TABLE [dbo].[LogConfirmedRequest]  WITH CHECK ADD  CONSTRAINT [FK_LogConfirmedRequest_LogRequest] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([RequestId])
GO
ALTER TABLE [dbo].[LogConfirmedRequest] CHECK CONSTRAINT [FK_LogConfirmedRequest_LogRequest]
GO
ALTER TABLE [dbo].[LogConfirmedRequest]  WITH CHECK ADD  CONSTRAINT [FK_LogConfirmedRequest_Server] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Server] ([ServerId])
GO
ALTER TABLE [dbo].[LogConfirmedRequest] CHECK CONSTRAINT [FK_LogConfirmedRequest_Server]
GO
ALTER TABLE [dbo].[LogIPAllocation]  WITH CHECK ADD  CONSTRAINT [FK_LogIPAllocation_Account] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[LogIPAllocation] CHECK CONSTRAINT [FK_LogIPAllocation_Account]
GO
ALTER TABLE [dbo].[LogIPAllocation]  WITH CHECK ADD  CONSTRAINT [FK_LogIPAllocation_IPAddress1] FOREIGN KEY([AssignedIP])
REFERENCES [dbo].[IPAddressPool] ([Id])
GO
ALTER TABLE [dbo].[LogIPAllocation] CHECK CONSTRAINT [FK_LogIPAllocation_IPAddress1]
GO
ALTER TABLE [dbo].[LogIPAllocation]  WITH CHECK ADD  CONSTRAINT [FK_LogIPAllocation_Server] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Server] ([ServerId])
GO
ALTER TABLE [dbo].[LogIPAllocation] CHECK CONSTRAINT [FK_LogIPAllocation_Server]
GO
ALTER TABLE [dbo].[LogIPStatus]  WITH CHECK ADD  CONSTRAINT [FK_LogIPStatus_Account] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[LogIPStatus] CHECK CONSTRAINT [FK_LogIPStatus_Account]
GO
ALTER TABLE [dbo].[LogIPStatus]  WITH CHECK ADD  CONSTRAINT [FK_LogIPStatus_IPAddressPool] FOREIGN KEY([IPAddress])
REFERENCES [dbo].[IPAddressPool] ([Id])
GO
ALTER TABLE [dbo].[LogIPStatus] CHECK CONSTRAINT [FK_LogIPStatus_IPAddressPool]
GO
ALTER TABLE [dbo].[LogNote]  WITH CHECK ADD  CONSTRAINT [FK_LogNote_Account] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[LogNote] CHECK CONSTRAINT [FK_LogNote_Account]
GO
ALTER TABLE [dbo].[LogRequestStatus]  WITH CHECK ADD  CONSTRAINT [FK_LogRequestStatus_Account] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[LogRequestStatus] CHECK CONSTRAINT [FK_LogRequestStatus_Account]
GO
ALTER TABLE [dbo].[LogRequestStatus]  WITH CHECK ADD  CONSTRAINT [FK_LogRequestStatus_Request] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([RequestId])
GO
ALTER TABLE [dbo].[LogRequestStatus] CHECK CONSTRAINT [FK_LogRequestStatus_Request]
GO
ALTER TABLE [dbo].[LogServerDelivery]  WITH CHECK ADD  CONSTRAINT [FK_LogServerDelivery_Account] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[LogServerDelivery] CHECK CONSTRAINT [FK_LogServerDelivery_Account]
GO
ALTER TABLE [dbo].[LogServerDelivery]  WITH CHECK ADD  CONSTRAINT [FK_LogServerDelivery_Request] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([RequestId])
GO
ALTER TABLE [dbo].[LogServerDelivery] CHECK CONSTRAINT [FK_LogServerDelivery_Request]
GO
ALTER TABLE [dbo].[LogServerDelivery]  WITH CHECK ADD  CONSTRAINT [FK_LogServerDelivery_Server] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Server] ([ServerId])
GO
ALTER TABLE [dbo].[LogServerDelivery] CHECK CONSTRAINT [FK_LogServerDelivery_Server]
GO
ALTER TABLE [dbo].[LogServerMoving]  WITH CHECK ADD  CONSTRAINT [FK_LogServerMoving_Account] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[LogServerMoving] CHECK CONSTRAINT [FK_LogServerMoving_Account]
GO
ALTER TABLE [dbo].[LogServerMoving]  WITH CHECK ADD  CONSTRAINT [FK_LogServerMoving_Location] FOREIGN KEY([MovedLocation])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[LogServerMoving] CHECK CONSTRAINT [FK_LogServerMoving_Location]
GO
ALTER TABLE [dbo].[LogServerMoving]  WITH CHECK ADD  CONSTRAINT [FK_LogServerMoving_Server] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Server] ([ServerId])
GO
ALTER TABLE [dbo].[LogServerMoving] CHECK CONSTRAINT [FK_LogServerMoving_Server]
GO
ALTER TABLE [dbo].[LogUpgradedServer]  WITH CHECK ADD  CONSTRAINT [FK_LogUpgradedServer_Account] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[LogUpgradedServer] CHECK CONSTRAINT [FK_LogUpgradedServer_Account]
GO
ALTER TABLE [dbo].[LogUpgradedServer]  WITH CHECK ADD  CONSTRAINT [FK_LogUpgradedServer_Request] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([RequestId])
GO
ALTER TABLE [dbo].[LogUpgradedServer] CHECK CONSTRAINT [FK_LogUpgradedServer_Request]
GO
ALTER TABLE [dbo].[LogUpgradedServer]  WITH CHECK ADD  CONSTRAINT [FK_LogUpgradedServer_Server] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Server] ([ServerId])
GO
ALTER TABLE [dbo].[LogUpgradedServer] CHECK CONSTRAINT [FK_LogUpgradedServer_Server]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_LogRequest_Account] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_LogRequest_Account]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_LogRequest_RequestType] FOREIGN KEY([RequestType])
REFERENCES [dbo].[RequestType] ([RequestTypeId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_LogRequest_RequestType]
GO
ALTER TABLE [dbo].[Server]  WITH CHECK ADD  CONSTRAINT [FK_Server_Account] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Server] CHECK CONSTRAINT [FK_Server_Account]
GO
ALTER TABLE [dbo].[Server]  WITH CHECK ADD  CONSTRAINT [FK_Server_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Server] CHECK CONSTRAINT [FK_Server_Location]
GO
ALTER TABLE [dbo].[Server]  WITH CHECK ADD  CONSTRAINT [FK_Server_Request] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([RequestId])
GO
ALTER TABLE [dbo].[Server] CHECK CONSTRAINT [FK_Server_Request]
GO
ALTER TABLE [dbo].[ServerAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ServerAttribute_Server] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Server] ([ServerId])
GO
ALTER TABLE [dbo].[ServerAttribute] CHECK CONSTRAINT [FK_ServerAttribute_Server]
GO
ALTER TABLE [dbo].[ServerIP]  WITH CHECK ADD  CONSTRAINT [FK_ServerIP_IPAddress] FOREIGN KEY([CurrentIP])
REFERENCES [dbo].[IPAddressPool] ([Id])
GO
ALTER TABLE [dbo].[ServerIP] CHECK CONSTRAINT [FK_ServerIP_IPAddress]
GO
ALTER TABLE [dbo].[ServerIP]  WITH CHECK ADD  CONSTRAINT [FK_ServerIP_Server] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Server] ([ServerId])
GO
ALTER TABLE [dbo].[ServerIP] CHECK CONSTRAINT [FK_ServerIP_Server]
GO
ALTER TABLE [dbo].[StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_StaffAssignment_Account] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[StaffAssignment] CHECK CONSTRAINT [FK_StaffAssignment_Account]
GO
ALTER TABLE [dbo].[StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_StaffAssignment_Account1] FOREIGN KEY([ShiftHeadId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[StaffAssignment] CHECK CONSTRAINT [FK_StaffAssignment_Account1]
GO
ALTER TABLE [dbo].[StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_StaffAssignment_Request] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([RequestId])
GO
ALTER TABLE [dbo].[StaffAssignment] CHECK CONSTRAINT [FK_StaffAssignment_Request]
GO
USE [master]
GO
ALTER DATABASE [IMS] SET  READ_WRITE 
GO
