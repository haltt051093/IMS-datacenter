USE [master]
GO
/****** Object:  Database [IMS]    Script Date: 18/02/2016 2:35:29 CH ******/
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
ALTER DATABASE [IMS] SET  ENABLE_BROKER 
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
/****** Object:  Table [dbo].[Account]    Script Date: 18/02/2016 2:35:30 CH ******/
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
	[GroupName] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignedShift]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedShift](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShiftName] [nvarchar](50) NULL,
	[GroupName] [nvarchar](50) NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttributeCode] [nvarchar](50) NULL,
	[AttributeName] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IPAddressPool]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPAddressPool](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [nvarchar](50) NOT NULL,
	[Gateway] [nvarchar](50) NULL,
	[Subnetmask] [nvarchar](50) NULL,
	[Staff] [nvarchar](50) NULL,
	[RegisteredDate] [datetime] NULL,
	[StatusCode] [nvarchar](50) NULL,
	[IsDefault] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LocationCode] [nvarchar](50) NOT NULL,
	[RackCode] [nvarchar](50) NULL,
	[RackUnit] [int] NULL,
	[StatusCode] [nvarchar](50) NULL,
	[ServerCode] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogChangedContent]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogChangedContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestCode] [nvarchar](50) NULL,
	[TypeOfLog] [nvarchar](50) NULL,
	[Object] [nvarchar](50) NULL,
	[ChangedValueOfObject] [nvarchar](50) NULL,
	[ObjectStatus] [nvarchar](50) NULL,
	[ServerCode] [nvarchar](50) NULL,
	[IPAddress] [nvarchar](50) NULL,
	[Staff] [nvarchar](50) NULL,
	[LogTime] [datetime] NULL,
	[Reason] [nvarchar](max) NULL,
	[PreviousId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Object]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Object](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Object] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rack]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RackCode] [nvarchar](50) NOT NULL,
	[RackName] [nvarchar](50) NULL,
	[StatusCode] [nvarchar](50) NULL,
	[RegisteredDate] [datetime] NULL,
	[MaximumPower] [int] NULL,
	[MaximumOutlet] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RackOfCustomer]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RackOfCustomer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RackCode] [nvarchar](50) NOT NULL,
	[Customer] [nvarchar](50) NULL,
	[RegisteredDate] [datetime] NULL,
	[IsHired] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 18/02/2016 2:35:30 CH ******/
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
	[StatusCode] [nvarchar](50) NULL,
	[ObjectCode] [nvarchar](50) NULL,
	[IsViewed] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestType]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestTypeCode] [nvarchar](50) NULL,
	[RequestTypeName] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Server]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Server](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerCode] [nvarchar](50) NOT NULL,
	[Customer] [nvarchar](50) NULL,
	[Maker] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[Power] [int] NULL,
	[Size] [int] NULL,
	[StatusCode] [nvarchar](50) NULL,
	[DefaultIP] [nvarchar](50) NULL,
	[RegisteredDate] [datetime] NULL,
	[Outlet] [int] NULL,
	[Bandwidth] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServerAttribute]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttributeCode] [nvarchar](50) NULL,
	[AttributeValue] [nvarchar](max) NULL,
	[ServerCode] [nvarchar](50) NULL,
	[StatusCode] [nvarchar](50) NULL,
	[UpdatedVersion] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServerIP]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerIP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerCode] [nvarchar](50) NULL,
	[CurrentIP] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shift]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShiftName] [nvarchar](50) NOT NULL,
	[StartedTime] [time](7) NULL,
	[EndedTime] [time](7) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaffAssignment]    Script Date: 18/02/2016 2:35:30 CH ******/
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
	[Comment] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusCode] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Object] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeOfLog]    Script Date: 18/02/2016 2:35:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeCode] [nvarchar](50) NOT NULL,
	[TypeName] [nvarchar](max) NULL
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
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (9, N'nhink', N'123', N'Staff', 1, N'Nguyễn Khả Nhi', N'0974456331', N'nhink@gmail.com', N'Quận 3, Hồ Chí Minh', N'356789002', N'Group 4')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (10, N'phuoclh', N'1234', N'Staff', 1, N'Lâm Hữu Phước', N'0983124456', N'phuochl@gmail.com', N'Quận Phú Nhuận, Hồ Chí Minh', N'3134567931', N'Group 2')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (3, N'tienhl', N'123', N'Shift Head', 1, N'Huỳnh Lâm Hà Tiên', N'0935678002', N'tienhuynh@gmail.com', N'Gò Vấp', N'331789456', N'Group 4')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (7, N'thaohq', N'123', N'Customer', 1, N'Huỳnh Quang Thảo', N'0967345813', N'thaohq@gmail.com', N'Quận 1, Hồ Chí Minh', N'331783556', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (17, N'quyenttt', N'QJVJRKHSAI', N'Staff', 1, N'Truyền Thanh Thảo Quyên', N'0933412883', N'truyenthanhthaoquyen@gmail.com', N'Lý Thường Kiệt, Quận 10', N'331717499', N'Group 4')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (15, N'haovtm', N'HWSADFQXWL', N'Staff', 1, N'Vũ Thị Mỹ Hảo', N'0943245890', N'haovtm@gmail.com', N'Quận 9, Hồ Chí Minh, Việt Nam', N'3134567922', N'Group 3')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (18, N'thanhnd', N'PSWSYQOLTT', N'Customer', 1, N'Nguyễn Duy Thanh', N'0912345654', N'nguyenduythanh@gmail.com', N'Quận Bình Thạnh', N'3134567531', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (1018, N'halt', N'MSTMOEYBBN', N'Staff', 1, N'Lê Thu Hà', N'0933412888', N'thuha051093@gmail.com', N'Quận 7', N'331717457', N'Group 3')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (1019, N'bichtt', N'EIEQBKGCBO', N'Staff', 1, N'Trần Thị Bích', N'01689808484', N'thuha051093@gmail.com', N'Bà Rịa', N'324561422', N'Group 3')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (1020, N'trinhhl', N'KEESQDEYWT', N'Staff', 1, N'Lê Hồng Trịnh', N'0912345632', N'thuha051093@gmail.com', N'Quận 1', N'240818499', N'Group 1')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupName]) VALUES (1021, N'dunglh', N'KKZONLEMKM', N'Shift Head', 1, N'Lý Hoàng Dũng', N'0964235623', N'lyhoangdung@gmail.com', N'Quận Bình Thạnh', N'3134567932', N'Group 1')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Attribute] ON 

