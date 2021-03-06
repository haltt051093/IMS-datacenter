USE [master]
GO
/****** Object:  Database [IMS]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[AssignedShift]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[Attribute]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 3/25/2016 3:16:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IPAddressPool]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[Location]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[Log]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[Note]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[Object]    Script Date: 3/25/2016 3:16:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Object](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Object] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rack]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[RackOfCustomer]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[RequestType]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 3/25/2016 3:16:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Server]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[ServerAttribute]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[ServerIP]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[Shift]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[Task]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[TempRequest]    Script Date: 3/25/2016 3:16:32 PM ******/
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
/****** Object:  Table [dbo].[TypeOfLog]    Script Date: 3/25/2016 3:16:32 PM ******/
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

INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (6, N'anndh', N'123', N'Manager', 1, N'Ngô Đăng Hà An', N'0964356773', N'sdfsfsdfsdf@email.com', N'Quận 7', N'324578023', N'Admin', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (2, N'haltt', N'123', N'Shift Head', 1, N'Lê Thi Thu Hà', N'0912345679', N'thuha051093@gmail.com', N'4/33 Văn Chung', N'331717456', N'Group 1', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (11, N'hieultt', N'BEXHNP', N'Customer', 1, N'Lê Trần Trung Hiếu', N'0912345679', N'letrantrunghieu@gmail.com', N'4/33 Văn Chung', N'3134567936', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (12, N'hungnh', N'123', N'Shift Head', 1, N'Nguyễn Huy Hùng', N'0912345672', N'hungnh@fpt.edu.vn', N'Quận 7', N'3134567938', N'Group 2', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (5, N'manhnh', N'123', N'Customer', 1, N'Nguyễn Hùng Mạnh', N'0945683220', N'manhnguyen@gmail.com', N'Phạm Văn Hai, Tân Bình, Hồ Chí Minh', N'339867411', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (4, N'namch', N'123', N'Staff', 1, N'Cao Hồng Nam', N'0933412886', N'namcao@gmail.com', N'Nha Trang', N'331818933', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (8, N'namnt', N'123', N'Customer', 1, N'Nguyễn Trung Nam', N'0965834779', N'namnt@gmail.com', N'Quận 9, Hồ Chí Minh', N'378990467', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (9, N'nhink', N'123', N'Staff', 0, N'Nguyễn Khả Nhi', N'0974456331', N'nhink@gmail.com', N'Quận 3, Hồ Chí Minh', N'356789002', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (10, N'phuoclh', N'1234', N'Shift Head', 0, N'Lâm Hữu Phước', N'dgffdfedf', N'phuochl@gmail.com', N'Quận Phú Nhuận, Hồ Chí Minh', N'3134567931', N'Group 2', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (3, N'tienhl', N'123', N'Shift Head', 1, N'Huỳnh Lâm Hà Tiên', N'0935678002', N'tienhuynh@gmail.com', N'Gò Vấp', N'331789456', N'Group 4', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (7, N'thaohq', N'123', N'Customer', 1, N'Huỳnh Quang Thảo', N'0967345813', N'thaohq@gmail.com', N'Quận 1, Hồ Chí Minh', N'331783556', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (17, N'quyenttt', N'123', N'Staff', 1, N'Truyền Thanh Thảo Quyên', N'0933412883', N'truyenthanhthaoquyen@gmail.com', N'Lý Thường Kiệt, Quận 10', N'331717499', N'Group 4', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (15, N'haovtm', N'HWSADFQXWL', N'Staff', 1, N'Vũ Thị Mỹ Hảo', N'0943245890', N'haovtm@gmail.com', N'Quận 9, Hồ Chí Minh, Việt Nam', N'3134567922', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (18, N'thanhnd', N'PSWSYQOLTT', N'Customer', 1, N'Nguyễn Duy Thanh', N'0912345654', N'nguyenduythanh@gmail.com', N'Quận Bình Thạnh', N'3134567531', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1018, N'halt', N'MSTMOEYBBN', N'Staff', 1, N'Lê Thu Hà', N'0933412888', N'thuha051093@gmail.com', N'Quận 7', N'331717457', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1019, N'bichtt', N'123', N'Shift Head', 1, N'Trần Thị Bích', N'01689808484', N'thuha051093@gmail.com', N'Bà Rịa', N'324561422', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1020, N'trinhhl', N'123', N'Staff', 1, N'Lê Hồng Trịnh', N'0912345632', N'thuha051093@gmail.com', N'Quận 1', N'240818499', N'Group 1', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1021, N'dunglh', N'123', N'Staff', 1, N'Lý Hoàng Dũng', N'0964235623', N'lyhoangdung@gmail.com', N'Quận Bình Thạnh', N'3134567932', N'Group 1', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1022, N'bangnn', N'GSTFBFUDMR', N'Customer', 1, N'Nguyen Ngoc Bang', N'0912345675', N'thuha051093@gmail.com', N'Tan Binh', N'345646575467', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1023, N'trungnh', N'TXMFEMWEFL', N'Customer', 1, N'Nguyen Hoang Trung', N'0912345674', N'thuha051093@gmail.com', N'Tan Binh', N'2314235345345', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1024, N'Baont', N'GMEHAPMOSG', N'Customer', 1, N'Nguyen The Bao', N'0912345670', N'thuha051093@gmail.com', N'Tan Binh', N'253452323454', N'Customer', NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[AssignedShift] ON 

INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (355, N'Shift 1', N'Group 1', CAST(N'2016-02-22 06:00:00.000' AS DateTime), CAST(N'2016-02-22 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (356, N'Shift 2', N'Group 2', CAST(N'2016-02-22 14:00:00.000' AS DateTime), CAST(N'2016-02-22 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (357, N'Shift 3', N'Group 3', CAST(N'2016-02-22 22:00:00.000' AS DateTime), CAST(N'2016-02-23 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (358, N'Shift 1', N'Group 4', CAST(N'2016-02-23 06:00:00.000' AS DateTime), CAST(N'2016-02-23 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (359, N'Shift 2', N'Group 1', CAST(N'2016-02-23 14:00:00.000' AS DateTime), CAST(N'2016-02-23 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (360, N'Shift 3', N'Group 2', CAST(N'2016-02-23 22:00:00.000' AS DateTime), CAST(N'2016-02-24 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (361, N'Shift 1', N'Group 3', CAST(N'2016-02-24 06:00:00.000' AS DateTime), CAST(N'2016-02-24 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (362, N'Shift 2', N'Group 4', CAST(N'2016-02-24 14:00:00.000' AS DateTime), CAST(N'2016-02-24 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (363, N'Shift 3', N'Group 1', CAST(N'2016-02-24 22:00:00.000' AS DateTime), CAST(N'2016-02-25 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (364, N'Shift 1', N'Group 2', CAST(N'2016-02-25 06:00:00.000' AS DateTime), CAST(N'2016-02-25 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (365, N'Shift 2', N'Group 3', CAST(N'2016-02-25 14:00:00.000' AS DateTime), CAST(N'2016-02-25 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (366, N'Shift 3', N'Group 4', CAST(N'2016-02-25 22:00:00.000' AS DateTime), CAST(N'2016-02-26 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (367, N'Shift 1', N'Group 1', CAST(N'2016-02-26 06:00:00.000' AS DateTime), CAST(N'2016-02-26 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (368, N'Shift 2', N'Group 2', CAST(N'2016-02-26 14:00:00.000' AS DateTime), CAST(N'2016-02-26 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (369, N'Shift 3', N'Group 3', CAST(N'2016-02-26 22:00:00.000' AS DateTime), CAST(N'2016-02-27 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (370, N'Shift 1', N'Group 4', CAST(N'2016-02-27 06:00:00.000' AS DateTime), CAST(N'2016-02-27 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (371, N'Shift 2', N'Group 1', CAST(N'2016-02-27 14:00:00.000' AS DateTime), CAST(N'2016-02-27 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (372, N'Shift 3', N'Group 2', CAST(N'2016-02-27 22:00:00.000' AS DateTime), CAST(N'2016-02-28 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (373, N'Shift 1', N'Group 3', CAST(N'2016-02-28 06:00:00.000' AS DateTime), CAST(N'2016-02-28 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (374, N'Shift 2', N'Group 4', CAST(N'2016-02-28 14:00:00.000' AS DateTime), CAST(N'2016-02-28 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (375, N'Shift 3', N'Group 1', CAST(N'2016-02-28 22:00:00.000' AS DateTime), CAST(N'2016-02-29 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (376, N'Shift 1', N'Group 2', CAST(N'2016-02-29 06:00:00.000' AS DateTime), CAST(N'2016-02-29 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (377, N'Shift 2', N'Group 3', CAST(N'2016-02-29 14:00:00.000' AS DateTime), CAST(N'2016-02-29 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (378, N'Shift 3', N'Group 4', CAST(N'2016-02-29 22:00:00.000' AS DateTime), CAST(N'2016-03-01 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (379, N'Shift 1', N'Group 1', CAST(N'2016-03-01 06:00:00.000' AS DateTime), CAST(N'2016-03-01 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (380, N'Shift 2', N'Group 2', CAST(N'2016-03-01 14:00:00.000' AS DateTime), CAST(N'2016-03-01 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (381, N'Shift 3', N'Group 3', CAST(N'2016-03-01 22:00:00.000' AS DateTime), CAST(N'2016-03-02 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (382, N'Shift 1', N'Group 4', CAST(N'2016-03-02 06:00:00.000' AS DateTime), CAST(N'2016-03-02 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (383, N'Shift 2', N'Group 1', CAST(N'2016-03-02 14:00:00.000' AS DateTime), CAST(N'2016-03-02 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (384, N'Shift 3', N'Group 2', CAST(N'2016-03-02 22:00:00.000' AS DateTime), CAST(N'2016-03-03 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (385, N'Shift 1', N'Group 3', CAST(N'2016-03-03 06:00:00.000' AS DateTime), CAST(N'2016-03-03 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (386, N'Shift 2', N'Group 4', CAST(N'2016-03-03 14:00:00.000' AS DateTime), CAST(N'2016-03-03 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (387, N'Shift 3', N'Group 1', CAST(N'2016-03-03 22:00:00.000' AS DateTime), CAST(N'2016-03-04 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (388, N'Shift 1', N'Group 2', CAST(N'2016-03-04 06:00:00.000' AS DateTime), CAST(N'2016-03-04 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (389, N'Shift 2', N'Group 3', CAST(N'2016-03-04 14:00:00.000' AS DateTime), CAST(N'2016-03-04 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (390, N'Shift 3', N'Group 4', CAST(N'2016-03-04 22:00:00.000' AS DateTime), CAST(N'2016-03-05 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (391, N'Shift 1', N'Group 1', CAST(N'2016-03-05 06:00:00.000' AS DateTime), CAST(N'2016-03-05 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (392, N'Shift 2', N'Group 2', CAST(N'2016-03-05 14:00:00.000' AS DateTime), CAST(N'2016-03-05 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (393, N'Shift 3', N'Group 3', CAST(N'2016-03-05 22:00:00.000' AS DateTime), CAST(N'2016-03-06 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (394, N'Shift 1', N'Group 4', CAST(N'2016-03-06 06:00:00.000' AS DateTime), CAST(N'2016-03-06 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (395, N'Shift 2', N'Group 1', CAST(N'2016-03-06 14:00:00.000' AS DateTime), CAST(N'2016-03-06 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (396, N'Shift 3', N'Group 2', CAST(N'2016-03-06 22:00:00.000' AS DateTime), CAST(N'2016-03-07 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (397, N'Shift 1', N'Group 3', CAST(N'2016-03-07 06:00:00.000' AS DateTime), CAST(N'2016-03-07 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (398, N'Shift 2', N'Group 4', CAST(N'2016-03-07 14:00:00.000' AS DateTime), CAST(N'2016-03-07 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (399, N'Shift 3', N'Group 1', CAST(N'2016-03-07 22:00:00.000' AS DateTime), CAST(N'2016-03-08 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (400, N'Shift 1', N'Group 2', CAST(N'2016-03-08 06:00:00.000' AS DateTime), CAST(N'2016-03-08 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (401, N'Shift 2', N'Group 3', CAST(N'2016-03-08 14:00:00.000' AS DateTime), CAST(N'2016-03-08 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (402, N'Shift 3', N'Group 4', CAST(N'2016-03-08 22:00:00.000' AS DateTime), CAST(N'2016-03-09 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (403, N'Shift 1', N'Group 1', CAST(N'2016-03-09 06:00:00.000' AS DateTime), CAST(N'2016-03-09 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (404, N'Shift 2', N'Group 2', CAST(N'2016-03-09 14:00:00.000' AS DateTime), CAST(N'2016-03-09 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (405, N'Shift 3', N'Group 3', CAST(N'2016-03-09 22:00:00.000' AS DateTime), CAST(N'2016-03-10 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (406, N'Shift 1', N'Group 4', CAST(N'2016-03-10 06:00:00.000' AS DateTime), CAST(N'2016-03-10 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (407, N'Shift 2', N'Group 1', CAST(N'2016-03-10 14:00:00.000' AS DateTime), CAST(N'2016-03-10 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (408, N'Shift 3', N'Group 2', CAST(N'2016-03-10 22:00:00.000' AS DateTime), CAST(N'2016-03-11 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (409, N'Shift 1', N'Group 3', CAST(N'2016-03-11 06:00:00.000' AS DateTime), CAST(N'2016-03-11 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (410, N'Shift 2', N'Group 4', CAST(N'2016-03-11 14:00:00.000' AS DateTime), CAST(N'2016-03-11 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (411, N'Shift 3', N'Group 1', CAST(N'2016-03-11 22:00:00.000' AS DateTime), CAST(N'2016-03-12 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (412, N'Shift 1', N'Group 2', CAST(N'2016-03-12 06:00:00.000' AS DateTime), CAST(N'2016-03-12 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (413, N'Shift 2', N'Group 3', CAST(N'2016-03-12 14:00:00.000' AS DateTime), CAST(N'2016-03-12 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (414, N'Shift 3', N'Group 4', CAST(N'2016-03-12 22:00:00.000' AS DateTime), CAST(N'2016-03-13 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (415, N'Shift 1', N'Group 1', CAST(N'2016-03-13 06:00:00.000' AS DateTime), CAST(N'2016-03-13 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (416, N'Shift 2', N'Group 2', CAST(N'2016-03-13 14:00:00.000' AS DateTime), CAST(N'2016-03-13 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (417, N'Shift 3', N'Group 3', CAST(N'2016-03-13 22:00:00.000' AS DateTime), CAST(N'2016-03-14 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (418, N'Shift 1', N'Group 4', CAST(N'2016-03-14 06:00:00.000' AS DateTime), CAST(N'2016-03-14 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (419, N'Shift 2', N'Group 1', CAST(N'2016-03-14 14:00:00.000' AS DateTime), CAST(N'2016-03-14 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (420, N'Shift 3', N'Group 2', CAST(N'2016-03-14 22:00:00.000' AS DateTime), CAST(N'2016-03-15 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (421, N'Shift 1', N'Group 3', CAST(N'2016-03-15 06:00:00.000' AS DateTime), CAST(N'2016-03-15 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (422, N'Shift 2', N'Group 4', CAST(N'2016-03-15 14:00:00.000' AS DateTime), CAST(N'2016-03-15 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (423, N'Shift 3', N'Group 1', CAST(N'2016-03-15 22:00:00.000' AS DateTime), CAST(N'2016-03-16 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (424, N'Shift 1', N'Group 2', CAST(N'2016-03-16 06:00:00.000' AS DateTime), CAST(N'2016-03-16 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (425, N'Shift 2', N'Group 3', CAST(N'2016-03-16 14:00:00.000' AS DateTime), CAST(N'2016-03-16 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (426, N'Shift 3', N'Group 4', CAST(N'2016-03-16 22:00:00.000' AS DateTime), CAST(N'2016-03-17 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (427, N'Shift 1', N'Group 1', CAST(N'2016-03-17 06:00:00.000' AS DateTime), CAST(N'2016-03-17 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (428, N'Shift 2', N'Group 2', CAST(N'2016-03-17 14:00:00.000' AS DateTime), CAST(N'2016-03-17 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (429, N'Shift 3', N'Group 3', CAST(N'2016-03-17 22:00:00.000' AS DateTime), CAST(N'2016-03-18 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (430, N'Shift 1', N'Group 4', CAST(N'2016-03-18 06:00:00.000' AS DateTime), CAST(N'2016-03-18 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (431, N'Shift 2', N'Group 1', CAST(N'2016-03-18 14:00:00.000' AS DateTime), CAST(N'2016-03-18 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (432, N'Shift 3', N'Group 2', CAST(N'2016-03-18 22:00:00.000' AS DateTime), CAST(N'2016-03-19 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (433, N'Shift 1', N'Group 3', CAST(N'2016-03-19 06:00:00.000' AS DateTime), CAST(N'2016-03-19 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (434, N'Shift 2', N'Group 4', CAST(N'2016-03-19 14:00:00.000' AS DateTime), CAST(N'2016-03-19 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (435, N'Shift 3', N'Group 1', CAST(N'2016-03-19 22:00:00.000' AS DateTime), CAST(N'2016-03-20 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (436, N'Shift 1', N'Group 2', CAST(N'2016-03-20 06:00:00.000' AS DateTime), CAST(N'2016-03-20 14:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (437, N'Shift 2', N'Group 3', CAST(N'2016-03-20 14:00:00.000' AS DateTime), CAST(N'2016-03-20 22:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (438, N'Shift 3', N'Group 4', CAST(N'2016-03-20 22:00:00.000' AS DateTime), CAST(N'2016-03-21 06:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (439, N'Shift 1', N'Group 1', CAST(N'2016-03-22 04:00:00.000' AS DateTime), CAST(N'2016-03-22 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (440, N'Shift 2', N'Group 2', CAST(N'2016-03-22 12:00:00.000' AS DateTime), CAST(N'2016-03-22 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (441, N'Shift 3', N'Group 3', CAST(N'2016-03-22 20:00:00.000' AS DateTime), CAST(N'2016-03-23 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (442, N'Shift 1', N'Group 4', CAST(N'2016-03-23 04:00:00.000' AS DateTime), CAST(N'2016-03-23 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (443, N'Shift 2', N'Group 1', CAST(N'2016-03-23 12:00:00.000' AS DateTime), CAST(N'2016-03-23 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (444, N'Shift 3', N'Group 2', CAST(N'2016-03-23 20:00:00.000' AS DateTime), CAST(N'2016-03-24 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (445, N'Shift 1', N'Group 3', CAST(N'2016-03-24 04:00:00.000' AS DateTime), CAST(N'2016-03-24 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (446, N'Shift 2', N'Group 4', CAST(N'2016-03-24 12:00:00.000' AS DateTime), CAST(N'2016-03-24 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (447, N'Shift 3', N'Group 1', CAST(N'2016-03-24 20:00:00.000' AS DateTime), CAST(N'2016-03-25 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (448, N'Shift 1', N'Group 2', CAST(N'2016-03-25 04:00:00.000' AS DateTime), CAST(N'2016-03-25 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (449, N'Shift 2', N'Group 3', CAST(N'2016-03-25 12:00:00.000' AS DateTime), CAST(N'2016-03-25 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (450, N'Shift 3', N'Group 4', CAST(N'2016-03-25 20:00:00.000' AS DateTime), CAST(N'2016-03-26 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (451, N'Shift 1', N'Group 1', CAST(N'2016-03-26 04:00:00.000' AS DateTime), CAST(N'2016-03-26 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (452, N'Shift 2', N'Group 2', CAST(N'2016-03-26 12:00:00.000' AS DateTime), CAST(N'2016-03-26 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (453, N'Shift 3', N'Group 3', CAST(N'2016-03-26 20:00:00.000' AS DateTime), CAST(N'2016-03-27 04:00:00.000' AS DateTime))
GO
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (454, N'Shift 1', N'Group 4', CAST(N'2016-03-27 04:00:00.000' AS DateTime), CAST(N'2016-03-27 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (455, N'Shift 2', N'Group 1', CAST(N'2016-03-27 12:00:00.000' AS DateTime), CAST(N'2016-03-27 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (456, N'Shift 3', N'Group 2', CAST(N'2016-03-27 20:00:00.000' AS DateTime), CAST(N'2016-03-28 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (457, N'Shift 1', N'Group 3', CAST(N'2016-03-28 04:00:00.000' AS DateTime), CAST(N'2016-03-28 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (458, N'Shift 2', N'Group 4', CAST(N'2016-03-28 12:00:00.000' AS DateTime), CAST(N'2016-03-28 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (459, N'Shift 3', N'Group 1', CAST(N'2016-03-28 20:00:00.000' AS DateTime), CAST(N'2016-03-29 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (460, N'Shift 1', N'Group 2', CAST(N'2016-03-29 04:00:00.000' AS DateTime), CAST(N'2016-03-29 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (461, N'Shift 2', N'Group 3', CAST(N'2016-03-29 12:00:00.000' AS DateTime), CAST(N'2016-03-29 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (462, N'Shift 3', N'Group 4', CAST(N'2016-03-29 20:00:00.000' AS DateTime), CAST(N'2016-03-30 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (463, N'Shift 1', N'Group 1', CAST(N'2016-03-30 04:00:00.000' AS DateTime), CAST(N'2016-03-30 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (464, N'Shift 2', N'Group 2', CAST(N'2016-03-30 12:00:00.000' AS DateTime), CAST(N'2016-03-30 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (465, N'Shift 3', N'Group 3', CAST(N'2016-03-30 20:00:00.000' AS DateTime), CAST(N'2016-03-31 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (466, N'Shift 1', N'Group 4', CAST(N'2016-03-31 04:00:00.000' AS DateTime), CAST(N'2016-03-31 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (467, N'Shift 2', N'Group 1', CAST(N'2016-03-31 12:00:00.000' AS DateTime), CAST(N'2016-03-31 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (468, N'Shift 3', N'Group 2', CAST(N'2016-03-31 20:00:00.000' AS DateTime), CAST(N'2016-04-01 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (469, N'Shift 1', N'Group 3', CAST(N'2016-04-01 04:00:00.000' AS DateTime), CAST(N'2016-04-01 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (470, N'Shift 2', N'Group 4', CAST(N'2016-04-01 12:00:00.000' AS DateTime), CAST(N'2016-04-01 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (471, N'Shift 3', N'Group 1', CAST(N'2016-04-01 20:00:00.000' AS DateTime), CAST(N'2016-04-02 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (472, N'Shift 1', N'Group 2', CAST(N'2016-04-02 04:00:00.000' AS DateTime), CAST(N'2016-04-02 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (473, N'Shift 2', N'Group 3', CAST(N'2016-04-02 12:00:00.000' AS DateTime), CAST(N'2016-04-02 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (474, N'Shift 3', N'Group 4', CAST(N'2016-04-02 20:00:00.000' AS DateTime), CAST(N'2016-04-03 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (475, N'Shift 1', N'Group 1', CAST(N'2016-04-03 04:00:00.000' AS DateTime), CAST(N'2016-04-03 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (476, N'Shift 2', N'Group 2', CAST(N'2016-04-03 12:00:00.000' AS DateTime), CAST(N'2016-04-03 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (477, N'Shift 3', N'Group 3', CAST(N'2016-04-03 20:00:00.000' AS DateTime), CAST(N'2016-04-04 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (478, N'Shift 1', N'Group 4', CAST(N'2016-04-04 04:00:00.000' AS DateTime), CAST(N'2016-04-04 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (479, N'Shift 2', N'Group 1', CAST(N'2016-04-04 12:00:00.000' AS DateTime), CAST(N'2016-04-04 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (480, N'Shift 3', N'Group 2', CAST(N'2016-04-04 20:00:00.000' AS DateTime), CAST(N'2016-04-05 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (481, N'Shift 1', N'Group 3', CAST(N'2016-04-05 04:00:00.000' AS DateTime), CAST(N'2016-04-05 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (482, N'Shift 2', N'Group 4', CAST(N'2016-04-05 12:00:00.000' AS DateTime), CAST(N'2016-04-05 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (483, N'Shift 3', N'Group 1', CAST(N'2016-04-05 20:00:00.000' AS DateTime), CAST(N'2016-04-06 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (484, N'Shift 1', N'Group 2', CAST(N'2016-04-06 04:00:00.000' AS DateTime), CAST(N'2016-04-06 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (485, N'Shift 2', N'Group 3', CAST(N'2016-04-06 12:00:00.000' AS DateTime), CAST(N'2016-04-06 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (486, N'Shift 3', N'Group 4', CAST(N'2016-04-06 20:00:00.000' AS DateTime), CAST(N'2016-04-07 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (487, N'Shift 1', N'Group 1', CAST(N'2016-04-07 04:00:00.000' AS DateTime), CAST(N'2016-04-07 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (488, N'Shift 2', N'Group 2', CAST(N'2016-04-07 12:00:00.000' AS DateTime), CAST(N'2016-04-07 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (489, N'Shift 3', N'Group 3', CAST(N'2016-04-07 20:00:00.000' AS DateTime), CAST(N'2016-04-08 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (490, N'Shift 1', N'Group 4', CAST(N'2016-04-08 04:00:00.000' AS DateTime), CAST(N'2016-04-08 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (491, N'Shift 2', N'Group 1', CAST(N'2016-04-08 12:00:00.000' AS DateTime), CAST(N'2016-04-08 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (492, N'Shift 3', N'Group 2', CAST(N'2016-04-08 20:00:00.000' AS DateTime), CAST(N'2016-04-09 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (493, N'Shift 1', N'Group 3', CAST(N'2016-04-09 04:00:00.000' AS DateTime), CAST(N'2016-04-09 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (494, N'Shift 2', N'Group 4', CAST(N'2016-04-09 12:00:00.000' AS DateTime), CAST(N'2016-04-09 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (495, N'Shift 3', N'Group 1', CAST(N'2016-04-09 20:00:00.000' AS DateTime), CAST(N'2016-04-10 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (496, N'Shift 1', N'Group 2', CAST(N'2016-04-10 04:00:00.000' AS DateTime), CAST(N'2016-04-10 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (497, N'Shift 2', N'Group 3', CAST(N'2016-04-10 12:00:00.000' AS DateTime), CAST(N'2016-04-10 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (498, N'Shift 3', N'Group 4', CAST(N'2016-04-10 20:00:00.000' AS DateTime), CAST(N'2016-04-11 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (499, N'Shift 1', N'Group 1', CAST(N'2016-04-11 04:00:00.000' AS DateTime), CAST(N'2016-04-11 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (500, N'Shift 2', N'Group 2', CAST(N'2016-04-11 12:00:00.000' AS DateTime), CAST(N'2016-04-11 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (501, N'Shift 3', N'Group 3', CAST(N'2016-04-11 20:00:00.000' AS DateTime), CAST(N'2016-04-12 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (502, N'Shift 1', N'Group 4', CAST(N'2016-04-12 04:00:00.000' AS DateTime), CAST(N'2016-04-12 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (503, N'Shift 2', N'Group 1', CAST(N'2016-04-12 12:00:00.000' AS DateTime), CAST(N'2016-04-12 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (504, N'Shift 3', N'Group 2', CAST(N'2016-04-12 20:00:00.000' AS DateTime), CAST(N'2016-04-13 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (505, N'Shift 1', N'Group 3', CAST(N'2016-04-13 04:00:00.000' AS DateTime), CAST(N'2016-04-13 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (506, N'Shift 2', N'Group 4', CAST(N'2016-04-13 12:00:00.000' AS DateTime), CAST(N'2016-04-13 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (507, N'Shift 3', N'Group 1', CAST(N'2016-04-13 20:00:00.000' AS DateTime), CAST(N'2016-04-14 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (508, N'Shift 1', N'Group 2', CAST(N'2016-04-14 04:00:00.000' AS DateTime), CAST(N'2016-04-14 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (509, N'Shift 2', N'Group 3', CAST(N'2016-04-14 12:00:00.000' AS DateTime), CAST(N'2016-04-14 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (510, N'Shift 3', N'Group 4', CAST(N'2016-04-14 20:00:00.000' AS DateTime), CAST(N'2016-04-15 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (511, N'Shift 1', N'Group 1', CAST(N'2016-04-15 04:00:00.000' AS DateTime), CAST(N'2016-04-15 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (512, N'Shift 2', N'Group 2', CAST(N'2016-04-15 12:00:00.000' AS DateTime), CAST(N'2016-04-15 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (513, N'Shift 3', N'Group 3', CAST(N'2016-04-15 20:00:00.000' AS DateTime), CAST(N'2016-04-16 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (514, N'Shift 1', N'Group 4', CAST(N'2016-04-16 04:00:00.000' AS DateTime), CAST(N'2016-04-16 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (515, N'Shift 2', N'Group 1', CAST(N'2016-04-16 12:00:00.000' AS DateTime), CAST(N'2016-04-16 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (516, N'Shift 3', N'Group 2', CAST(N'2016-04-16 20:00:00.000' AS DateTime), CAST(N'2016-04-17 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (517, N'Shift 1', N'Group 3', CAST(N'2016-04-17 04:00:00.000' AS DateTime), CAST(N'2016-04-17 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (518, N'Shift 2', N'Group 4', CAST(N'2016-04-17 12:00:00.000' AS DateTime), CAST(N'2016-04-17 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (519, N'Shift 3', N'Group 1', CAST(N'2016-04-17 20:00:00.000' AS DateTime), CAST(N'2016-04-18 04:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (520, N'Shift 1', N'Group 2', CAST(N'2016-04-18 04:00:00.000' AS DateTime), CAST(N'2016-04-18 12:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (521, N'Shift 2', N'Group 3', CAST(N'2016-04-18 12:00:00.000' AS DateTime), CAST(N'2016-04-18 20:00:00.000' AS DateTime))
INSERT [dbo].[AssignedShift] ([Id], [ShiftCode], [GroupCode], [StartedTime], [EndedTime]) VALUES (522, N'Shift 3', N'Group 4', CAST(N'2016-04-18 20:00:00.000' AS DateTime), CAST(N'2016-04-19 04:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[AssignedShift] OFF
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

INSERT [dbo].[Group] ([Id], [GroupCode]) VALUES (1, N'Group 1')
INSERT [dbo].[Group] ([Id], [GroupCode]) VALUES (2, N'Group 2')
INSERT [dbo].[Group] ([Id], [GroupCode]) VALUES (3, N'Group 3')
INSERT [dbo].[Group] ([Id], [GroupCode]) VALUES (4, N'Group 4')
INSERT [dbo].[Group] ([Id], [GroupCode]) VALUES (5, N'Admin')
INSERT [dbo].[Group] ([Id], [GroupCode]) VALUES (6, N'Customer')
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[Object] ON 

INSERT [dbo].[Object] ([Id], [Object]) VALUES (5, N'Account')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (3, N'IPAddress')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (4, N'Location')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (6, N'Note')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (1, N'Request')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (2, N'Server')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (7, N'StaffAssignment')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (8, N'Rack')
INSERT [dbo].[Object] ([Id], [Object]) VALUES (9, N'ServerAttribute')
SET IDENTITY_INSERT [dbo].[Object] OFF
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
SET IDENTITY_INSERT [dbo].[ServerAttribute] ON 

INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (7, N'SAT003', N'750GB', N'GHJHKRN', N'STATUS23', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (8, N'SAT004', N'6GB', N'GHJHKRN', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (9, N'SAT008', N'4', N'GHJHKRN', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (10, N'SAT003', N'500GB', N'HGMTYJTR', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (11, N'SAT004', N'4GB', N'HGMTYJTR', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (12, N'SAT001', N'123456', N'HGMTYJTR', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (13, N'SAT002', N'1232537567', N'S279701764', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (14, N'SAT004', N'10GB', N'S279701764', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (15, N'SAT003', N'50TB', N'S279701764', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (16, N'SAT001', N'4646456', N'S317994736', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (17, N'SAT002', N'4234234', N'S317994736', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (18, N'SAT002', N'234234', N'S964524154', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (19, N'SAT003', N'10GB', N'S964524154', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (20, N'SAT003', N'QWEQWE', N'S530795683', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (21, N'SAT001', N'1234523', N'S530795683', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (22, N'SAT001', N'23424234', N'S531171981', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (23, N'SAT002', N'345345345435', N'S531171981', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (24, N'SAT001', N'4534', N'S531171981', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (25, N'SAT001', N'4565867', N'S199131323', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (26, N'SAT002', N'567567', N'S199131323', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (27, N'SAT001', N'567', N'S199131323', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (28, N'SAT001', N'213423432', N'S489512476', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (29, N'SAT002', N'3244535435', N'S489512476', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (30, N'SAT004', N'433', N'S489512476', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (31, N'SAT001', N'2335345', N'S562550534', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (32, N'SAT002', N'2425345345', N'S562550534', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (33, N'SAT004', N'124', N'S562550534', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (34, N'SAT001', N'234346546', N'S574075648', N'STATUS23', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (35, N'SAT002', N'464567576', N'S574075648', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (40, N'SAT001', N'5345435435', N'S894248644', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (41, N'SAT002', N'25345345', N'S894248644', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (42, N'SAT004', N'1111', N'S894248644', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (43, N'SAT001', N'234234', N'S678422956', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (44, N'SAT002', N'5345546456', N'S678422956', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (45, N'SAT004', N'321', N'S678422956', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (46, N'SAT001', N'65765745', N'S417075961', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (47, N'SAT002', N'98098098908', N'S417075961', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (48, N'SAT004', N'657', N'S417075961', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (49, N'SAT001', N'23425345', N'S010199860', N'STATUS24', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (50, N'SAT002', N'45345345', N'S010199860', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (51, N'SAT004', N'222', N'S010199860', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (52, N'SAT001', N'23234245', N'S035426658', N'STATUS24', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (53, N'SAT002', N'545345', N'S035426658', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (54, N'SAT004', N'245', N'S035426658', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (55, N'SAT001', N'34535234', N'S720565656', N'STATUS24', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (56, N'SAT002', N'5364564', N'S720565656', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (57, N'SAT004', N'2345', N'S720565656', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (58, N'SAT001', N'345345345', N'S718376923', N'STATUS24', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (59, N'SAT002', N'6464566456', N'S718376923', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (60, N'SAT004', N'234', N'S718376923', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (61, N'SAT001', N'213234324', N'S446967830', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (62, N'SAT002', N'2345345', N'S446967830', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (63, N'SAT004', N'324', N'S446967830', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (64, N'SAT001', N'234234', N'S416229445', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (65, N'SAT002', N'534525345', N'S416229445', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (66, N'SAT004', N'234', N'S416229445', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (67, N'SAT001', N'213234324', N'S045537132', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (68, N'SAT002', N'2345345', N'S045537132', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (69, N'SAT004', N'324', N'S045537132', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (70, N'SAT001', N'234234', N'S440679246', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (71, N'SAT002', N'534525345', N'S440679246', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (72, N'SAT004', N'234', N'S440679246', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (73, N'SAT001', N'213234324', N'S897712091', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (74, N'SAT002', N'2345345', N'S897712091', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (75, N'SAT004', N'324', N'S897712091', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (76, N'SAT001', N'234234', N'S864854551', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (77, N'SAT002', N'534525345', N'S864854551', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (78, N'SAT004', N'234', N'S864854551', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (79, N'SAT001', N'243235345', N'S793818599', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (80, N'SAT002', N'345345345', N'S793818599', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (81, N'SAT004', N'3453', N'S793818599', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (82, N'SAT001', N'234234234', N'S889737490', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (83, N'SAT002', N'235345345', N'S889737490', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (84, N'SAT004', N'432', N'S889737490', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (85, N'SAT001', N'354356456', N'S256931833', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (86, N'SAT002', N'32546456', N'S256931833', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (87, N'SAT004', N'45', N'S256931833', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (88, N'SAT001', N'36456356', N'S630049477', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (89, N'SAT002', N'645745758', N'S630049477', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (90, N'SAT004', N'345', N'S630049477', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (91, N'SAT001', N'2143234234', N'S854788318', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (92, N'SAT002', N'23424254', N'S854788318', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (93, N'SAT004', N'3214', N'S854788318', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (94, N'SAT001', N'35345345', N'S067086740', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (95, N'SAT002', N'34564564', N'S067086740', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (96, N'SAT004', N'435', N'S067086740', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (97, N'SAT001', N'345345', N'S086512085', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (98, N'SAT002', N'345345345', N'S086512085', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (36, N'SAT004', N'346', N'S574075648', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (37, N'SAT001', N'4564576567', N'S700629597', N'STATUS24', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (38, N'SAT002', N'6587687', N'S700629597', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (39, N'SAT004', N'678', N'S700629597', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (99, N'SAT004', N'234', N'S086512085', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (100, N'SAT001', N'34535345345', N'S584022928', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (101, N'SAT002', N'535345345', N'S584022928', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (102, N'SAT004', N'422', N'S584022928', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (106, N'SAT001', N'243534534', N'S773393444', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (107, N'SAT002', N'235345345', N'S773393444', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (108, N'SAT004', N'534', N'S773393444', N'STATUS22', 0)
GO
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (109, N'SAT001', N'234234', N'S602307910', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (110, N'SAT002', N'353534', N'S602307910', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (111, N'SAT004', N'4354', N'S602307910', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (112, N'SAT001', N'345435', N'S082355245', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (113, N'SAT002', N'34335', N'S082355245', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (114, N'SAT004', N'543', N'S082355245', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (115, N'SAT001', N'24234', N'S392245750', N'STATUS24', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (116, N'SAT002', N'234234', N'S392245750', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (117, N'SAT004', N'354', N'S392245750', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (1106, N'SAT001', N'2352345', N'S311029004', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (1107, N'SAT002', N'124234234', N'S311029004', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (1108, N'SAT004', N'234234', N'S311029004', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (1109, N'SAT001', N'234234', N'S266173197', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (1110, N'SAT002', N'4234234', N'S266173197', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (1111, N'SAT004', N'423', N'S266173197', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (103, N'SAT001', N'2345345345', N'S075786579', N'STATUS24', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (104, N'SAT002', N'32424234', N'S075786579', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (105, N'SAT004', N'234', N'S075786579', N'STATUS22', 0)
SET IDENTITY_INSERT [dbo].[ServerAttribute] OFF
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
