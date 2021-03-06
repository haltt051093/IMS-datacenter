USE [master]
GO
/****** Object:  Database [IMS]    Script Date: 4/19/2016 1:10:22 PM ******/
CREATE DATABASE [IMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\IMS.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\IMS_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Account]    Script Date: 4/19/2016 1:10:23 PM ******/
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
	[GroupCode] [nvarchar](50) NULL,
	[Company] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignedShift]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedShift](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShiftCode] [nvarchar](50) NULL,
	[GroupCode] [nvarchar](50) NULL,
	[StartedTime] [datetime] NULL,
	[EndedTime] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IPAddressPool]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPAddressPool](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [nvarchar](50) NOT NULL,
	[Gateway] [nvarchar](50) NULL,
	[NetworkIP] [nvarchar](50) NULL,
	[Subnetmask] [nvarchar](50) NULL,
	[Staff] [nvarchar](50) NULL,
	[RegisteredDate] [datetime] NULL,
	[StatusCode] [nvarchar](50) NULL,
	[IsDefault] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 4/19/2016 1:10:23 PM ******/
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
/****** Object:  Table [dbo].[Log]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestCode] [nvarchar](50) NULL,
	[TypeOfLog] [nvarchar](50) NULL,
	[Object] [nvarchar](50) NULL,
	[ChangedValueOfObject] [nvarchar](50) NULL,
	[ObjectStatus] [nvarchar](50) NULL,
	[ServerCode] [nvarchar](50) NULL,
	[IPAddress] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[LogTime] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[PreviousId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Note]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Note](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NoteCode] [nvarchar](50) NULL,
	[RequestCode] [nvarchar](50) NULL,
	[StaffCode] [nvarchar](50) NULL,
	[NoteContent] [nvarchar](max) NULL,
	[AddedTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NotificationCode] [nvarchar](50) NULL,
	[RefCode] [nvarchar](50) NULL,
	[RefType] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[IsViewed] [bit] NULL,
	[NotifTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rack]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RackCode] [nvarchar](50) NOT NULL,
	[RackName] [nvarchar](50) NULL,
	[StatusCode] [nvarchar](50) NULL,
	[AddedDate] [datetime] NULL,
	[MaximumPower] [int] NULL,
	[MaximumOutlet] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RackOfCustomer]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RackOfCustomer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RackCode] [nvarchar](50) NOT NULL,
	[Customer] [nvarchar](50) NULL,
	[RentedDate] [datetime] NULL,
	[StatusCode] [varchar](50) NULL,
	[PreviousId] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Request]    Script Date: 4/19/2016 1:10:23 PM ******/
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
	[IsViewed] [bit] NULL,
	[Assignee] [nvarchar](50) NULL,
	[Reason] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestType]    Script Date: 4/19/2016 1:10:23 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Server]    Script Date: 4/19/2016 1:10:23 PM ******/
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
	[Bandwidth] [nvarchar](50) NULL,
	[PartNumber] [nvarchar](max) NULL,
	[SerialNumber] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServerIP]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerIP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerCode] [nvarchar](50) NULL,
	[CurrentIP] [nvarchar](50) NULL,
	[StatusCode] [nvarchar](50) NULL,
	[AssignedDate] [datetime] NULL,
	[PreviousId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shift]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShiftCode] [nvarchar](50) NOT NULL,
	[StartedTime] [int] NULL,
	[EndedTime] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusCode] [nvarchar](50) NOT NULL,
	[StatusName] [nvarchar](50) NULL,
	[Object] [nvarchar](50) NULL,
	[Priority] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Task]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskCode] [nvarchar](50) NULL,
	[ShiftHead] [nvarchar](50) NULL,
	[AssignedStaff] [nvarchar](50) NULL,
	[PreAssignedStaff] [nvarchar](50) NULL,
	[RequestCode] [nvarchar](50) NULL,
	[StatusCode] [nvarchar](50) NULL,
	[AssignedTime] [datetime] NULL,
	[Comment] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TempRequest]    Script Date: 4/19/2016 1:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TempCode] [nvarchar](50) NULL,
	[RequestCode] [nvarchar](50) NULL,
	[ObjectType] [nvarchar](50) NULL,
	[Data] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeOfLog]    Script Date: 4/19/2016 1:10:23 PM ******/
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

INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (6, N'anndh', N'123', N'Manager', 1, N'Ngô Đăng Hà An', N'0964356773', N'anndn@fpt.edu.vn', N'Quận 7', N'324578023', N'Admin', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (2, N'haltt', N'123', N'Shift Head', 1, N'Lê Thị Thu Hà', N'0912345679', N'thuha051093@gmail.com', N'4/33 Văn Chung', N'331717456', N'Group 1', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (11, N'hieultt', N'123', N'Customer', 1, N'Lê Trần Trung Hiếu', N'0912345679', N'letrantrunghieu@gmail.com', N'4/33 Văn Chung', N'3134567936', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (12, N'hungnh', N'123', N'Shift Head', 1, N'Nguyễn Huy Hưng', N'0912345672', N'hungnh@fpt.edu.vn', N'Quận 7', N'3134567938', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (5, N'manhnh', N'123', N'Customer', 1, N'Nguyễn Hùng Mạnh', N'0945683220', N'manhnguyen@gmail.com', N'Phạm Văn Hai, Tân Bình, Hồ Chí Minh', N'339867411', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (4, N'namch', N'123', N'Staff', 1, N'Cao Hồng Nam', N'0933412886', N'namcao@gmail.com', N'Nha Trang', N'331818933', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (8, N'namnt', N'123', N'Customer', 1, N'Nguyễn Trung Nam', N'0965834779', N'namnt@gmail.com', N'Quận 9, Hồ Chí Minh', N'378990467', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (9, N'nhink', N'123', N'Staff', 1, N'Nguyễn Khả Nhi', N'0974456331', N'nhink@gmail.com', N'Quận 3, Hồ Chí Minh', N'356789002', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (10, N'phuoclh', N'1234', N'Staff', 1, N'Lâm Hữu Phước', N'dgffdfedf', N'phuochl@gmail.com', N'Quận Phú Nhuận, Hồ Chí Minh', N'3134567931', N'Group 2', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (3, N'tienhl', N'123', N'Shift Head', 1, N'Huỳnh Lâm Hà Tiên', N'0935678002', N'tienhuynh@gmail.com', N'Gò Vấp', N'331789456', N'Group 4', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (7, N'thaohq', N'123', N'Customer', 1, N'Huỳnh Quang Thảo', N'0967345813', N'thaohq@gmail.com', N'Quận 1, Hồ Chí Minh', N'331783556', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (17, N'quyenttt', N'123', N'Staff', 1, N'Truyền Thanh Thảo Quyên', N'0933412883', N'truyenthanhthaoquyen@gmail.com', N'Lý Thường Kiệt, Quận 10', N'331717499', N'Group 4', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (15, N'haovtm', N'123', N'Staff', 1, N'Vũ Thị Mỹ Hảo', N'0943245890', N'haovtm@gmail.com', N'Quận 9, Hồ Chí Minh, Việt Nam', N'3134567922', N'Group 2', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1020, N'trinhhl', N'123', N'Staff', 1, N'Lê Hồng Trịnh', N'0912345632', N'thuha051093@gmail.com', N'Quận 1', N'240818499', N'Group 1', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1021, N'dunglh', N'123', N'Shift Head', 1, N'Lý Hoàng Dũng', N'0964235623', N'lyhoangdung@gmail.com', N'Quận Bình Thạnh', N'3134567932', N'Group 2', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1022, N'longt', N'123', N'Customer', 1, N'Trần Long', N'0912345675', N'thuha051093@gmail.com', N'Tan Binh', N'345646575467', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1023, N'manhdv', N'123', N'Staff', 1, N'Đinh Văn Mạnh', N'0912345674', N'thuha051093@gmail.com', N'Tan Binh', N'2314235345345', N'Group 4', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1024, N'Baont', N'123', N'Customer', 1, N'Nguyen The Bao', N'0912345670', N'thuha051093@gmail.com', N'Tan Binh', N'253452323454', N'Customer', NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[AssignedShift] ON 

INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (780, N'Shift 1', N'Group 1', CAST(N'2016-04-07 06:00:00.000' AS DateTime), CAST(N'2016-04-07 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (781, N'Shift 2', N'Group 2', CAST(N'2016-04-07 14:00:00.000' AS DateTime), CAST(N'2016-04-07 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (782, N'Shift 3', N'Group 3', CAST(N'2016-04-07 22:00:00.000' AS DateTime), CAST(N'2016-04-08 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (783, N'Shift 1', N'Group 4', CAST(N'2016-04-08 06:00:00.000' AS DateTime), CAST(N'2016-04-08 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (784, N'Shift 2', N'Group 1', CAST(N'2016-04-08 14:00:00.000' AS DateTime), CAST(N'2016-04-08 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (785, N'Shift 3', N'Group 2', CAST(N'2016-04-08 22:00:00.000' AS DateTime), CAST(N'2016-04-09 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (786, N'Shift 1', N'Group 3', CAST(N'2016-04-09 06:00:00.000' AS DateTime), CAST(N'2016-04-09 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (787, N'Shift 2', N'Group 4', CAST(N'2016-04-09 14:00:00.000' AS DateTime), CAST(N'2016-04-09 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (788, N'Shift 3', N'Group 1', CAST(N'2016-04-09 22:00:00.000' AS DateTime), CAST(N'2016-04-10 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (789, N'Shift 1', N'Group 2', CAST(N'2016-04-10 06:00:00.000' AS DateTime), CAST(N'2016-04-10 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (790, N'Shift 2', N'Group 3', CAST(N'2016-04-10 14:00:00.000' AS DateTime), CAST(N'2016-04-10 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (791, N'Shift 3', N'Group 4', CAST(N'2016-04-10 22:00:00.000' AS DateTime), CAST(N'2016-04-11 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (792, N'Shift 1', N'Group 1', CAST(N'2016-04-11 06:00:00.000' AS DateTime), CAST(N'2016-04-11 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (793, N'Shift 2', N'Group 2', CAST(N'2016-04-11 14:00:00.000' AS DateTime), CAST(N'2016-04-11 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (794, N'Shift 3', N'Group 3', CAST(N'2016-04-11 22:00:00.000' AS DateTime), CAST(N'2016-04-12 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (795, N'Shift 1', N'Group 4', CAST(N'2016-04-12 06:00:00.000' AS DateTime), CAST(N'2016-04-12 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (796, N'Shift 2', N'Group 1', CAST(N'2016-04-12 14:00:00.000' AS DateTime), CAST(N'2016-04-12 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (797, N'Shift 3', N'Group 2', CAST(N'2016-04-12 22:00:00.000' AS DateTime), CAST(N'2016-04-13 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (798, N'Shift 1', N'Group 3', CAST(N'2016-04-13 06:00:00.000' AS DateTime), CAST(N'2016-04-13 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (799, N'Shift 2', N'Group 4', CAST(N'2016-04-13 14:00:00.000' AS DateTime), CAST(N'2016-04-13 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (800, N'Shift 3', N'Group 1', CAST(N'2016-04-13 22:00:00.000' AS DateTime), CAST(N'2016-04-14 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (801, N'Shift 1', N'Group 2', CAST(N'2016-04-14 06:00:00.000' AS DateTime), CAST(N'2016-04-14 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (802, N'Shift 2', N'Group 3', CAST(N'2016-04-14 14:00:00.000' AS DateTime), CAST(N'2016-04-14 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (803, N'Shift 3', N'Group 4', CAST(N'2016-04-14 22:00:00.000' AS DateTime), CAST(N'2016-04-15 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (804, N'Shift 1', N'Group 1', CAST(N'2016-04-15 06:00:00.000' AS DateTime), CAST(N'2016-04-15 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (805, N'Shift 2', N'Group 2', CAST(N'2016-04-15 14:00:00.000' AS DateTime), CAST(N'2016-04-15 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (806, N'Shift 3', N'Group 3', CAST(N'2016-04-15 22:00:00.000' AS DateTime), CAST(N'2016-04-16 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (807, N'Shift 1', N'Group 4', CAST(N'2016-04-16 06:00:00.000' AS DateTime), CAST(N'2016-04-16 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (808, N'Shift 2', N'Group 1', CAST(N'2016-04-16 14:00:00.000' AS DateTime), CAST(N'2016-04-16 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (809, N'Shift 3', N'Group 2', CAST(N'2016-04-16 22:00:00.000' AS DateTime), CAST(N'2016-04-17 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (810, N'Shift 1', N'Group 3', CAST(N'2016-04-17 06:00:00.000' AS DateTime), CAST(N'2016-04-17 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (811, N'Shift 2', N'Group 4', CAST(N'2016-04-17 14:00:00.000' AS DateTime), CAST(N'2016-04-17 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (812, N'Shift 3', N'Group 1', CAST(N'2016-04-17 22:00:00.000' AS DateTime), CAST(N'2016-04-18 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (813, N'Shift 1', N'Group 2', CAST(N'2016-04-18 06:00:00.000' AS DateTime), CAST(N'2016-04-18 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (814, N'Shift 2', N'Group 3', CAST(N'2016-04-18 14:00:00.000' AS DateTime), CAST(N'2016-04-18 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (815, N'Shift 3', N'Group 4', CAST(N'2016-04-18 22:00:00.000' AS DateTime), CAST(N'2016-04-19 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (816, N'Shift 1', N'Group 1', CAST(N'2016-04-19 06:00:00.000' AS DateTime), CAST(N'2016-04-19 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (817, N'Shift 2', N'Group 2', CAST(N'2016-04-19 14:00:00.000' AS DateTime), CAST(N'2016-04-19 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (818, N'Shift 3', N'Group 3', CAST(N'2016-04-19 22:00:00.000' AS DateTime), CAST(N'2016-04-20 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (819, N'Shift 1', N'Group 4', CAST(N'2016-04-20 06:00:00.000' AS DateTime), CAST(N'2016-04-20 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (820, N'Shift 2', N'Group 1', CAST(N'2016-04-20 14:00:00.000' AS DateTime), CAST(N'2016-04-20 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (821, N'Shift 3', N'Group 2', CAST(N'2016-04-20 22:00:00.000' AS DateTime), CAST(N'2016-04-21 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (822, N'Shift 1', N'Group 3', CAST(N'2016-04-21 06:00:00.000' AS DateTime), CAST(N'2016-04-21 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (823, N'Shift 2', N'Group 4', CAST(N'2016-04-21 14:00:00.000' AS DateTime), CAST(N'2016-04-21 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (824, N'Shift 3', N'Group 1', CAST(N'2016-04-21 22:00:00.000' AS DateTime), CAST(N'2016-04-22 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (825, N'Shift 1', N'Group 2', CAST(N'2016-04-22 06:00:00.000' AS DateTime), CAST(N'2016-04-22 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (826, N'Shift 2', N'Group 3', CAST(N'2016-04-22 14:00:00.000' AS DateTime), CAST(N'2016-04-22 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (827, N'Shift 3', N'Group 4', CAST(N'2016-04-22 22:00:00.000' AS DateTime), CAST(N'2016-04-23 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (828, N'Shift 1', N'Group 1', CAST(N'2016-04-23 06:00:00.000' AS DateTime), CAST(N'2016-04-23 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (829, N'Shift 2', N'Group 2', CAST(N'2016-04-23 14:00:00.000' AS DateTime), CAST(N'2016-04-23 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (830, N'Shift 3', N'Group 3', CAST(N'2016-04-23 22:00:00.000' AS DateTime), CAST(N'2016-04-24 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (831, N'Shift 1', N'Group 4', CAST(N'2016-04-24 06:00:00.000' AS DateTime), CAST(N'2016-04-24 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (832, N'Shift 2', N'Group 1', CAST(N'2016-04-24 14:00:00.000' AS DateTime), CAST(N'2016-04-24 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (833, N'Shift 3', N'Group 2', CAST(N'2016-04-24 22:00:00.000' AS DateTime), CAST(N'2016-04-25 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (834, N'Shift 1', N'Group 3', CAST(N'2016-04-25 06:00:00.000' AS DateTime), CAST(N'2016-04-25 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (835, N'Shift 2', N'Group 4', CAST(N'2016-04-25 14:00:00.000' AS DateTime), CAST(N'2016-04-25 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (836, N'Shift 3', N'Group 1', CAST(N'2016-04-25 22:00:00.000' AS DateTime), CAST(N'2016-04-26 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (837, N'Shift 1', N'Group 2', CAST(N'2016-04-26 06:00:00.000' AS DateTime), CAST(N'2016-04-26 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (838, N'Shift 2', N'Group 3', CAST(N'2016-04-26 14:00:00.000' AS DateTime), CAST(N'2016-04-26 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (839, N'Shift 3', N'Group 4', CAST(N'2016-04-26 22:00:00.000' AS DateTime), CAST(N'2016-04-27 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (840, N'Shift 1', N'Group 1', CAST(N'2016-04-27 06:00:00.000' AS DateTime), CAST(N'2016-04-27 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (841, N'Shift 2', N'Group 2', CAST(N'2016-04-27 14:00:00.000' AS DateTime), CAST(N'2016-04-27 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (842, N'Shift 3', N'Group 3', CAST(N'2016-04-27 22:00:00.000' AS DateTime), CAST(N'2016-04-28 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (843, N'Shift 1', N'Group 4', CAST(N'2016-04-28 06:00:00.000' AS DateTime), CAST(N'2016-04-28 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (844, N'Shift 2', N'Group 1', CAST(N'2016-04-28 14:00:00.000' AS DateTime), CAST(N'2016-04-28 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (845, N'Shift 3', N'Group 2', CAST(N'2016-04-28 22:00:00.000' AS DateTime), CAST(N'2016-04-29 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (846, N'Shift 1', N'Group 3', CAST(N'2016-04-29 06:00:00.000' AS DateTime), CAST(N'2016-04-29 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (847, N'Shift 2', N'Group 4', CAST(N'2016-04-29 14:00:00.000' AS DateTime), CAST(N'2016-04-29 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (848, N'Shift 3', N'Group 1', CAST(N'2016-04-29 22:00:00.000' AS DateTime), CAST(N'2016-04-30 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (849, N'Shift 1', N'Group 2', CAST(N'2016-04-30 06:00:00.000' AS DateTime), CAST(N'2016-04-30 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (850, N'Shift 2', N'Group 3', CAST(N'2016-04-30 14:00:00.000' AS DateTime), CAST(N'2016-04-30 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (851, N'Shift 3', N'Group 4', CAST(N'2016-04-30 22:00:00.000' AS DateTime), CAST(N'2016-05-01 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (852, N'Shift 1', N'Group 1', CAST(N'2016-05-01 06:00:00.000' AS DateTime), CAST(N'2016-05-01 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (853, N'Shift 2', N'Group 2', CAST(N'2016-05-01 14:00:00.000' AS DateTime), CAST(N'2016-05-01 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (854, N'Shift 3', N'Group 3', CAST(N'2016-05-01 22:00:00.000' AS DateTime), CAST(N'2016-05-02 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (855, N'Shift 1', N'Group 4', CAST(N'2016-05-02 06:00:00.000' AS DateTime), CAST(N'2016-05-02 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (856, N'Shift 2', N'Group 1', CAST(N'2016-05-02 14:00:00.000' AS DateTime), CAST(N'2016-05-02 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (857, N'Shift 3', N'Group 2', CAST(N'2016-05-02 22:00:00.000' AS DateTime), CAST(N'2016-05-03 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (858, N'Shift 1', N'Group 3', CAST(N'2016-05-03 06:00:00.000' AS DateTime), CAST(N'2016-05-03 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (859, N'Shift 2', N'Group 4', CAST(N'2016-05-03 14:00:00.000' AS DateTime), CAST(N'2016-05-03 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (860, N'Shift 3', N'Group 1', CAST(N'2016-05-03 22:00:00.000' AS DateTime), CAST(N'2016-05-04 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (861, N'Shift 1', N'Group 2', CAST(N'2016-05-04 06:00:00.000' AS DateTime), CAST(N'2016-05-04 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (862, N'Shift 2', N'Group 3', CAST(N'2016-05-04 14:00:00.000' AS DateTime), CAST(N'2016-05-04 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (863, N'Shift 3', N'Group 4', CAST(N'2016-05-04 22:00:00.000' AS DateTime), CAST(N'2016-05-05 06:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[AssignedShift] OFF
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([Id], [GroupCode]) VALUES (1, N'Group 1')
INSERT [dbo].[Group] ([Id], [GroupCode]) VALUES (2, N'Group 2')
INSERT [dbo].[Group] ([Id], [GroupCode]) VALUES (3, N'Group 3')
INSERT [dbo].[Group] ([Id], [GroupCode]) VALUES (4, N'Group 4')
INSERT [dbo].[Group] ([Id], [GroupCode]) VALUES (5, N'Admin')
INSERT [dbo].[Group] ([Id], [GroupCode]) VALUES (6, N'Customer')
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1, N'R216898503', N'ADDSERVER', N'Request', N'R216898503', N'STATUS04', NULL, NULL, N'hieultt', CAST(N'2016-04-10 11:51:21.273' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (2, N'R093162463', N'ADDSERVER', N'Request', N'R093162463', N'STATUS04', NULL, NULL, N'hieultt', CAST(N'2016-04-10 11:54:42.763' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (3, N'R093162463', N'ADDSERVER', N'Server', N'S553138894', N'STATUS01', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 11:54:42.973' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (4, N'R093162463', N'ADDSERVER', N'Server', N'S715723845', N'STATUS01', N'S715723845', NULL, N'hieultt', CAST(N'2016-04-10 11:54:42.983' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (5, N'R093162463', N'ADDSERVER', N'Server', N'S910025754', N'STATUS01', N'S910025754', NULL, N'hieultt', CAST(N'2016-04-10 11:54:43.030' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (6, N'R093162463', N'ADDSERVER', N'Request', N'R093162463', N'STATUS05', NULL, NULL, N'hungnh', CAST(N'2016-04-10 11:57:33.777' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (7, N'R093162463', N'ADDSERVER', N'Request', N'R093162463', N'STATUS06', NULL, NULL, N'hungnh', CAST(N'2016-04-10 11:57:38.503' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (8, N'R093162463', N'ADDSERVER', N'Server', N'S553138894', N'STATUS02', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.373' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (9, N'R093162463', N'ADDSERVER', N'ServerIP', N'116.193.73.3', N'STATUS29', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.407' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (10, N'R093162463', N'ADDSERVER', N'IPAddress', N'116.193.73.3', N'STATUS11', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.420' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (11, N'R093162463', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.433' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (12, N'R093162463', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.447' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (13, N'R093162463', N'ADDSERVER', N'Server', N'S715723845', N'STATUS02', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.470' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (14, N'R093162463', N'ADDSERVER', N'ServerIP', N'116.193.73.5', N'STATUS29', N'S715723845', NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.503' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (15, N'R093162463', N'ADDSERVER', N'IPAddress', N'116.193.73.5', N'STATUS11', N'S715723845', NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.517' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (16, N'R093162463', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.527' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (17, N'R093162463', N'ADDSERVER', N'Server', N'S910025754', N'STATUS02', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.547' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (18, N'R093162463', N'ADDSERVER', N'ServerIP', N'210.2.64.2', N'STATUS29', N'S910025754', NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.573' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (19, N'R093162463', N'ADDSERVER', N'IPAddress', N'210.2.64.2', N'STATUS11', N'S910025754', NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.583' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (20, N'R093162463', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.597' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (21, N'R093162463', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.607' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (22, N'R093162463', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.623' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (23, N'R093162463', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.633' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (24, N'R093162463', N'ADDSERVER', N'Request', N'R093162463', N'STATUS07', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:04:34.657' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (25, N'R202370735', N'ADDSERVER', N'Request', N'R202370735', N'STATUS04', NULL, NULL, N'hieultt', CAST(N'2016-04-10 12:05:43.280' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (26, N'R202370735', N'ADDSERVER', N'Server', N'S434278452', N'STATUS01', N'S434278452', NULL, N'hieultt', CAST(N'2016-04-10 12:05:43.360' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (27, N'R202370735', N'ADDSERVER', N'Server', N'S157202353', N'STATUS01', N'S157202353', NULL, N'hieultt', CAST(N'2016-04-10 12:05:43.390' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (28, N'R202370735', N'ADDSERVER', N'Server', N'S899125785', N'STATUS01', N'S899125785', NULL, N'hieultt', CAST(N'2016-04-10 12:05:43.417' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (29, N'R202370735', N'ADDSERVER', N'Request', N'R202370735', N'STATUS05', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:06:07.300' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (30, N'R202370735', N'ADDSERVER', N'Request', N'R202370735', N'STATUS06', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:06:09.293' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (31, N'R202370735', N'ADDSERVER', N'Server', N'S434278452', N'STATUS02', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.427' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (32, N'R202370735', N'ADDSERVER', N'ServerIP', N'213.2.64.1', N'STATUS29', N'S434278452', NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.457' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (33, N'R202370735', N'ADDSERVER', N'IPAddress', N'213.2.64.1', N'STATUS11', N'S434278452', NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.470' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (34, N'R202370735', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.483' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (35, N'R202370735', N'ADDSERVER', N'Server', N'S157202353', N'STATUS02', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.507' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (36, N'R202370735', N'ADDSERVER', N'ServerIP', N'116.193.73.2', N'STATUS29', N'S157202353', NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.530' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (37, N'R202370735', N'ADDSERVER', N'IPAddress', N'116.193.73.2', N'STATUS11', N'S157202353', NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.543' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (38, N'R202370735', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.557' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (39, N'R202370735', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.573' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (40, N'R202370735', N'ADDSERVER', N'Server', N'S899125785', N'STATUS02', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.597' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (41, N'R202370735', N'ADDSERVER', N'ServerIP', N'116.193.73.4', N'STATUS29', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.627' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (42, N'R202370735', N'ADDSERVER', N'IPAddress', N'116.193.73.4', N'STATUS11', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.637' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (43, N'R202370735', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.650' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (44, N'R202370735', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.663' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (45, N'R202370735', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.673' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (46, N'R202370735', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.687' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (47, N'R202370735', N'ADDSERVER', N'Request', N'R202370735', N'STATUS07', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:07:18.710' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (48, N'R280040529', N'ADDSERVER', N'Request', N'R280040529', N'STATUS04', NULL, NULL, N'thaohq', CAST(N'2016-04-10 12:09:41.133' AS DateTime), N'Nguoi di thay the: Le Bao Tran
CMND: 331719045
SDT: 0935890523', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (49, N'R280040529', N'ADDSERVER', N'Server', N'S763621671', N'STATUS01', N'S763621671', NULL, N'thaohq', CAST(N'2016-04-10 12:09:41.190' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (50, N'R280040529', N'ADDSERVER', N'Server', N'S267417355', N'STATUS01', N'S267417355', NULL, N'thaohq', CAST(N'2016-04-10 12:09:41.217' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (51, N'R280040529', N'ADDSERVER', N'Server', N'S086116125', N'STATUS01', N'S086116125', NULL, N'thaohq', CAST(N'2016-04-10 12:09:41.243' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (52, N'R280040529', N'ADDSERVER', N'Server', N'S932093894', N'STATUS01', N'S932093894', NULL, N'thaohq', CAST(N'2016-04-10 12:09:41.270' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (53, N'R280040529', N'ADDSERVER', N'Request', N'R280040529', N'STATUS05', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:10:37.283' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (54, N'R280040529', N'ADDSERVER', N'Request', N'R280040529', N'STATUS06', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:10:46.240' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (55, N'R280040529', N'ADDSERVER', N'Server', N'S763621671', N'STATUS02', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.223' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (56, N'R280040529', N'ADDSERVER', N'ServerIP', N'120.72.85.1', N'STATUS29', N'S763621671', NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.267' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (57, N'R280040529', N'ADDSERVER', N'IPAddress', N'120.72.85.1', N'STATUS11', N'S763621671', NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.283' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (58, N'R280040529', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.297' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (59, N'R280040529', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.317' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (60, N'R280040529', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.330' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (61, N'R280040529', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.343' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (62, N'R280040529', N'ADDSERVER', N'Server', N'S267417355', N'STATUS02', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.377' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (63, N'R280040529', N'ADDSERVER', N'ServerIP', N'202.78.227.2', N'STATUS29', N'S267417355', NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.403' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (64, N'R280040529', N'ADDSERVER', N'IPAddress', N'202.78.227.2', N'STATUS11', N'S267417355', NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.417' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (65, N'R280040529', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.427' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (66, N'R280040529', N'ADDSERVER', N'Server', N'S086116125', N'STATUS02', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.457' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (67, N'R280040529', N'ADDSERVER', N'ServerIP', N'210.2.64.9', N'STATUS29', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.483' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (68, N'R280040529', N'ADDSERVER', N'IPAddress', N'210.2.64.9', N'STATUS11', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.497' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (69, N'R280040529', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.507' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (70, N'R280040529', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.523' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (71, N'R280040529', N'ADDSERVER', N'Server', N'S932093894', N'STATUS02', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.543' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (72, N'R280040529', N'ADDSERVER', N'ServerIP', N'213.2.64.2', N'STATUS29', N'S932093894', NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.570' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (73, N'R280040529', N'ADDSERVER', N'IPAddress', N'213.2.64.2', N'STATUS11', N'S932093894', NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.583' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (74, N'R280040529', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.597' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (75, N'R280040529', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.610' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (76, N'R280040529', N'ADDSERVER', N'Request', N'R280040529', N'STATUS07', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:12:15.633' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (77, N'R411535743', N'ASSIGNIP', N'Request', N'R411535743', N'STATUS04', N'S763621671', NULL, N'thaohq', CAST(N'2016-04-10 12:16:32.520' AS DateTime), N'{"NumberOfIp":5,"Description":"[None]","NumberOfRack":0}', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (78, N'R039394319', N'ASSIGNIP', N'Request', N'R039394319', N'STATUS04', N'S086116125', NULL, N'thaohq', CAST(N'2016-04-10 12:16:55.563' AS DateTime), N'{"NumberOfIp":6,"Description":"[None]","NumberOfRack":0}', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (79, N'R090157487', N'ASSIGNIP', N'Request', N'R090157487', N'STATUS04', N'S267417355', NULL, N'thaohq', CAST(N'2016-04-10 12:17:02.937' AS DateTime), N'{"NumberOfIp":2,"Description":"[None]","NumberOfRack":0}', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (80, N'R090157487', N'ASSIGNIP', N'Request', N'R090157487', N'STATUS06', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:27:01.737' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (81, N'R090157487', N'ASSIGNIP', N'ServerIP', N'202.78.227.12', N'STATUS29', N'S267417355', NULL, N'hungnh', CAST(N'2016-04-10 12:29:39.487' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (82, N'R090157487', N'ASSIGNIP', N'IPAddress', N'202.78.227.12', N'STATUS11', N'S267417355', NULL, N'hungnh', CAST(N'2016-04-10 12:29:39.533' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (83, N'R090157487', N'ASSIGNIP', N'ServerIP', N'202.78.227.4', N'STATUS29', N'S267417355', NULL, N'hungnh', CAST(N'2016-04-10 12:29:39.540' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (84, N'R090157487', N'ASSIGNIP', N'IPAddress', N'202.78.227.4', N'STATUS11', N'S267417355', NULL, N'hungnh', CAST(N'2016-04-10 12:29:39.550' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (85, N'R090157487', N'ASSIGNIP', N'Request', N'R090157487', N'STATUS07', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:29:39.560' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (86, N'R039394319', N'ASSIGNIP', N'Request', N'R039394319', N'STATUS06', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:30:40.133' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (87, N'R039394319', N'ASSIGNIP', N'ServerIP', N'210.2.64.40', N'STATUS29', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:31:05.547' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (88, N'R039394319', N'ASSIGNIP', N'IPAddress', N'210.2.64.40', N'STATUS11', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:31:05.567' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (89, N'R039394319', N'ASSIGNIP', N'ServerIP', N'210.2.64.8', N'STATUS29', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:31:05.580' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (90, N'R039394319', N'ASSIGNIP', N'IPAddress', N'210.2.64.8', N'STATUS11', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:31:05.590' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (91, N'R039394319', N'ASSIGNIP', N'ServerIP', N'210.2.64.6', N'STATUS29', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:31:05.597' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (92, N'R039394319', N'ASSIGNIP', N'IPAddress', N'210.2.64.6', N'STATUS11', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:31:05.607' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (93, N'R039394319', N'ASSIGNIP', N'ServerIP', N'210.2.64.46', N'STATUS29', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:31:05.613' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (94, N'R039394319', N'ASSIGNIP', N'IPAddress', N'210.2.64.46', N'STATUS11', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:31:05.623' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (95, N'R039394319', N'ASSIGNIP', N'ServerIP', N'210.2.64.53', N'STATUS29', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:31:05.630' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (96, N'R039394319', N'ASSIGNIP', N'IPAddress', N'210.2.64.53', N'STATUS11', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:31:05.640' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (97, N'R039394319', N'ASSIGNIP', N'ServerIP', N'210.2.64.38', N'STATUS29', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:31:05.657' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (98, N'R039394319', N'ASSIGNIP', N'IPAddress', N'210.2.64.38', N'STATUS11', N'S086116125', NULL, N'hungnh', CAST(N'2016-04-10 12:31:05.667' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (99, N'R039394319', N'ASSIGNIP', N'Request', N'R039394319', N'STATUS07', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:31:05.680' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (100, N'R411535743', N'ASSIGNIP', N'Request', N'R411535743', N'STATUS06', NULL, NULL, N'hungnh', CAST(N'2016-04-10 12:32:53.657' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (101, N'R411535743', N'ASSIGNIP', N'ServerIP', N'120.72.85.11', N'STATUS29', N'S763621671', NULL, N'haovtm', CAST(N'2016-04-10 12:35:44.630' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (102, N'R411535743', N'ASSIGNIP', N'IPAddress', N'120.72.85.11', N'STATUS11', N'S763621671', NULL, N'haovtm', CAST(N'2016-04-10 12:35:44.647' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (103, N'R411535743', N'ASSIGNIP', N'ServerIP', N'120.72.85.55', N'STATUS29', N'S763621671', NULL, N'haovtm', CAST(N'2016-04-10 12:35:44.653' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (104, N'R411535743', N'ASSIGNIP', N'IPAddress', N'120.72.85.55', N'STATUS11', N'S763621671', NULL, N'haovtm', CAST(N'2016-04-10 12:35:44.663' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (105, N'R411535743', N'ASSIGNIP', N'ServerIP', N'120.72.85.56', N'STATUS29', N'S763621671', NULL, N'haovtm', CAST(N'2016-04-10 12:35:44.670' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (106, N'R411535743', N'ASSIGNIP', N'IPAddress', N'120.72.85.56', N'STATUS11', N'S763621671', NULL, N'haovtm', CAST(N'2016-04-10 12:35:44.677' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (107, N'R411535743', N'ASSIGNIP', N'ServerIP', N'120.72.85.24', N'STATUS29', N'S763621671', NULL, N'haovtm', CAST(N'2016-04-10 12:35:44.687' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (108, N'R411535743', N'ASSIGNIP', N'IPAddress', N'120.72.85.24', N'STATUS11', N'S763621671', NULL, N'haovtm', CAST(N'2016-04-10 12:35:44.733' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (109, N'R411535743', N'ASSIGNIP', N'ServerIP', N'120.72.85.52', N'STATUS29', N'S763621671', NULL, N'haovtm', CAST(N'2016-04-10 12:35:44.767' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (110, N'R411535743', N'ASSIGNIP', N'IPAddress', N'120.72.85.52', N'STATUS11', N'S763621671', NULL, N'haovtm', CAST(N'2016-04-10 12:35:44.777' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (111, N'R411535743', N'ASSIGNIP', N'Request', N'R411535743', N'STATUS07', NULL, NULL, N'haovtm', CAST(N'2016-04-10 12:35:44.790' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (112, N'R003673872', N'ASSIGNIP', N'Request', N'R003673872', N'STATUS04', N'S715723845', NULL, N'hieultt', CAST(N'2016-04-10 12:36:25.983' AS DateTime), N'{"NumberOfIp":4,"Description":"[None]","NumberOfRack":0}', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (113, N'R453331493', N'ASSIGNIP', N'Request', N'R453331493', N'STATUS04', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 12:36:33.137' AS DateTime), N'{"NumberOfIp":8,"Description":"[None]","NumberOfRack":0}', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1175, N'R324991040', N'CHANGEIP', N'Request', N'R324991040', N'STATUS04', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 15:20:01.520' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1176, N'R324991040', N'CHANGEIP', N'ServerIP', N'116.193.73.169', N'STATUS36', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 15:20:01.690' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1177, N'R324991040', N'CHANGEIP', N'ServerIP', N'116.193.73.160', N'STATUS36', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 15:20:01.697' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1178, N'R299635139', N'RETURNIP', N'Request', N'R299635139', N'STATUS04', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 15:20:14.780' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1179, N'R299635139', N'RETURNIP', N'ServerIP', N'116.193.73.175', N'STATUS30', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 15:20:14.787' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1180, N'R299635139', N'RETURNIP', N'ServerIP', N'116.193.73.156', N'STATUS30', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 15:20:14.793' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1181, N'R475438005', N'RETURNIP', N'Request', N'R475438005', N'STATUS04', N'S715723845', NULL, N'hieultt', CAST(N'2016-04-10 15:20:45.877' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1182, N'R475438005', N'RETURNIP', N'ServerIP', N'116.193.73.88', N'STATUS30', N'S715723845', NULL, N'hieultt', CAST(N'2016-04-10 15:20:45.883' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1183, N'R475438005', N'RETURNIP', N'ServerIP', N'116.193.73.5', N'STATUS30', N'S715723845', NULL, N'hieultt', CAST(N'2016-04-10 15:20:45.890' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1184, N'R475438005', N'RETURNIP', N'ServerIP', N'116.193.73.127', N'STATUS30', N'S715723845', NULL, N'hieultt', CAST(N'2016-04-10 15:20:45.897' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1185, N'R475438005', N'RETURNIP', N'ServerIP', N'on', N'STATUS30', N'S715723845', NULL, N'hieultt', CAST(N'2016-04-10 15:20:45.900' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1186, N'R908906975', N'RETURNIP', N'Request', N'R908906975', N'STATUS04', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 15:30:25.737' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1187, N'R908906975', N'RETURNIP', N'ServerIP', N'116.193.73.28', N'STATUS30', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 15:30:25.783' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1188, N'R555066048', N'RETURNIP', N'Request', N'R555066048', N'STATUS04', N'S157202353', NULL, N'hieultt', CAST(N'2016-04-10 16:05:39.633' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1189, N'R555066048', N'RETURNIP', N'ServerIP', N'116.193.73.93', N'STATUS30', N'S157202353', NULL, N'hieultt', CAST(N'2016-04-10 16:05:39.683' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1190, N'R555066048', N'RETURNIP', N'ServerIP', N'116.193.73.55', N'STATUS30', N'S157202353', NULL, N'hieultt', CAST(N'2016-04-10 16:05:39.690' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1191, N'R555066048', N'RETURNIP', N'ServerIP', N'116.193.73.2', N'STATUS30', N'S157202353', NULL, N'hieultt', CAST(N'2016-04-10 16:05:39.697' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1192, N'R555066048', N'RETURNIP', N'ServerIP', N'116.193.73.128', N'STATUS30', N'S157202353', NULL, N'hieultt', CAST(N'2016-04-10 16:05:39.713' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1193, N'R555066048', N'RETURNIP', N'ServerIP', N'on', N'STATUS30', N'S157202353', NULL, N'hieultt', CAST(N'2016-04-10 16:05:39.717' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1194, N'R348877398', N'RETURNIP', N'Request', N'R348877398', N'STATUS04', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 16:09:37.197' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1195, N'R348877398', N'RETURNIP', N'ServerIP', N'116.193.73.92', N'STATUS30', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 16:09:37.270' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1196, N'R348877398', N'RETURNIP', N'ServerIP', N'116.193.73.30', N'STATUS30', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 16:09:37.290' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1197, N'R348877398', N'RETURNIP', N'ServerIP', N'116.193.73.3', N'STATUS30', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 16:09:37.297' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1198, N'R348877398', N'RETURNIP', N'ServerIP', N'116.193.73.21', N'STATUS30', N'S553138894', NULL, N'hieultt', CAST(N'2016-04-10 16:09:37.310' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1199, N'R348877398', N'RETURNIP', N'Request', N'R348877398', N'STATUS06', NULL, NULL, N'bichtt', CAST(N'2016-04-10 16:10:39.843' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1200, N'R348877398', N'RETURNIP', N'ServerIP', N'116.193.73.92', N'STATUS29', N'S553138894', NULL, N'bichtt', CAST(N'2016-04-10 16:10:43.493' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1201, N'R348877398', N'RETURNIP', N'ServerIP', N'116.193.73.30', N'STATUS29', N'S553138894', NULL, N'bichtt', CAST(N'2016-04-10 16:10:43.583' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1202, N'R348877398', N'RETURNIP', N'ServerIP', N'116.193.73.3', N'STATUS29', N'S553138894', NULL, N'bichtt', CAST(N'2016-04-10 16:10:43.693' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1203, N'R348877398', N'RETURNIP', N'ServerIP', N'116.193.73.21', N'STATUS29', N'S553138894', NULL, N'bichtt', CAST(N'2016-04-10 16:10:43.827' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1204, N'R348877398', N'RETURNIP', N'Request', N'R348877398', N'STATUS09', NULL, NULL, N'bichtt', CAST(N'2016-04-10 16:10:44.057' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1205, N'R555066048', N'RETURNIP', N'ServerIP', N'116.193.73.93', N'STATUS29', N'S157202353', NULL, N'bichtt', CAST(N'2016-04-10 16:11:05.007' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (114, N'R436069930', N'ASSIGNIP', N'Request', N'R436069930', N'STATUS04', N'S434278452', NULL, N'hieultt', CAST(N'2016-04-10 13:38:26.667' AS DateTime), N'{"NumberOfIp":5,"Description":"[None]","NumberOfRack":0}', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (115, N'R914673018', N'ASSIGNIP', N'Request', N'R914673018', N'STATUS04', N'S157202353', NULL, N'hieultt', CAST(N'2016-04-10 13:38:41.173' AS DateTime), N'{"NumberOfIp":3,"Description":"[None]","NumberOfRack":0}', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (116, N'R821133664', N'ASSIGNIP', N'Request', N'R821133664', N'STATUS04', N'S899125785', NULL, N'hieultt', CAST(N'2016-04-10 13:38:50.067' AS DateTime), N'{"NumberOfIp":7,"Description":"[None]","NumberOfRack":0}', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (117, N'R821133664', N'ASSIGNIP', N'Request', N'R821133664', N'STATUS06', NULL, NULL, N'hungnh', CAST(N'2016-04-10 13:43:41.790' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (118, N'R821133664', N'ASSIGNIP', N'ServerIP', N'116.193.73.204', N'STATUS29', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:43.993' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (119, N'R821133664', N'ASSIGNIP', N'IPAddress', N'116.193.73.204', N'STATUS11', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.020' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (120, N'R821133664', N'ASSIGNIP', N'ServerIP', N'116.193.73.31', N'STATUS29', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.023' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (121, N'R821133664', N'ASSIGNIP', N'IPAddress', N'116.193.73.31', N'STATUS11', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.033' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (122, N'R821133664', N'ASSIGNIP', N'ServerIP', N'116.193.73.215', N'STATUS29', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.037' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (123, N'R821133664', N'ASSIGNIP', N'IPAddress', N'116.193.73.215', N'STATUS11', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.047' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (124, N'R821133664', N'ASSIGNIP', N'ServerIP', N'116.193.73.82', N'STATUS29', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.067' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (125, N'R821133664', N'ASSIGNIP', N'IPAddress', N'116.193.73.82', N'STATUS11', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.073' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (126, N'R821133664', N'ASSIGNIP', N'ServerIP', N'116.193.73.153', N'STATUS29', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.077' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (127, N'R821133664', N'ASSIGNIP', N'IPAddress', N'116.193.73.153', N'STATUS11', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.087' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (128, N'R821133664', N'ASSIGNIP', N'ServerIP', N'116.193.73.105', N'STATUS29', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.093' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (129, N'R821133664', N'ASSIGNIP', N'IPAddress', N'116.193.73.105', N'STATUS11', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.103' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (130, N'R821133664', N'ASSIGNIP', N'ServerIP', N'116.193.73.235', N'STATUS29', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.107' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (131, N'R821133664', N'ASSIGNIP', N'IPAddress', N'116.193.73.235', N'STATUS11', N'S899125785', NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.117' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (132, N'R821133664', N'ASSIGNIP', N'Request', N'R821133664', N'STATUS07', NULL, NULL, N'hungnh', CAST(N'2016-04-10 13:43:44.127' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (133, N'R914673018', N'ASSIGNIP', N'Request', N'R914673018', N'STATUS06', NULL, NULL, N'hungnh', CAST(N'2016-04-10 13:43:50.357' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (134, N'R914673018', N'ASSIGNIP', N'ServerIP', N'116.193.73.93', N'STATUS29', N'S157202353', NULL, N'hungnh', CAST(N'2016-04-10 13:43:52.620' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (135, N'R914673018', N'ASSIGNIP', N'IPAddress', N'116.193.73.93', N'STATUS11', N'S157202353', NULL, N'hungnh', CAST(N'2016-04-10 13:43:52.630' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (136, N'R914673018', N'ASSIGNIP', N'ServerIP', N'116.193.73.55', N'STATUS29', N'S157202353', NULL, N'hungnh', CAST(N'2016-04-10 13:43:52.637' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (137, N'R914673018', N'ASSIGNIP', N'IPAddress', N'116.193.73.55', N'STATUS11', N'S157202353', NULL, N'hungnh', CAST(N'2016-04-10 13:43:52.647' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (138, N'R914673018', N'ASSIGNIP', N'ServerIP', N'116.193.73.128', N'STATUS29', N'S157202353', NULL, N'hungnh', CAST(N'2016-04-10 13:43:52.667' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (139, N'R914673018', N'ASSIGNIP', N'IPAddress', N'116.193.73.128', N'STATUS11', N'S157202353', NULL, N'hungnh', CAST(N'2016-04-10 13:43:52.677' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (140, N'R914673018', N'ASSIGNIP', N'Request', N'R914673018', N'STATUS07', NULL, NULL, N'hungnh', CAST(N'2016-04-10 13:43:52.687' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (141, N'R436069930', N'ASSIGNIP', N'Request', N'R436069930', N'STATUS06', NULL, NULL, N'hungnh', CAST(N'2016-04-10 13:43:57.763' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (142, N'R436069930', N'ASSIGNIP', N'ServerIP', N'213.2.64.16', N'STATUS29', N'S434278452', NULL, N'hungnh', CAST(N'2016-04-10 13:44:00.610' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (143, N'R436069930', N'ASSIGNIP', N'IPAddress', N'213.2.64.16', N'STATUS11', N'S434278452', NULL, N'hungnh', CAST(N'2016-04-10 13:44:00.693' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (144, N'R436069930', N'ASSIGNIP', N'ServerIP', N'213.2.64.216', N'STATUS29', N'S434278452', NULL, N'hungnh', CAST(N'2016-04-10 13:44:00.703' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (145, N'R436069930', N'ASSIGNIP', N'IPAddress', N'213.2.64.216', N'STATUS11', N'S434278452', NULL, N'hungnh', CAST(N'2016-04-10 13:44:00.717' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (146, N'R436069930', N'ASSIGNIP', N'ServerIP', N'213.2.64.202', N'STATUS29', N'S434278452', NULL, N'hungnh', CAST(N'2016-04-10 13:44:00.723' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (147, N'R436069930', N'ASSIGNIP', N'IPAddress', N'213.2.64.202', N'STATUS11', N'S434278452', NULL, N'hungnh', CAST(N'2016-04-10 13:44:00.737' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (148, N'R436069930', N'ASSIGNIP', N'ServerIP', N'213.2.64.180', N'STATUS29', N'S434278452', NULL, N'hungnh', CAST(N'2016-04-10 13:44:00.747' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (149, N'R436069930', N'ASSIGNIP', N'IPAddress', N'213.2.64.180', N'STATUS11', N'S434278452', NULL, N'hungnh', CAST(N'2016-04-10 13:44:00.760' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (150, N'R436069930', N'ASSIGNIP', N'ServerIP', N'213.2.64.54', N'STATUS29', N'S434278452', NULL, N'hungnh', CAST(N'2016-04-10 13:44:00.770' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (151, N'R436069930', N'ASSIGNIP', N'IPAddress', N'213.2.64.54', N'STATUS11', N'S434278452', NULL, N'hungnh', CAST(N'2016-04-10 13:44:00.810' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (152, N'R436069930', N'ASSIGNIP', N'Request', N'R436069930', N'STATUS07', NULL, NULL, N'hungnh', CAST(N'2016-04-10 13:44:00.833' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (153, N'R453331493', N'ASSIGNIP', N'Request', N'R453331493', N'STATUS06', NULL, NULL, N'hungnh', CAST(N'2016-04-10 13:44:05.687' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (154, N'R453331493', N'ASSIGNIP', N'ServerIP', N'116.193.73.30', N'STATUS29', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.770' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (155, N'R453331493', N'ASSIGNIP', N'IPAddress', N'116.193.73.30', N'STATUS11', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.787' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (156, N'R453331493', N'ASSIGNIP', N'ServerIP', N'116.193.73.21', N'STATUS29', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.807' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (157, N'R453331493', N'ASSIGNIP', N'IPAddress', N'116.193.73.21', N'STATUS11', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.820' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (158, N'R453331493', N'ASSIGNIP', N'ServerIP', N'116.193.73.28', N'STATUS29', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.830' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (159, N'R453331493', N'ASSIGNIP', N'IPAddress', N'116.193.73.28', N'STATUS11', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.840' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (160, N'R453331493', N'ASSIGNIP', N'ServerIP', N'116.193.73.160', N'STATUS29', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.850' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (161, N'R453331493', N'ASSIGNIP', N'IPAddress', N'116.193.73.160', N'STATUS11', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.863' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (162, N'R453331493', N'ASSIGNIP', N'ServerIP', N'116.193.73.169', N'STATUS29', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.883' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (163, N'R453331493', N'ASSIGNIP', N'IPAddress', N'116.193.73.169', N'STATUS11', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.897' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (164, N'R453331493', N'ASSIGNIP', N'ServerIP', N'116.193.73.92', N'STATUS29', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.927' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (165, N'R453331493', N'ASSIGNIP', N'IPAddress', N'116.193.73.92', N'STATUS11', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.937' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (166, N'R453331493', N'ASSIGNIP', N'ServerIP', N'116.193.73.175', N'STATUS29', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.947' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (167, N'R453331493', N'ASSIGNIP', N'IPAddress', N'116.193.73.175', N'STATUS11', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.957' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (168, N'R453331493', N'ASSIGNIP', N'ServerIP', N'116.193.73.156', N'STATUS29', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:07.983' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (169, N'R453331493', N'ASSIGNIP', N'IPAddress', N'116.193.73.156', N'STATUS11', N'S553138894', NULL, N'hungnh', CAST(N'2016-04-10 13:44:08.003' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (170, N'R453331493', N'ASSIGNIP', N'Request', N'R453331493', N'STATUS07', NULL, NULL, N'hungnh', CAST(N'2016-04-10 13:44:08.017' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (171, N'R003673872', N'ASSIGNIP', N'Request', N'R003673872', N'STATUS06', NULL, NULL, N'hungnh', CAST(N'2016-04-10 13:44:13.177' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (172, N'R003673872', N'ASSIGNIP', N'ServerIP', N'116.193.73.8', N'STATUS29', N'S715723845', NULL, N'hungnh', CAST(N'2016-04-10 13:44:14.913' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (173, N'R003673872', N'ASSIGNIP', N'IPAddress', N'116.193.73.8', N'STATUS11', N'S715723845', NULL, N'hungnh', CAST(N'2016-04-10 13:44:14.933' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (174, N'R003673872', N'ASSIGNIP', N'ServerIP', N'116.193.73.127', N'STATUS29', N'S715723845', NULL, N'hungnh', CAST(N'2016-04-10 13:44:14.967' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (175, N'R003673872', N'ASSIGNIP', N'IPAddress', N'116.193.73.127', N'STATUS11', N'S715723845', NULL, N'hungnh', CAST(N'2016-04-10 13:44:14.977' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (176, N'R003673872', N'ASSIGNIP', N'ServerIP', N'116.193.73.88', N'STATUS29', N'S715723845', NULL, N'hungnh', CAST(N'2016-04-10 13:44:14.987' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (177, N'R003673872', N'ASSIGNIP', N'IPAddress', N'116.193.73.88', N'STATUS11', N'S715723845', NULL, N'hungnh', CAST(N'2016-04-10 13:44:15.003' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (178, N'R003673872', N'ASSIGNIP', N'ServerIP', N'116.193.73.50', N'STATUS29', N'S715723845', NULL, N'hungnh', CAST(N'2016-04-10 13:44:15.017' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (179, N'R003673872', N'ASSIGNIP', N'IPAddress', N'116.193.73.50', N'STATUS11', N'S715723845', NULL, N'hungnh', CAST(N'2016-04-10 13:44:15.037' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (180, N'R003673872', N'ASSIGNIP', N'Request', N'R003673872', N'STATUS07', NULL, NULL, N'hungnh', CAST(N'2016-04-10 13:44:15.077' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (181, N'R227168169', N'CHANGEIP', N'Request', N'R227168169', N'STATUS04', N'S715723845', NULL, N'hieultt', CAST(N'2016-04-10 13:45:31.843' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (182, N'R227168169', N'CHANGEIP', N'ServerIP', N'116.193.73.8', N'STATUS36', N'S715723845', NULL, N'hieultt', CAST(N'2016-04-10 13:45:31.907' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (183, N'R227168169', N'CHANGEIP', N'ServerIP', N'116.193.73.50', N'STATUS36', N'S715723845', NULL, N'hieultt', CAST(N'2016-04-10 13:45:31.920' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (184, N'R216898503', N'ADDSERVER', N'Request', N'R216898503', N'STATUS08', NULL, NULL, N'hieultt', CAST(N'2016-04-10 13:48:13.723' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (185, N'R691323091', N'RENTRACK', N'Request', N'R691323091', N'STATUS04', NULL, NULL, N'hieultt', CAST(N'2016-04-10 13:49:12.617' AS DateTime), N'{"NumberOfIp":0,"Description":"[None]","NumberOfRack":2}', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (186, N'R925259928', N'RENTRACK', N'Request', N'R925259928', N'STATUS04', NULL, NULL, N'hieultt', CAST(N'2016-04-10 14:01:36.370' AS DateTime), N'{"NumberOfIp":0,"Description":"[None]","NumberOfRack":1}', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1206, N'R555066048', N'RETURNIP', N'ServerIP', N'116.193.73.55', N'STATUS29', N'S157202353', NULL, N'bichtt', CAST(N'2016-04-10 16:11:05.040' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1207, N'R555066048', N'RETURNIP', N'ServerIP', N'116.193.73.2', N'STATUS29', N'S157202353', NULL, N'bichtt', CAST(N'2016-04-10 16:11:05.050' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1208, N'R555066048', N'RETURNIP', N'ServerIP', N'116.193.73.128', N'STATUS29', N'S157202353', NULL, N'bichtt', CAST(N'2016-04-10 16:11:05.057' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1209, N'R555066048', N'RETURNIP', N'ServerIP', N'on', N'STATUS29', N'S157202353', NULL, N'bichtt', CAST(N'2016-04-10 16:11:05.063' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1210, N'R555066048', N'RETURNIP', N'Request', N'R555066048', N'STATUS09', NULL, NULL, N'bichtt', CAST(N'2016-04-10 16:11:05.077' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1211, N'R908906975', N'RETURNIP', N'Request', N'R908906975', N'STATUS06', NULL, NULL, N'bichtt', CAST(N'2016-04-10 16:11:13.363' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1212, N'R908906975', N'RETURNIP', N'IPAddress', N'116.193.73.28', N'STATUS10', N'S553138894', NULL, N'bichtt', CAST(N'2016-04-10 16:11:15.333' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1213, N'R908906975', N'RETURNIP', N'ServerIP', N'116.193.73.28', N'STATUS31', N'S553138894', NULL, N'bichtt', CAST(N'2016-04-10 16:11:15.410' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1214, N'R908906975', N'RETURNIP', N'Request', N'R908906975', N'STATUS07', NULL, NULL, N'bichtt', CAST(N'2016-04-10 16:11:15.490' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1215, N'R475438005', N'RETURNIP', N'ServerIP', N'116.193.73.88', N'STATUS29', N'S715723845', NULL, N'bichtt', CAST(N'2016-04-10 16:11:21.957' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1216, N'R475438005', N'RETURNIP', N'ServerIP', N'116.193.73.5', N'STATUS29', N'S715723845', NULL, N'bichtt', CAST(N'2016-04-10 16:11:21.970' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1217, N'R475438005', N'RETURNIP', N'ServerIP', N'116.193.73.127', N'STATUS29', N'S715723845', NULL, N'bichtt', CAST(N'2016-04-10 16:11:22.007' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1218, N'R475438005', N'RETURNIP', N'ServerIP', N'on', N'STATUS29', N'S715723845', NULL, N'bichtt', CAST(N'2016-04-10 16:11:22.013' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1219, N'R475438005', N'RETURNIP', N'Request', N'R475438005', N'STATUS09', NULL, NULL, N'bichtt', CAST(N'2016-04-10 16:11:22.023' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1220, N'R299635139', N'RETURNIP', N'ServerIP', N'116.193.73.175', N'STATUS29', N'S553138894', NULL, N'bichtt', CAST(N'2016-04-10 16:11:29.550' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1221, N'R299635139', N'RETURNIP', N'ServerIP', N'116.193.73.156', N'STATUS29', N'S553138894', NULL, N'bichtt', CAST(N'2016-04-10 16:11:29.597' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1222, N'R299635139', N'RETURNIP', N'Request', N'R299635139', N'STATUS09', NULL, NULL, N'bichtt', CAST(N'2016-04-10 16:11:29.660' AS DateTime), N'hihihihihi', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1223, N'R324991040', N'CHANGEIP', N'ServerIP', N'116.193.73.169', N'STATUS29', N'S553138894', NULL, N'bichtt', CAST(N'2016-04-10 16:11:35.590' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1224, N'R324991040', N'CHANGEIP', N'ServerIP', N'116.193.73.160', N'STATUS29', N'S553138894', NULL, N'bichtt', CAST(N'2016-04-10 16:11:35.603' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1225, N'R324991040', N'CHANGEIP', N'Request', N'R324991040', N'STATUS09', NULL, NULL, N'bichtt', CAST(N'2016-04-10 16:11:35.857' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1226, N'R925259928', N'RENTRACK', N'Request', N'R925259928', N'STATUS06', NULL, NULL, N'bichtt', CAST(N'2016-04-10 16:12:20.187' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1227, N'R646495399', N'ADDSERVER', N'Request', N'R646495399', N'STATUS04', NULL, NULL, N'longt', CAST(N'2016-04-19 13:06:14.117' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1228, N'R646495399', N'ADDSERVER', N'Server', N'S992184397', N'STATUS01', N'S992184397', NULL, N'longt', CAST(N'2016-04-19 13:06:14.173' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1229, N'R646495399', N'ADDSERVER', N'Server', N'S852265192', N'STATUS01', N'S852265192', NULL, N'longt', CAST(N'2016-04-19 13:06:14.187' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Log] OFF
SET IDENTITY_INSERT [dbo].[RequestType] ON 

INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (3, N'RT003', N'Add server')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (9, N'RT009', N'Assign new IP address')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (8, N'RT008', N'Change IP address')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (11, N'RT011', N'Rent rack')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (10, N'RT010', N'Return IP address')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (12, N'RT012', N'Return rack')
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (7, N'RT007', N'Bring server away')
SET IDENTITY_INSERT [dbo].[RequestType] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'Customer')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (3, N'Manager')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'Shift Head')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (4, N'Staff')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Shift] ON 

INSERT [dbo].[Shift] ([Id], [ShiftCode], [StartedTime], [EndedTime]) VALUES (1, N'Shift 1', 6, 14)
INSERT [dbo].[Shift] ([Id], [ShiftCode], [StartedTime], [EndedTime]) VALUES (2, N'Shift 2', 14, 22)
INSERT [dbo].[Shift] ([Id], [ShiftCode], [StartedTime], [EndedTime]) VALUES (3, N'Shift 3', 22, 30)
SET IDENTITY_INSERT [dbo].[Shift] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (1, N'STATUS01', N'Waiting', N'Server', 1)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (2, N'STATUS02', N'Running', N'Server', 2)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (3, N'STATUS03', N'Deactivate', N'Server', 4)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (4, N'STATUS04', N'Pending', N'Request', 1)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (5, N'STATUS05', N'Waiting', N'Request', 2)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (6, N'STATUS06', N'Processing', N'Request', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (7, N'STATUS07', N'Done', N'Request', 4)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (8, N'STATUS08', N'Cancelled', N'Request', 5)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (9, N'STATUS09', N'Rejected', N'Request', 6)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (10, N'STATUS10', N'Available', N'IPAddress', 1)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (11, N'STATUS11', N'Used', N'IPAddress', 2)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (12, N'STATUS12', N'Blocked', N'IPAddress', 4)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (13, N'STATUS13', N'Free', N'Location', 1)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (14, N'STATUS14', N'Used', N'Location', 2)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (15, N'STATUS15', N'Waiting', N'Task', 1)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (16, N'STATUS16', N'Doing', N'Task', 2)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (17, N'STATUS17', N'Completed', N'Task', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (18, N'STATUS18', N'Not Finished', N'Task', 4)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (19, N'STATUS19', N'Available', N'Rack', 1)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (20, N'STATUS20', N'Rented', N'Rack', 2)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (22, N'STATUS22', N'Updating', N'ServerAttribute', 2)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (23, N'STATUS23', N'Old', N'ServerAttribute', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (24, N'STATUS24', N'Current', N'ServerAttribute', 1)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (25, N'STATUS25', N'Returning', N'Rack', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (26, N'STATUS26', N'Current', N'RackOfCustomer', 1)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (27, N'STATUS27', N'Returning', N'RackOfCustomer', 2)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (28, N'STATUS28', N'Old', N'RackOfCustomer', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (29, N'STATUS29', N'Current', N'ServerIP', 1)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (30, N'STATUS30', N'Returning', N'ServerIP', 2)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (31, N'STATUS31', N'Old', N'ServerIP', 4)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (32, N'STATUS32', N'Reserve', N'IPAddress', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (33, N'STATUS33', N'Used', N'Rack', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (34, N'STATUS34', N'Bringing away', N'Server', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (35, N'STATUS35', N'Deactivate', N'IPAddress', 5)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (36, N'STATUS36', N'Changing', N'ServerIP', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (37, N'STATUS37', N'Cancelled', N'Task', 5)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (38, N'STATUS38', N'Pending & Processing', N'Request', 0)
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[TypeOfLog] ON 

INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (12, N'ADDSERVER', N'Add server')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (13, N'RENTRACK', N'Rent rack')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (10, N'UACCOUNTSTATUS', N'Update Account Status')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (9, N'UIPSTATUS', N'Update IP Status')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (14, N'RETURNRACK', N'Return rack')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (7, N'UREQUESTSTATUS', N'Update Request Status')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (11, N'UROLE', N'Update Role')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (8, N'USERVERSTATUS', N'Update Server Status')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (15, N'RETURNIP', N'Return IP')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (16, N'CHANGEIP', N'Change IP')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (17, N'ASSIGNIP', N'Assign IP')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (18, N'BLOCKIP', N'Block IP')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (19, N'UNBLOCKIP', N'Unblock IP')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (20, N'BASERVER', N'Bring Server Away')
INSERT [dbo].[TypeOfLog] ([Id], [TypeCode], [TypeName]) VALUES (21, N'ASSIGNDEFAULTIP', N'Assign Default IP')
SET IDENTITY_INSERT [dbo].[TypeOfLog] OFF
USE [master]
GO
ALTER DATABASE [IMS] SET  READ_WRITE 
GO