INSERT [dbo].[Attribute] ([Id], [AttributeCode], [AttributeName]) VALUES (1, N'SAT001', N'Part Number')
INSERT [dbo].[Attribute] ([Id], [AttributeCode], [AttributeName]) VALUES (2, N'SAT002', N'Serial Number')
INSERT [dbo].[Attribute] ([Id], [AttributeCode], [AttributeName]) VALUES (3, N'SAT003', N'Storage')
INSERT [dbo].[Attribute] ([Id], [AttributeCode], [AttributeName]) VALUES (4, N'SAT004', N'Memory')
INSERT [dbo].[Attribute] ([Id], [AttributeCode], [AttributeName]) VALUES (5, N'SAT005', N'Processors')
INSERT [dbo].[Attribute] ([Id], [AttributeCode], [AttributeName]) VALUES (6, N'SAT006', N'Hard Drives')
INSERT [dbo].[Attribute] ([Id], [AttributeCode], [AttributeName]) VALUES (7, N'SAT007', N'Raid Controllers')
INSERT [dbo].[Attribute] ([Id], [AttributeCode], [AttributeName]) VALUES (8, N'SAT008', N'Slots')
INSERT [dbo].[Attribute] ([Id], [AttributeCode], [AttributeName]) VALUES (9, N'SAT009', N'Rail Kits')
INSERT [dbo].[Attribute] ([Id], [AttributeCode], [AttributeName]) VALUES (10, N'SAT010', N'Drive Bays')
INSERT [dbo].[Attribute] ([Id], [AttributeCode], [AttributeName]) VALUES (11, N'SAT011', N'Networking')
INSERT [dbo].[Attribute] ([Id], [AttributeCode], [AttributeName]) VALUES (12, N'SAT012', N'Graphics')
SET IDENTITY_INSERT [dbo].[Attribute] OFF
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([Id], [GroupName]) VALUES (1, N'Group 1')
INSERT [dbo].[Group] ([Id], [GroupName]) VALUES (2, N'Group 2')
INSERT [dbo].[Group] ([Id], [GroupName]) VALUES (3, N'Group 3')
INSERT [dbo].[Group] ([Id], [GroupName]) VALUES (4, N'Group 4')
INSERT [dbo].[Group] ([Id], [GroupName]) VALUES (5, N'No Group')
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[IPAddressPool] ON 

INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (6, N'128.3.11.228', N'128.3.11.1', N'255.255.254.0', N'haovtm', CAST(N'2016-01-16 23:22:00.320' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1, N'192.168.0.1', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-16 23:17:30.243' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (13, N'192.168.0.10', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:01:11.713' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (14, N'192.168.0.11', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:01:25.193' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (15, N'192.168.0.12', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:01:37.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (16, N'192.168.0.13', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:01:56.283' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (17, N'192.168.0.14', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:02:11.347' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (18, N'192.168.0.15', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:02:32.367' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (19, N'192.168.0.16', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:02:45.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (20, N'192.168.0.17', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:03:02.780' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (21, N'192.168.0.18', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:03:15.830' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (22, N'192.168.0.19', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:03:29.947' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (3, N'192.168.0.2', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-16 23:18:00.927' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (23, N'192.168.0.20', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:03:40.750' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (24, N'192.168.0.21', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:04:09.367' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (25, N'192.168.0.22', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:04:26.540' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (26, N'192.168.0.23', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:04:43.087' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (27, N'192.168.0.24', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:04:56.713' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (28, N'192.168.0.25', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:05:09.627' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (29, N'192.168.0.26', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:05:28.560' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (30, N'192.168.0.27', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:05:41.023' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (31, N'192.168.0.28', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:05:52.467' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (32, N'192.168.0.29', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:06:09.107' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (4, N'192.168.0.3', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-16 23:18:31.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (33, N'192.168.0.30', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:06:19.617' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (5, N'192.168.0.4', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-16 23:19:02.500' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (8, N'192.168.0.5', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 00:57:48.777' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (9, N'192.168.0.6', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 00:58:58.407' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (10, N'192.168.0.7', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 00:59:14.447' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (11, N'192.168.0.8', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 00:59:14.447' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (12, N'192.168.0.9', N'192.168.0.253', N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:00:58.977' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (7, N'192.168.1.2', N'192.168.1.254', N'255.255.255.0', N'phuoclh', CAST(N'2016-01-16 23:23:50.990' AS DateTime), N'STATUS10', 1)
SET IDENTITY_INSERT [dbo].[IPAddressPool] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (289, N'L480404', N'R956229', 1, N'STATUS13', N'QBFGWHZ')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (290, N'L077743', N'R956229', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (291, N'L368385', N'R956229', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (292, N'L799209', N'R956229', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (293, N'L997855', N'R956229', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (294, N'L358226', N'R956229', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (295, N'L720190', N'R956229', 7, N'STATUS13', N'SDFRWTBX')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (296, N'L635526', N'R956229', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (297, N'L108859', N'R956229', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (298, N'L629966', N'R956229', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (299, N'L069263', N'R956229', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (300, N'L039926', N'R956229', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (301, N'L668832', N'R956229', 13, N'STATUS13', N'XCVSDFWQ')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (302, N'L348597', N'R956229', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (303, N'L749927', N'R956229', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (304, N'L071614', N'R956229', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (305, N'L297654', N'R956229', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (306, N'L334138', N'R956229', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (307, N'L453739', N'R956229', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (308, N'L269143', N'R956229', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (309, N'L306204', N'R956229', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (310, N'L953397', N'R956229', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (311, N'L187278', N'R956229', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (312, N'L145867', N'R956229', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (313, N'L338584', N'R956229', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (314, N'L593232', N'R956229', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (37, N'L856022', N'R329695', 1, N'STATUS14', N'BJIWEHDHQ')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (38, N'L474197', N'R329695', 2, N'STATUS14', N'BJIWEHDHQ')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (39, N'L010818', N'R329695', 3, N'STATUS14', N'GHJHKRN')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (40, N'L770339', N'R329695', 4, N'STATUS14', N'GHJHKRN')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (41, N'L867151', N'R329695', 5, N'STATUS14', N'SDFCXVWX')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (42, N'L921578', N'R329695', 6, N'STATUS14', N'SDFSDFWE')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (43, N'L605052', N'R329695', 7, N'STATUS14', N'SDFSDFWE')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (44, N'L930410', N'R329695', 8, N'STATUS14', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (45, N'L318748', N'R329695', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (46, N'L589795', N'R329695', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (47, N'L880589', N'R329695', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (48, N'L889291', N'R329695', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (49, N'L387513', N'R329695', 13, N'STATUS13', N'SGSWDFWT')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (50, N'L057804', N'R329695', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (51, N'L312716', N'R329695', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (52, N'L641221', N'R329695', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (53, N'L779388', N'R329695', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (54, N'L197504', N'R329695', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (55, N'L806900', N'R329695', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (56, N'L747033', N'R329695', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (57, N'L981772', N'R329695', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (58, N'L402095', N'R329695', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (59, N'L306330', N'R329695', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (60, N'L518698', N'R329695', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (61, N'L044847', N'R329695', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (62, N'L132618', N'R329695', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (63, N'L319906', N'R329695', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (64, N'L296698', N'R329695', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (65, N'L342354', N'R329695', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (66, N'L725241', N'R329695', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (67, N'L465711', N'R329695', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (68, N'L921342', N'R329695', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (69, N'L202819', N'R329695', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (70, N'L217842', N'R329695', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (71, N'L022539', N'R329695', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (72, N'L931308', N'R329695', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (73, N'L761518', N'R329695', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (74, N'L304394', N'R329695', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (75, N'L371691', N'R329695', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (76, N'L692642', N'R329695', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (77, N'L470118', N'R329695', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (78, N'L123271', N'R329695', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (79, N'L942113', N'R280212', 1, N'STATUS14', N'ERTVDSFG')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (80, N'L296354', N'R280212', 2, N'STATUS14', N'ERTVDSFG')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (81, N'L919719', N'R280212', 3, N'STATUS14', N'HGDHERHW')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (82, N'L937306', N'R280212', 4, N'STATUS14', N'HGDHERHW')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (83, N'L784778', N'R280212', 5, N'STATUS14', N'HGMTYJTR')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (84, N'L719600', N'R280212', 6, N'STATUS14', N'HGMTYJTR')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (85, N'L170327', N'R280212', 7, N'STATUS14', N'KYKHJNGR')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (86, N'L409543', N'R280212', 8, N'STATUS14', N'RTYURDFD')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (87, N'L288305', N'R280212', 9, N'STATUS14', N'SDFSDFWG')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (88, N'L083725', N'R280212', 10, N'STATUS13', N'SDFSDFWG')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (89, N'L465975', N'R280212', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (90, N'L573160', N'R280212', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (91, N'L991259', N'R280212', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (92, N'L310606', N'R280212', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (93, N'L026257', N'R280212', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (94, N'L202516', N'R280212', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (95, N'L975269', N'R280212', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (96, N'L101337', N'R280212', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (97, N'L157895', N'R280212', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (98, N'L317592', N'R280212', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (99, N'L265231', N'R280212', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (100, N'L623622', N'R280212', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (101, N'L450189', N'R280212', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (102, N'L404197', N'R280212', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (103, N'L872713', N'R280212', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (104, N'L246010', N'R280212', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (105, N'L490712', N'R280212', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (106, N'L748084', N'R280212', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (107, N'L839825', N'R280212', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (108, N'L222307', N'R280212', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (109, N'L710930', N'R280212', 31, N'STATUS13', NULL)
GO
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (110, N'L030461', N'R280212', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (111, N'L066883', N'R280212', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (112, N'L812325', N'R280212', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (113, N'L775487', N'R280212', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (114, N'L831262', N'R280212', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (115, N'L810753', N'R280212', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (116, N'L678742', N'R280212', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (117, N'L603640', N'R280212', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (118, N'L104408', N'R280212', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (119, N'L264354', N'R280212', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (120, N'L673254', N'R280212', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (121, N'L375004', N'R117159', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (122, N'L778607', N'R117159', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (123, N'L877587', N'R117159', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (124, N'L566240', N'R117159', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (125, N'L094457', N'R117159', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (126, N'L203112', N'R117159', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (127, N'L742603', N'R117159', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (128, N'L885369', N'R117159', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (129, N'L300407', N'R117159', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (130, N'L316787', N'R117159', 10, N'STATUS14', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (131, N'L603612', N'R117159', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (132, N'L394021', N'R117159', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (133, N'L651191', N'R117159', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (134, N'L926351', N'R117159', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (135, N'L080941', N'R117159', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (136, N'L989797', N'R117159', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (137, N'L449549', N'R117159', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (138, N'L251347', N'R117159', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (139, N'L975055', N'R117159', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (140, N'L814554', N'R117159', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (141, N'L872879', N'R117159', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (142, N'L270529', N'R117159', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (143, N'L245821', N'R117159', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (144, N'L414421', N'R117159', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (145, N'L679176', N'R117159', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (146, N'L792840', N'R117159', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (147, N'L147119', N'R117159', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (148, N'L354249', N'R117159', 28, N'STATUS14', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (149, N'L134078', N'R117159', 29, N'STATUS14', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (150, N'L003996', N'R117159', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (151, N'L387502', N'R117159', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (152, N'L167962', N'R117159', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (153, N'L790472', N'R117159', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (154, N'L820498', N'R117159', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (155, N'L014769', N'R117159', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (156, N'L384435', N'R117159', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (157, N'L287280', N'R117159', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (158, N'L441765', N'R117159', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (159, N'L617623', N'R117159', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (160, N'L538327', N'R117159', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (161, N'L058844', N'R117159', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (162, N'L156373', N'R117159', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (163, N'L767911', N'R950566', 1, N'STATUS14', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (164, N'L818501', N'R950566', 2, N'STATUS14', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (165, N'L345138', N'R950566', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (166, N'L714239', N'R950566', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (167, N'L962273', N'R950566', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (168, N'L625533', N'R950566', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (169, N'L540540', N'R950566', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (170, N'L415238', N'R950566', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (171, N'L987044', N'R950566', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (172, N'L530392', N'R950566', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (173, N'L859524', N'R950566', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (174, N'L139770', N'R950566', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (175, N'L222756', N'R950566', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (176, N'L755807', N'R950566', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (177, N'L682076', N'R950566', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (178, N'L020306', N'R950566', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (179, N'L604585', N'R950566', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (180, N'L064558', N'R950566', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (181, N'L172916', N'R950566', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (182, N'L522575', N'R950566', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (183, N'L200444', N'R950566', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (184, N'L414054', N'R950566', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (185, N'L762528', N'R950566', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (186, N'L961841', N'R950566', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (187, N'L278824', N'R950566', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (188, N'L888963', N'R950566', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (189, N'L069196', N'R950566', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (190, N'L489205', N'R950566', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (191, N'L995506', N'R950566', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (192, N'L572691', N'R950566', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (193, N'L034731', N'R950566', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (194, N'L634157', N'R950566', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (195, N'L335825', N'R950566', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (196, N'L129409', N'R950566', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (197, N'L905562', N'R950566', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (198, N'L921711', N'R950566', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (199, N'L908187', N'R950566', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (200, N'L320274', N'R950566', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (201, N'L640971', N'R950566', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (202, N'L643565', N'R950566', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (203, N'L872283', N'R950566', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (204, N'L017629', N'R950566', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (205, N'L077503', N'R461770', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (206, N'L843019', N'R461770', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (207, N'L563996', N'R461770', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (208, N'L843757', N'R461770', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (209, N'L329267', N'R461770', 5, N'STATUS13', NULL)
GO
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (210, N'L019009', N'R461770', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (211, N'L440559', N'R461770', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (212, N'L045408', N'R461770', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (213, N'L596271', N'R461770', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (214, N'L917710', N'R461770', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (215, N'L686257', N'R461770', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (216, N'L766470', N'R461770', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (217, N'L989226', N'R461770', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (218, N'L196569', N'R461770', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (219, N'L147221', N'R461770', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (220, N'L356024', N'R461770', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (221, N'L737613', N'R461770', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (222, N'L480055', N'R461770', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (223, N'L758625', N'R461770', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (224, N'L657410', N'R461770', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (225, N'L956075', N'R461770', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (226, N'L086326', N'R461770', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (227, N'L922881', N'R461770', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (228, N'L975900', N'R461770', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (229, N'L960338', N'R461770', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (230, N'L608787', N'R461770', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (231, N'L576168', N'R461770', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (232, N'L413397', N'R461770', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (233, N'L228415', N'R461770', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (234, N'L248403', N'R461770', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (235, N'L541675', N'R461770', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (236, N'L293530', N'R461770', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (237, N'L106308', N'R461770', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (238, N'L307566', N'R461770', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (239, N'L920048', N'R461770', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (240, N'L787762', N'R461770', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (241, N'L056470', N'R461770', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (242, N'L051731', N'R461770', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (243, N'L610832', N'R461770', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (244, N'L930943', N'R461770', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (245, N'L058706', N'R461770', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (246, N'L390748', N'R461770', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (247, N'L084472', N'R416917', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (248, N'L984853', N'R416917', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (249, N'L512993', N'R416917', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (250, N'L769447', N'R416917', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (251, N'L106201', N'R416917', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (252, N'L826410', N'R416917', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (253, N'L001874', N'R416917', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (254, N'L293555', N'R416917', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (255, N'L815098', N'R416917', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (256, N'L442424', N'R416917', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (257, N'L759994', N'R416917', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (258, N'L780060', N'R416917', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (259, N'L896001', N'R416917', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (260, N'L463589', N'R416917', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (261, N'L545726', N'R416917', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (262, N'L357615', N'R416917', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (263, N'L269228', N'R416917', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (264, N'L492086', N'R416917', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (265, N'L988921', N'R416917', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (266, N'L988492', N'R416917', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (267, N'L184621', N'R416917', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (268, N'L001400', N'R416917', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (269, N'L572839', N'R416917', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (270, N'L071619', N'R416917', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (271, N'L854298', N'R416917', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (272, N'L623055', N'R416917', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (273, N'L829197', N'R416917', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (274, N'L827206', N'R416917', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (275, N'L254416', N'R416917', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (276, N'L095459', N'R416917', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (277, N'L553551', N'R416917', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (278, N'L615881', N'R416917', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (279, N'L262068', N'R416917', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (280, N'L251229', N'R416917', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (281, N'L673794', N'R416917', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (282, N'L668154', N'R416917', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (283, N'L860772', N'R416917', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (284, N'L439542', N'R416917', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (285, N'L407221', N'R416917', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (286, N'L683917', N'R416917', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (287, N'L243331', N'R416917', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (288, N'L420632', N'R416917', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (315, N'L794921', N'R956229', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (316, N'L795423', N'R956229', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (317, N'L031792', N'R956229', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (318, N'L630916', N'R956229', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (319, N'L866995', N'R956229', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (320, N'L351503', N'R956229', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (321, N'L826819', N'R956229', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (322, N'L701480', N'R956229', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (323, N'L312772', N'R956229', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (324, N'L630989', N'R956229', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (325, N'L480743', N'R956229', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (326, N'L774226', N'R956229', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (327, N'L401628', N'R956229', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (328, N'L375038', N'R956229', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (329, N'L512415', N'R956229', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (330, N'L456058', N'R956229', 42, N'STATUS13', NULL)
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[LogChangedContent] ON 

INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (1, N'R443360925', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', NULL, NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (2, N'R839633092', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', CAST(N'2016-02-16 14:40:44.783' AS DateTime), NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (3, N'R135652872', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', CAST(N'2016-02-17 11:53:07.487' AS DateTime), NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (4, N'R274996914', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', CAST(N'2016-02-17 12:59:30.520' AS DateTime), NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (5, N'R647275760', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', CAST(N'2016-02-17 13:11:09.070' AS DateTime), NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (6, N'R963476909', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', CAST(N'2016-02-17 13:11:41.137' AS DateTime), NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (7, N'R013279953', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', CAST(N'2016-02-17 13:53:23.360' AS DateTime), NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (8, N'R199772617', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', CAST(N'2016-02-17 13:53:52.633' AS DateTime), NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (9, N'R118733991', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', CAST(N'2016-02-17 14:04:47.267' AS DateTime), NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (10, N'R654021152', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', CAST(N'2016-02-17 14:05:10.447' AS DateTime), NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (11, N'R704337652', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', CAST(N'2016-02-17 14:11:35.563' AS DateTime), NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (12, N'R756889261', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', CAST(N'2016-02-17 14:12:54.760' AS DateTime), NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (13, N'R785978359', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', CAST(N'2016-02-17 14:13:15.927' AS DateTime), NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (14, N'R950023455', N'UREQUESTSTATUS', N'Request', N'STATUS04', NULL, NULL, NULL, N'nhink', CAST(N'2016-02-17 14:16:25.973' AS DateTime), NULL, NULL)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (15, N'R200052941', N'ASERVER', N'Request', N'STATUS04', NULL, NULL, NULL, NULL, CAST(N'2016-02-17 19:57:05.673' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (16, N'R200052941', N'ASERVER', N'Server', N'S532573909', N'STATUS01', NULL, NULL, NULL, CAST(N'2016-02-17 19:57:33.750' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (17, N'R568414231', N'ASERVER', N'Request', N'R568414231', N'STATUS04', NULL, NULL, NULL, CAST(N'2016-02-17 22:00:42.140' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (18, N'R568414231', N'ASERVER', N'Server', N'S279701764', N'STATUS01', NULL, NULL, NULL, CAST(N'2016-02-17 22:00:48.017' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (19, N'R233881197', N'ASERVER', N'Request', N'R233881197', N'STATUS04', NULL, NULL, NULL, CAST(N'2016-02-18 13:31:08.417' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (20, N'R233881197', N'ASERVER', N'Server', N'S317994736', N'STATUS01', NULL, NULL, NULL, CAST(N'2016-02-18 13:31:09.370' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (21, N'R434520351', N'ASERVER', N'Request', N'R434520351', N'STATUS04', NULL, NULL, NULL, CAST(N'2016-02-18 13:41:25.750' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (22, N'R434520351', N'ASERVER', N'Server', N'S964524154', N'STATUS01', NULL, NULL, NULL, CAST(N'2016-02-18 13:41:25.797' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (23, N'R522373829', N'ASERVER', N'Request', N'R522373829', N'STATUS04', NULL, NULL, NULL, CAST(N'2016-02-18 14:02:45.480' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Reason], [PreviousId]) VALUES (24, N'R522373829', N'ASERVER', N'Server', N'S530795683', N'STATUS01', NULL, NULL, NULL, CAST(N'2016-02-18 14:02:45.927' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[LogChangedContent] OFF
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

INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [RegisteredDate], [MaximumPower], [MaximumOutlet]) VALUES (21, N'R280212', N'A1', N'STATUS20', CAST(N'2016-02-01 09:32:13.687' AS DateTime), 14400, 42)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [RegisteredDate], [MaximumPower], [MaximumOutlet]) VALUES (22, N'R117159', N'A2', N'STATUS20', CAST(N'2016-02-01 09:32:30.800' AS DateTime), 14400, 42)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [RegisteredDate], [MaximumPower], [MaximumOutlet]) VALUES (23, N'R950566', N'B1', N'STATUS20', CAST(N'2016-02-01 09:32:51.953' AS DateTime), 14400, 42)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [RegisteredDate], [MaximumPower], [MaximumOutlet]) VALUES (24, N'R461770', N'C1', N'STATUS20', CAST(N'2016-02-01 09:33:08.050' AS DateTime), 14400, 42)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [RegisteredDate], [MaximumPower], [MaximumOutlet]) VALUES (25, N'R416917', N'D1', N'STATUS19', CAST(N'2016-02-01 09:33:23.593' AS DateTime), 14400, 42)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [RegisteredDate], [MaximumPower], [MaximumOutlet]) VALUES (20, N'R329695', N'E1', N'STATUS20', CAST(N'2016-02-01 09:31:08.700' AS DateTime), 14400, 42)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [RegisteredDate], [MaximumPower], [MaximumOutlet]) VALUES (26, N'R956229', N'A3', N'STATUS19', CAST(N'2016-02-11 22:58:05.573' AS DateTime), 14400, 41)
SET IDENTITY_INSERT [dbo].[Rack] OFF
SET IDENTITY_INSERT [dbo].[RackOfCustomer] ON 

INSERT [dbo].[RackOfCustomer] ([Id], [RackCode], [Customer], [RegisteredDate], [IsHired]) VALUES (1, N'R329695', N'manhnh', CAST(N'2016-01-02 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[RackOfCustomer] ([Id], [RackCode], [Customer], [RegisteredDate], [IsHired]) VALUES (2, N'R117159', N'manhnh', CAST(N'2015-10-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[RackOfCustomer] ([Id], [RackCode], [Customer], [RegisteredDate], [IsHired]) VALUES (3, N'R280212', N'thaohq', CAST(N'2015-05-05 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[RackOfCustomer] ([Id], [RackCode], [Customer], [RegisteredDate], [IsHired]) VALUES (4, N'R950566', N'thaohq', CAST(N'2015-11-12 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[RackOfCustomer] ([Id], [RackCode], [Customer], [RegisteredDate], [IsHired]) VALUES (6, N'R461770', N'manhnh', CAST(N'2016-01-05 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[RackOfCustomer] OFF
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (1, N'R226253861', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-01 00:51:19.873' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (2, N'R697723467', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-11 23:17:24.827' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (3, N'R383938599', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-11 23:17:25.160' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (4, N'R443360925', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-16 14:34:00.483' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (5, N'R839633092', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-16 14:40:44.400' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (6, N'R135652872', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-17 11:53:06.510' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (7, N'R274996914', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-17 12:59:24.907' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (8, N'R647275760', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-17 13:11:08.643' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (9, N'R963476909', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-17 13:11:41.107' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (10, N'R013279953', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-17 13:53:22.687' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (11, N'R199772617', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-17 13:53:52.607' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (12, N'R118733991', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-17 14:04:47.230' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (13, N'R654021152', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-17 14:05:10.413' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (14, N'R704337652', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-17 14:11:35.527' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (15, N'R756889261', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-17 14:12:54.743' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (16, N'R785978359', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-17 14:13:15.907' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (17, N'R950023455', N'RT011', N'manhnh', NULL, NULL, CAST(N'2016-02-17 14:16:25.893' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (18, N'R218147202', N'RT003', N'manhnh', NULL, N'nothing', CAST(N'2016-02-17 15:43:37.867' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (19, N'R088497056', N'RT003', N'manhnh', CAST(N'2016-02-17 19:38:26.307' AS DateTime), N'Nothing', CAST(N'2016-02-17 19:38:26.340' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (22, N'R238576941', N'RT003', N'manhnh', CAST(N'2016-02-17 20:30:07.550' AS DateTime), N'sdfsf', CAST(N'2016-02-17 20:30:07.657' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (23, N'R018468438', N'RT003', N'manhnh', CAST(N'2016-02-17 21:49:13.353' AS DateTime), N'123', CAST(N'2016-02-17 21:49:13.683' AS DateTime), N'STATUS04', NULL, 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (24, N'R568414231', N'RT003', N'manhnh', CAST(N'2016-02-17 21:59:51.837' AS DateTime), N'hihi', CAST(N'2016-02-17 21:59:51.870' AS DateTime), N'STATUS04', NULL, 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (25, N'R233881197', N'RT003', N'manhnh', CAST(N'2016-02-18 13:30:51.627' AS DateTime), N'123123', CAST(N'2016-02-18 13:30:52.867' AS DateTime), N'STATUS04', NULL, 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (26, N'R434520351', N'RT003', N'manhnh', NULL, N'QDAFSDF', CAST(N'2016-02-18 13:41:20.903' AS DateTime), N'STATUS04', NULL, 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (27, N'R522373829', N'RT003', N'manhnh', CAST(N'2016-02-25 08:00:00.000' AS DateTime), N'12313', CAST(N'2016-02-18 14:02:44.970' AS DateTime), N'STATUS04', NULL, 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (28, N'R681359642', N'RT003', N'manhnh', NULL, NULL, CAST(N'2016-02-18 14:04:03.917' AS DateTime), N'STATUS04', NULL, 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (20, N'R517642515', N'RT003', N'manhnh', CAST(N'2016-02-17 19:49:21.830' AS DateTime), N'123', CAST(N'2016-02-17 19:50:08.550' AS DateTime), N'STATUS04', NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [ObjectCode], [IsViewed]) VALUES (21, N'R200052941', N'RT003', N'manhnh', CAST(N'2016-02-17 19:56:21.760' AS DateTime), N'hihi', CAST(N'2016-02-17 19:56:21.793' AS DateTime), N'STATUS04', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Request] OFF
SET IDENTITY_INSERT [dbo].[RequestType] ON 

INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (3, N'RT003', N'Add server')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (9, N'RT009', N'Assign new IP address')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (5, N'RT005', N'Bring server in')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (4, N'RT004', N'Bring server out')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (8, N'RT008', N'Change IP address')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (11, N'RT011', N'Rent rack')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (10, N'RT010', N'Return IP address')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (12, N'RT012', N'Return rack')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (2, N'RT002', N'Set up server')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (6, N'RT006', N'Upgrade server at center')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (1, N'RT001', N'Visit center')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (7, N'RT007', N'Withdraw server')
SET IDENTITY_INSERT [dbo].[RequestType] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'Customer')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (3, N'Manager')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'Shift Head')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (4, N'Staff')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Server] ON 

INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (1, N'BJIWEHDHQ', N'manhnh', N'DELL ', N'POWEREDGE C2100', 750, 2, N'STATUS02', N'192.168.0.10', CAST(N'2016-01-16 23:26:41.550' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (2, N'ERTVDSFG', N'thaohq', N'HP', N'DL 180G6 ', 750, 2, N'STATUS02', N'192.168.0.10', CAST(N'2016-01-18 01:16:38.707' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (3, N'GHJHKRN', N'manhnh', N'SUPERMICRO ', N'X8 DTI', 600, 2, N'STATUS02', N'192.168.0.11', CAST(N'2016-01-18 01:19:12.470' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (4, N'HGDHERHW', N'thaohq', N'DELL ', N'POWEREDGE C6100', 1100, 2, N'STATUS02', N'192.168.0.6', CAST(N'2016-01-18 01:12:07.160' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (5, N'HGMTYJTR', N'thaohq', N'IBM', N'X3650 M1', 835, 2, N'STATUS02', N'192.168.0.7', CAST(N'2016-01-18 01:13:46.210' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (6, N'KYKHJNGR', N'thaohq', N'HP', N'DL 160G6', 500, 1, N'STATUS02', N'192.168.0.8', CAST(N'2016-01-18 01:14:53.833' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (7, N'QBFGWHZ', N'namnt', N'SUPERMICRO ', N'X8DTL-I', 600, 1, N'STATUS02', N'192.168.1.2', CAST(N'2016-01-18 00:56:26.783' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (8, N'RTYURDFD', N'thaohq', N'INTEL', N'S1200BT', 600, 1, N'STATUS02', N'192.168.0.9', CAST(N'2016-01-18 01:15:44.467' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (9, N'SDFCXVWX', N'manhnh', N'DELL ', N'R320', 550, 1, N'STATUS02', N'192.168.0.12', CAST(N'2016-01-18 01:19:49.787' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (10, N'SDFRWTBX', N'namnt', N'HP', N'DL380 G5', 675, 2, N'STATUS02', N'192.168.0.5', CAST(N'2016-01-18 01:10:26.697' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (11, N'SDFSDFWE', N'manhnh', N'DELL ', N'R710 - 6', 717, 2, N'STATUS02', N'192.168.0.29', CAST(N'2016-01-16 23:30:46.997' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (12, N'SDFSDFWG', N'thaohq', N'IBM', N'X3650 M3', 675, 2, N'STATUS02', N'192.168.0.30', CAST(N'2016-01-17 00:01:37.207' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (13, N'SGSWDFWT', N'manhnh', N'DELL ', N'POWEREDGE C1100', 650, 1, N'STATUS02', N'192.168.0.4', CAST(N'2016-01-16 23:28:23.020' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (14, N'XCVSDFWQ', N'namnt', N'HP', N'DL380 G6 ', 675, 2, N'STATUS02', N'128.3.11.228', CAST(N'2016-01-17 00:04:39.913' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (16, N'S532573909', N'manhnh', N'DELL ', N'R610', 700, 2, N'STATUS01', NULL, CAST(N'2016-02-17 19:56:27.407' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (18, N'S279701764', N'manhnh', N'SUPERMICRO ', N'HTBD', 200, 2, N'STATUS01', NULL, CAST(N'2016-02-17 22:00:00.120' AS DateTime), 1, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (19, N'S317994736', N'manhnh', N'SUPERMICRO ', N'ewrewr', 1233, 1, N'STATUS01', NULL, CAST(N'2016-02-18 13:30:58.680' AS DateTime), 2, N'1Gbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (20, N'S964524154', N'manhnh', N'SUPERMICRO ', N'SDF', 1234, 1, N'STATUS01', NULL, CAST(N'2016-02-18 13:41:21.823' AS DateTime), 1, N'1Gbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (21, N'S530795683', N'manhnh', N'SUPERMICRO ', N'WER', 1234, 2, N'STATUS01', NULL, CAST(N'2016-02-18 14:02:45.323' AS DateTime), 1, N'1Gbps')
SET IDENTITY_INSERT [dbo].[Server] OFF
SET IDENTITY_INSERT [dbo].[ServerAttribute] ON 

INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (7, N'SAT003', N'750GB', N'GHJHKRN', NULL, NULL)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (8, N'SAT004', N'6GB', N'GHJHKRN', NULL, NULL)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (9, N'SAT008', N'4', N'GHJHKRN', NULL, NULL)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (10, N'SAT003', N'500GB', N'HGMTYJTR', NULL, NULL)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (11, N'SAT004', N'4GB', N'HGMTYJTR', NULL, NULL)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (12, N'SAT001', N'123456', N'HGMTYJTR', NULL, NULL)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (13, N'SAT002', N'1232537567', N'S279701764', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (14, N'SAT004', N'10GB', N'S279701764', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (15, N'SAT003', N'50TB', N'S279701764', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (16, N'SAT001', N'4646456', N'S317994736', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (17, N'SAT002', N'4234234', N'S317994736', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (18, N'SAT002', N'234234', N'S964524154', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (19, N'SAT003', N'10GB', N'S964524154', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (20, N'SAT003', N'QWEQWE', N'S530795683', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (21, N'SAT001', N'1234523', N'S530795683', N'STATUS22', 0)
SET IDENTITY_INSERT [dbo].[ServerAttribute] OFF
SET IDENTITY_INSERT [dbo].[ServerIP] ON 

INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP]) VALUES (10, N'GHJHKRN', N'192.168.0.11')
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP]) VALUES (11, N'GHJHKRN', N'192.168.0.12')
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP]) VALUES (12, N'GHJHKRN', N'192.168.0.13')
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP]) VALUES (13, N'GHJHKRN', N'192.168.0.14')
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP]) VALUES (14, N'GHJHKRN', N'192.168.0.15')
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP]) VALUES (15, N'HGMTYJTR', N'192.168.0.7')
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP]) VALUES (16, N'HGMTYJTR', N'192.168.0.22')
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP]) VALUES (17, N'HGMTYJTR', N'192.168.0.23')
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP]) VALUES (18, N'HGMTYJTR', N'192.168.0.24')
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP]) VALUES (19, N'HGMTYJTR', N'192.168.0.25')
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP]) VALUES (20, N'BJIWEHDHQ', N'192.168.0.10')
SET IDENTITY_INSERT [dbo].[ServerIP] OFF
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
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (19, N'STATUS19', N'Available', N'Rack')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (20, N'STATUS20', N'Rented', N'Rack')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (21, N'STATUS21', N'Using', N'Rack')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (22, N'STATUS22', N'Updating', N'ServerAttribute')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (23, N'STATUS23', N'Old', N'ServerAttribute')
INSERT [dbo].[Status] ([Id], [StatusCode], [Status], [Object]) VALUES (24, N'STATUS24', N'New', N'ServerAttribute')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[TypeOfLog] ON 

INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (12, N'ASERVER', N'Customer adds new server')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (10, N'UACCOUNTSTATUS', N'Update Account Status')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (9, N'UIPSTATUS', N'Update IP Status')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (7, N'UREQUESTSTATUS', N'Update Request Status')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (11, N'UROLE', N'Update Role')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (8, N'USERVERSTATUS', N'Update Server Status')
SET IDENTITY_INSERT [dbo].[TypeOfLog] OFF
USE [master]
GO
ALTER DATABASE [IMS] SET  READ_WRITE 
GO
