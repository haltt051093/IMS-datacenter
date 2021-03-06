USE [master]
GO
/****** Object:  Database [IMS]    Script Date: 29/01/2016 1:39:48 CH ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[Fullname] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Identification] [nvarchar](50) NULL,
	[GroupName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignedShift]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedShift](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShiftName] [nvarchar](50) NULL,
	[GroupName] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_AssignedShift_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttributeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED 
(
	[AttributeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Group_1] PRIMARY KEY CLUSTERED 
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IPAddressPool]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPAddressPool](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [nvarchar](50) NOT NULL,
	[Gateway] [nvarchar](50) NULL,
	[Subnetmask] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[RegisteredDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_IPAddressPool] PRIMARY KEY CLUSTERED 
(
	[IPAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LocationCode] [nvarchar](50) NOT NULL,
	[RackCode] [nvarchar](50) NULL,
	[RackUnit] [int] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogChangedContent]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogChangedContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestCode] [nvarchar](50) NULL,
	[Staff] [nvarchar](50) NULL,
	[LogTime] [datetime] NULL,
	[TypeOfLog] [nvarchar](50) NULL,
	[Object] [nvarchar](50) NULL,
	[ChangedValueOfObject] [nvarchar](50) NULL,
	[ServerCode] [nvarchar](50) NULL,
	[IPAddress] [nvarchar](50) NULL,
	[Reason] [nvarchar](max) NULL,
 CONSTRAINT [PK_LogChangedContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Object]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Object](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Object] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Object] PRIMARY KEY CLUSTERED 
(
	[Object] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rack]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RackCode] [nvarchar](50) NOT NULL,
	[RegisteredDate] [datetime] NULL,
	[MaximumPower] [int] NULL,
	[MaximumOutlet] [int] NULL,
 CONSTRAINT [PK_Rack] PRIMARY KEY CLUSTERED 
(
	[RackCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RackOfCustomer]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RackOfCustomer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RackCode] [nvarchar](50) NOT NULL,
	[Customer] [nvarchar](50) NULL,
	[RegisteredDate] [datetime] NULL,
 CONSTRAINT [PK_RackOfCustomer_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestCode] [nvarchar](50) NOT NULL,
	[RequestType] [nvarchar](50) NULL,
	[Customer] [nvarchar](50) NULL,
	[AppointmentTime] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[RequestedTime] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestType]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RequestType_1] PRIMARY KEY CLUSTERED 
(
	[RequestType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role_1] PRIMARY KEY CLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Server]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Server](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerCode] [nvarchar](50) NOT NULL,
	[Customer] [nvarchar](50) NULL,
	[Maker] [nvarchar](50) NULL,
	[Modern] [nvarchar](50) NULL,
	[Power] [int] NULL,
	[Size] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[DefaultIP] [nvarchar](50) NULL,
	[LocationCode] [nvarchar](50) NULL,
	[RegisteredDate] [datetime] NULL,
	[Outlet] [int] NULL,
 CONSTRAINT [PK_Server_1] PRIMARY KEY CLUSTERED 
(
	[ServerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServerAttribute]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttributeName] [nvarchar](50) NULL,
	[ServerCode] [nvarchar](50) NULL,
	[AttributeValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_ServerAttribute_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServerIP]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerIP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerCode] [nvarchar](50) NOT NULL,
	[CurrentIP] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ServerIP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shift]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShiftName] [nvarchar](50) NOT NULL,
	[StartedTime] [time](7) NULL,
	[EndedTime] [time](7) NULL,
 CONSTRAINT [PK_Shift_1] PRIMARY KEY CLUSTERED 
(
	[ShiftName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaffAssignment]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffAssignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Staff] [nvarchar](50) NULL,
	[ShiftHead] [nvarchar](50) NULL,
	[RequestCode] [nvarchar](50) NULL,
	[AssignmentStatus] [nvarchar](50) NULL,
	[ChangedStatusTime] [datetime] NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_StaffAssignment_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusCode] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Object] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeOfLog]    Script Date: 29/01/2016 1:39:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeCode] [nvarchar](50) NOT NULL,
	[TypeName] [nvarchar](max) NULL,
 CONSTRAINT [PK_TypeOfLog] PRIMARY KEY CLUSTERED 
(
	[TypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (6, N'anndh', N'123', N'Manager', 1, N'Ngô Đăng Hà An', N'0964356773', N'anngo@gmail.com', N'Quận 7', N'324578023', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (2, N'haltt', N'123', N'Shift Head', 1, N'Lê Thi Thu Hà', N'0912345678', N'thuha051093@gmail.com', N'4/33 Văn Chung', N'331717456', N'Group 1')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (11, N'hieultt', N'BEXHNP', N'Customer', 1, N'Lê Trần Trung Hiếu', N'0912345679', N'letrantrunghieu@gmail.com', N'4/33 Văn Chung', N'3134567936', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (12, N'hungnh', N'NXLBXAXUML', N'Shift Head', 1, N'Nguyễn Huy Hùng', N'0912345672', N'hungnh@fpt.edu.vn', N'Quận 7', N'3134567938', N'Group 2')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (5, N'manhnh', N'123', N'Customer', 1, N'Nguyễn Hùng Mạnh', N'0945683220', N'manhnguyen@gmail.com', N'Phạm Văn Hai, Tân Bình, Hồ Chí Minh', N'339867411', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (4, N'namch', N'123', N'Shift Head', 1, N'Cao Hồng Nam', N'0933412886', N'namcao@gmail.com', N'Nha Trang', N'331818933', N'Group 3')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (8, N'namnt', N'123', N'Customer', 1, N'Nguyễn Trung Nam', N'0965834779', N'namnt@gmail.com', N'Quận 9, Hồ Chí Minh', N'378990467', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (9, N'nhink', N'123', N'Staff', 0, N'Nguyễn Khả Nhi', N'0974456331', N'nhink@gmail.com', N'Quận 3, Hồ Chí Minh', N'356789002', N'Group 1')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (10, N'phuoclh', N'1234', N'Staff', 1, N'Lâm Hữu Phước', N'0983124456', N'phuochl@gmail.com', N'Quận Phú Nhuận, Hồ Chí Minh', N'3134567931', N'Group 2')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (3, N'tienhl', N'123', N'Shift Head', 1, N'Huỳnh Lâm Hà Tiên', N'0935678002', N'tienhuynh@gmail.com', N'Gò Vấp', N'331789456', N'Group 4')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (7, N'thaohq', N'123', N'Customer', 1, N'Huỳnh Quang Thảo', N'0967345813', N'thaohq@gmail.com', N'Quận 1, Hồ Chí Minh', N'331783556', N'No Group')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([Id], [GroupName]) VALUES (1, N'Group 1')
INSERT [dbo].[Group] ([Id], [GroupName]) VALUES (2, N'Group 2')
INSERT [dbo].[Group] ([Id], [GroupName]) VALUES (3, N'Group 3')
INSERT [dbo].[Group] ([Id], [GroupName]) VALUES (4, N'Group 4')
INSERT [dbo].[Group] ([Id], [GroupName]) VALUES (5, N'No Group')
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[IPAddressPool] ON 

INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (6, N'128.3.11.228', N'128.3.11.1', N'255.255.254.0', N'2', CAST(N'2016-01-16 23:22:00.320' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (1, N'192.168.0.1', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-16 23:17:30.243' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (13, N'192.168.0.10', N'192.168.0.253', N'255.255.255.0', N'3', CAST(N'2016-01-18 01:01:11.713' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (14, N'192.168.0.11', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:01:25.193' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (15, N'192.168.0.12', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:01:37.740' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (16, N'192.168.0.13', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:01:56.283' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (17, N'192.168.0.14', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:02:11.347' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (18, N'192.168.0.15', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:02:32.367' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (19, N'192.168.0.16', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:02:45.770' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (20, N'192.168.0.17', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:03:02.780' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (21, N'192.168.0.18', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:03:15.830' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (22, N'192.168.0.19', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:03:29.947' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (3, N'192.168.0.2', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-16 23:18:00.927' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (23, N'192.168.0.20', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:03:40.750' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (24, N'192.168.0.21', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:04:09.367' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (25, N'192.168.0.22', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:04:26.540' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (26, N'192.168.0.23', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:04:43.087' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (27, N'192.168.0.24', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:04:56.713' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (28, N'192.168.0.25', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-18 01:05:09.627' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (29, N'192.168.0.26', N'192.168.0.253', N'255.255.255.0', N'4', CAST(N'2016-01-18 01:05:28.560' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (30, N'192.168.0.27', N'192.168.0.253', N'255.255.255.0', N'4', CAST(N'2016-01-18 01:05:41.023' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (31, N'192.168.0.28', N'192.168.0.253', N'255.255.255.0', N'4', CAST(N'2016-01-18 01:05:52.467' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (32, N'192.168.0.29', N'192.168.0.253', N'255.255.255.0', N'4', CAST(N'2016-01-18 01:06:09.107' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (4, N'192.168.0.3', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-16 23:18:31.770' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (33, N'192.168.0.30', N'192.168.0.253', N'255.255.255.0', N'4', CAST(N'2016-01-18 01:06:19.617' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (5, N'192.168.0.4', N'192.168.0.253', N'255.255.255.0', N'2', CAST(N'2016-01-16 23:19:02.500' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (8, N'192.168.0.5', N'192.168.0.253', N'255.255.255.0', N'3', CAST(N'2016-01-18 00:57:48.777' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (9, N'192.168.0.6', N'192.168.0.253', N'255.255.255.0', N'3', CAST(N'2016-01-18 00:58:58.407' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (10, N'192.168.0.7', N'192.168.0.253', N'255.255.255.0', N'3', CAST(N'2016-01-18 00:59:14.447' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (11, N'192.168.0.8', N'192.168.0.253', N'255.255.255.0', N'3', NULL, N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (12, N'192.168.0.9', N'192.168.0.253', N'255.255.255.0', N'3', CAST(N'2016-01-18 01:00:58.977' AS DateTime), N'STATUS10')
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Username], [RegisteredDate], [Status]) VALUES (7, N'192.168.1.2', N'192.168.1.254', N'255.255.255.0', N'3', CAST(N'2016-01-16 23:23:50.990' AS DateTime), N'STATUS10')
SET IDENTITY_INSERT [dbo].[IPAddressPool] OFF
SET IDENTITY_INSERT [dbo].[Object] ON 

INSERT [dbo].[Object] ([Id], [Object]) VALUES (5, N'Account')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (3, N'IPAddress')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (4, N'Location')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (6, N'Note')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (1, N'Request')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (2, N'Server')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (7, N'StaffAssignment')
SET IDENTITY_INSERT [dbo].[Object] OFF
SET IDENTITY_INSERT [dbo].[Rack] ON 

INSERT [dbo].[Rack] ([Id], [RackCode], [RegisteredDate], [MaximumPower], [MaximumOutlet]) VALUES (1, N'1', CAST(N'2016-01-17 00:33:36.397' AS DateTime), NULL, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RegisteredDate], [MaximumPower], [MaximumOutlet]) VALUES (2, N'2', CAST(N'2016-01-17 00:33:41.817' AS DateTime), NULL, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RegisteredDate], [MaximumPower], [MaximumOutlet]) VALUES (3, N'3', CAST(N'2016-01-17 00:33:46.577' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Rack] OFF
SET IDENTITY_INSERT [dbo].[RequestType] ON 

INSERT [dbo].[RequestType] ([Id], [RequestType]) VALUES (3, N'Add server')
INSERT [dbo].[RequestType] ([Id], [RequestType]) VALUES (9, N'Assign new IP address')
INSERT [dbo].[RequestType] ([Id], [RequestType]) VALUES (5, N'Bring server in')
INSERT [dbo].[RequestType] ([Id], [RequestType]) VALUES (4, N'Bring server out')
INSERT [dbo].[RequestType] ([Id], [RequestType]) VALUES (8, N'Change IP address')
INSERT [dbo].[RequestType] ([Id], [RequestType]) VALUES (11, N'Rent rack')
INSERT [dbo].[RequestType] ([Id], [RequestType]) VALUES (10, N'Return IP address')
INSERT [dbo].[RequestType] ([Id], [RequestType]) VALUES (12, N'Return rack')
INSERT [dbo].[RequestType] ([Id], [RequestType]) VALUES (2, N'Set up server')
INSERT [dbo].[RequestType] ([Id], [RequestType]) VALUES (6, N'Upgrade server at center')
INSERT [dbo].[RequestType] ([Id], [RequestType]) VALUES (1, N'Visit center')
INSERT [dbo].[RequestType] ([Id], [RequestType]) VALUES (7, N'Withdraw server')
SET IDENTITY_INSERT [dbo].[RequestType] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'Customer')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (3, N'Manager')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'Shift Head')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (4, N'Staff')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Server] ON 

INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (1, N'BJIWEHDHQ', N'5', N'DELL ', N'POWEREDGE C2100', 750, 2, N'STATUS02', N'1', NULL, CAST(N'2016-01-16 23:26:41.550' AS DateTime), NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (2, N'ERTVDSFG', N'7', N'HP ', N'DL 180G6 ', 750, 2, N'STATUS02', N'13', NULL, CAST(N'2016-01-18 01:16:38.707' AS DateTime), NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (3, N'GHJHKRN', N'5', N'SUPERMICRO ', N'X8 DTI', 600, 2, N'STATUS02', N'14', NULL, CAST(N'2016-01-18 01:19:12.470' AS DateTime), NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (4, N'HGDHERHW', N'7', N'DELL ', N'POWEREDGE C6100', 1100, 2, N'STATUS02', N'9', NULL, CAST(N'2016-01-18 01:12:07.160' AS DateTime), NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (5, N'HGMTYJTR', N'7', N'IBM ', N'X3650 M1', 835, 2, N'STATUS02', N'10', NULL, CAST(N'2016-01-18 01:13:46.210' AS DateTime), NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (6, N'KYKHJNGR', N'7', N'HP', N'DL 160G6', 500, 1, N'STATUS02', N'11', NULL, CAST(N'2016-01-18 01:14:53.833' AS DateTime), NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (7, N'QBFGWHZ', N'8', N'SUPERMICRO ', N'X8DTL-I', 600, 1, N'STATUS02', N'7', NULL, CAST(N'2016-01-18 00:56:26.783' AS DateTime), NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (8, N'RTYURDFD', N'7', N'INTEL ', N'S1200BT', 600, 1, N'STATUS02', N'12', NULL, CAST(N'2016-01-18 01:15:44.467' AS DateTime), NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (9, N'SDFCXVWX', N'5', N'DELL ', N'R320', 550, 1, N'STATUS02', N'15', NULL, CAST(N'2016-01-18 01:19:49.787' AS DateTime), NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (10, N'SDFRWTBX', N'8', N'HP ', N'DL380 G5', 675, 2, N'STATUS02', N'8', NULL, CAST(N'2016-01-18 01:10:26.697' AS DateTime), NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (11, N'SDFSDFWE', N'5', N'DELL ', N'R710 - 6', 717, 2, N'STATUS02', N'32', NULL, CAST(N'2016-01-16 23:30:46.997' AS DateTime), NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (12, N'SDFSDFWG', N'7', N'IBM  ', N'X3650 M3', 675, 2, N'STATUS02', N'33', NULL, CAST(N'2016-01-17 00:01:37.207' AS DateTime), NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (13, N'SGSWDFWT', N'5', N'DELL ', N'POWEREDGE C1100', 650, 1, N'STATUS02', N'5', NULL, CAST(N'2016-01-16 23:28:23.020' AS DateTime), NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Modern], [Power], [Size], [Status], [DefaultIP], [LocationCode], [RegisteredDate], [Outlet]) VALUES (14, N'XCVSDFWQ', N'8', N'HP ', N'DL380 G6 ', 675, 2, N'STATUS02', N'6', NULL, CAST(N'2016-01-17 00:04:39.913' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Server] OFF
SET IDENTITY_INSERT [dbo].[Shift] ON 

INSERT [dbo].[Shift] ([Id], [ShiftName], [StartedTime], [EndedTime]) VALUES (1, N'Shift 1', CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[Shift] ([Id], [ShiftName], [StartedTime], [EndedTime]) VALUES (2, N'Shift 2', CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time))
INSERT [dbo].[Shift] ([Id], [ShiftName], [StartedTime], [EndedTime]) VALUES (3, N'Shift 3', CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Shift] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (1, N'STATUS01', N'Waiting', N'Server')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (2, N'STATUS02', N'Running', N'Server')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (3, N'STATUS03', N'Deactivate', N'Server')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (4, N'STATUS04', N'Waiting', N'Request')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (5, N'STATUS05', N'Pending', N'Request')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (6, N'STATUS06', N'Processing', N'Request')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (7, N'STATUS07', N'Done', N'Request')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (8, N'STATUS08', N'Cancelled', N'Request')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (9, N'STATUS09', N'Rejected', N'Request')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (10, N'STATUS10', N'Available', N'IPAddress')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (11, N'STATUS11', N'Used', N'IPAddress')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (12, N'STATUS12', N'Blocked', N'IPAddress')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (13, N'STATUS13', N'Free', N'Location')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (14, N'STATUS14', N'Used', N'Location')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (15, N'STATUS15', N'Approving', N'StaffAssignment')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (16, N'STATUS16', N'Doing', N'StaffAssignment')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (17, N'STATUS17', N'Done', N'StaffAssignment')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (18, N'STATUS18', N'Not Finished', N'StaffAssignment')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[TypeOfLog] ON 

INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (4, N'CAREQUEST', N'Cancel Request')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (1, N'CREQUEST', N'Create New Request')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (10, N'UACCOUNTSTATUS', N'Update Account Status')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (9, N'UIPSTATUS', N'Update IP Status')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (2, N'UREQUEST', N'Update Request')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (7, N'UREQUESTSTATUS', N'Update Request Status')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (11, N'UROLE', N'Update Role')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (8, N'USERVERSTATUS', N'Update Server Status')
SET IDENTITY_INSERT [dbo].[TypeOfLog] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Group] FOREIGN KEY([GroupName])
REFERENCES [dbo].[Group] ([GroupName])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Group]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([RoleName])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[AssignedShift]  WITH CHECK ADD  CONSTRAINT [FK_AssignedShift_Group] FOREIGN KEY([GroupName])
REFERENCES [dbo].[Group] ([GroupName])
GO
ALTER TABLE [dbo].[AssignedShift] CHECK CONSTRAINT [FK_AssignedShift_Group]
GO
ALTER TABLE [dbo].[AssignedShift]  WITH CHECK ADD  CONSTRAINT [FK_AssignedShift_Shift] FOREIGN KEY([ShiftName])
REFERENCES [dbo].[Shift] ([ShiftName])
GO
ALTER TABLE [dbo].[AssignedShift] CHECK CONSTRAINT [FK_AssignedShift_Shift]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusCode])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Status]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Status1] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusCode])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Status1]
GO
ALTER TABLE [dbo].[LogChangedContent]  WITH CHECK ADD  CONSTRAINT [FK_LogChangedContent_Object] FOREIGN KEY([Object])
REFERENCES [dbo].[Object] ([Object])
GO
ALTER TABLE [dbo].[LogChangedContent] CHECK CONSTRAINT [FK_LogChangedContent_Object]
GO
ALTER TABLE [dbo].[LogChangedContent]  WITH CHECK ADD  CONSTRAINT [FK_LogChangedContent_TypeOfLog] FOREIGN KEY([TypeOfLog])
REFERENCES [dbo].[TypeOfLog] ([TypeCode])
GO
ALTER TABLE [dbo].[LogChangedContent] CHECK CONSTRAINT [FK_LogChangedContent_TypeOfLog]
GO
ALTER TABLE [dbo].[RackOfCustomer]  WITH CHECK ADD  CONSTRAINT [FK_RackOfCustomer_Account] FOREIGN KEY([Customer])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RackOfCustomer] CHECK CONSTRAINT [FK_RackOfCustomer_Account]
GO
ALTER TABLE [dbo].[RackOfCustomer]  WITH CHECK ADD  CONSTRAINT [FK_RackOfCustomer_Rack] FOREIGN KEY([RackCode])
REFERENCES [dbo].[Rack] ([RackCode])
GO
ALTER TABLE [dbo].[RackOfCustomer] CHECK CONSTRAINT [FK_RackOfCustomer_Rack]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_RequestType] FOREIGN KEY([RequestType])
REFERENCES [dbo].[RequestType] ([RequestType])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_RequestType]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusCode])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Status]
GO
ALTER TABLE [dbo].[Server]  WITH CHECK ADD  CONSTRAINT [FK_Server_Location] FOREIGN KEY([LocationCode])
REFERENCES [dbo].[Location] ([LocationCode])
GO
ALTER TABLE [dbo].[Server] CHECK CONSTRAINT [FK_Server_Location]
GO
ALTER TABLE [dbo].[Server]  WITH CHECK ADD  CONSTRAINT [FK_Server_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusCode])
GO
ALTER TABLE [dbo].[Server] CHECK CONSTRAINT [FK_Server_Status]
GO
ALTER TABLE [dbo].[ServerAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ServerAttribute_Attribute] FOREIGN KEY([AttributeName])
REFERENCES [dbo].[Attribute] ([AttributeName])
GO
ALTER TABLE [dbo].[ServerAttribute] CHECK CONSTRAINT [FK_ServerAttribute_Attribute]
GO
ALTER TABLE [dbo].[ServerAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ServerAttribute_Server] FOREIGN KEY([ServerCode])
REFERENCES [dbo].[Server] ([ServerCode])
GO
ALTER TABLE [dbo].[ServerAttribute] CHECK CONSTRAINT [FK_ServerAttribute_Server]
GO
ALTER TABLE [dbo].[ServerIP]  WITH CHECK ADD  CONSTRAINT [FK_ServerIP_IPAddressPool] FOREIGN KEY([CurrentIP])
REFERENCES [dbo].[IPAddressPool] ([IPAddress])
GO
ALTER TABLE [dbo].[ServerIP] CHECK CONSTRAINT [FK_ServerIP_IPAddressPool]
GO
ALTER TABLE [dbo].[ServerIP]  WITH CHECK ADD  CONSTRAINT [FK_ServerIP_Server] FOREIGN KEY([ServerCode])
REFERENCES [dbo].[Server] ([ServerCode])
GO
ALTER TABLE [dbo].[ServerIP] CHECK CONSTRAINT [FK_ServerIP_Server]
GO
ALTER TABLE [dbo].[StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_StaffAssignment_Account] FOREIGN KEY([Staff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[StaffAssignment] CHECK CONSTRAINT [FK_StaffAssignment_Account]
GO
ALTER TABLE [dbo].[StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_StaffAssignment_Account1] FOREIGN KEY([ShiftHead])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[StaffAssignment] CHECK CONSTRAINT [FK_StaffAssignment_Account1]
GO
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_Object] FOREIGN KEY([Object])
REFERENCES [dbo].[Object] ([Object])
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_Object]
GO
USE [master]
GO
ALTER DATABASE [IMS] SET  READ_WRITE 
GO
