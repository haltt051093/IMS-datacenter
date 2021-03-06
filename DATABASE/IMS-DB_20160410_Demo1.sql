USE [master]
GO
/****** Object:  Database [IMS]    Script Date: 4/10/2016 1:34:36 PM ******/
CREATE DATABASE [IMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\IMS.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\IMS_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Account]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[AssignedShift]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[Attribute]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 4/10/2016 1:34:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IPAddressPool]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[Location]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[Log]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[Note]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[Object]    Script Date: 4/10/2016 1:34:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Object](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Object] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rack]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[RackOfCustomer]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[RequestType]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 4/10/2016 1:34:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Server]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[ServerAttribute]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[ServerIP]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[Shift]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[Task]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[TempRequest]    Script Date: 4/10/2016 1:34:37 PM ******/
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
/****** Object:  Table [dbo].[TypeOfLog]    Script Date: 4/10/2016 1:34:37 PM ******/
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
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (11, N'hieultt', N'123', N'Customer', 1, N'Lê Trần Trung Hiếu', N'0912345679', N'letrantrunghieu@gmail.com', N'4/33 Văn Chung', N'3134567936', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (12, N'hungnh', N'123', N'Shift Head', 1, N'Nguyễn Huy Hưng', N'0912345672', N'hungnh@fpt.edu.vn', N'Quận 7', N'3134567938', N'Group 2', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (5, N'manhnh', N'123', N'Customer', 1, N'Nguyễn Hùng Mạnh', N'0945683220', N'manhnguyen@gmail.com', N'Phạm Văn Hai, Tân Bình, Hồ Chí Minh', N'339867411', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (4, N'namch', N'123', N'Staff', 1, N'Cao Hồng Nam', N'0933412886', N'namcao@gmail.com', N'Nha Trang', N'331818933', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (8, N'namnt', N'123', N'Customer', 1, N'Nguyễn Trung Nam', N'0965834779', N'namnt@gmail.com', N'Quận 9, Hồ Chí Minh', N'378990467', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (9, N'nhink', N'123', N'Staff', 0, N'Nguyễn Khả Nhi', N'0974456331', N'nhink@gmail.com', N'Quận 3, Hồ Chí Minh', N'356789002', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (10, N'phuoclh', N'1234', N'Staff', 0, N'Lâm Hữu Phước', N'dgffdfedf', N'phuochl@gmail.com', N'Quận Phú Nhuận, Hồ Chí Minh', N'3134567931', N'Group 2', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (3, N'tienhl', N'123', N'Shift Head', 1, N'Huỳnh Lâm Hà Tiên', N'0935678002', N'tienhuynh@gmail.com', N'Gò Vấp', N'331789456', N'Group 4', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (7, N'thaohq', N'123', N'Customer', 1, N'Huỳnh Quang Thảo', N'0967345813', N'thaohq@gmail.com', N'Quận 1, Hồ Chí Minh', N'331783556', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (17, N'quyenttt', N'123', N'Staff', 1, N'Truyền Thanh Thảo Quyên', N'0933412883', N'truyenthanhthaoquyen@gmail.com', N'Lý Thường Kiệt, Quận 10', N'331717499', N'Group 4', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (15, N'haovtm', N'123', N'Staff', 1, N'Vũ Thị Mỹ Hảo', N'0943245890', N'haovtm@gmail.com', N'Quận 9, Hồ Chí Minh, Việt Nam', N'3134567922', N'Group 2', NULL)
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
SET IDENTITY_INSERT [dbo].[IPAddressPool] ON 

INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1, N'116.193.73.0', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (2, N'116.193.73.1', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (3, N'116.193.73.2', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (4, N'116.193.73.3', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (5, N'116.193.73.4', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (6, N'116.193.73.5', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (7, N'116.193.73.6', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (8, N'116.193.73.7', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (9, N'116.193.73.8', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (10, N'116.193.73.9', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (11, N'116.193.73.10', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (12, N'116.193.73.11', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (13, N'116.193.73.12', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (14, N'116.193.73.13', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (15, N'116.193.73.14', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (16, N'116.193.73.15', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (17, N'116.193.73.16', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (18, N'116.193.73.17', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (19, N'116.193.73.18', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (20, N'116.193.73.19', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (21, N'116.193.73.20', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (22, N'116.193.73.21', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (23, N'116.193.73.22', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (24, N'116.193.73.23', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (25, N'116.193.73.24', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (26, N'116.193.73.25', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (27, N'116.193.73.26', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (28, N'116.193.73.27', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (29, N'116.193.73.28', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (30, N'116.193.73.29', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (31, N'116.193.73.30', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (32, N'116.193.73.31', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (33, N'116.193.73.32', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (34, N'116.193.73.33', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (35, N'116.193.73.34', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (36, N'116.193.73.35', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (37, N'116.193.73.36', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (38, N'116.193.73.37', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (39, N'116.193.73.38', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (40, N'116.193.73.39', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (41, N'116.193.73.40', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (42, N'116.193.73.41', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (43, N'116.193.73.42', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (44, N'116.193.73.43', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (45, N'116.193.73.44', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (46, N'116.193.73.45', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (47, N'116.193.73.46', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (48, N'116.193.73.47', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (49, N'116.193.73.48', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (50, N'116.193.73.49', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (51, N'116.193.73.50', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (52, N'116.193.73.51', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (53, N'116.193.73.52', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (54, N'116.193.73.53', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (55, N'116.193.73.54', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (56, N'116.193.73.55', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (57, N'116.193.73.56', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (58, N'116.193.73.57', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (59, N'116.193.73.58', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (60, N'116.193.73.59', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (61, N'116.193.73.60', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (62, N'116.193.73.61', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (63, N'116.193.73.62', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (64, N'116.193.73.63', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (65, N'116.193.73.64', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (66, N'116.193.73.65', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (67, N'116.193.73.66', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (68, N'116.193.73.67', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (69, N'116.193.73.68', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (70, N'116.193.73.69', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (71, N'116.193.73.70', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (72, N'116.193.73.71', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (73, N'116.193.73.72', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (74, N'116.193.73.73', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (75, N'116.193.73.74', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (76, N'116.193.73.75', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (77, N'116.193.73.76', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (78, N'116.193.73.77', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (79, N'116.193.73.78', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (80, N'116.193.73.79', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (81, N'116.193.73.80', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (82, N'116.193.73.81', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (83, N'116.193.73.82', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (84, N'116.193.73.83', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (85, N'116.193.73.84', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (86, N'116.193.73.85', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (87, N'116.193.73.86', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (88, N'116.193.73.87', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (89, N'116.193.73.88', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (90, N'116.193.73.89', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (91, N'116.193.73.90', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (92, N'116.193.73.91', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (93, N'116.193.73.92', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (94, N'116.193.73.93', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (95, N'116.193.73.94', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (96, N'116.193.73.95', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (97, N'116.193.73.96', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (98, N'116.193.73.97', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (99, N'116.193.73.98', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (100, N'116.193.73.99', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (101, N'116.193.73.100', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (102, N'116.193.73.101', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (103, N'116.193.73.102', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (104, N'116.193.73.103', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (105, N'116.193.73.104', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (106, N'116.193.73.105', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (107, N'116.193.73.106', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (108, N'116.193.73.107', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (109, N'116.193.73.108', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (110, N'116.193.73.109', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (111, N'116.193.73.110', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (112, N'116.193.73.111', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (113, N'116.193.73.112', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (114, N'116.193.73.113', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (115, N'116.193.73.114', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (116, N'116.193.73.115', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (117, N'116.193.73.116', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (118, N'116.193.73.117', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (119, N'116.193.73.118', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (120, N'116.193.73.119', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (121, N'116.193.73.120', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (122, N'116.193.73.121', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (123, N'116.193.73.122', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (124, N'116.193.73.123', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (125, N'116.193.73.124', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (126, N'116.193.73.125', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (127, N'116.193.73.126', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (128, N'116.193.73.127', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (129, N'116.193.73.128', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (130, N'116.193.73.129', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (131, N'116.193.73.130', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (132, N'116.193.73.131', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (133, N'116.193.73.132', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (134, N'116.193.73.133', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (135, N'116.193.73.134', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (136, N'116.193.73.135', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (137, N'116.193.73.136', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (138, N'116.193.73.137', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (139, N'116.193.73.138', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (140, N'116.193.73.139', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (141, N'116.193.73.140', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (142, N'116.193.73.141', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (143, N'116.193.73.142', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (144, N'116.193.73.143', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (145, N'116.193.73.144', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (146, N'116.193.73.145', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (147, N'116.193.73.146', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (148, N'116.193.73.147', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (149, N'116.193.73.148', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (150, N'116.193.73.149', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (151, N'116.193.73.150', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (152, N'116.193.73.151', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (153, N'116.193.73.152', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (154, N'116.193.73.153', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (155, N'116.193.73.154', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (156, N'116.193.73.155', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (157, N'116.193.73.156', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (158, N'116.193.73.157', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (159, N'116.193.73.158', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (160, N'116.193.73.159', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (161, N'116.193.73.160', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (162, N'116.193.73.161', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (163, N'116.193.73.162', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (164, N'116.193.73.163', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (165, N'116.193.73.164', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (166, N'116.193.73.165', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (167, N'116.193.73.166', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (168, N'116.193.73.167', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (169, N'116.193.73.168', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (170, N'116.193.73.169', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (171, N'116.193.73.170', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (172, N'116.193.73.171', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (173, N'116.193.73.172', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (174, N'116.193.73.173', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (175, N'116.193.73.174', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (176, N'116.193.73.175', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (177, N'116.193.73.176', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (178, N'116.193.73.177', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (179, N'116.193.73.178', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (180, N'116.193.73.179', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (181, N'116.193.73.180', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (182, N'116.193.73.181', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (183, N'116.193.73.182', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (184, N'116.193.73.183', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (185, N'116.193.73.184', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (186, N'116.193.73.185', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (187, N'116.193.73.186', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (188, N'116.193.73.187', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (189, N'116.193.73.188', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (190, N'116.193.73.189', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (191, N'116.193.73.190', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (192, N'116.193.73.191', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (193, N'116.193.73.192', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (194, N'116.193.73.193', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (195, N'116.193.73.194', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (196, N'116.193.73.195', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (197, N'116.193.73.196', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (198, N'116.193.73.197', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (199, N'116.193.73.198', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (200, N'116.193.73.199', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (201, N'116.193.73.200', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (202, N'116.193.73.201', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (203, N'116.193.73.202', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (204, N'116.193.73.203', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (205, N'116.193.73.204', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (206, N'116.193.73.205', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (207, N'116.193.73.206', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (208, N'116.193.73.207', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (209, N'116.193.73.208', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (210, N'116.193.73.209', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (211, N'116.193.73.210', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (212, N'116.193.73.211', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (213, N'116.193.73.212', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (214, N'116.193.73.213', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (215, N'116.193.73.214', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (216, N'116.193.73.215', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (217, N'116.193.73.216', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (218, N'116.193.73.217', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (219, N'116.193.73.218', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (220, N'116.193.73.219', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (221, N'116.193.73.220', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (222, N'116.193.73.221', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (223, N'116.193.73.222', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (224, N'116.193.73.223', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (225, N'116.193.73.224', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (226, N'116.193.73.225', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (227, N'116.193.73.226', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (228, N'116.193.73.227', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (229, N'116.193.73.228', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (230, N'116.193.73.229', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (231, N'116.193.73.230', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (232, N'116.193.73.231', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (233, N'116.193.73.232', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (234, N'116.193.73.233', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (235, N'116.193.73.234', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (236, N'116.193.73.235', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (237, N'116.193.73.236', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (238, N'116.193.73.237', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (239, N'116.193.73.238', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (240, N'116.193.73.239', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (241, N'116.193.73.240', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (242, N'116.193.73.241', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (243, N'116.193.73.242', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (244, N'116.193.73.243', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (245, N'116.193.73.244', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (246, N'116.193.73.245', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (247, N'116.193.73.246', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (248, N'116.193.73.247', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (249, N'116.193.73.248', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (250, N'116.193.73.249', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (251, N'116.193.73.250', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (252, N'116.193.73.251', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (253, N'116.193.73.252', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (254, N'116.193.73.253', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (255, N'116.193.73.254', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (256, N'116.193.73.255', N'116.193.73.254', N'116.193.73.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:37.103' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (257, N'202.78.227.0', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (258, N'202.78.227.1', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (259, N'202.78.227.2', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (260, N'202.78.227.3', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (261, N'202.78.227.4', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (262, N'202.78.227.5', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (263, N'202.78.227.6', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (264, N'202.78.227.7', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (265, N'202.78.227.8', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (266, N'202.78.227.9', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (267, N'202.78.227.10', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (268, N'202.78.227.11', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (269, N'202.78.227.12', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (270, N'202.78.227.13', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (271, N'202.78.227.14', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (272, N'202.78.227.15', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (273, N'202.78.227.16', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (274, N'202.78.227.17', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (275, N'202.78.227.18', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (276, N'202.78.227.19', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (277, N'202.78.227.20', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (278, N'202.78.227.21', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (279, N'202.78.227.22', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (280, N'202.78.227.23', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (281, N'202.78.227.24', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (282, N'202.78.227.25', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (283, N'202.78.227.26', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (284, N'202.78.227.27', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (285, N'202.78.227.28', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (286, N'202.78.227.29', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (287, N'202.78.227.30', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (288, N'202.78.227.31', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (289, N'202.78.227.32', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (290, N'202.78.227.33', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (291, N'202.78.227.34', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (292, N'202.78.227.35', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (293, N'202.78.227.36', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (294, N'202.78.227.37', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (295, N'202.78.227.38', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (296, N'202.78.227.39', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (297, N'202.78.227.40', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (298, N'202.78.227.41', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (299, N'202.78.227.42', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (300, N'202.78.227.43', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (301, N'202.78.227.44', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (302, N'202.78.227.45', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (303, N'202.78.227.46', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (304, N'202.78.227.47', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (305, N'202.78.227.48', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (306, N'202.78.227.49', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (307, N'202.78.227.50', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (308, N'202.78.227.51', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (309, N'202.78.227.52', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (310, N'202.78.227.53', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (311, N'202.78.227.54', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (312, N'202.78.227.55', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (313, N'202.78.227.56', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (314, N'202.78.227.57', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (315, N'202.78.227.58', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (316, N'202.78.227.59', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (317, N'202.78.227.60', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (318, N'202.78.227.61', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (319, N'202.78.227.62', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (320, N'202.78.227.63', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (321, N'202.78.227.64', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (322, N'202.78.227.65', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (323, N'202.78.227.66', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (324, N'202.78.227.67', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (325, N'202.78.227.68', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (326, N'202.78.227.69', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (327, N'202.78.227.70', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (328, N'202.78.227.71', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (329, N'202.78.227.72', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (330, N'202.78.227.73', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (331, N'202.78.227.74', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (332, N'202.78.227.75', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (333, N'202.78.227.76', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (334, N'202.78.227.77', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (335, N'202.78.227.78', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (336, N'202.78.227.79', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (337, N'202.78.227.80', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (338, N'202.78.227.81', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (339, N'202.78.227.82', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (340, N'202.78.227.83', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (341, N'202.78.227.84', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (342, N'202.78.227.85', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (343, N'202.78.227.86', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (344, N'202.78.227.87', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (345, N'202.78.227.88', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (346, N'202.78.227.89', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (347, N'202.78.227.90', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (348, N'202.78.227.91', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (349, N'202.78.227.92', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (350, N'202.78.227.93', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (351, N'202.78.227.94', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (352, N'202.78.227.95', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (353, N'202.78.227.96', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (354, N'202.78.227.97', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (355, N'202.78.227.98', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (356, N'202.78.227.99', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (357, N'202.78.227.100', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (358, N'202.78.227.101', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (359, N'202.78.227.102', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (360, N'202.78.227.103', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (361, N'202.78.227.104', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (362, N'202.78.227.105', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (363, N'202.78.227.106', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (364, N'202.78.227.107', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (365, N'202.78.227.108', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (366, N'202.78.227.109', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (367, N'202.78.227.110', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (368, N'202.78.227.111', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (369, N'202.78.227.112', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (370, N'202.78.227.113', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (371, N'202.78.227.114', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (372, N'202.78.227.115', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (373, N'202.78.227.116', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (374, N'202.78.227.117', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (375, N'202.78.227.118', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (376, N'202.78.227.119', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (377, N'202.78.227.120', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (378, N'202.78.227.121', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (379, N'202.78.227.122', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (380, N'202.78.227.123', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (381, N'202.78.227.124', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (382, N'202.78.227.125', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (383, N'202.78.227.126', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (384, N'202.78.227.127', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (385, N'202.78.227.128', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (386, N'202.78.227.129', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (387, N'202.78.227.130', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (388, N'202.78.227.131', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (389, N'202.78.227.132', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (390, N'202.78.227.133', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (391, N'202.78.227.134', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (392, N'202.78.227.135', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (393, N'202.78.227.136', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (394, N'202.78.227.137', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (395, N'202.78.227.138', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (396, N'202.78.227.139', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (397, N'202.78.227.140', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (398, N'202.78.227.141', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (399, N'202.78.227.142', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (400, N'202.78.227.143', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (401, N'202.78.227.144', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (402, N'202.78.227.145', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (403, N'202.78.227.146', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (404, N'202.78.227.147', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (405, N'202.78.227.148', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (406, N'202.78.227.149', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (407, N'202.78.227.150', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (408, N'202.78.227.151', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (409, N'202.78.227.152', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (410, N'202.78.227.153', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (411, N'202.78.227.154', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (412, N'202.78.227.155', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (413, N'202.78.227.156', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (414, N'202.78.227.157', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (415, N'202.78.227.158', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (416, N'202.78.227.159', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (417, N'202.78.227.160', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (418, N'202.78.227.161', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (419, N'202.78.227.162', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (420, N'202.78.227.163', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (421, N'202.78.227.164', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (422, N'202.78.227.165', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (423, N'202.78.227.166', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (424, N'202.78.227.167', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (425, N'202.78.227.168', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (426, N'202.78.227.169', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (427, N'202.78.227.170', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (428, N'202.78.227.171', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (429, N'202.78.227.172', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (430, N'202.78.227.173', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (431, N'202.78.227.174', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (432, N'202.78.227.175', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (433, N'202.78.227.176', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (434, N'202.78.227.177', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (435, N'202.78.227.178', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (436, N'202.78.227.179', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (437, N'202.78.227.180', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (438, N'202.78.227.181', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (439, N'202.78.227.182', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (440, N'202.78.227.183', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (441, N'202.78.227.184', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (442, N'202.78.227.185', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (443, N'202.78.227.186', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (444, N'202.78.227.187', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (445, N'202.78.227.188', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (446, N'202.78.227.189', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (447, N'202.78.227.190', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (448, N'202.78.227.191', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (449, N'202.78.227.192', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (450, N'202.78.227.193', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (451, N'202.78.227.194', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (452, N'202.78.227.195', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (453, N'202.78.227.196', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (454, N'202.78.227.197', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (455, N'202.78.227.198', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (456, N'202.78.227.199', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (457, N'202.78.227.200', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (458, N'202.78.227.201', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (459, N'202.78.227.202', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (460, N'202.78.227.203', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (461, N'202.78.227.204', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (462, N'202.78.227.205', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (463, N'202.78.227.206', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (464, N'202.78.227.207', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (465, N'202.78.227.208', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (466, N'202.78.227.209', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (467, N'202.78.227.210', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (468, N'202.78.227.211', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (469, N'202.78.227.212', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (470, N'202.78.227.213', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (471, N'202.78.227.214', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (472, N'202.78.227.215', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (473, N'202.78.227.216', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (474, N'202.78.227.217', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (475, N'202.78.227.218', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (476, N'202.78.227.219', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (477, N'202.78.227.220', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (478, N'202.78.227.221', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (479, N'202.78.227.222', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (480, N'202.78.227.223', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (481, N'202.78.227.224', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (482, N'202.78.227.225', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (483, N'202.78.227.226', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (484, N'202.78.227.227', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (485, N'202.78.227.228', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (486, N'202.78.227.229', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (487, N'202.78.227.230', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (488, N'202.78.227.231', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (489, N'202.78.227.232', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (490, N'202.78.227.233', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (491, N'202.78.227.234', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (492, N'202.78.227.235', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (493, N'202.78.227.236', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (494, N'202.78.227.237', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (495, N'202.78.227.238', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (496, N'202.78.227.239', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (497, N'202.78.227.240', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (498, N'202.78.227.241', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (499, N'202.78.227.242', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (500, N'202.78.227.243', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (501, N'202.78.227.244', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (502, N'202.78.227.245', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (503, N'202.78.227.246', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (504, N'202.78.227.247', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (505, N'202.78.227.248', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (506, N'202.78.227.249', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (507, N'202.78.227.250', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (508, N'202.78.227.251', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (509, N'202.78.227.252', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (510, N'202.78.227.253', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (511, N'202.78.227.254', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (512, N'202.78.227.255', N'202.78.227.254', N'202.78.227.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:44:47.160' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (513, N'120.72.85.0', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (514, N'120.72.85.1', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (515, N'120.72.85.2', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (516, N'120.72.85.3', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (517, N'120.72.85.4', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (518, N'120.72.85.5', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (519, N'120.72.85.6', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (520, N'120.72.85.7', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (521, N'120.72.85.8', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (522, N'120.72.85.9', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (523, N'120.72.85.10', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (524, N'120.72.85.11', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (525, N'120.72.85.12', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (526, N'120.72.85.13', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (527, N'120.72.85.14', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (528, N'120.72.85.15', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (529, N'120.72.85.16', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (530, N'120.72.85.17', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (531, N'120.72.85.18', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (532, N'120.72.85.19', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (533, N'120.72.85.20', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (534, N'120.72.85.21', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (535, N'120.72.85.22', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (536, N'120.72.85.23', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (537, N'120.72.85.24', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (538, N'120.72.85.25', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (539, N'120.72.85.26', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (540, N'120.72.85.27', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (541, N'120.72.85.28', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (542, N'120.72.85.29', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (543, N'120.72.85.30', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (544, N'120.72.85.31', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (545, N'120.72.85.32', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (546, N'120.72.85.33', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (547, N'120.72.85.34', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (548, N'120.72.85.35', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (549, N'120.72.85.36', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (550, N'120.72.85.37', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (551, N'120.72.85.38', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (552, N'120.72.85.39', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (553, N'120.72.85.40', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (554, N'120.72.85.41', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (555, N'120.72.85.42', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (556, N'120.72.85.43', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (557, N'120.72.85.44', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (558, N'120.72.85.45', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (559, N'120.72.85.46', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (560, N'120.72.85.47', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (561, N'120.72.85.48', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (562, N'120.72.85.49', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (563, N'120.72.85.50', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (564, N'120.72.85.51', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (565, N'120.72.85.52', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (566, N'120.72.85.53', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (567, N'120.72.85.54', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (568, N'120.72.85.55', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (569, N'120.72.85.56', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (570, N'120.72.85.57', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (571, N'120.72.85.58', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (572, N'120.72.85.59', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (573, N'120.72.85.60', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (574, N'120.72.85.61', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (575, N'120.72.85.62', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (576, N'120.72.85.63', N'120.72.85.62', N'120.72.85.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:44:57.770' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (577, N'210.2.64.0', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (578, N'210.2.64.1', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (579, N'210.2.64.2', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (580, N'210.2.64.3', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (581, N'210.2.64.4', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (582, N'210.2.64.5', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (583, N'210.2.64.6', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (584, N'210.2.64.7', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (585, N'210.2.64.8', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (586, N'210.2.64.9', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (587, N'210.2.64.10', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (588, N'210.2.64.11', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (589, N'210.2.64.12', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (590, N'210.2.64.13', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (591, N'210.2.64.14', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (592, N'210.2.64.15', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (593, N'210.2.64.16', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (594, N'210.2.64.17', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (595, N'210.2.64.18', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (596, N'210.2.64.19', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (597, N'210.2.64.20', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (598, N'210.2.64.21', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (599, N'210.2.64.22', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (600, N'210.2.64.23', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (601, N'210.2.64.24', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (602, N'210.2.64.25', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (603, N'210.2.64.26', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (604, N'210.2.64.27', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (605, N'210.2.64.28', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (606, N'210.2.64.29', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (607, N'210.2.64.30', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (608, N'210.2.64.31', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (609, N'210.2.64.32', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (610, N'210.2.64.33', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (611, N'210.2.64.34', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (612, N'210.2.64.35', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (613, N'210.2.64.36', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (614, N'210.2.64.37', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (615, N'210.2.64.38', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (616, N'210.2.64.39', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (617, N'210.2.64.40', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (618, N'210.2.64.41', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (619, N'210.2.64.42', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (620, N'210.2.64.43', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (621, N'210.2.64.44', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (622, N'210.2.64.45', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (623, N'210.2.64.46', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (624, N'210.2.64.47', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (625, N'210.2.64.48', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (626, N'210.2.64.49', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (627, N'210.2.64.50', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (628, N'210.2.64.51', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (629, N'210.2.64.52', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (630, N'210.2.64.53', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (631, N'210.2.64.54', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (632, N'210.2.64.55', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (633, N'210.2.64.56', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (634, N'210.2.64.57', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (635, N'210.2.64.58', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (636, N'210.2.64.59', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (637, N'210.2.64.60', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (638, N'210.2.64.61', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (639, N'210.2.64.62', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (640, N'210.2.64.63', N'210.2.64.62', N'210.2.64.0', N'255.255.255.192', NULL, CAST(N'2016-04-10 11:45:46.057' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (641, N'213.2.64.0', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (642, N'213.2.64.1', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (643, N'213.2.64.2', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (644, N'213.2.64.3', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (645, N'213.2.64.4', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (646, N'213.2.64.5', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (647, N'213.2.64.6', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (648, N'213.2.64.7', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (649, N'213.2.64.8', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (650, N'213.2.64.9', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (651, N'213.2.64.10', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (652, N'213.2.64.11', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (653, N'213.2.64.12', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (654, N'213.2.64.13', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (655, N'213.2.64.14', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (656, N'213.2.64.15', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (657, N'213.2.64.16', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (658, N'213.2.64.17', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (659, N'213.2.64.18', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (660, N'213.2.64.19', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (661, N'213.2.64.20', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (662, N'213.2.64.21', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (663, N'213.2.64.22', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (664, N'213.2.64.23', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (665, N'213.2.64.24', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (666, N'213.2.64.25', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (667, N'213.2.64.26', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (668, N'213.2.64.27', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (669, N'213.2.64.28', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (670, N'213.2.64.29', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (671, N'213.2.64.30', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (672, N'213.2.64.31', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (673, N'213.2.64.32', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (674, N'213.2.64.33', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (675, N'213.2.64.34', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (676, N'213.2.64.35', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (677, N'213.2.64.36', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (678, N'213.2.64.37', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (679, N'213.2.64.38', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (680, N'213.2.64.39', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (681, N'213.2.64.40', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (682, N'213.2.64.41', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (683, N'213.2.64.42', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (684, N'213.2.64.43', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (685, N'213.2.64.44', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (686, N'213.2.64.45', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (687, N'213.2.64.46', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (688, N'213.2.64.47', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (689, N'213.2.64.48', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (690, N'213.2.64.49', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (691, N'213.2.64.50', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (692, N'213.2.64.51', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (693, N'213.2.64.52', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (694, N'213.2.64.53', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (695, N'213.2.64.54', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (696, N'213.2.64.55', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (697, N'213.2.64.56', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (698, N'213.2.64.57', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (699, N'213.2.64.58', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (700, N'213.2.64.59', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (701, N'213.2.64.60', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (702, N'213.2.64.61', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (703, N'213.2.64.62', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (704, N'213.2.64.63', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (705, N'213.2.64.64', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (706, N'213.2.64.65', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (707, N'213.2.64.66', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (708, N'213.2.64.67', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (709, N'213.2.64.68', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (710, N'213.2.64.69', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (711, N'213.2.64.70', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (712, N'213.2.64.71', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (713, N'213.2.64.72', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (714, N'213.2.64.73', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (715, N'213.2.64.74', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (716, N'213.2.64.75', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (717, N'213.2.64.76', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (718, N'213.2.64.77', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (719, N'213.2.64.78', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (720, N'213.2.64.79', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (721, N'213.2.64.80', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (722, N'213.2.64.81', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (723, N'213.2.64.82', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (724, N'213.2.64.83', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (725, N'213.2.64.84', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (726, N'213.2.64.85', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (727, N'213.2.64.86', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (728, N'213.2.64.87', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (729, N'213.2.64.88', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (730, N'213.2.64.89', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (731, N'213.2.64.90', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (732, N'213.2.64.91', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (733, N'213.2.64.92', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (734, N'213.2.64.93', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (735, N'213.2.64.94', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (736, N'213.2.64.95', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (737, N'213.2.64.96', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (738, N'213.2.64.97', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (739, N'213.2.64.98', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (740, N'213.2.64.99', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (741, N'213.2.64.100', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (742, N'213.2.64.101', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (743, N'213.2.64.102', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (744, N'213.2.64.103', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (745, N'213.2.64.104', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (746, N'213.2.64.105', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (747, N'213.2.64.106', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (748, N'213.2.64.107', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (749, N'213.2.64.108', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (750, N'213.2.64.109', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (751, N'213.2.64.110', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (752, N'213.2.64.111', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (753, N'213.2.64.112', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (754, N'213.2.64.113', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (755, N'213.2.64.114', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (756, N'213.2.64.115', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (757, N'213.2.64.116', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (758, N'213.2.64.117', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (759, N'213.2.64.118', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (760, N'213.2.64.119', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (761, N'213.2.64.120', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (762, N'213.2.64.121', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (763, N'213.2.64.122', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (764, N'213.2.64.123', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (765, N'213.2.64.124', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (766, N'213.2.64.125', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (767, N'213.2.64.126', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (768, N'213.2.64.127', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (769, N'213.2.64.128', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (770, N'213.2.64.129', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (771, N'213.2.64.130', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (772, N'213.2.64.131', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (773, N'213.2.64.132', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (774, N'213.2.64.133', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (775, N'213.2.64.134', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (776, N'213.2.64.135', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (777, N'213.2.64.136', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (778, N'213.2.64.137', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (779, N'213.2.64.138', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (780, N'213.2.64.139', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (781, N'213.2.64.140', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (782, N'213.2.64.141', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (783, N'213.2.64.142', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (784, N'213.2.64.143', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (785, N'213.2.64.144', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (786, N'213.2.64.145', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (787, N'213.2.64.146', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (788, N'213.2.64.147', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (789, N'213.2.64.148', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (790, N'213.2.64.149', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (791, N'213.2.64.150', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (792, N'213.2.64.151', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (793, N'213.2.64.152', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (794, N'213.2.64.153', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (795, N'213.2.64.154', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (796, N'213.2.64.155', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (797, N'213.2.64.156', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (798, N'213.2.64.157', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (799, N'213.2.64.158', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (800, N'213.2.64.159', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (801, N'213.2.64.160', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (802, N'213.2.64.161', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (803, N'213.2.64.162', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (804, N'213.2.64.163', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (805, N'213.2.64.164', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (806, N'213.2.64.165', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (807, N'213.2.64.166', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (808, N'213.2.64.167', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (809, N'213.2.64.168', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (810, N'213.2.64.169', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (811, N'213.2.64.170', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (812, N'213.2.64.171', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (813, N'213.2.64.172', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (814, N'213.2.64.173', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (815, N'213.2.64.174', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (816, N'213.2.64.175', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (817, N'213.2.64.176', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (818, N'213.2.64.177', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (819, N'213.2.64.178', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (820, N'213.2.64.179', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (821, N'213.2.64.180', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (822, N'213.2.64.181', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (823, N'213.2.64.182', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (824, N'213.2.64.183', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (825, N'213.2.64.184', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (826, N'213.2.64.185', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (827, N'213.2.64.186', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (828, N'213.2.64.187', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (829, N'213.2.64.188', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (830, N'213.2.64.189', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (831, N'213.2.64.190', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (832, N'213.2.64.191', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (833, N'213.2.64.192', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (834, N'213.2.64.193', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (835, N'213.2.64.194', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (836, N'213.2.64.195', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (837, N'213.2.64.196', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (838, N'213.2.64.197', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (839, N'213.2.64.198', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (840, N'213.2.64.199', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (841, N'213.2.64.200', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (842, N'213.2.64.201', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (843, N'213.2.64.202', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (844, N'213.2.64.203', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (845, N'213.2.64.204', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (846, N'213.2.64.205', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (847, N'213.2.64.206', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (848, N'213.2.64.207', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (849, N'213.2.64.208', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (850, N'213.2.64.209', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (851, N'213.2.64.210', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (852, N'213.2.64.211', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (853, N'213.2.64.212', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (854, N'213.2.64.213', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (855, N'213.2.64.214', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (856, N'213.2.64.215', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (857, N'213.2.64.216', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (858, N'213.2.64.217', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (859, N'213.2.64.218', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (860, N'213.2.64.219', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (861, N'213.2.64.220', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (862, N'213.2.64.221', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (863, N'213.2.64.222', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (864, N'213.2.64.223', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (865, N'213.2.64.224', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (866, N'213.2.64.225', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (867, N'213.2.64.226', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (868, N'213.2.64.227', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (869, N'213.2.64.228', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (870, N'213.2.64.229', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (871, N'213.2.64.230', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (872, N'213.2.64.231', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (873, N'213.2.64.232', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (874, N'213.2.64.233', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (875, N'213.2.64.234', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (876, N'213.2.64.235', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (877, N'213.2.64.236', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (878, N'213.2.64.237', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (879, N'213.2.64.238', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (880, N'213.2.64.239', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (881, N'213.2.64.240', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (882, N'213.2.64.241', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (883, N'213.2.64.242', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (884, N'213.2.64.243', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (885, N'213.2.64.244', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (886, N'213.2.64.245', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (887, N'213.2.64.246', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (888, N'213.2.64.247', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (889, N'213.2.64.248', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (890, N'213.2.64.249', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (891, N'213.2.64.250', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (892, N'213.2.64.251', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (893, N'213.2.64.252', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (894, N'213.2.64.253', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (895, N'213.2.64.254', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (896, N'213.2.64.255', N'213.2.64.254', N'213.2.64.0', N'255.255.255.0', NULL, CAST(N'2016-04-10 11:46:08.463' AS DateTime), N'STATUS32', 0)
SET IDENTITY_INSERT [dbo].[IPAddressPool] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (1, N'L670018', N'R521249', 1, N'STATUS14', N'S763621671')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (2, N'L314981', N'R521249', 2, N'STATUS14', N'S763621671')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (3, N'L005586', N'R521249', 3, N'STATUS14', N'S763621671')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (4, N'L497721', N'R521249', 4, N'STATUS14', N'S763621671')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (5, N'L206484', N'R521249', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (6, N'L760620', N'R521249', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (7, N'L797639', N'R521249', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (8, N'L984770', N'R521249', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (9, N'L633874', N'R521249', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (10, N'L255333', N'R521249', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (11, N'L310272', N'R521249', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (12, N'L152851', N'R521249', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (13, N'L100515', N'R521249', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (14, N'L194123', N'R521249', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (15, N'L826270', N'R521249', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (16, N'L523028', N'R521249', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (17, N'L882555', N'R521249', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (18, N'L403541', N'R521249', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (19, N'L560529', N'R521249', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (20, N'L070854', N'R521249', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (21, N'L620317', N'R521249', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (22, N'L361259', N'R521249', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (23, N'L857989', N'R521249', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (24, N'L611097', N'R521249', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (25, N'L435074', N'R521249', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (26, N'L881279', N'R521249', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (27, N'L371827', N'R521249', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (28, N'L510259', N'R521249', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (29, N'L229987', N'R521249', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (30, N'L282709', N'R521249', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (31, N'L317271', N'R521249', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (32, N'L830571', N'R521249', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (33, N'L811168', N'R521249', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (34, N'L631087', N'R521249', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (35, N'L767746', N'R521249', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (36, N'L537004', N'R521249', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (37, N'L199136', N'R521249', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (38, N'L295316', N'R521249', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (39, N'L872579', N'R521249', 39, N'STATUS14', N'S553138894')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (40, N'L362793', N'R521249', 40, N'STATUS14', N'S553138894')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (41, N'L603609', N'R521249', 41, N'STATUS14', N'S715723845')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (42, N'L344132', N'R521249', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (43, N'L952244', N'R202880', 1, N'STATUS14', N'S267417355')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (44, N'L426126', N'R202880', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (45, N'L910375', N'R202880', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (46, N'L590899', N'R202880', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (47, N'L191546', N'R202880', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (48, N'L221322', N'R202880', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (49, N'L250849', N'R202880', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (50, N'L974652', N'R202880', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (51, N'L944798', N'R202880', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (52, N'L467703', N'R202880', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (53, N'L517324', N'R202880', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (54, N'L756348', N'R202880', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (55, N'L606276', N'R202880', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (56, N'L118314', N'R202880', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (57, N'L035151', N'R202880', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (58, N'L728105', N'R202880', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (59, N'L507862', N'R202880', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (60, N'L737485', N'R202880', 18, N'STATUS14', N'S932093894')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (61, N'L822184', N'R202880', 19, N'STATUS14', N'S932093894')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (62, N'L096199', N'R202880', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (63, N'L683842', N'R202880', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (64, N'L506673', N'R202880', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (65, N'L028708', N'R202880', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (66, N'L354357', N'R202880', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (67, N'L342203', N'R202880', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (68, N'L712062', N'R202880', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (69, N'L381521', N'R202880', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (70, N'L994865', N'R202880', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (71, N'L318284', N'R202880', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (72, N'L689448', N'R202880', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (73, N'L068540', N'R202880', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (74, N'L155175', N'R202880', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (75, N'L984040', N'R202880', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (76, N'L771626', N'R202880', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (77, N'L341854', N'R202880', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (78, N'L021288', N'R202880', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (79, N'L612943', N'R202880', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (80, N'L524038', N'R202880', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (81, N'L151524', N'R202880', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (82, N'L638190', N'R202880', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (83, N'L315302', N'R202880', 41, N'STATUS14', N'S157202353')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (84, N'L797981', N'R202880', 42, N'STATUS14', N'S157202353')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (85, N'L459182', N'R992503', 1, N'STATUS14', N'S899125785')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (86, N'L982091', N'R992503', 2, N'STATUS14', N'S899125785')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (87, N'L440281', N'R992503', 3, N'STATUS14', N'S899125785')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (88, N'L354817', N'R992503', 4, N'STATUS14', N'S899125785')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (89, N'L980966', N'R992503', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (90, N'L301884', N'R992503', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (91, N'L623062', N'R992503', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (92, N'L535966', N'R992503', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (93, N'L914504', N'R992503', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (94, N'L489902', N'R992503', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (95, N'L759025', N'R992503', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (96, N'L069282', N'R992503', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (97, N'L820641', N'R992503', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (98, N'L527577', N'R992503', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (99, N'L438369', N'R992503', 15, N'STATUS13', NULL)
GO
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (100, N'L667535', N'R992503', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (101, N'L877913', N'R992503', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (102, N'L698588', N'R992503', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (103, N'L728733', N'R992503', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (104, N'L854761', N'R992503', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (105, N'L591335', N'R992503', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (106, N'L908481', N'R992503', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (107, N'L861904', N'R992503', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (108, N'L240724', N'R992503', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (109, N'L568671', N'R992503', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (110, N'L796402', N'R992503', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (111, N'L966830', N'R992503', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (112, N'L839564', N'R992503', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (113, N'L446416', N'R992503', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (114, N'L765020', N'R992503', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (115, N'L147438', N'R992503', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (116, N'L722675', N'R992503', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (117, N'L421392', N'R992503', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (118, N'L914682', N'R992503', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (119, N'L843000', N'R992503', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (120, N'L761348', N'R992503', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (121, N'L252606', N'R992503', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (122, N'L693238', N'R992503', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (123, N'L452469', N'R992503', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (124, N'L073886', N'R992503', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (125, N'L927285', N'R992503', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (126, N'L954327', N'R992503', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (127, N'L990667', N'R567320', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (128, N'L677030', N'R567320', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (129, N'L228431', N'R567320', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (130, N'L702925', N'R567320', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (131, N'L979697', N'R567320', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (132, N'L005146', N'R567320', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (133, N'L746981', N'R567320', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (134, N'L491470', N'R567320', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (135, N'L343862', N'R567320', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (136, N'L527248', N'R567320', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (137, N'L625773', N'R567320', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (138, N'L689908', N'R567320', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (139, N'L526855', N'R567320', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (140, N'L234299', N'R567320', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (141, N'L190190', N'R567320', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (142, N'L500627', N'R567320', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (143, N'L956880', N'R567320', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (144, N'L222885', N'R567320', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (145, N'L089955', N'R567320', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (146, N'L227320', N'R567320', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (147, N'L481911', N'R567320', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (148, N'L360409', N'R567320', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (149, N'L829668', N'R567320', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (150, N'L829636', N'R567320', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (151, N'L911071', N'R567320', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (152, N'L469620', N'R567320', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (153, N'L256595', N'R567320', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (154, N'L092992', N'R567320', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (155, N'L611897', N'R567320', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (156, N'L971989', N'R567320', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (157, N'L015436', N'R567320', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (158, N'L273700', N'R567320', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (159, N'L262603', N'R567320', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (160, N'L440184', N'R567320', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (161, N'L558270', N'R567320', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (162, N'L894118', N'R567320', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (163, N'L870036', N'R567320', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (164, N'L230061', N'R567320', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (165, N'L735146', N'R567320', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (166, N'L273124', N'R567320', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (167, N'L665612', N'R567320', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (168, N'L339335', N'R567320', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (169, N'L310324', N'R991032', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (170, N'L097290', N'R991032', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (171, N'L377150', N'R991032', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (172, N'L655852', N'R991032', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (173, N'L645971', N'R991032', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (174, N'L801655', N'R991032', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (175, N'L876571', N'R991032', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (176, N'L179544', N'R991032', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (177, N'L307541', N'R991032', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (178, N'L329533', N'R991032', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (179, N'L573462', N'R991032', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (180, N'L372059', N'R991032', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (181, N'L988860', N'R991032', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (182, N'L763419', N'R991032', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (183, N'L638616', N'R991032', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (184, N'L395931', N'R991032', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (185, N'L145340', N'R991032', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (186, N'L295008', N'R991032', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (187, N'L372013', N'R991032', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (188, N'L654423', N'R991032', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (189, N'L974020', N'R991032', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (190, N'L918487', N'R991032', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (191, N'L550821', N'R991032', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (192, N'L637219', N'R991032', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (193, N'L629268', N'R991032', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (194, N'L265143', N'R991032', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (195, N'L427775', N'R991032', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (196, N'L426574', N'R991032', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (197, N'L077990', N'R991032', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (198, N'L864344', N'R991032', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (199, N'L004383', N'R991032', 31, N'STATUS13', NULL)
GO
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (200, N'L444981', N'R991032', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (201, N'L943819', N'R991032', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (202, N'L473565', N'R991032', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (203, N'L089084', N'R991032', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (204, N'L337555', N'R991032', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (205, N'L312493', N'R991032', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (206, N'L356710', N'R991032', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (207, N'L281166', N'R991032', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (208, N'L496789', N'R991032', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (209, N'L138288', N'R991032', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (210, N'L971983', N'R991032', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (211, N'L275214', N'R779191', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (212, N'L189094', N'R779191', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (213, N'L976218', N'R779191', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (214, N'L931348', N'R779191', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (215, N'L339180', N'R779191', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (216, N'L266487', N'R779191', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (217, N'L842991', N'R779191', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (218, N'L418037', N'R779191', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (219, N'L592034', N'R779191', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (220, N'L056680', N'R779191', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (221, N'L710255', N'R779191', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (222, N'L460890', N'R779191', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (223, N'L746196', N'R779191', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (224, N'L170745', N'R779191', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (225, N'L937614', N'R779191', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (226, N'L406398', N'R779191', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (227, N'L190749', N'R779191', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (228, N'L572851', N'R779191', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (229, N'L195927', N'R779191', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (230, N'L968253', N'R779191', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (231, N'L388306', N'R779191', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (232, N'L778566', N'R779191', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (233, N'L518758', N'R779191', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (234, N'L710170', N'R779191', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (235, N'L646634', N'R779191', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (236, N'L111496', N'R779191', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (237, N'L734461', N'R779191', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (238, N'L939518', N'R779191', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (239, N'L755986', N'R779191', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (240, N'L196872', N'R779191', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (241, N'L418594', N'R779191', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (242, N'L098642', N'R779191', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (243, N'L981942', N'R779191', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (244, N'L559173', N'R779191', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (245, N'L006183', N'R779191', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (246, N'L637979', N'R779191', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (247, N'L492804', N'R779191', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (248, N'L872999', N'R779191', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (249, N'L165510', N'R779191', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (250, N'L102401', N'R779191', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (251, N'L942431', N'R779191', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (252, N'L713364', N'R779191', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (253, N'L490634', N'R275462', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (254, N'L381298', N'R275462', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (255, N'L953056', N'R275462', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (256, N'L141715', N'R275462', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (257, N'L187863', N'R275462', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (258, N'L547259', N'R275462', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (259, N'L196671', N'R275462', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (260, N'L242150', N'R275462', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (261, N'L567393', N'R275462', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (262, N'L209255', N'R275462', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (263, N'L359605', N'R275462', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (264, N'L456102', N'R275462', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (265, N'L230390', N'R275462', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (266, N'L521367', N'R275462', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (267, N'L854665', N'R275462', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (268, N'L971030', N'R275462', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (269, N'L441876', N'R275462', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (270, N'L993780', N'R275462', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (271, N'L824285', N'R275462', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (272, N'L311563', N'R275462', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (273, N'L405506', N'R275462', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (274, N'L512820', N'R275462', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (275, N'L508301', N'R275462', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (276, N'L167200', N'R275462', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (277, N'L675492', N'R275462', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (278, N'L308687', N'R275462', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (279, N'L036869', N'R275462', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (280, N'L366559', N'R275462', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (281, N'L957766', N'R275462', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (282, N'L170083', N'R275462', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (283, N'L024145', N'R275462', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (284, N'L353757', N'R275462', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (285, N'L773609', N'R275462', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (286, N'L124059', N'R275462', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (287, N'L253064', N'R275462', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (288, N'L355369', N'R275462', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (289, N'L753374', N'R275462', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (290, N'L192225', N'R275462', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (291, N'L948048', N'R275462', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (292, N'L915759', N'R275462', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (293, N'L709653', N'R275462', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (294, N'L420627', N'R275462', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (295, N'L492192', N'R886833', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (296, N'L652088', N'R886833', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (297, N'L440711', N'R886833', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (298, N'L465170', N'R886833', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (299, N'L301129', N'R886833', 5, N'STATUS13', NULL)
GO
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (300, N'L896474', N'R886833', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (301, N'L503345', N'R886833', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (302, N'L117872', N'R886833', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (303, N'L714600', N'R886833', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (304, N'L706630', N'R886833', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (305, N'L639421', N'R886833', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (306, N'L466151', N'R886833', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (307, N'L819401', N'R886833', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (308, N'L166356', N'R886833', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (309, N'L372934', N'R886833', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (310, N'L154894', N'R886833', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (311, N'L535940', N'R886833', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (312, N'L807510', N'R886833', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (313, N'L653458', N'R886833', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (314, N'L185195', N'R886833', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (315, N'L058334', N'R886833', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (316, N'L613128', N'R886833', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (317, N'L827575', N'R886833', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (318, N'L586651', N'R886833', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (319, N'L315408', N'R886833', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (320, N'L733436', N'R886833', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (321, N'L718879', N'R886833', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (322, N'L429114', N'R886833', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (323, N'L722185', N'R886833', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (324, N'L236211', N'R886833', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (325, N'L836406', N'R886833', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (326, N'L436375', N'R886833', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (327, N'L215249', N'R886833', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (328, N'L321183', N'R886833', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (329, N'L257734', N'R886833', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (330, N'L095969', N'R886833', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (331, N'L327758', N'R886833', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (332, N'L982285', N'R886833', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (333, N'L282727', N'R886833', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (334, N'L696730', N'R886833', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (335, N'L162227', N'R886833', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (336, N'L906885', N'R886833', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (337, N'L818517', N'R579350', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (338, N'L658770', N'R579350', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (339, N'L263547', N'R579350', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (340, N'L961916', N'R579350', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (341, N'L835758', N'R579350', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (342, N'L699304', N'R579350', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (343, N'L727234', N'R579350', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (344, N'L837843', N'R579350', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (345, N'L083111', N'R579350', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (346, N'L207376', N'R579350', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (347, N'L332890', N'R579350', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (348, N'L136972', N'R579350', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (349, N'L923062', N'R579350', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (350, N'L842525', N'R579350', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (351, N'L890250', N'R579350', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (352, N'L184027', N'R579350', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (353, N'L398390', N'R579350', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (354, N'L132645', N'R579350', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (355, N'L898099', N'R579350', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (356, N'L653547', N'R579350', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (357, N'L885439', N'R579350', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (358, N'L954332', N'R579350', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (359, N'L630719', N'R579350', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (360, N'L267802', N'R579350', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (361, N'L258428', N'R579350', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (362, N'L417303', N'R579350', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (363, N'L817922', N'R579350', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (364, N'L516647', N'R579350', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (365, N'L650302', N'R579350', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (366, N'L646939', N'R579350', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (367, N'L051508', N'R579350', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (368, N'L238722', N'R579350', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (369, N'L055987', N'R579350', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (370, N'L098593', N'R579350', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (371, N'L785849', N'R579350', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (372, N'L078221', N'R579350', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (373, N'L845443', N'R579350', 37, N'STATUS14', N'S910025754')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (374, N'L472230', N'R579350', 38, N'STATUS14', N'S910025754')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (375, N'L819898', N'R579350', 39, N'STATUS14', N'S910025754')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (376, N'L256730', N'R579350', 40, N'STATUS14', N'S910025754')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (377, N'L232320', N'R579350', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (378, N'L053371', N'R579350', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (379, N'L778383', N'R607764', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (380, N'L832532', N'R607764', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (381, N'L337257', N'R607764', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (382, N'L525268', N'R607764', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (383, N'L961051', N'R607764', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (384, N'L167683', N'R607764', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (385, N'L258687', N'R607764', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (386, N'L216671', N'R607764', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (387, N'L236595', N'R607764', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (388, N'L102223', N'R607764', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (389, N'L010577', N'R607764', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (390, N'L185063', N'R607764', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (391, N'L128604', N'R607764', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (392, N'L444356', N'R607764', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (393, N'L212319', N'R607764', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (394, N'L732468', N'R607764', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (395, N'L388185', N'R607764', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (396, N'L792603', N'R607764', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (397, N'L317587', N'R607764', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (398, N'L045051', N'R607764', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (399, N'L478192', N'R607764', 21, N'STATUS13', NULL)
GO
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (400, N'L018725', N'R607764', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (401, N'L530753', N'R607764', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (402, N'L218631', N'R607764', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (403, N'L702666', N'R607764', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (404, N'L422936', N'R607764', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (405, N'L362574', N'R607764', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (406, N'L514643', N'R607764', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (407, N'L140354', N'R607764', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (408, N'L704444', N'R607764', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (409, N'L583836', N'R607764', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (410, N'L260077', N'R607764', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (411, N'L212724', N'R607764', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (412, N'L608613', N'R607764', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (413, N'L489785', N'R607764', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (414, N'L380687', N'R607764', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (415, N'L613528', N'R607764', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (416, N'L906936', N'R607764', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (417, N'L360918', N'R607764', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (418, N'L359330', N'R607764', 40, N'STATUS14', N'S086116125')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (419, N'L824287', N'R607764', 41, N'STATUS14', N'S086116125')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (420, N'L681341', N'R607764', 42, N'STATUS14', N'S434278452')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (421, N'L731894', N'R880155', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (422, N'L373792', N'R880155', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (423, N'L240064', N'R880155', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (424, N'L695517', N'R880155', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (425, N'L983412', N'R880155', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (426, N'L923436', N'R880155', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (427, N'L699493', N'R880155', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (428, N'L617947', N'R880155', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (429, N'L871727', N'R880155', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (430, N'L637715', N'R880155', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (431, N'L784487', N'R880155', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (432, N'L828360', N'R880155', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (433, N'L064965', N'R880155', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (434, N'L811307', N'R880155', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (435, N'L918892', N'R880155', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (436, N'L164327', N'R880155', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (437, N'L941641', N'R880155', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (438, N'L186497', N'R880155', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (439, N'L825296', N'R880155', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (440, N'L801449', N'R880155', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (441, N'L544249', N'R880155', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (442, N'L752004', N'R880155', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (443, N'L665565', N'R880155', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (444, N'L704070', N'R880155', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (445, N'L070143', N'R880155', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (446, N'L731992', N'R880155', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (447, N'L253427', N'R880155', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (448, N'L137949', N'R880155', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (449, N'L598389', N'R880155', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (450, N'L421660', N'R880155', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (451, N'L672441', N'R880155', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (452, N'L940369', N'R880155', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (453, N'L128902', N'R880155', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (454, N'L014264', N'R880155', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (455, N'L857428', N'R880155', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (456, N'L716154', N'R880155', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (457, N'L835792', N'R880155', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (458, N'L247797', N'R880155', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (459, N'L751830', N'R880155', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (460, N'L387854', N'R880155', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (461, N'L693534', N'R880155', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (462, N'L148850', N'R880155', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (463, N'L357390', N'R320903', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (464, N'L246454', N'R320903', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (465, N'L320973', N'R320903', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (466, N'L704129', N'R320903', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (467, N'L136112', N'R320903', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (468, N'L667750', N'R320903', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (469, N'L427546', N'R320903', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (470, N'L124433', N'R320903', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (471, N'L561146', N'R320903', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (472, N'L805570', N'R320903', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (473, N'L209994', N'R320903', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (474, N'L162774', N'R320903', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (475, N'L066284', N'R320903', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (476, N'L968717', N'R320903', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (477, N'L018830', N'R320903', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (478, N'L009445', N'R320903', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (479, N'L705597', N'R320903', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (480, N'L367545', N'R320903', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (481, N'L348117', N'R320903', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (482, N'L253698', N'R320903', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (483, N'L096116', N'R320903', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (484, N'L058276', N'R320903', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (485, N'L255167', N'R320903', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (486, N'L421461', N'R320903', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (487, N'L854302', N'R320903', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (488, N'L400118', N'R320903', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (489, N'L752844', N'R320903', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (490, N'L270103', N'R320903', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (491, N'L345569', N'R320903', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (492, N'L319385', N'R320903', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (493, N'L904315', N'R320903', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (494, N'L539705', N'R320903', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (495, N'L012486', N'R320903', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (496, N'L325286', N'R320903', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (497, N'L393583', N'R320903', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (498, N'L311015', N'R320903', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (499, N'L285701', N'R320903', 37, N'STATUS13', NULL)
GO
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (500, N'L115885', N'R320903', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (501, N'L084624', N'R320903', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (502, N'L867965', N'R320903', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (503, N'L094867', N'R320903', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (504, N'L840428', N'R320903', 42, N'STATUS13', NULL)
SET IDENTITY_INSERT [dbo].[Location] OFF
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
SET IDENTITY_INSERT [dbo].[Log] OFF
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (1, N'N490233142', N'R093162463', N'Request', N'hungnh', N'Request Add Server from Lê Trần Trung Hiếu', 1, CAST(N'2016-04-10 11:54:43.160' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (2, N'N892657850', N'R093162463', N'Request', N'hieultt', N'Request Add Server is accepted!', 1, CAST(N'2016-04-10 11:57:33.787' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (3, N'N826317009', N'R093162463', N'Request', N'hieultt', N'Request Add Server is DONE!', 1, CAST(N'2016-04-10 12:04:34.723' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (4, N'N202613608', N'R202370735', N'Request', N'hungnh', N'Request Add Server from Lê Trần Trung Hiếu', 1, CAST(N'2016-04-10 12:05:43.440' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (5, N'N171493870', N'R202370735', N'Request', N'hieultt', N'Request Add Server is accepted!', 0, CAST(N'2016-04-10 12:06:07.320' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (6, N'N161865354', N'R202370735', N'Request', N'hieultt', N'Request Add Server is DONE!', 0, CAST(N'2016-04-10 12:07:18.737' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (7, N'N803167989', N'R280040529', N'Request', N'hungnh', N'Request Add Server from Huỳnh Quang Thảo', 1, CAST(N'2016-04-10 12:09:41.290' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (8, N'N638538406', N'R280040529', N'Request', N'thaohq', N'Request Add Server is accepted!', 1, CAST(N'2016-04-10 12:10:37.307' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (9, N'N038459095', N'R280040529', N'Request', N'thaohq', N'Request Add Server is DONE!', 1, CAST(N'2016-04-10 12:12:15.667' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (10, N'N226795597', N'R411535743', N'Request', N'hungnh', N'Request Assign IP from Huỳnh Quang Thảo', 1, CAST(N'2016-04-10 12:16:32.553' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (11, N'N743239467', N'R039394319', N'Request', N'hungnh', N'Request Assign IP from Huỳnh Quang Thảo', 1, CAST(N'2016-04-10 12:16:55.583' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (12, N'N740054354', N'R090157487', N'Request', N'hungnh', N'Request Assign IP from Huỳnh Quang Thảo', 1, CAST(N'2016-04-10 12:17:02.997' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (13, N'N372148535', N'R090157487', N'Request', N'thaohq', N'Request Assign IP is accepted!', 0, CAST(N'2016-04-10 12:27:01.757' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (14, N'N333607734', N'R090157487', N'Request', N'thaohq', N'Request Assign IP is DONE!', 0, CAST(N'2016-04-10 12:29:39.580' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (15, N'N599267756', N'R039394319', N'Request', N'thaohq', N'Request Assign IP is accepted!', 0, CAST(N'2016-04-10 12:30:40.140' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (16, N'N014718100', N'R039394319', N'Request', N'thaohq', N'Request Assign IP is DONE!', 0, CAST(N'2016-04-10 12:31:05.717' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (17, N'N895021081', N'R411535743', N'Request', N'thaohq', N'Request Assign IP is accepted!', 0, CAST(N'2016-04-10 12:32:53.693' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (18, N'N768373848', N'R411535743', N'Task', N'haovtm', N'You have a new task', 1, CAST(N'2016-04-10 12:32:53.753' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (19, N'N750079791', N'R411535743', N'Request', N'hungnh', N'Vũ Thị Mỹ Hảo starts PROCESSING request Assign new IP address', 0, CAST(N'2016-04-10 12:35:33.333' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (20, N'N161221738', N'R411535743', N'Request', N'thaohq', N'Request Assign IP is DONE!', 0, CAST(N'2016-04-10 12:35:44.823' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (21, N'N248300629', N'R003673872', N'Request', N'hungnh', N'Request Assign IP from Lê Trần Trung Hiếu', 0, CAST(N'2016-04-10 12:36:26.037' AS DateTime))
INSERT [dbo].[Notification] ([Id], [NotificationCode], [RefCode], [RefType], [Username], [Description], [IsViewed], [NotifTime]) VALUES (22, N'N452999527', N'R453331493', N'Request', N'hungnh', N'Request Assign IP from Lê Trần Trung Hiếu', 0, CAST(N'2016-04-10 12:36:33.157' AS DateTime))
SET IDENTITY_INSERT [dbo].[Notification] OFF
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
SET IDENTITY_INSERT [dbo].[Rack] ON 

INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (1, N'R521249', N'A1', N'STATUS33', CAST(N'2016-04-10 11:43:27.890' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (2, N'R202880', N'A2', N'STATUS33', CAST(N'2016-04-10 11:43:31.403' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (3, N'R992503', N'A3', N'STATUS33', CAST(N'2016-04-10 11:43:35.567' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (4, N'R567320', N'B1', N'STATUS19', CAST(N'2016-04-10 11:43:40.673' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (5, N'R991032', N'B2', N'STATUS19', CAST(N'2016-04-10 11:43:46.063' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (6, N'R779191', N'B3', N'STATUS19', CAST(N'2016-04-10 11:43:51.387' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (7, N'R275462', N'C1', N'STATUS19', CAST(N'2016-04-10 11:43:54.997' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (8, N'R886833', N'C2', N'STATUS19', CAST(N'2016-04-10 11:43:58.177' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (9, N'R579350', N'C3', N'STATUS33', CAST(N'2016-04-10 11:44:01.757' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (10, N'R607764', N'D1', N'STATUS33', CAST(N'2016-04-10 11:44:05.187' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (11, N'R880155', N'D2', N'STATUS19', CAST(N'2016-04-10 11:44:08.813' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (12, N'R320903', N'D3', N'STATUS19', CAST(N'2016-04-10 11:44:13.630' AS DateTime), 10, NULL)
SET IDENTITY_INSERT [dbo].[Rack] OFF
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (1, N'R216898503', N'RT003', N'hieultt', CAST(N'2016-04-11 11:00:00.000' AS DateTime), N'[None]', CAST(N'2016-04-10 11:51:21.227' AS DateTime), N'STATUS04', 0, NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (2, N'R093162463', N'RT003', N'hieultt', CAST(N'2016-04-12 11:00:00.000' AS DateTime), N'[None]', CAST(N'2016-04-10 11:54:42.697' AS DateTime), N'STATUS07', 0, N'hungnh', NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (3, N'R202370735', N'RT003', N'hieultt', CAST(N'2016-04-14 12:00:00.000' AS DateTime), N'[None]', CAST(N'2016-04-10 12:05:43.243' AS DateTime), N'STATUS07', 0, N'hungnh', NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (4, N'R280040529', N'RT003', N'thaohq', CAST(N'2016-04-26 12:00:00.000' AS DateTime), N'Nguoi di thay the: Le Bao Tran
CMND: 331719045
SDT: 0935890523', CAST(N'2016-04-10 12:09:41.107' AS DateTime), N'STATUS07', 0, N'hungnh', NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (5, N'R411535743', N'RT009', N'thaohq', NULL, N'{"NumberOfIp":5,"Description":"[None]","NumberOfRack":0}', CAST(N'2016-04-10 12:16:32.493' AS DateTime), N'STATUS07', 0, N'haovtm', NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (6, N'R039394319', N'RT009', N'thaohq', NULL, N'{"NumberOfIp":6,"Description":"[None]","NumberOfRack":0}', CAST(N'2016-04-10 12:16:55.510' AS DateTime), N'STATUS07', 0, N'hungnh', NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (7, N'R090157487', N'RT009', N'thaohq', NULL, N'{"NumberOfIp":2,"Description":"[None]","NumberOfRack":0}', CAST(N'2016-04-10 12:17:02.863' AS DateTime), N'STATUS07', 0, N'hungnh', NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (8, N'R003673872', N'RT009', N'hieultt', NULL, N'{"NumberOfIp":4,"Description":"[None]","NumberOfRack":0}', CAST(N'2016-04-10 12:36:25.943' AS DateTime), N'STATUS04', 0, NULL, NULL)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee], [Reason]) VALUES (9, N'R453331493', N'RT009', N'hieultt', NULL, N'{"NumberOfIp":8,"Description":"[None]","NumberOfRack":0}', CAST(N'2016-04-10 12:36:33.130' AS DateTime), N'STATUS04', 0, NULL, NULL)
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

INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (1, N'S553138894', N'hieultt', NULL, NULL, 600, 2, N'STATUS02', N'116.193.73.3', CAST(N'2016-04-10 11:54:42.803' AS DateTime), NULL, N'100Mbps', N'2342343654', N'1243234345')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (2, N'S715723845', N'hieultt', NULL, NULL, 500, 1, N'STATUS02', N'116.193.73.5', CAST(N'2016-04-10 11:54:42.980' AS DateTime), NULL, N'100Mbps', N'4234234', N'2354645')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (3, N'S910025754', N'hieultt', NULL, NULL, 700, 4, N'STATUS02', N'210.2.64.2', CAST(N'2016-04-10 11:54:43.000' AS DateTime), NULL, N'1Gbps', NULL, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (4, N'S434278452', N'hieultt', NULL, NULL, 350, 1, N'STATUS02', N'213.2.64.1', CAST(N'2016-04-10 12:05:43.330' AS DateTime), NULL, N'100Mbps', N'234234', N'235245')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (5, N'S157202353', N'hieultt', NULL, NULL, 400, 2, N'STATUS02', N'116.193.73.2', CAST(N'2016-04-10 12:05:43.377' AS DateTime), NULL, N'100Mbps', N'3245456457', N'4564564234')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (6, N'S899125785', N'hieultt', NULL, NULL, 600, 4, N'STATUS02', N'116.193.73.4', CAST(N'2016-04-10 12:05:43.403' AS DateTime), NULL, N'1Gbps', N'424353453', N'345456456')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (7, N'S763621671', N'thaohq', NULL, NULL, 800, 4, N'STATUS02', N'120.72.85.1', CAST(N'2016-04-10 12:09:41.163' AS DateTime), NULL, N'1Gbps', N'235345436', N'4353465456')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (8, N'S267417355', N'thaohq', NULL, NULL, 400, 1, N'STATUS02', N'202.78.227.2', CAST(N'2016-04-10 12:09:41.203' AS DateTime), NULL, N'100Mbps', N'23423452', N'42353453')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (9, N'S086116125', N'thaohq', NULL, NULL, 500, 2, N'STATUS02', N'210.2.64.9', CAST(N'2016-04-10 12:09:41.230' AS DateTime), NULL, N'1Gbps', NULL, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (10, N'S932093894', N'thaohq', NULL, NULL, 450, 2, N'STATUS02', N'213.2.64.2', CAST(N'2016-04-10 12:09:41.257' AS DateTime), NULL, N'100Mbps', N'2343545', N'2546456')
SET IDENTITY_INSERT [dbo].[Server] OFF
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
SET IDENTITY_INSERT [dbo].[ServerIP] ON 

INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (1, N'S553138894', N'116.193.73.3', N'STATUS29', CAST(N'2016-04-10 12:04:34.390' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (2, N'S715723845', N'116.193.73.5', N'STATUS29', CAST(N'2016-04-10 12:04:34.490' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (3, N'S910025754', N'210.2.64.2', N'STATUS29', CAST(N'2016-04-10 12:04:34.560' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (4, N'S434278452', N'213.2.64.1', N'STATUS29', CAST(N'2016-04-10 12:07:18.443' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (5, N'S157202353', N'116.193.73.2', N'STATUS29', CAST(N'2016-04-10 12:07:18.520' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (6, N'S899125785', N'116.193.73.4', N'STATUS29', CAST(N'2016-04-10 12:07:18.613' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (7, N'S763621671', N'120.72.85.1', N'STATUS29', CAST(N'2016-04-10 12:12:15.247' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (8, N'S267417355', N'202.78.227.2', N'STATUS29', CAST(N'2016-04-10 12:12:15.390' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (9, N'S086116125', N'210.2.64.9', N'STATUS29', CAST(N'2016-04-10 12:12:15.473' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (10, N'S932093894', N'213.2.64.2', N'STATUS29', CAST(N'2016-04-10 12:12:15.557' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (11, N'S267417355', N'202.78.227.12', N'STATUS29', CAST(N'2016-04-10 12:29:39.477' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (12, N'S267417355', N'202.78.227.4', N'STATUS29', CAST(N'2016-04-10 12:29:39.540' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (13, N'S086116125', N'210.2.64.40', N'STATUS29', CAST(N'2016-04-10 12:31:05.540' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (14, N'S086116125', N'210.2.64.8', N'STATUS29', CAST(N'2016-04-10 12:31:05.577' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (15, N'S086116125', N'210.2.64.6', N'STATUS29', CAST(N'2016-04-10 12:31:05.593' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (16, N'S086116125', N'210.2.64.46', N'STATUS29', CAST(N'2016-04-10 12:31:05.610' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (17, N'S086116125', N'210.2.64.53', N'STATUS29', CAST(N'2016-04-10 12:31:05.627' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (18, N'S086116125', N'210.2.64.38', N'STATUS29', CAST(N'2016-04-10 12:31:05.643' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (19, N'S763621671', N'120.72.85.11', N'STATUS29', CAST(N'2016-04-10 12:35:44.623' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (20, N'S763621671', N'120.72.85.55', N'STATUS29', CAST(N'2016-04-10 12:35:44.650' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (21, N'S763621671', N'120.72.85.56', N'STATUS29', CAST(N'2016-04-10 12:35:44.667' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (22, N'S763621671', N'120.72.85.24', N'STATUS29', CAST(N'2016-04-10 12:35:44.680' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (23, N'S763621671', N'120.72.85.52', N'STATUS29', CAST(N'2016-04-10 12:35:44.760' AS DateTime), 0)
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
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([Id], [TaskCode], [ShiftHead], [AssignedStaff], [PreAssignedStaff], [RequestCode], [StatusCode], [AssignedTime], [Comment]) VALUES (1, N'T752024257', N'hungnh', N'hungnh', NULL, N'R093162463', N'STATUS17', CAST(N'2016-04-10 11:57:38.527' AS DateTime), NULL)
INSERT [dbo].[Task] ([Id], [TaskCode], [ShiftHead], [AssignedStaff], [PreAssignedStaff], [RequestCode], [StatusCode], [AssignedTime], [Comment]) VALUES (2, N'T317515247', N'hungnh', N'hungnh', NULL, N'R202370735', N'STATUS17', CAST(N'2016-04-10 12:06:09.317' AS DateTime), NULL)
INSERT [dbo].[Task] ([Id], [TaskCode], [ShiftHead], [AssignedStaff], [PreAssignedStaff], [RequestCode], [StatusCode], [AssignedTime], [Comment]) VALUES (3, N'T854710038', N'hungnh', N'hungnh', NULL, N'R280040529', N'STATUS17', CAST(N'2016-04-10 12:10:46.257' AS DateTime), NULL)
INSERT [dbo].[Task] ([Id], [TaskCode], [ShiftHead], [AssignedStaff], [PreAssignedStaff], [RequestCode], [StatusCode], [AssignedTime], [Comment]) VALUES (4, N'T835338789', N'hungnh', N'hungnh', NULL, N'R090157487', N'STATUS17', CAST(N'2016-04-10 12:27:01.797' AS DateTime), NULL)
INSERT [dbo].[Task] ([Id], [TaskCode], [ShiftHead], [AssignedStaff], [PreAssignedStaff], [RequestCode], [StatusCode], [AssignedTime], [Comment]) VALUES (5, N'T486827091', N'hungnh', N'hungnh', NULL, N'R039394319', N'STATUS17', CAST(N'2016-04-10 12:30:40.153' AS DateTime), NULL)
INSERT [dbo].[Task] ([Id], [TaskCode], [ShiftHead], [AssignedStaff], [PreAssignedStaff], [RequestCode], [StatusCode], [AssignedTime], [Comment]) VALUES (6, N'T896102367', N'hungnh', N'haovtm', NULL, N'R411535743', N'STATUS17', CAST(N'2016-04-10 12:32:53.727' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Task] OFF
SET IDENTITY_INSERT [dbo].[TempRequest] ON 

INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1, N'T559550250', N'R216898503', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"hieultt","Maker":null,"Model":null,"Power":500,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"100Mbps","PartNumber":"5345345","SerialNumber":"1234243","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (2, N'T508946193', N'R216898503', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"hieultt","Maker":null,"Model":null,"Power":600,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"1Gbps","PartNumber":"2424242345","SerialNumber":"4235345345","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (3, N'T105424612', N'R216898503', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"hieultt","Maker":null,"Model":null,"Power":700,"Size":4,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"1Gbps","PartNumber":null,"SerialNumber":null,"Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (4, N'T030545895', N'R216898503', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"hieultt","Maker":null,"Model":null,"Power":750,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"100Mbps","PartNumber":"123242342","SerialNumber":"124234234","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (5, N'T128259810', N'R093162463', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"hieultt","Maker":null,"Model":null,"Power":600,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"100Mbps","PartNumber":"2342343654","SerialNumber":"1243234345","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (6, N'T731219176', N'R093162463', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"hieultt","Maker":null,"Model":null,"Power":500,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"100Mbps","PartNumber":"4234234","SerialNumber":"2354645","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (7, N'T488917218', N'R093162463', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"hieultt","Maker":null,"Model":null,"Power":700,"Size":4,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"1Gbps","PartNumber":null,"SerialNumber":null,"Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (8, N'T641478266', N'R202370735', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"hieultt","Maker":null,"Model":null,"Power":350,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"100Mbps","PartNumber":"234234","SerialNumber":"235245","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (9, N'T870314811', N'R202370735', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"hieultt","Maker":null,"Model":null,"Power":400,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"100Mbps","PartNumber":"3245456457","SerialNumber":"4564564234","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (10, N'T537555321', N'R202370735', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"hieultt","Maker":null,"Model":null,"Power":600,"Size":4,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"1Gbps","PartNumber":"424353453","SerialNumber":"345456456","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (11, N'T350035605', N'R280040529', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"thaohq","Maker":null,"Model":null,"Power":800,"Size":4,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"1Gbps","PartNumber":"235345436","SerialNumber":"4353465456","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (12, N'T385167700', N'R280040529', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"thaohq","Maker":null,"Model":null,"Power":400,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"100Mbps","PartNumber":"23423452","SerialNumber":"42353453","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (13, N'T676794508', N'R280040529', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"thaohq","Maker":null,"Model":null,"Power":500,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"1Gbps","PartNumber":null,"SerialNumber":null,"Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (14, N'T274388886', N'R280040529', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":"T274388886","Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"Edit","ServerDefaultIP":null,"ServerCode":null,"Customer":null,"Maker":null,"Model":null,"Power":450,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Bandwidth":"100Mbps","PartNumber":"2343545","SerialNumber":"2546456","Id":0}')
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
