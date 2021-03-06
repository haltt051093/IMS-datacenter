USE [master]
GO
/****** Object:  Database [IMS]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[AssignedShift]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 4/19/2016 2:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IPAddressPool]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[Location]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[Log]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[Note]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[Rack]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[RackOfCustomer]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[RequestType]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 4/19/2016 2:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Server]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[ServerIP]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[Shift]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[Task]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[TempRequest]    Script Date: 4/19/2016 2:09:06 PM ******/
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
/****** Object:  Table [dbo].[TypeOfLog]    Script Date: 4/19/2016 2:09:06 PM ******/
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
SET IDENTITY_INSERT [dbo].[IPAddressPool] ON 

INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (948, N'116.193.73.51', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1000, N'116.193.73.103', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1001, N'116.193.73.104', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1002, N'116.193.73.105', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1003, N'116.193.73.106', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1004, N'116.193.73.107', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1005, N'116.193.73.108', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1006, N'116.193.73.109', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1007, N'116.193.73.110', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1008, N'116.193.73.111', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1009, N'116.193.73.112', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1010, N'116.193.73.113', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1011, N'116.193.73.114', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1012, N'116.193.73.115', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1013, N'116.193.73.116', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1014, N'116.193.73.117', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1015, N'116.193.73.118', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1016, N'116.193.73.119', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1017, N'116.193.73.120', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1018, N'116.193.73.121', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1019, N'116.193.73.122', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1020, N'116.193.73.123', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1021, N'116.193.73.124', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1022, N'116.193.73.125', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1023, N'116.193.73.126', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1024, N'116.193.73.127', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1025, N'116.193.73.128', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1026, N'116.193.73.129', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1027, N'116.193.73.130', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1028, N'116.193.73.131', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1029, N'116.193.73.132', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1030, N'116.193.73.133', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1031, N'116.193.73.134', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1032, N'116.193.73.135', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1033, N'116.193.73.136', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1034, N'116.193.73.137', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1035, N'116.193.73.138', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1036, N'116.193.73.139', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1037, N'116.193.73.140', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1038, N'116.193.73.141', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1039, N'116.193.73.142', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1040, N'116.193.73.143', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1041, N'116.193.73.144', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1042, N'116.193.73.145', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1043, N'116.193.73.146', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1044, N'116.193.73.147', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1045, N'116.193.73.148', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1046, N'116.193.73.149', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1047, N'116.193.73.150', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1048, N'116.193.73.151', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1049, N'116.193.73.152', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1353, N'202.78.227.200', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1354, N'202.78.227.201', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1355, N'202.78.227.202', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1356, N'202.78.227.203', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1357, N'202.78.227.204', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1358, N'202.78.227.205', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1359, N'202.78.227.206', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1360, N'202.78.227.207', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1361, N'202.78.227.208', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1362, N'202.78.227.209', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1363, N'202.78.227.210', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1364, N'202.78.227.211', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1365, N'202.78.227.212', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1366, N'202.78.227.213', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1367, N'202.78.227.214', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1368, N'202.78.227.215', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1369, N'202.78.227.216', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1370, N'202.78.227.217', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1371, N'202.78.227.218', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1372, N'202.78.227.219', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1373, N'202.78.227.220', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1374, N'202.78.227.221', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1375, N'202.78.227.222', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1376, N'202.78.227.223', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1377, N'202.78.227.224', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1378, N'202.78.227.225', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1379, N'202.78.227.226', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1380, N'202.78.227.227', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1381, N'202.78.227.228', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1382, N'202.78.227.229', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1383, N'202.78.227.230', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1384, N'202.78.227.231', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1385, N'202.78.227.232', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1386, N'202.78.227.233', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1387, N'202.78.227.234', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1388, N'202.78.227.235', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1389, N'202.78.227.236', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1390, N'202.78.227.237', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1391, N'202.78.227.238', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1392, N'202.78.227.239', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1393, N'202.78.227.240', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1394, N'202.78.227.241', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1395, N'202.78.227.242', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1396, N'202.78.227.243', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1397, N'202.78.227.244', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1398, N'202.78.227.245', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1399, N'202.78.227.246', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1400, N'202.78.227.247', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1401, N'202.78.227.248', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1050, N'116.193.73.153', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1051, N'116.193.73.154', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1052, N'116.193.73.155', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1053, N'116.193.73.156', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1054, N'116.193.73.157', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1055, N'116.193.73.158', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1056, N'116.193.73.159', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1057, N'116.193.73.160', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1058, N'116.193.73.161', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1059, N'116.193.73.162', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1060, N'116.193.73.163', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1061, N'116.193.73.164', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1062, N'116.193.73.165', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1063, N'116.193.73.166', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1064, N'116.193.73.167', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1065, N'116.193.73.168', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1066, N'116.193.73.169', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1067, N'116.193.73.170', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1068, N'116.193.73.171', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1069, N'116.193.73.172', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1070, N'116.193.73.173', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1071, N'116.193.73.174', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1072, N'116.193.73.175', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1073, N'116.193.73.176', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1074, N'116.193.73.177', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1075, N'116.193.73.178', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1076, N'116.193.73.179', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1077, N'116.193.73.180', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1078, N'116.193.73.181', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1079, N'116.193.73.182', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1080, N'116.193.73.183', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1081, N'116.193.73.184', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1082, N'116.193.73.185', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1083, N'116.193.73.186', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1084, N'116.193.73.187', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1085, N'116.193.73.188', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1086, N'116.193.73.189', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1087, N'116.193.73.190', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1088, N'116.193.73.191', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1089, N'116.193.73.192', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1090, N'116.193.73.193', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1091, N'116.193.73.194', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1092, N'116.193.73.195', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1093, N'116.193.73.196', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1094, N'116.193.73.197', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1095, N'116.193.73.198', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1096, N'116.193.73.199', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1097, N'116.193.73.200', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1098, N'116.193.73.201', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1099, N'116.193.73.202', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1100, N'116.193.73.203', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (897, N'116.193.73.0', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (898, N'116.193.73.1', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (899, N'116.193.73.2', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (900, N'116.193.73.3', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (901, N'116.193.73.4', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (902, N'116.193.73.5', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (903, N'116.193.73.6', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (904, N'116.193.73.7', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (905, N'116.193.73.8', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (906, N'116.193.73.9', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (907, N'116.193.73.10', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (908, N'116.193.73.11', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (909, N'116.193.73.12', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (910, N'116.193.73.13', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (911, N'116.193.73.14', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (912, N'116.193.73.15', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (913, N'116.193.73.16', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (914, N'116.193.73.17', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (915, N'116.193.73.18', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (916, N'116.193.73.19', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (917, N'116.193.73.20', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (918, N'116.193.73.21', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (919, N'116.193.73.22', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (920, N'116.193.73.23', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (921, N'116.193.73.24', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (922, N'116.193.73.25', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (923, N'116.193.73.26', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (924, N'116.193.73.27', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (925, N'116.193.73.28', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (926, N'116.193.73.29', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (927, N'116.193.73.30', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (928, N'116.193.73.31', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (929, N'116.193.73.32', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (930, N'116.193.73.33', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (931, N'116.193.73.34', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (932, N'116.193.73.35', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (933, N'116.193.73.36', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (934, N'116.193.73.37', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (935, N'116.193.73.38', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (936, N'116.193.73.39', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (937, N'116.193.73.40', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (938, N'116.193.73.41', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (939, N'116.193.73.42', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (940, N'116.193.73.43', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (941, N'116.193.73.44', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (942, N'116.193.73.45', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (943, N'116.193.73.46', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (944, N'116.193.73.47', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (945, N'116.193.73.48', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (946, N'116.193.73.49', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (947, N'116.193.73.50', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1101, N'116.193.73.204', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1102, N'116.193.73.205', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1103, N'116.193.73.206', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1104, N'116.193.73.207', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1105, N'116.193.73.208', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1106, N'116.193.73.209', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1107, N'116.193.73.210', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1108, N'116.193.73.211', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1109, N'116.193.73.212', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1110, N'116.193.73.213', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1111, N'116.193.73.214', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1112, N'116.193.73.215', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1113, N'116.193.73.216', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1114, N'116.193.73.217', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1115, N'116.193.73.218', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1116, N'116.193.73.219', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1117, N'116.193.73.220', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1118, N'116.193.73.221', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1119, N'116.193.73.222', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1120, N'116.193.73.223', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1121, N'116.193.73.224', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1122, N'116.193.73.225', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1123, N'116.193.73.226', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1124, N'116.193.73.227', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1125, N'116.193.73.228', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1126, N'116.193.73.229', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1127, N'116.193.73.230', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1128, N'116.193.73.231', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1129, N'116.193.73.232', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1130, N'116.193.73.233', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1131, N'116.193.73.234', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1132, N'116.193.73.235', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1133, N'116.193.73.236', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1134, N'116.193.73.237', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1135, N'116.193.73.238', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1136, N'116.193.73.239', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1137, N'116.193.73.240', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1138, N'116.193.73.241', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1139, N'116.193.73.242', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1140, N'116.193.73.243', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1141, N'116.193.73.244', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1142, N'116.193.73.245', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1143, N'116.193.73.246', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1144, N'116.193.73.247', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1145, N'116.193.73.248', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1146, N'116.193.73.249', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1147, N'116.193.73.250', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1148, N'116.193.73.251', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1149, N'116.193.73.252', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1150, N'116.193.73.253', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1151, N'116.193.73.254', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1152, N'116.193.73.255', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1153, N'202.78.227.0', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1154, N'202.78.227.1', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1155, N'202.78.227.2', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1156, N'202.78.227.3', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1157, N'202.78.227.4', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1158, N'202.78.227.5', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1159, N'202.78.227.6', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1160, N'202.78.227.7', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1161, N'202.78.227.8', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1162, N'202.78.227.9', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1163, N'202.78.227.10', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1164, N'202.78.227.11', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1165, N'202.78.227.12', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1166, N'202.78.227.13', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1167, N'202.78.227.14', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1168, N'202.78.227.15', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1169, N'202.78.227.16', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1170, N'202.78.227.17', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1171, N'202.78.227.18', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1172, N'202.78.227.19', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1173, N'202.78.227.20', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1174, N'202.78.227.21', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1175, N'202.78.227.22', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1176, N'202.78.227.23', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1177, N'202.78.227.24', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1178, N'202.78.227.25', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1179, N'202.78.227.26', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1180, N'202.78.227.27', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1181, N'202.78.227.28', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1182, N'202.78.227.29', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1183, N'202.78.227.30', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1184, N'202.78.227.31', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1185, N'202.78.227.32', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1186, N'202.78.227.33', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1187, N'202.78.227.34', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1188, N'202.78.227.35', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1189, N'202.78.227.36', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1190, N'202.78.227.37', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1191, N'202.78.227.38', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1192, N'202.78.227.39', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1193, N'202.78.227.40', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1194, N'202.78.227.41', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1195, N'202.78.227.42', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1196, N'202.78.227.43', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1197, N'202.78.227.44', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1198, N'202.78.227.45', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1199, N'202.78.227.46', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1200, N'202.78.227.47', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1201, N'202.78.227.48', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1202, N'202.78.227.49', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1203, N'202.78.227.50', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1204, N'202.78.227.51', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1205, N'202.78.227.52', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1206, N'202.78.227.53', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1207, N'202.78.227.54', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1208, N'202.78.227.55', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1209, N'202.78.227.56', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1210, N'202.78.227.57', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1211, N'202.78.227.58', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1212, N'202.78.227.59', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1213, N'202.78.227.60', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1214, N'202.78.227.61', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1215, N'202.78.227.62', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1216, N'202.78.227.63', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1217, N'202.78.227.64', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1218, N'202.78.227.65', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1219, N'202.78.227.66', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1220, N'202.78.227.67', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1221, N'202.78.227.68', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1222, N'202.78.227.69', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1223, N'202.78.227.70', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1224, N'202.78.227.71', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1225, N'202.78.227.72', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1226, N'202.78.227.73', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1227, N'202.78.227.74', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1228, N'202.78.227.75', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1229, N'202.78.227.76', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1230, N'202.78.227.77', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1231, N'202.78.227.78', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1232, N'202.78.227.79', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1233, N'202.78.227.80', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1234, N'202.78.227.81', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1235, N'202.78.227.82', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1236, N'202.78.227.83', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1237, N'202.78.227.84', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1238, N'202.78.227.85', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1239, N'202.78.227.86', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1240, N'202.78.227.87', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1241, N'202.78.227.88', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1242, N'202.78.227.89', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1243, N'202.78.227.90', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1244, N'202.78.227.91', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1245, N'202.78.227.92', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1246, N'202.78.227.93', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1247, N'202.78.227.94', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1248, N'202.78.227.95', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1249, N'202.78.227.96', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1250, N'202.78.227.97', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1251, N'202.78.227.98', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1252, N'202.78.227.99', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1253, N'202.78.227.100', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1254, N'202.78.227.101', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1255, N'202.78.227.102', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1256, N'202.78.227.103', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1257, N'202.78.227.104', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1258, N'202.78.227.105', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1259, N'202.78.227.106', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1260, N'202.78.227.107', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1261, N'202.78.227.108', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1262, N'202.78.227.109', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1263, N'202.78.227.110', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1264, N'202.78.227.111', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1265, N'202.78.227.112', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1266, N'202.78.227.113', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1267, N'202.78.227.114', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1268, N'202.78.227.115', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1269, N'202.78.227.116', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1270, N'202.78.227.117', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1271, N'202.78.227.118', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1272, N'202.78.227.119', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1273, N'202.78.227.120', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1274, N'202.78.227.121', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1275, N'202.78.227.122', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1276, N'202.78.227.123', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1277, N'202.78.227.124', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1278, N'202.78.227.125', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1279, N'202.78.227.126', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1280, N'202.78.227.127', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1281, N'202.78.227.128', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1282, N'202.78.227.129', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1283, N'202.78.227.130', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1284, N'202.78.227.131', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1285, N'202.78.227.132', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1286, N'202.78.227.133', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1287, N'202.78.227.134', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1288, N'202.78.227.135', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1289, N'202.78.227.136', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1290, N'202.78.227.137', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1291, N'202.78.227.138', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1292, N'202.78.227.139', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1293, N'202.78.227.140', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1294, N'202.78.227.141', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1295, N'202.78.227.142', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1296, N'202.78.227.143', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1297, N'202.78.227.144', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1298, N'202.78.227.145', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1299, N'202.78.227.146', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1300, N'202.78.227.147', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1301, N'202.78.227.148', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1302, N'202.78.227.149', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1303, N'202.78.227.150', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1304, N'202.78.227.151', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1305, N'202.78.227.152', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1306, N'202.78.227.153', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1307, N'202.78.227.154', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1308, N'202.78.227.155', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1309, N'202.78.227.156', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1310, N'202.78.227.157', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1311, N'202.78.227.158', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1312, N'202.78.227.159', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1313, N'202.78.227.160', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1314, N'202.78.227.161', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1315, N'202.78.227.162', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1316, N'202.78.227.163', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1317, N'202.78.227.164', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1318, N'202.78.227.165', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1319, N'202.78.227.166', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1320, N'202.78.227.167', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1321, N'202.78.227.168', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1322, N'202.78.227.169', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1323, N'202.78.227.170', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1324, N'202.78.227.171', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1325, N'202.78.227.172', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1326, N'202.78.227.173', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1327, N'202.78.227.174', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1328, N'202.78.227.175', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1329, N'202.78.227.176', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1330, N'202.78.227.177', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1331, N'202.78.227.178', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1332, N'202.78.227.179', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1333, N'202.78.227.180', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1334, N'202.78.227.181', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1335, N'202.78.227.182', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1336, N'202.78.227.183', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1337, N'202.78.227.184', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1338, N'202.78.227.185', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1339, N'202.78.227.186', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1340, N'202.78.227.187', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1341, N'202.78.227.188', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1342, N'202.78.227.189', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1343, N'202.78.227.190', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1344, N'202.78.227.191', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1345, N'202.78.227.192', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1346, N'202.78.227.193', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1347, N'202.78.227.194', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1348, N'202.78.227.195', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1349, N'202.78.227.196', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1350, N'202.78.227.197', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1351, N'202.78.227.198', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1352, N'202.78.227.199', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (949, N'116.193.73.52', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (950, N'116.193.73.53', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (951, N'116.193.73.54', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (952, N'116.193.73.55', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (953, N'116.193.73.56', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (954, N'116.193.73.57', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (955, N'116.193.73.58', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (956, N'116.193.73.59', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (957, N'116.193.73.60', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (958, N'116.193.73.61', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (959, N'116.193.73.62', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (960, N'116.193.73.63', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (961, N'116.193.73.64', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (962, N'116.193.73.65', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (963, N'116.193.73.66', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (964, N'116.193.73.67', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (965, N'116.193.73.68', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (966, N'116.193.73.69', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (967, N'116.193.73.70', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (968, N'116.193.73.71', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (969, N'116.193.73.72', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (970, N'116.193.73.73', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (971, N'116.193.73.74', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (972, N'116.193.73.75', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (973, N'116.193.73.76', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (974, N'116.193.73.77', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (975, N'116.193.73.78', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (976, N'116.193.73.79', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (977, N'116.193.73.80', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (978, N'116.193.73.81', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (979, N'116.193.73.82', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (980, N'116.193.73.83', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (981, N'116.193.73.84', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (982, N'116.193.73.85', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (983, N'116.193.73.86', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (984, N'116.193.73.87', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (985, N'116.193.73.88', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (986, N'116.193.73.89', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (987, N'116.193.73.90', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (988, N'116.193.73.91', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (989, N'116.193.73.92', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (990, N'116.193.73.93', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (991, N'116.193.73.94', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (992, N'116.193.73.95', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (993, N'116.193.73.96', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (994, N'116.193.73.97', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (995, N'116.193.73.98', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (996, N'116.193.73.99', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (997, N'116.193.73.100', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (998, N'116.193.73.101', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (999, N'116.193.73.102', N'116.193.73.1', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:12.683' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1402, N'202.78.227.249', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1403, N'202.78.227.250', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1404, N'202.78.227.251', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1405, N'202.78.227.252', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1406, N'202.78.227.253', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1407, N'202.78.227.254', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1408, N'202.78.227.255', N'202.78.227.1', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-19 13:12:30.740' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1409, N'210.2.64.0', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1410, N'210.2.64.1', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1411, N'210.2.64.2', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1412, N'210.2.64.3', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1413, N'210.2.64.4', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1414, N'210.2.64.5', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1415, N'210.2.64.6', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1416, N'210.2.64.7', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1417, N'210.2.64.8', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1418, N'210.2.64.9', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1419, N'210.2.64.10', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1420, N'210.2.64.11', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1421, N'210.2.64.12', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1422, N'210.2.64.13', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1423, N'210.2.64.14', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1424, N'210.2.64.15', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1425, N'210.2.64.16', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1426, N'210.2.64.17', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1427, N'210.2.64.18', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1428, N'210.2.64.19', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1429, N'210.2.64.20', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1430, N'210.2.64.21', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1431, N'210.2.64.22', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1432, N'210.2.64.23', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1433, N'210.2.64.24', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1434, N'210.2.64.25', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1435, N'210.2.64.26', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1436, N'210.2.64.27', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1437, N'210.2.64.28', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1438, N'210.2.64.29', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1439, N'210.2.64.30', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1440, N'210.2.64.31', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1441, N'210.2.64.32', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1442, N'210.2.64.33', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1443, N'210.2.64.34', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1444, N'210.2.64.35', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1445, N'210.2.64.36', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1446, N'210.2.64.37', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1447, N'210.2.64.38', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1448, N'210.2.64.39', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1449, N'210.2.64.40', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1450, N'210.2.64.41', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1451, N'210.2.64.42', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1452, N'210.2.64.43', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1453, N'210.2.64.44', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1454, N'210.2.64.45', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1455, N'210.2.64.46', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1456, N'210.2.64.47', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1457, N'210.2.64.48', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1458, N'210.2.64.49', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1459, N'210.2.64.50', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1460, N'210.2.64.51', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1461, N'210.2.64.52', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1462, N'210.2.64.53', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1463, N'210.2.64.54', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1464, N'210.2.64.55', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1465, N'210.2.64.56', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1466, N'210.2.64.57', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1467, N'210.2.64.58', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1468, N'210.2.64.59', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1469, N'210.2.64.60', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1470, N'210.2.64.61', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1471, N'210.2.64.62', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1472, N'210.2.64.63', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:12:47.433' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1473, N'120.72.90.0', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1474, N'120.72.90.1', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1475, N'120.72.90.2', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1476, N'120.72.90.3', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1477, N'120.72.90.4', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1478, N'120.72.90.5', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1479, N'120.72.90.6', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1480, N'120.72.90.7', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1481, N'120.72.90.8', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1482, N'120.72.90.9', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1483, N'120.72.90.10', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1484, N'120.72.90.11', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1485, N'120.72.90.12', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1486, N'120.72.90.13', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1487, N'120.72.90.14', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1488, N'120.72.90.15', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1489, N'120.72.90.16', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1490, N'120.72.90.17', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1491, N'120.72.90.18', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1492, N'120.72.90.19', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1493, N'120.72.90.20', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1494, N'120.72.90.21', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1495, N'120.72.90.22', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1496, N'120.72.90.23', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1497, N'120.72.90.24', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1498, N'120.72.90.25', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1499, N'120.72.90.26', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1500, N'120.72.90.27', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1501, N'120.72.90.28', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1502, N'120.72.90.29', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1503, N'120.72.90.30', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1504, N'120.72.90.31', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1505, N'120.72.90.32', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1506, N'120.72.90.33', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1507, N'120.72.90.34', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1508, N'120.72.90.35', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1509, N'120.72.90.36', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1510, N'120.72.90.37', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1511, N'120.72.90.38', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1512, N'120.72.90.39', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1513, N'120.72.90.40', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1514, N'120.72.90.41', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1515, N'120.72.90.42', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1516, N'120.72.90.43', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1517, N'120.72.90.44', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1518, N'120.72.90.45', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1519, N'120.72.90.46', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1520, N'120.72.90.47', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1521, N'120.72.90.48', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1522, N'120.72.90.49', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1523, N'120.72.90.50', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1524, N'120.72.90.51', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1525, N'120.72.90.52', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1526, N'120.72.90.53', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1527, N'120.72.90.54', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1528, N'120.72.90.55', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1529, N'120.72.90.56', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1530, N'120.72.90.57', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1531, N'120.72.90.58', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1532, N'120.72.90.59', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1533, N'120.72.90.60', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1534, N'120.72.90.61', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1535, N'120.72.90.62', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1536, N'120.72.90.63', N'120.72.90.62', N'120.72.90.0', N'255.255.255.192', NULL, CAST(N'2016-04-19 13:14:07.143' AS DateTime), N'STATUS32', 0)
SET IDENTITY_INSERT [dbo].[IPAddressPool] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (505, N'L093183', N'R995751', 1, N'STATUS14', N'S208634214')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (506, N'L112491', N'R995751', 2, N'STATUS14', N'S139351114')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (507, N'L329796', N'R995751', 3, N'STATUS14', N'S139351114')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (508, N'L599409', N'R995751', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (509, N'L055269', N'R995751', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (510, N'L172803', N'R995751', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (511, N'L549432', N'R995751', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (512, N'L692383', N'R995751', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (513, N'L424568', N'R995751', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (514, N'L329856', N'R995751', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (515, N'L530330', N'R995751', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (516, N'L340582', N'R995751', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (517, N'L858533', N'R995751', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (518, N'L499384', N'R995751', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (519, N'L667529', N'R995751', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (520, N'L829886', N'R995751', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (521, N'L878610', N'R995751', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (522, N'L203810', N'R995751', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (523, N'L456805', N'R995751', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (524, N'L441553', N'R995751', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (525, N'L224971', N'R995751', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (526, N'L770724', N'R995751', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (527, N'L081858', N'R995751', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (528, N'L077909', N'R995751', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (529, N'L496240', N'R995751', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (530, N'L150962', N'R995751', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (531, N'L592989', N'R995751', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (532, N'L137658', N'R995751', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (533, N'L375981', N'R995751', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (534, N'L069056', N'R995751', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (535, N'L118052', N'R995751', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (536, N'L964308', N'R995751', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (537, N'L128524', N'R995751', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (538, N'L351156', N'R995751', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (539, N'L130243', N'R995751', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (540, N'L579899', N'R995751', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (541, N'L902324', N'R995751', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (542, N'L102774', N'R995751', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (543, N'L517575', N'R995751', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (544, N'L772832', N'R995751', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (545, N'L128744', N'R995751', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (546, N'L821162', N'R995751', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (547, N'L301631', N'R213026', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (548, N'L788061', N'R213026', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (549, N'L298079', N'R213026', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (550, N'L830415', N'R213026', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (551, N'L051979', N'R213026', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (552, N'L210924', N'R213026', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (553, N'L688619', N'R213026', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (554, N'L391494', N'R213026', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (555, N'L325215', N'R213026', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (556, N'L394586', N'R213026', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (557, N'L030239', N'R213026', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (558, N'L265338', N'R213026', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (559, N'L077554', N'R213026', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (560, N'L353769', N'R213026', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (561, N'L940556', N'R213026', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (562, N'L417240', N'R213026', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (563, N'L446742', N'R213026', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (564, N'L264004', N'R213026', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (565, N'L230856', N'R213026', 19, N'STATUS14', N'S333095919')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (566, N'L937554', N'R213026', 20, N'STATUS14', N'S333095919')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (567, N'L251331', N'R213026', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (568, N'L502065', N'R213026', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (569, N'L528333', N'R213026', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (570, N'L832913', N'R213026', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (571, N'L401671', N'R213026', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (572, N'L369603', N'R213026', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (573, N'L919215', N'R213026', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (574, N'L602433', N'R213026', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (575, N'L961890', N'R213026', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (576, N'L610933', N'R213026', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (577, N'L953030', N'R213026', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (578, N'L117300', N'R213026', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (579, N'L039708', N'R213026', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (580, N'L509248', N'R213026', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (581, N'L872666', N'R213026', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (582, N'L121736', N'R213026', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (583, N'L964486', N'R213026', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (584, N'L148074', N'R213026', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (585, N'L194675', N'R213026', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (586, N'L374862', N'R213026', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (587, N'L155641', N'R213026', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (588, N'L757760', N'R213026', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (589, N'L847585', N'R551474', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (590, N'L078912', N'R551474', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (591, N'L800213', N'R551474', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (592, N'L442580', N'R551474', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (593, N'L070885', N'R551474', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (594, N'L940040', N'R551474', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (595, N'L158799', N'R551474', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (596, N'L291747', N'R551474', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (597, N'L482783', N'R551474', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (598, N'L070810', N'R551474', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (599, N'L507163', N'R551474', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (600, N'L293251', N'R551474', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (601, N'L563194', N'R551474', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (602, N'L699739', N'R551474', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (603, N'L225914', N'R551474', 15, N'STATUS13', NULL)
GO
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (604, N'L863609', N'R551474', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (605, N'L573180', N'R551474', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (606, N'L450364', N'R551474', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (607, N'L099556', N'R551474', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (608, N'L348663', N'R551474', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (609, N'L488222', N'R551474', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (610, N'L252579', N'R551474', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (611, N'L556762', N'R551474', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (612, N'L674334', N'R551474', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (613, N'L394495', N'R551474', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (614, N'L211554', N'R551474', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (615, N'L543067', N'R551474', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (616, N'L510181', N'R551474', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (617, N'L117891', N'R551474', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (618, N'L342276', N'R551474', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (619, N'L119218', N'R551474', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (620, N'L541437', N'R551474', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (621, N'L646183', N'R551474', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (622, N'L355529', N'R551474', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (623, N'L373858', N'R551474', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (624, N'L703407', N'R551474', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (625, N'L774188', N'R551474', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (626, N'L464631', N'R551474', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (627, N'L331782', N'R551474', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (628, N'L919846', N'R551474', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (629, N'L510527', N'R551474', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (630, N'L393486', N'R551474', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (631, N'L893618', N'R680338', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (632, N'L494584', N'R680338', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (633, N'L408632', N'R680338', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (634, N'L999738', N'R680338', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (635, N'L890011', N'R680338', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (636, N'L744498', N'R680338', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (637, N'L427547', N'R680338', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (638, N'L091681', N'R680338', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (639, N'L546544', N'R680338', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (640, N'L501773', N'R680338', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (641, N'L028795', N'R680338', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (642, N'L438449', N'R680338', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (643, N'L330880', N'R680338', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (644, N'L305643', N'R680338', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (645, N'L580544', N'R680338', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (646, N'L114547', N'R680338', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (647, N'L240551', N'R680338', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (648, N'L079437', N'R680338', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (649, N'L933433', N'R680338', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (650, N'L766544', N'R680338', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (651, N'L504716', N'R680338', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (652, N'L133094', N'R680338', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (653, N'L273662', N'R680338', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (654, N'L202842', N'R680338', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (655, N'L765183', N'R680338', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (656, N'L074018', N'R680338', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (657, N'L276029', N'R680338', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (658, N'L330898', N'R680338', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (659, N'L779083', N'R680338', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (660, N'L925039', N'R680338', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (661, N'L342571', N'R680338', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (662, N'L029882', N'R680338', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (663, N'L079701', N'R680338', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (664, N'L510869', N'R680338', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (665, N'L738405', N'R680338', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (666, N'L083854', N'R680338', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (667, N'L572799', N'R680338', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (668, N'L331943', N'R680338', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (669, N'L317744', N'R680338', 39, N'STATUS14', N'S129156621')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (670, N'L623398', N'R680338', 40, N'STATUS14', N'S129156621')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (671, N'L597042', N'R680338', 41, N'STATUS14', N'S129156621')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (672, N'L033022', N'R680338', 42, N'STATUS14', N'S129156621')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (673, N'L729401', N'R715320', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (674, N'L756381', N'R715320', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (675, N'L362314', N'R715320', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (676, N'L984511', N'R715320', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (677, N'L051206', N'R715320', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (678, N'L497526', N'R715320', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (679, N'L208579', N'R715320', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (680, N'L538670', N'R715320', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (681, N'L401973', N'R715320', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (682, N'L827974', N'R715320', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (683, N'L899382', N'R715320', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (684, N'L861533', N'R715320', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (685, N'L960956', N'R715320', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (686, N'L981123', N'R715320', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (687, N'L324421', N'R715320', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (688, N'L973381', N'R715320', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (689, N'L644977', N'R715320', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (690, N'L317924', N'R715320', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (691, N'L684289', N'R715320', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (692, N'L605210', N'R715320', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (693, N'L715495', N'R715320', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (694, N'L647901', N'R715320', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (695, N'L886759', N'R715320', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (696, N'L570212', N'R715320', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (697, N'L504135', N'R715320', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (698, N'L575980', N'R715320', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (699, N'L252239', N'R715320', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (700, N'L360486', N'R715320', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (701, N'L470455', N'R715320', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (702, N'L555902', N'R715320', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (703, N'L792743', N'R715320', 31, N'STATUS13', NULL)
GO
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (704, N'L782760', N'R715320', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (705, N'L536610', N'R715320', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (706, N'L171479', N'R715320', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (707, N'L692713', N'R715320', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (708, N'L848333', N'R715320', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (709, N'L404518', N'R715320', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (710, N'L007576', N'R715320', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (711, N'L268223', N'R715320', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (712, N'L257730', N'R715320', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (713, N'L751298', N'R715320', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (714, N'L418462', N'R715320', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (715, N'L584932', N'R118035', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (716, N'L657263', N'R118035', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (717, N'L028736', N'R118035', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (718, N'L289002', N'R118035', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (719, N'L814821', N'R118035', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (720, N'L894643', N'R118035', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (721, N'L188095', N'R118035', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (722, N'L479127', N'R118035', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (723, N'L671132', N'R118035', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (724, N'L798389', N'R118035', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (725, N'L152080', N'R118035', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (726, N'L147223', N'R118035', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (727, N'L017553', N'R118035', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (728, N'L740783', N'R118035', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (729, N'L682919', N'R118035', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (730, N'L797597', N'R118035', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (731, N'L781318', N'R118035', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (732, N'L419536', N'R118035', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (733, N'L065541', N'R118035', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (734, N'L744934', N'R118035', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (735, N'L720076', N'R118035', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (736, N'L762815', N'R118035', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (737, N'L479509', N'R118035', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (738, N'L631593', N'R118035', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (739, N'L706287', N'R118035', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (740, N'L986090', N'R118035', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (741, N'L038465', N'R118035', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (742, N'L147655', N'R118035', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (743, N'L641981', N'R118035', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (744, N'L900834', N'R118035', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (745, N'L055716', N'R118035', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (746, N'L265617', N'R118035', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (747, N'L024329', N'R118035', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (748, N'L598239', N'R118035', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (749, N'L137794', N'R118035', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (750, N'L915326', N'R118035', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (751, N'L664726', N'R118035', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (752, N'L859595', N'R118035', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (753, N'L935673', N'R118035', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (754, N'L585008', N'R118035', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (755, N'L207050', N'R118035', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (756, N'L457111', N'R118035', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (757, N'L267295', N'R867383', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (758, N'L803445', N'R867383', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (759, N'L117480', N'R867383', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (760, N'L207419', N'R867383', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (761, N'L407896', N'R867383', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (762, N'L013830', N'R867383', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (763, N'L861802', N'R867383', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (764, N'L122982', N'R867383', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (765, N'L512509', N'R867383', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (766, N'L929979', N'R867383', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (767, N'L691030', N'R867383', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (768, N'L023654', N'R867383', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (769, N'L675413', N'R867383', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (770, N'L869726', N'R867383', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (771, N'L115340', N'R867383', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (772, N'L704269', N'R867383', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (773, N'L439265', N'R867383', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (774, N'L963539', N'R867383', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (775, N'L348146', N'R867383', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (776, N'L983570', N'R867383', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (777, N'L155700', N'R867383', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (778, N'L079444', N'R867383', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (779, N'L039554', N'R867383', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (780, N'L393478', N'R867383', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (781, N'L717202', N'R867383', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (782, N'L153125', N'R867383', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (783, N'L835374', N'R867383', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (784, N'L532708', N'R867383', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (785, N'L836101', N'R867383', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (786, N'L019073', N'R867383', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (787, N'L738226', N'R867383', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (788, N'L184558', N'R867383', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (789, N'L421215', N'R867383', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (790, N'L304750', N'R867383', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (791, N'L417961', N'R867383', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (792, N'L685460', N'R867383', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (793, N'L103503', N'R867383', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (794, N'L272322', N'R867383', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (795, N'L552813', N'R867383', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (796, N'L683459', N'R867383', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (797, N'L002882', N'R867383', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (798, N'L116036', N'R867383', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (799, N'L519426', N'R835542', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (800, N'L318848', N'R835542', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (801, N'L544090', N'R835542', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (802, N'L027364', N'R835542', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (803, N'L582152', N'R835542', 5, N'STATUS13', NULL)
GO
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (804, N'L203471', N'R835542', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (805, N'L150089', N'R835542', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (806, N'L895036', N'R835542', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (807, N'L629581', N'R835542', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (808, N'L175380', N'R835542', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (809, N'L936333', N'R835542', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (810, N'L430051', N'R835542', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (811, N'L030407', N'R835542', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (812, N'L005777', N'R835542', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (813, N'L307238', N'R835542', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (814, N'L722039', N'R835542', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (815, N'L821087', N'R835542', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (816, N'L392165', N'R835542', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (817, N'L143360', N'R835542', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (818, N'L245184', N'R835542', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (819, N'L096328', N'R835542', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (820, N'L922748', N'R835542', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (821, N'L015990', N'R835542', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (822, N'L413569', N'R835542', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (823, N'L264734', N'R835542', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (824, N'L205273', N'R835542', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (825, N'L271480', N'R835542', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (826, N'L676649', N'R835542', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (827, N'L545744', N'R835542', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (828, N'L836712', N'R835542', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (829, N'L005565', N'R835542', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (830, N'L409311', N'R835542', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (831, N'L976241', N'R835542', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (832, N'L643991', N'R835542', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (833, N'L574637', N'R835542', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (834, N'L742687', N'R835542', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (835, N'L469537', N'R835542', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (836, N'L632891', N'R835542', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (837, N'L529586', N'R835542', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (838, N'L242131', N'R835542', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (839, N'L754743', N'R835542', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (840, N'L395697', N'R835542', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (841, N'L034615', N'R916764', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (842, N'L945091', N'R916764', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (843, N'L600449', N'R916764', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (844, N'L356630', N'R916764', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (845, N'L800769', N'R916764', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (846, N'L198211', N'R916764', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (847, N'L538753', N'R916764', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (848, N'L452084', N'R916764', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (849, N'L055453', N'R916764', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (850, N'L652521', N'R916764', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (851, N'L501208', N'R916764', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (852, N'L491955', N'R916764', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (853, N'L549313', N'R916764', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (854, N'L258454', N'R916764', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (855, N'L945196', N'R916764', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (856, N'L242017', N'R916764', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (857, N'L144782', N'R916764', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (858, N'L060209', N'R916764', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (859, N'L729405', N'R916764', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (860, N'L649683', N'R916764', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (861, N'L526376', N'R916764', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (862, N'L364523', N'R916764', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (863, N'L506503', N'R916764', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (864, N'L077349', N'R916764', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (865, N'L440854', N'R916764', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (866, N'L970697', N'R916764', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (867, N'L277345', N'R916764', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (868, N'L428851', N'R916764', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (869, N'L848775', N'R916764', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (870, N'L015648', N'R916764', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (871, N'L862670', N'R916764', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (872, N'L834340', N'R916764', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (873, N'L254271', N'R916764', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (874, N'L525970', N'R916764', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (875, N'L181228', N'R916764', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (876, N'L636382', N'R916764', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (877, N'L355485', N'R916764', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (878, N'L405476', N'R916764', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (879, N'L932455', N'R916764', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (880, N'L567264', N'R916764', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (881, N'L161758', N'R916764', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (882, N'L814516', N'R916764', 42, N'STATUS13', NULL)
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1286, N'R551102690', N'ASSIGNIP', N'ServerIP', N'120.72.90.25', N'STATUS29', N'S333095919', NULL, N'haltt', CAST(N'2016-04-19 13:55:41.303' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1287, N'R551102690', N'ASSIGNIP', N'IPAddress', N'120.72.90.25', N'STATUS11', N'S333095919', NULL, N'haltt', CAST(N'2016-04-19 13:55:41.327' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1288, N'R551102690', N'ASSIGNIP', N'Request', N'R551102690', N'STATUS07', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:55:41.357' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1289, N'R334591687', N'CHANGEIP', N'Request', N'R334591687', N'STATUS04', N'S333095919', NULL, N'manhnh', CAST(N'2016-04-19 13:56:49.187' AS DateTime), N'change 25,28', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1290, N'R334591687', N'CHANGEIP', N'ServerIP', N'120.72.90.28', N'STATUS36', N'S333095919', NULL, N'manhnh', CAST(N'2016-04-19 13:56:49.230' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1291, N'R334591687', N'CHANGEIP', N'ServerIP', N'120.72.90.25', N'STATUS36', N'S333095919', NULL, N'manhnh', CAST(N'2016-04-19 13:56:49.257' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1292, N'R334591687', N'CHANGEIP', N'Request', N'R334591687', N'STATUS06', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:57:18.060' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1293, N'R334591687', N'CHANGEIP', N'ServerIP', N'120.72.90.28', N'STATUS31', N'S333095919', NULL, NULL, CAST(N'2016-04-19 13:57:25.837' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1294, N'R334591687', N'CHANGEIP', N'IPAddress', N'120.72.90.28', N'STATUS10', N'S333095919', NULL, NULL, CAST(N'2016-04-19 13:57:25.893' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1295, N'R334591687', N'CHANGEIP', N'ServerIP', N'120.72.90.18', N'STATUS29', N'S333095919', NULL, NULL, CAST(N'2016-04-19 13:57:25.920' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1296, N'R334591687', N'CHANGEIP', N'IPAddress', N'120.72.90.18', N'STATUS11', N'S333095919', NULL, NULL, CAST(N'2016-04-19 13:57:25.937' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1297, N'R334591687', N'CHANGEIP', N'ServerIP', N'120.72.90.25', N'STATUS31', N'S333095919', NULL, NULL, CAST(N'2016-04-19 13:57:25.957' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1298, N'R334591687', N'CHANGEIP', N'IPAddress', N'120.72.90.25', N'STATUS10', N'S333095919', NULL, NULL, CAST(N'2016-04-19 13:57:25.980' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1299, N'R334591687', N'CHANGEIP', N'ServerIP', N'120.72.90.56', N'STATUS29', N'S333095919', NULL, NULL, CAST(N'2016-04-19 13:57:26.007' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1300, N'R334591687', N'CHANGEIP', N'IPAddress', N'120.72.90.56', N'STATUS11', N'S333095919', NULL, NULL, CAST(N'2016-04-19 13:57:26.043' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1301, N'R334591687', N'CHANGEIP', N'Request', N'R334591687', N'STATUS07', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:57:26.070' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1302, N'R280399260', N'ADDSERVER', N'Request', N'R280399260', N'STATUS04', NULL, NULL, N'longt', CAST(N'2016-04-19 14:02:07.333' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1303, N'R280399260', N'ADDSERVER', N'Server', N'S208634214', N'STATUS01', N'S208634214', NULL, N'longt', CAST(N'2016-04-19 14:02:07.363' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1304, N'R280399260', N'ADDSERVER', N'Server', N'S139351114', N'STATUS01', N'S139351114', NULL, N'longt', CAST(N'2016-04-19 14:02:07.393' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1305, N'R280399260', N'ADDSERVER', N'Request', N'R280399260', N'STATUS05', NULL, NULL, N'haltt', CAST(N'2016-04-19 14:04:30.087' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1306, N'R280399260', N'ADDSERVER', N'Request', N'R280399260', N'STATUS06', NULL, NULL, N'haltt', CAST(N'2016-04-19 14:04:34.057' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1307, N'R280399260', N'ADDSERVER', N'Server', N'S208634214', N'STATUS02', NULL, NULL, N'trinhhl', CAST(N'2016-04-19 14:06:35.760' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1308, N'R280399260', N'ADDSERVER', N'ServerIP', N'202.78.227.5', N'STATUS29', N'S208634214', NULL, N'trinhhl', CAST(N'2016-04-19 14:06:35.800' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1309, N'R280399260', N'ADDSERVER', N'IPAddress', N'202.78.227.5', N'STATUS11', N'S208634214', NULL, N'trinhhl', CAST(N'2016-04-19 14:06:35.827' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1310, N'R280399260', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'trinhhl', CAST(N'2016-04-19 14:06:35.843' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1311, N'R280399260', N'ADDSERVER', N'Server', N'S139351114', N'STATUS02', NULL, NULL, N'trinhhl', CAST(N'2016-04-19 14:06:35.873' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1312, N'R280399260', N'ADDSERVER', N'ServerIP', N'116.193.73.12', N'STATUS29', N'S139351114', NULL, N'trinhhl', CAST(N'2016-04-19 14:06:35.900' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1313, N'R280399260', N'ADDSERVER', N'IPAddress', N'116.193.73.12', N'STATUS11', N'S139351114', NULL, N'trinhhl', CAST(N'2016-04-19 14:06:35.913' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1314, N'R280399260', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'trinhhl', CAST(N'2016-04-19 14:06:35.927' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1315, N'R280399260', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'trinhhl', CAST(N'2016-04-19 14:06:35.937' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1316, N'R280399260', N'ADDSERVER', N'Request', N'R280399260', N'STATUS07', NULL, NULL, N'trinhhl', CAST(N'2016-04-19 14:06:35.960' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1235, N'R281080894', N'ADDSERVER', N'Request', N'R281080894', N'STATUS04', NULL, NULL, N'manhnh', CAST(N'2016-04-19 13:35:21.407' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1236, N'R281080894', N'ADDSERVER', N'Server', N'S023387396', N'STATUS01', N'S023387396', NULL, N'manhnh', CAST(N'2016-04-19 13:35:21.457' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1237, N'R281080894', N'ADDSERVER', N'Server', N'S333095919', N'STATUS01', N'S333095919', NULL, N'manhnh', CAST(N'2016-04-19 13:35:21.467' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1238, N'R281080894', N'ADDSERVER', N'Server', N'S129156621', N'STATUS01', N'S129156621', NULL, N'manhnh', CAST(N'2016-04-19 13:35:21.473' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1239, N'R281080894', N'ADDSERVER', N'Request', N'R281080894', N'STATUS05', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:41:54.073' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1240, N'R281080894', N'ADDSERVER', N'Request', N'R281080894', N'STATUS06', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:42:00.403' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1241, N'R281080894', N'ADDSERVER', N'Server', N'S023387396', N'STATUS02', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:43:08.673' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1242, N'R281080894', N'ADDSERVER', N'ServerIP', N'116.193.73.2', N'STATUS29', N'S023387396', NULL, N'haltt', CAST(N'2016-04-19 13:43:08.710' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1243, N'R281080894', N'ADDSERVER', N'IPAddress', N'116.193.73.2', N'STATUS11', N'S023387396', NULL, N'haltt', CAST(N'2016-04-19 13:43:08.720' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1244, N'R281080894', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:43:08.730' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1245, N'R281080894', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:43:08.740' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1246, N'R281080894', N'ADDSERVER', N'Server', N'S333095919', N'STATUS02', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:43:08.760' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1247, N'R281080894', N'ADDSERVER', N'ServerIP', N'120.72.90.1', N'STATUS29', N'S333095919', NULL, N'haltt', CAST(N'2016-04-19 13:43:08.780' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1248, N'R281080894', N'ADDSERVER', N'IPAddress', N'120.72.90.1', N'STATUS11', N'S333095919', NULL, N'haltt', CAST(N'2016-04-19 13:43:08.790' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1249, N'R281080894', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:43:08.797' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1250, N'R281080894', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:43:08.810' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1251, N'R281080894', N'ADDSERVER', N'Server', N'S129156621', N'STATUS02', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:43:08.830' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1252, N'R281080894', N'ADDSERVER', N'ServerIP', N'116.193.73.10', N'STATUS29', N'S129156621', NULL, N'haltt', CAST(N'2016-04-19 13:43:08.850' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1253, N'R281080894', N'ADDSERVER', N'IPAddress', N'116.193.73.10', N'STATUS11', N'S129156621', NULL, N'haltt', CAST(N'2016-04-19 13:43:08.860' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1254, N'R281080894', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:43:08.870' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1255, N'R281080894', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:43:08.877' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1256, N'R281080894', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:43:08.890' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1257, N'R281080894', N'ADDSERVER', N'Location', NULL, N'STATUS14', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:43:08.900' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1258, N'R281080894', N'ADDSERVER', N'Request', N'R281080894', N'STATUS07', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:43:08.923' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1259, N'R401676612', N'ADDSERVER', N'Request', N'R401676612', N'STATUS04', NULL, NULL, N'manhnh', CAST(N'2016-04-19 13:53:09.187' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1260, N'R401676612', N'ADDSERVER', N'Server', N'S221563986', N'STATUS01', N'S221563986', NULL, N'manhnh', CAST(N'2016-04-19 13:53:09.237' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1261, N'R401676612', N'ADDSERVER', N'Server', N'S221563986', N'STATUS03', NULL, NULL, N'manhnh', CAST(N'2016-04-19 13:53:15.607' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1262, N'R401676612', N'ADDSERVER', N'Request', N'R401676612', N'STATUS08', NULL, NULL, N'manhnh', CAST(N'2016-04-19 13:53:15.633' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1263, NULL, NULL, N'TaskList', N'Generate assigned shift', NULL, NULL, NULL, NULL, CAST(N'2016-04-19 13:53:22.067' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1264, N'R274144220', N'BASERVER', N'Request', N'R274144220', N'STATUS04', NULL, NULL, N'manhnh', CAST(N'2016-04-19 13:53:43.583' AS DateTime), N'[None]', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1265, N'R274144220', N'BASERVER', N'ServerIP', N'116.193.73.2', N'STATUS30', N'S023387396', NULL, N'manhnh', CAST(N'2016-04-19 13:53:43.650' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1266, N'R274144220', N'BASERVER', N'Server', N'S023387396', N'STATUS34', NULL, NULL, N'manhnh', CAST(N'2016-04-19 13:53:43.677' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1267, N'R274144220', N'BASERVER', N'Location', N'A1U41', N'STATUS14', NULL, NULL, N'manhnh', CAST(N'2016-04-19 13:53:43.693' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1268, N'R274144220', N'BASERVER', N'Location', N'A1U42', N'STATUS14', NULL, NULL, N'manhnh', CAST(N'2016-04-19 13:53:43.707' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1269, N'R551102690', N'ASSIGNIP', N'Request', N'R551102690', N'STATUS04', N'S333095919', NULL, N'manhnh', CAST(N'2016-04-19 13:54:18.230' AS DateTime), N'{"NumberOfIp":4,"Description":"[None]","NumberOfRack":0}', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1270, N'R252889581', N'RENTRACK', N'Request', N'R252889581', N'STATUS04', NULL, NULL, N'manhnh', CAST(N'2016-04-19 13:54:25.180' AS DateTime), N'{"NumberOfIp":0,"Description":"[None]","NumberOfRack":1}', 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1271, N'R274144220', N'BASERVER', N'Request', N'R274144220', N'STATUS05', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:54:45.237' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1272, N'R274144220', N'RETURNIP', N'ServerIP', N'116.193.73.2', N'STATUS29', N'S023387396', NULL, N'haltt', CAST(N'2016-04-19 13:54:54.317' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1273, N'R274144220', N'BASERVER', N'Server', N'S023387396', N'STATUS02', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:54:54.347' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1274, N'R274144220', N'BASERVER', N'Request', N'R274144220', N'STATUS09', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:54:54.367' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1275, N'R252889581', N'RENTRACK', N'Request', N'R252889581', N'STATUS06', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:55:03.143' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1276, N'R252889581', N'RENTRACK', N'RackOfCustomer', N'C1', N'STATUS26', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:55:14.487' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1277, N'R252889581', N'RENTRACK', N'Rack', N'C1', N'STATUS20', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:55:14.513' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1278, N'R252889581', N'RENTRACK', N'Request', N'R252889581', N'STATUS07', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:55:14.537' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1279, N'R551102690', N'ASSIGNIP', N'Request', N'R551102690', N'STATUS06', NULL, NULL, N'haltt', CAST(N'2016-04-19 13:55:28.947' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1280, N'R551102690', N'ASSIGNIP', N'ServerIP', N'120.72.90.49', N'STATUS29', N'S333095919', NULL, N'haltt', CAST(N'2016-04-19 13:55:41.010' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1281, N'R551102690', N'ASSIGNIP', N'IPAddress', N'120.72.90.49', N'STATUS11', N'S333095919', NULL, N'haltt', CAST(N'2016-04-19 13:55:41.103' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1282, N'R551102690', N'ASSIGNIP', N'ServerIP', N'120.72.90.28', N'STATUS29', N'S333095919', NULL, N'haltt', CAST(N'2016-04-19 13:55:41.143' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1283, N'R551102690', N'ASSIGNIP', N'IPAddress', N'120.72.90.28', N'STATUS11', N'S333095919', NULL, N'haltt', CAST(N'2016-04-19 13:55:41.200' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1284, N'R551102690', N'ASSIGNIP', N'ServerIP', N'120.72.90.58', N'STATUS29', N'S333095919', NULL, N'haltt', CAST(N'2016-04-19 13:55:41.243' AS DateTime), NULL, 0)
INSERT [dbo].[Log] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (1285, N'R551102690', N'ASSIGNIP', N'IPAddress', N'120.72.90.58', N'STATUS11', N'S333095919', NULL, N'haltt', CAST(N'2016-04-19 13:55:41.273' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Log] OFF
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1052, N'N601795167', N'R281080894', N'Request', N'haltt', N'Request Add Server from Nguyễn Hùng Mạnh', 1, CAST(N'2016-04-19 13:35:21.510' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1053, N'N054690387', N'R281080894', N'Request', N'manhnh', N'Request Add Server is accepted!', 1, CAST(N'2016-04-19 13:41:54.117' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1054, N'N323874214', N'R281080894', N'Request', N'manhnh', N'Request Add Server is DONE!', 1, CAST(N'2016-04-19 13:43:08.977' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1055, N'N060065015', N'R401676612', N'Request', N'haltt', N'Request Add Server from Nguyễn Hùng Mạnh', 1, CAST(N'2016-04-19 13:53:09.277' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1056, N'N379767801', N'R401676612', N'Request', N'haltt', N'Customer Nguyễn Hùng Mạnh cancelled Request Add Server', 1, CAST(N'2016-04-19 13:53:15.667' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1057, N'N526798688', N'R274144220', N'Request', N'haltt', N'Request Bring Server Away from Nguyễn Hùng Mạnh', 1, CAST(N'2016-04-19 13:53:43.727' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1058, N'N221978181', N'R551102690', N'Request', N'haltt', N'Request Assign IP from Nguyễn Hùng Mạnh', 1, CAST(N'2016-04-19 13:54:18.280' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1059, N'N021721286', N'R252889581', N'Request', N'haltt', N'Request Rent Rack from Nguyễn Hùng Mạnh', 1, CAST(N'2016-04-19 13:54:25.213' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1060, N'N571316421', N'R274144220', N'Request', N'manhnh', N'Request Bring Server Away is accepted!', 1, CAST(N'2016-04-19 13:54:45.250' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1061, N'N321312310', N'R274144220', N'Request', N'manhnh', N'Request Bring Server Away is REJECTED! Because ', 1, CAST(N'2016-04-19 13:54:54.437' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1062, N'N089007024', N'R252889581', N'Request', N'manhnh', N'Request Rent Rack is accepted!', 1, CAST(N'2016-04-19 13:55:03.160' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1063, N'N703756198', N'R252889581', N'Request', N'manhnh', N'Request Rent Rack is DONE!', 1, CAST(N'2016-04-19 13:55:14.567' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1064, N'N994219837', N'R551102690', N'Request', N'manhnh', N'Request Assign IP is accepted!', 1, CAST(N'2016-04-19 13:55:28.970' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1065, N'N800303598', N'R551102690', N'Request', N'manhnh', N'Request Assign IP is DONE!', 1, CAST(N'2016-04-19 13:55:41.403' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1066, N'N559155989', N'R334591687', N'Request', N'haltt', N'Request Change IP from Nguyễn Hùng Mạnh', 1, CAST(N'2016-04-19 13:56:49.280' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1067, N'N902761531', N'R334591687', N'Request', N'manhnh', N'Request Change IP is accepted!', 1, CAST(N'2016-04-19 13:57:18.083' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1068, N'N043989564', N'R334591687', N'Request', N'manhnh', N'Request Change IP is DONE!', 1, CAST(N'2016-04-19 13:57:26.103' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1069, N'N386112713', N'R280399260', N'Request', N'dunglh', N'Request Add Server from Trần Long', 0, CAST(N'2016-04-19 14:02:07.413' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1070, N'N263718749', N'R280399260', N'Request', N'longt', N'Request Add Server is accepted!', 0, CAST(N'2016-04-19 14:04:30.120' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1071, N'N326732830', N'R280399260', N'Task', N'trinhhl', N'You have a new task', 1, CAST(N'2016-04-19 14:04:34.090' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1072, N'N211683374', N'R280399260', N'Task', N'haltt', N'Lê Hồng Trịnh starts PROCESSING request Add server', 1, CAST(N'2016-04-19 14:05:15.907' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1073, N'N627976258', N'R280399260', N'Request', N'longt', N'Request Add Server is DONE!', 0, CAST(N'2016-04-19 14:06:35.993' AS DateTime))
SET IDENTITY_INSERT [dbo].[Notification] OFF
SET IDENTITY_INSERT [dbo].[Rack] ON 

INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (13, N'R995751', N'A1', N'STATUS33', CAST(N'2016-04-19 13:14:39.193' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (14, N'R213026', N'A2', N'STATUS33', CAST(N'2016-04-19 13:14:42.517' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (15, N'R551474', N'A3', N'STATUS19', CAST(N'2016-04-19 13:14:47.847' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (16, N'R680338', N'B1', N'STATUS33', CAST(N'2016-04-19 13:14:52.053' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (17, N'R715320', N'B2', N'STATUS19', CAST(N'2016-04-19 13:15:03.840' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (18, N'R118035', N'B3', N'STATUS19', CAST(N'2016-04-19 13:17:45.123' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (19, N'R867383', N'C1', N'STATUS20', CAST(N'2016-04-19 13:18:51.287' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (20, N'R835542', N'C2', N'STATUS19', CAST(N'2016-04-19 13:19:05.850' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (21, N'R916764', N'C3', N'STATUS19', CAST(N'2016-04-19 13:19:19.573' AS DateTime), 10, NULL)
SET IDENTITY_INSERT [dbo].[Rack] OFF
SET IDENTITY_INSERT [dbo].[RackOfCustomer] ON 

INSERT [dbo].[RackOfCustomer] ([Id], [RackCode], [Customer], [RentedDate], [StatusCode], [PreviousId]) VALUES (1, N'R867383', N'manhnh', CAST(N'2016-04-19 13:55:14.410' AS DateTime), N'STATUS26', 0)
SET IDENTITY_INSERT [dbo].[RackOfCustomer] OFF
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (1021, N'R281080894', N'RT003', N'manhnh', CAST(N'2016-04-20 13:00:00.000' AS DateTime), N'[None]', CAST(N'2016-04-19 13:43:08.917' AS DateTime), N'STATUS07', 0, N'haltt', NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (1022, N'R401676612', N'RT003', N'manhnh', CAST(N'2016-04-21 14:00:00.000' AS DateTime), N'[None]', CAST(N'2016-04-19 13:53:15.623' AS DateTime), N'STATUS08', 0, NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (1023, N'R274144220', N'RT007', N'manhnh', CAST(N'2016-04-19 17:00:00.000' AS DateTime), N'[None]', CAST(N'2016-04-19 13:54:54.357' AS DateTime), N'STATUS09', 0, N'haltt', NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (1024, N'R551102690', N'RT009', N'manhnh', NULL, N'{"NumberOfIp":4,"Description":"[None]","NumberOfRack":0}', CAST(N'2016-04-19 13:55:41.347' AS DateTime), N'STATUS07', 0, N'haltt', NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (1025, N'R252889581', N'RT011', N'manhnh', NULL, N'{"NumberOfIp":0,"Description":"[None]","NumberOfRack":1}', CAST(N'2016-04-19 13:55:14.527' AS DateTime), N'STATUS07', 0, N'haltt', NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (1026, N'R334591687', N'RT008', N'manhnh', NULL, N'change 25,28', CAST(N'2016-04-19 13:57:26.057' AS DateTime), N'STATUS07', 0, N'haltt', NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (1027, N'R280399260', N'RT003', N'longt', CAST(N'2016-04-21 14:00:00.000' AS DateTime), N'[None]', CAST(N'2016-04-19 14:06:35.950' AS DateTime), N'STATUS07', 0, N'trinhhl', NULL)
SET IDENTITY_INSERT [dbo].[Request] OFF
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
SET IDENTITY_INSERT [dbo].[Server] ON 

INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (16, N'S023387396', N'manhnh', NULL, NULL, 500, 2, N'STATUS02', N'116.193.73.2', CAST(N'2016-04-19 13:35:21.443' AS DateTime), NULL, N'100Mbps', N'143325324', N'123134235')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (17, N'S333095919', N'manhnh', NULL, NULL, 600, 2, N'STATUS02', N'120.72.90.1', CAST(N'2016-04-19 13:35:21.463' AS DateTime), NULL, N'100Mbps', N'24324562', N'21314235')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (18, N'S129156621', N'manhnh', NULL, NULL, 750, 4, N'STATUS02', N'116.193.73.10', CAST(N'2016-04-19 13:35:21.470' AS DateTime), NULL, N'1Gbps', N'2342345', N'234345345')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (19, N'S221563986', N'manhnh', NULL, NULL, 800, 4, N'STATUS03', NULL, CAST(N'2016-04-19 13:53:09.213' AS DateTime), NULL, N'1Gbps', N'23425345', N'14253453')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (20, N'S208634214', N'longt', NULL, NULL, 550, 1, N'STATUS02', N'202.78.227.5', CAST(N'2016-04-19 14:02:07.350' AS DateTime), NULL, N'100Mbps', N'2134234234', N'42342353245')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (21, N'S139351114', N'longt', NULL, NULL, 600, 2, N'STATUS02', N'116.193.73.12', CAST(N'2016-04-19 14:02:07.380' AS DateTime), NULL, N'1Gbps', N'234253454', N'23435345')
SET IDENTITY_INSERT [dbo].[Server] OFF
SET IDENTITY_INSERT [dbo].[ServerIP] ON 

INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (51, N'S023387396', N'116.193.73.2', N'STATUS29', CAST(N'2016-04-19 13:43:08.687' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (52, N'S333095919', N'120.72.90.1', N'STATUS29', CAST(N'2016-04-19 13:43:08.770' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (53, N'S129156621', N'116.193.73.10', N'STATUS29', CAST(N'2016-04-19 13:43:08.840' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (54, N'S333095919', N'120.72.90.49', N'STATUS29', CAST(N'2016-04-19 13:55:40.943' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (55, N'S333095919', N'120.72.90.28', N'STATUS31', CAST(N'2016-04-19 13:55:41.123' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (56, N'S333095919', N'120.72.90.58', N'STATUS29', CAST(N'2016-04-19 13:55:41.227' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (57, N'S333095919', N'120.72.90.25', N'STATUS31', CAST(N'2016-04-19 13:55:41.287' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (58, N'S333095919', N'120.72.90.18', N'STATUS29', CAST(N'2016-04-19 13:57:25.903' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (59, N'S333095919', N'120.72.90.56', N'STATUS29', CAST(N'2016-04-19 13:57:25.993' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (60, N'S208634214', N'202.78.227.5', N'STATUS29', CAST(N'2016-04-19 14:06:35.777' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (61, N'S139351114', N'116.193.73.12', N'STATUS29', CAST(N'2016-04-19 14:06:35.890' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[ServerIP] OFF
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
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([Id], [TaskCode], [ShiftHead], [AssignedStaff], [PreAssignedStaff], [RequestCode], [StatusCode], [AssignedTime], [Comment]) VALUES (15, N'T637325487', N'haltt', N'haltt', NULL, N'R281080894', N'STATUS17', CAST(N'2016-04-19 13:42:00.433' AS DateTime), NULL)
INSERT [dbo].[Task] ([Id], [TaskCode], [ShiftHead], [AssignedStaff], [PreAssignedStaff], [RequestCode], [StatusCode], [AssignedTime], [Comment]) VALUES (16, N'T239926372', N'haltt', N'haltt', NULL, N'R252889581', N'STATUS17', CAST(N'2016-04-19 13:55:03.177' AS DateTime), NULL)
INSERT [dbo].[Task] ([Id], [TaskCode], [ShiftHead], [AssignedStaff], [PreAssignedStaff], [RequestCode], [StatusCode], [AssignedTime], [Comment]) VALUES (17, N'T755116816', N'haltt', N'haltt', NULL, N'R551102690', N'STATUS17', CAST(N'2016-04-19 13:55:28.990' AS DateTime), NULL)
INSERT [dbo].[Task] ([Id], [TaskCode], [ShiftHead], [AssignedStaff], [PreAssignedStaff], [RequestCode], [StatusCode], [AssignedTime], [Comment]) VALUES (18, N'T545447609', N'haltt', N'haltt', NULL, N'R334591687', N'STATUS17', CAST(N'2016-04-19 13:57:18.100' AS DateTime), NULL)
INSERT [dbo].[Task] ([Id], [TaskCode], [ShiftHead], [AssignedStaff], [PreAssignedStaff], [RequestCode], [StatusCode], [AssignedTime], [Comment]) VALUES (19, N'T477393151', N'haltt', N'trinhhl', NULL, N'R280399260', N'STATUS17', CAST(N'2016-04-19 14:04:34.073' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Task] OFF
SET IDENTITY_INSERT [dbo].[TempRequest] ON 

INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (21, N'T917330203', N'R281080894', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"manhnh","Maker":null,"Model":null,"Power":500,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"100Mbps","PartNumber":"143325324","SerialNumber":"123134235","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (22, N'T985614230', N'R281080894', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"manhnh","Maker":null,"Model":null,"Power":600,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"100Mbps","PartNumber":"24324562","SerialNumber":"21314235","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (23, N'T428107333', N'R281080894', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"manhnh","Maker":null,"Model":null,"Power":750,"Size":4,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"1Gbps","PartNumber":"2342345","SerialNumber":"234345345","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (24, N'T589259720', N'R401676612', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"manhnh","Maker":null,"Model":null,"Power":800,"Size":4,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"1Gbps","PartNumber":"23425345","SerialNumber":"14253453","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (25, N'T613254835', N'R280399260', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"longt","Maker":null,"Model":null,"Power":550,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"100Mbps","PartNumber":"2134234234","SerialNumber":"42342353245","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (26, N'T112891001', N'R280399260', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"longt","Maker":null,"Model":null,"Power":600,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"1Gbps","PartNumber":"234253454","SerialNumber":"23435345","Id":0}')
SET IDENTITY_INSERT [dbo].[TempRequest] OFF
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
