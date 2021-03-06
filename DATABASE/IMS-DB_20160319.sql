USE [master]
GO
/****** Object:  Database [IMS]    Script Date: 3/19/2016 4:00:41 PM ******/
CREATE DATABASE [IMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\IMS.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[Account]    Script Date: 3/19/2016 4:00:41 PM ******/
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
/****** Object:  Table [dbo].[AssignedShift]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[Attribute]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 3/19/2016 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IPAddressPool]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[Location]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[LogChangedContent]    Script Date: 3/19/2016 4:00:42 PM ******/
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
	[Username] [nvarchar](50) NULL,
	[LogTime] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[PreviousId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Note]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 3/19/2016 4:00:42 PM ******/
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
	[IsViewed] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Object]    Script Date: 3/19/2016 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Object](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Object] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rack]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[RackOfCustomer]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 3/19/2016 4:00:42 PM ******/
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
	[Assignee] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestType]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 3/19/2016 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Server]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[ServerAttribute]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[ServerIP]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[Shift]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[Task]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[TempRequest]    Script Date: 3/19/2016 4:00:42 PM ******/
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
/****** Object:  Table [dbo].[TypeOfLog]    Script Date: 3/19/2016 4:00:42 PM ******/
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
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (2, N'haltt', N'111', N'Shift Head', 1, N'Lê Thi Thu Hà', N'0912345679', N'thuha051093@gmail.com', N'4/33 Văn Chung', N'331717456', N'Group 1', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (11, N'hieultt', N'BEXHNP', N'Customer', 1, N'Lê Trần Trung Hiếu', N'0912345679', N'letrantrunghieu@gmail.com', N'4/33 Văn Chung', N'3134567936', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (12, N'hungnh', N'NXLBXAXUML', N'Shift Head', 1, N'Nguyễn Huy Hùng', N'0912345672', N'hungnh@fpt.edu.vn', N'Quận 7', N'3134567938', N'Group 2', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (5, N'manhnh', N'123', N'Customer', 1, N'Nguyễn Hùng Mạnh', N'0945683220', N'manhnguyen@gmail.com', N'Phạm Văn Hai, Tân Bình, Hồ Chí Minh', N'339867411', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (4, N'namch', N'123', N'Shift Head', 1, N'Cao Hồng Nam', N'0933412886', N'namcao@gmail.com', N'Nha Trang', N'331818933', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (8, N'namnt', N'123', N'Customer', 1, N'Nguyễn Trung Nam', N'0965834779', N'namnt@gmail.com', N'Quận 9, Hồ Chí Minh', N'378990467', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (9, N'nhink', N'123', N'Staff', 0, N'Nguyễn Khả Nhi', N'0974456331', N'nhink@gmail.com', N'Quận 3, Hồ Chí Minh', N'356789002', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (10, N'phuoclh', N'1234', N'Shift Head', 0, N'Lâm Hữu Phước', N'dgffdfedf', N'phuochl@gmail.com', N'Quận Phú Nhuận, Hồ Chí Minh', N'3134567931', N'Group 2', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (3, N'tienhl', N'123', N'Shift Head', 1, N'Huỳnh Lâm Hà Tiên', N'0935678002', N'tienhuynh@gmail.com', N'Gò Vấp', N'331789456', N'Group 4', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (7, N'thaohq', N'123', N'Customer', 1, N'Huỳnh Quang Thảo', N'0967345813', N'thaohq@gmail.com', N'Quận 1, Hồ Chí Minh', N'331783556', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (17, N'quyenttt', N'QJVJRKHSAI', N'Staff', 1, N'Truyền Thanh Thảo Quyên', N'0933412883', N'truyenthanhthaoquyen@gmail.com', N'Lý Thường Kiệt, Quận 10', N'331717499', N'Group 4', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (15, N'haovtm', N'HWSADFQXWL', N'Staff', 1, N'Vũ Thị Mỹ Hảo', N'0943245890', N'haovtm@gmail.com', N'Quận 9, Hồ Chí Minh, Việt Nam', N'3134567922', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (18, N'thanhnd', N'PSWSYQOLTT', N'Customer', 1, N'Nguyễn Duy Thanh', N'0912345654', N'nguyenduythanh@gmail.com', N'Quận Bình Thạnh', N'3134567531', N'Customer', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1018, N'halt', N'MSTMOEYBBN', N'Staff', 1, N'Lê Thu Hà', N'0933412888', N'thuha051093@gmail.com', N'Quận 7', N'331717457', N'Group 3', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode], [Company]) VALUES (1019, N'bichtt', N'EIEQBKGCBO', N'Staff', 1, N'Trần Thị Bích', N'01689808484', N'thuha051093@gmail.com', N'Bà Rịa', N'324561422', N'Group 3', NULL)
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
SET IDENTITY_INSERT [dbo].[IPAddressPool] ON 

INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (34, N'120.70.85.0', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (35, N'120.70.85.1', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (36, N'120.70.85.2', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (37, N'120.70.85.3', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (38, N'120.70.85.4', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (39, N'120.70.85.5', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (40, N'120.70.85.6', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (41, N'120.70.85.7', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (42, N'120.70.85.8', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (43, N'120.70.85.9', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (44, N'120.70.85.10', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (45, N'120.70.85.11', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (46, N'120.70.85.12', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (47, N'120.70.85.13', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (48, N'120.70.85.14', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (49, N'120.70.85.15', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (50, N'120.70.85.16', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (51, N'120.70.85.17', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (52, N'120.70.85.18', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (53, N'120.70.85.19', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (54, N'120.70.85.20', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (55, N'120.70.85.21', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (56, N'120.70.85.22', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (57, N'120.70.85.23', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (58, N'120.70.85.24', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (59, N'120.70.85.25', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (60, N'120.70.85.26', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (61, N'120.70.85.27', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (62, N'120.70.85.28', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (63, N'120.70.85.29', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (64, N'120.70.85.30', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (65, N'120.70.85.31', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (66, N'120.70.85.32', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (67, N'120.70.85.33', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (68, N'120.70.85.34', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (69, N'120.70.85.35', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (70, N'120.70.85.36', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (71, N'120.70.85.37', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (72, N'120.70.85.38', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (73, N'120.70.85.39', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (74, N'120.70.85.40', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (75, N'120.70.85.41', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (76, N'120.70.85.42', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (77, N'120.70.85.43', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (78, N'120.70.85.44', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (79, N'120.70.85.45', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (80, N'120.70.85.46', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (81, N'120.70.85.47', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (82, N'120.70.85.48', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (83, N'120.70.85.49', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (84, N'120.70.85.50', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (85, N'120.70.85.51', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (86, N'120.70.85.52', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (87, N'120.70.85.53', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (88, N'120.70.85.54', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (89, N'120.70.85.55', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (90, N'120.70.85.56', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (91, N'120.70.85.57', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (92, N'120.70.85.58', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (93, N'120.70.85.59', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (94, N'120.70.85.60', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (95, N'120.70.85.61', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (96, N'120.70.85.62', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (97, N'120.70.85.63', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (98, N'120.70.85.64', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (99, N'120.70.85.65', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (100, N'120.70.85.66', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (101, N'120.70.85.67', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (102, N'120.70.85.68', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (103, N'120.70.85.69', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (104, N'120.70.85.70', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (105, N'120.70.85.71', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (106, N'120.70.85.72', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (107, N'120.70.85.73', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (108, N'120.70.85.74', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (109, N'120.70.85.75', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (110, N'120.70.85.76', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (111, N'120.70.85.77', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (112, N'120.70.85.78', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (113, N'120.70.85.79', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (114, N'120.70.85.80', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (115, N'120.70.85.81', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (116, N'120.70.85.82', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (117, N'120.70.85.83', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (118, N'120.70.85.84', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (119, N'120.70.85.85', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (120, N'120.70.85.86', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (121, N'120.70.85.87', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (122, N'120.70.85.88', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (123, N'120.70.85.89', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (124, N'120.70.85.90', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (125, N'120.70.85.91', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (126, N'120.70.85.92', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (127, N'120.70.85.93', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (128, N'120.70.85.94', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (129, N'120.70.85.95', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (130, N'120.70.85.96', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (131, N'120.70.85.97', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (132, N'120.70.85.98', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (133, N'120.70.85.99', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (134, N'120.70.85.100', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (135, N'120.70.85.101', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (136, N'120.70.85.102', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (137, N'120.70.85.103', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (138, N'120.70.85.104', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (139, N'120.70.85.105', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (140, N'120.70.85.106', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (141, N'120.70.85.107', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (142, N'120.70.85.108', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (143, N'120.70.85.109', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (144, N'120.70.85.110', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (145, N'120.70.85.111', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (146, N'120.70.85.112', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (147, N'120.70.85.113', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (148, N'120.70.85.114', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (149, N'120.70.85.115', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (150, N'120.70.85.116', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (151, N'120.70.85.117', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (152, N'120.70.85.118', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (153, N'120.70.85.119', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (154, N'120.70.85.120', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (155, N'120.70.85.121', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (156, N'120.70.85.122', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (157, N'120.70.85.123', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (158, N'120.70.85.124', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (159, N'120.70.85.125', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (160, N'120.70.85.126', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (161, N'120.70.85.127', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (162, N'120.70.85.128', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (163, N'120.70.85.129', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (164, N'120.70.85.130', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (165, N'120.70.85.131', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (166, N'120.70.85.132', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (167, N'120.70.85.133', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (168, N'120.70.85.134', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (169, N'120.70.85.135', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (170, N'120.70.85.136', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (171, N'120.70.85.137', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (172, N'120.70.85.138', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (173, N'120.70.85.139', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (174, N'120.70.85.140', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (175, N'120.70.85.141', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (176, N'120.70.85.142', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (177, N'120.70.85.143', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (178, N'120.70.85.144', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (179, N'120.70.85.145', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (180, N'120.70.85.146', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (181, N'120.70.85.147', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (182, N'120.70.85.148', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (183, N'120.70.85.149', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (184, N'120.70.85.150', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (185, N'120.70.85.151', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (186, N'120.70.85.152', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (187, N'120.70.85.153', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (188, N'120.70.85.154', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (189, N'120.70.85.155', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (190, N'120.70.85.156', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (191, N'120.70.85.157', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (192, N'120.70.85.158', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (193, N'120.70.85.159', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (194, N'120.70.85.160', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (195, N'120.70.85.161', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (196, N'120.70.85.162', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (197, N'120.70.85.163', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (198, N'120.70.85.164', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (199, N'120.70.85.165', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (200, N'120.70.85.166', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (201, N'120.70.85.167', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (202, N'120.70.85.168', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (203, N'120.70.85.169', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (204, N'120.70.85.170', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (205, N'120.70.85.171', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (206, N'120.70.85.172', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (207, N'120.70.85.173', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (208, N'120.70.85.174', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (209, N'120.70.85.175', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (210, N'120.70.85.176', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (211, N'120.70.85.177', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (212, N'120.70.85.178', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (213, N'120.70.85.179', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (214, N'120.70.85.180', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (215, N'120.70.85.181', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (216, N'120.70.85.182', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (217, N'120.70.85.183', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (218, N'120.70.85.184', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (219, N'120.70.85.185', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (220, N'120.70.85.186', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (221, N'120.70.85.187', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (222, N'120.70.85.188', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (223, N'120.70.85.189', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (224, N'120.70.85.190', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (225, N'120.70.85.191', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (226, N'120.70.85.192', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (227, N'120.70.85.193', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (228, N'120.70.85.194', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (229, N'120.70.85.195', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (230, N'120.70.85.196', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (231, N'120.70.85.197', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (232, N'120.70.85.198', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (233, N'120.70.85.199', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (234, N'120.70.85.200', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (235, N'120.70.85.201', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (236, N'120.70.85.202', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (237, N'120.70.85.203', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (238, N'120.70.85.204', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (239, N'120.70.85.205', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (240, N'120.70.85.206', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (241, N'120.70.85.207', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (242, N'120.70.85.208', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (243, N'120.70.85.209', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (244, N'120.70.85.210', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (245, N'120.70.85.211', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (246, N'120.70.85.212', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (247, N'120.70.85.213', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (248, N'120.70.85.214', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (249, N'120.70.85.215', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (250, N'120.70.85.216', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (251, N'120.70.85.217', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (252, N'120.70.85.218', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (253, N'120.70.85.219', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (254, N'120.70.85.220', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (255, N'120.70.85.221', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (256, N'120.70.85.222', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (257, N'120.70.85.223', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (258, N'120.70.85.224', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (259, N'120.70.85.225', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (260, N'120.70.85.226', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (261, N'120.70.85.227', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (262, N'120.70.85.228', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (263, N'120.70.85.229', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (264, N'120.70.85.230', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (265, N'120.70.85.231', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (266, N'120.70.85.232', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (267, N'120.70.85.233', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (268, N'120.70.85.234', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (269, N'120.70.85.235', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (270, N'120.70.85.236', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (271, N'120.70.85.237', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (272, N'120.70.85.238', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (273, N'120.70.85.239', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (274, N'120.70.85.240', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (275, N'120.70.85.241', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (276, N'120.70.85.242', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (277, N'120.70.85.243', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (278, N'120.70.85.244', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (279, N'120.70.85.245', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (280, N'120.70.85.246', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (281, N'120.70.85.247', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (282, N'120.70.85.248', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (283, N'120.70.85.249', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (284, N'120.70.85.250', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (285, N'120.70.85.251', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (286, N'120.70.85.252', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (287, N'120.70.85.253', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (288, N'120.70.85.254', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (289, N'120.70.85.255', N'120.70.85.1', N'120.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:27.063' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (290, N'122.70.85.0', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (291, N'122.70.85.1', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (292, N'122.70.85.2', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (293, N'122.70.85.3', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (294, N'122.70.85.4', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (295, N'122.70.85.5', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (296, N'122.70.85.6', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (297, N'122.70.85.7', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (298, N'122.70.85.8', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (299, N'122.70.85.9', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (300, N'122.70.85.10', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (301, N'122.70.85.11', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (302, N'122.70.85.12', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (303, N'122.70.85.13', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (304, N'122.70.85.14', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (305, N'122.70.85.15', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (306, N'122.70.85.16', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (307, N'122.70.85.17', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (308, N'122.70.85.18', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (309, N'122.70.85.19', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (310, N'122.70.85.20', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (311, N'122.70.85.21', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (312, N'122.70.85.22', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (313, N'122.70.85.23', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (314, N'122.70.85.24', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (315, N'122.70.85.25', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (316, N'122.70.85.26', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (317, N'122.70.85.27', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (318, N'122.70.85.28', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (319, N'122.70.85.29', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (320, N'122.70.85.30', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (321, N'122.70.85.31', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (322, N'122.70.85.32', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (323, N'122.70.85.33', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (324, N'122.70.85.34', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (325, N'122.70.85.35', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (326, N'122.70.85.36', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (327, N'122.70.85.37', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (328, N'122.70.85.38', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (329, N'122.70.85.39', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (330, N'122.70.85.40', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (331, N'122.70.85.41', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (332, N'122.70.85.42', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (333, N'122.70.85.43', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (334, N'122.70.85.44', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (335, N'122.70.85.45', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (336, N'122.70.85.46', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (337, N'122.70.85.47', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (338, N'122.70.85.48', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (339, N'122.70.85.49', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (340, N'122.70.85.50', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (341, N'122.70.85.51', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (342, N'122.70.85.52', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (343, N'122.70.85.53', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (344, N'122.70.85.54', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (345, N'122.70.85.55', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (346, N'122.70.85.56', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (347, N'122.70.85.57', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (348, N'122.70.85.58', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (349, N'122.70.85.59', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (350, N'122.70.85.60', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (351, N'122.70.85.61', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (352, N'122.70.85.62', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (353, N'122.70.85.63', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (354, N'122.70.85.64', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (355, N'122.70.85.65', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (356, N'122.70.85.66', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (357, N'122.70.85.67', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (358, N'122.70.85.68', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (359, N'122.70.85.69', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (360, N'122.70.85.70', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (361, N'122.70.85.71', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (362, N'122.70.85.72', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (363, N'122.70.85.73', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (364, N'122.70.85.74', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (365, N'122.70.85.75', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (366, N'122.70.85.76', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (367, N'122.70.85.77', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (368, N'122.70.85.78', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (369, N'122.70.85.79', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (370, N'122.70.85.80', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (371, N'122.70.85.81', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (372, N'122.70.85.82', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (373, N'122.70.85.83', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (374, N'122.70.85.84', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (375, N'122.70.85.85', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (376, N'122.70.85.86', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (377, N'122.70.85.87', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (378, N'122.70.85.88', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (379, N'122.70.85.89', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (380, N'122.70.85.90', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (381, N'122.70.85.91', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (382, N'122.70.85.92', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (383, N'122.70.85.93', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (384, N'122.70.85.94', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (385, N'122.70.85.95', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (386, N'122.70.85.96', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (387, N'122.70.85.97', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (388, N'122.70.85.98', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (389, N'122.70.85.99', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (390, N'122.70.85.100', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (391, N'122.70.85.101', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (392, N'122.70.85.102', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (393, N'122.70.85.103', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (394, N'122.70.85.104', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (395, N'122.70.85.105', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (396, N'122.70.85.106', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (397, N'122.70.85.107', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (398, N'122.70.85.108', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (399, N'122.70.85.109', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (400, N'122.70.85.110', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (401, N'122.70.85.111', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (402, N'122.70.85.112', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (403, N'122.70.85.113', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (404, N'122.70.85.114', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (405, N'122.70.85.115', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (406, N'122.70.85.116', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (407, N'122.70.85.117', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (408, N'122.70.85.118', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (409, N'122.70.85.119', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (410, N'122.70.85.120', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (411, N'122.70.85.121', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (412, N'122.70.85.122', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (413, N'122.70.85.123', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (414, N'122.70.85.124', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (415, N'122.70.85.125', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (416, N'122.70.85.126', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (417, N'122.70.85.127', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (418, N'122.70.85.128', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (419, N'122.70.85.129', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (420, N'122.70.85.130', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (421, N'122.70.85.131', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (422, N'122.70.85.132', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (423, N'122.70.85.133', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (424, N'122.70.85.134', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (425, N'122.70.85.135', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (426, N'122.70.85.136', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (427, N'122.70.85.137', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (428, N'122.70.85.138', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (429, N'122.70.85.139', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (430, N'122.70.85.140', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (431, N'122.70.85.141', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (432, N'122.70.85.142', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (433, N'122.70.85.143', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (434, N'122.70.85.144', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (435, N'122.70.85.145', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (436, N'122.70.85.146', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (437, N'122.70.85.147', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (438, N'122.70.85.148', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (439, N'122.70.85.149', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (440, N'122.70.85.150', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (441, N'122.70.85.151', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (442, N'122.70.85.152', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (443, N'122.70.85.153', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (444, N'122.70.85.154', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (445, N'122.70.85.155', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (446, N'122.70.85.156', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (447, N'122.70.85.157', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (448, N'122.70.85.158', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (449, N'122.70.85.159', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (450, N'122.70.85.160', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (451, N'122.70.85.161', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (452, N'122.70.85.162', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (453, N'122.70.85.163', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (454, N'122.70.85.164', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (455, N'122.70.85.165', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (456, N'122.70.85.166', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (457, N'122.70.85.167', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (458, N'122.70.85.168', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (459, N'122.70.85.169', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (460, N'122.70.85.170', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (461, N'122.70.85.171', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (462, N'122.70.85.172', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (463, N'122.70.85.173', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (464, N'122.70.85.174', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (465, N'122.70.85.175', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (466, N'122.70.85.176', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (467, N'122.70.85.177', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (468, N'122.70.85.178', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (469, N'122.70.85.179', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (470, N'122.70.85.180', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (471, N'122.70.85.181', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (472, N'122.70.85.182', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (473, N'122.70.85.183', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (474, N'122.70.85.184', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (475, N'122.70.85.185', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (476, N'122.70.85.186', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (477, N'122.70.85.187', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (478, N'122.70.85.188', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (479, N'122.70.85.189', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (480, N'122.70.85.190', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (481, N'122.70.85.191', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (482, N'122.70.85.192', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (483, N'122.70.85.193', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (484, N'122.70.85.194', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (485, N'122.70.85.195', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (486, N'122.70.85.196', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (487, N'122.70.85.197', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (488, N'122.70.85.198', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (489, N'122.70.85.199', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (490, N'122.70.85.200', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (491, N'122.70.85.201', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (492, N'122.70.85.202', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (493, N'122.70.85.203', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (494, N'122.70.85.204', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (495, N'122.70.85.205', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (496, N'122.70.85.206', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (497, N'122.70.85.207', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (498, N'122.70.85.208', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (499, N'122.70.85.209', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (500, N'122.70.85.210', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (501, N'122.70.85.211', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (502, N'122.70.85.212', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (503, N'122.70.85.213', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (504, N'122.70.85.214', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (505, N'122.70.85.215', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (506, N'122.70.85.216', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (507, N'122.70.85.217', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (508, N'122.70.85.218', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (509, N'122.70.85.219', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (510, N'122.70.85.220', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (511, N'122.70.85.221', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (512, N'122.70.85.222', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (513, N'122.70.85.223', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (514, N'122.70.85.224', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (515, N'122.70.85.225', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (516, N'122.70.85.226', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (517, N'122.70.85.227', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (518, N'122.70.85.228', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (519, N'122.70.85.229', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (520, N'122.70.85.230', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (521, N'122.70.85.231', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (522, N'122.70.85.232', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (523, N'122.70.85.233', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (524, N'122.70.85.234', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (525, N'122.70.85.235', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (526, N'122.70.85.236', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (527, N'122.70.85.237', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (528, N'122.70.85.238', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (529, N'122.70.85.239', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (530, N'122.70.85.240', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (531, N'122.70.85.241', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (532, N'122.70.85.242', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (533, N'122.70.85.243', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (534, N'122.70.85.244', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (535, N'122.70.85.245', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (536, N'122.70.85.246', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (537, N'122.70.85.247', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (538, N'122.70.85.248', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (539, N'122.70.85.249', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (540, N'122.70.85.250', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (541, N'122.70.85.251', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (542, N'122.70.85.252', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (543, N'122.70.85.253', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (544, N'122.70.85.254', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (545, N'122.70.85.255', N'122.70.85.1', N'122.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:21:51.267' AS DateTime), N'STATUS35', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (546, N'123.70.85.0', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (547, N'123.70.85.1', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS32', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (548, N'123.70.85.2', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (549, N'123.70.85.3', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (550, N'123.70.85.4', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (551, N'123.70.85.5', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (552, N'123.70.85.6', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (553, N'123.70.85.7', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (554, N'123.70.85.8', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (555, N'123.70.85.9', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (556, N'123.70.85.10', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (557, N'123.70.85.11', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (558, N'123.70.85.12', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (559, N'123.70.85.13', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (560, N'123.70.85.14', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (561, N'123.70.85.15', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (562, N'123.70.85.16', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (563, N'123.70.85.17', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (564, N'123.70.85.18', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (565, N'123.70.85.19', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (566, N'123.70.85.20', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (567, N'123.70.85.21', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (568, N'123.70.85.22', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (569, N'123.70.85.23', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (570, N'123.70.85.24', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (571, N'123.70.85.25', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (572, N'123.70.85.26', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (573, N'123.70.85.27', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (574, N'123.70.85.28', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (575, N'123.70.85.29', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (576, N'123.70.85.30', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (577, N'123.70.85.31', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (578, N'123.70.85.32', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (579, N'123.70.85.33', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (580, N'123.70.85.34', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (581, N'123.70.85.35', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (582, N'123.70.85.36', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (583, N'123.70.85.37', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (584, N'123.70.85.38', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (585, N'123.70.85.39', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (586, N'123.70.85.40', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (587, N'123.70.85.41', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (588, N'123.70.85.42', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (589, N'123.70.85.43', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (590, N'123.70.85.44', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (591, N'123.70.85.45', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (592, N'123.70.85.46', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (593, N'123.70.85.47', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (594, N'123.70.85.48', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (595, N'123.70.85.49', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (596, N'123.70.85.50', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (597, N'123.70.85.51', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (598, N'123.70.85.52', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (599, N'123.70.85.53', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (600, N'123.70.85.54', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (601, N'123.70.85.55', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (602, N'123.70.85.56', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (603, N'123.70.85.57', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (604, N'123.70.85.58', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (605, N'123.70.85.59', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (606, N'123.70.85.60', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (607, N'123.70.85.61', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (608, N'123.70.85.62', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (609, N'123.70.85.63', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (610, N'123.70.85.64', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (611, N'123.70.85.65', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (612, N'123.70.85.66', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (613, N'123.70.85.67', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (614, N'123.70.85.68', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (615, N'123.70.85.69', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (616, N'123.70.85.70', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (617, N'123.70.85.71', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (618, N'123.70.85.72', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (619, N'123.70.85.73', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (620, N'123.70.85.74', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (621, N'123.70.85.75', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (622, N'123.70.85.76', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (623, N'123.70.85.77', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (624, N'123.70.85.78', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (625, N'123.70.85.79', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (626, N'123.70.85.80', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (627, N'123.70.85.81', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (628, N'123.70.85.82', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (629, N'123.70.85.83', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (630, N'123.70.85.84', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (631, N'123.70.85.85', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (632, N'123.70.85.86', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (633, N'123.70.85.87', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (634, N'123.70.85.88', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (635, N'123.70.85.89', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (636, N'123.70.85.90', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (637, N'123.70.85.91', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (638, N'123.70.85.92', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (639, N'123.70.85.93', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (640, N'123.70.85.94', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (641, N'123.70.85.95', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (642, N'123.70.85.96', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (643, N'123.70.85.97', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (644, N'123.70.85.98', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (645, N'123.70.85.99', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (646, N'123.70.85.100', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (647, N'123.70.85.101', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (648, N'123.70.85.102', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (649, N'123.70.85.103', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (650, N'123.70.85.104', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (651, N'123.70.85.105', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (652, N'123.70.85.106', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (653, N'123.70.85.107', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (654, N'123.70.85.108', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (655, N'123.70.85.109', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (656, N'123.70.85.110', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (657, N'123.70.85.111', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (658, N'123.70.85.112', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (659, N'123.70.85.113', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (660, N'123.70.85.114', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (661, N'123.70.85.115', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (662, N'123.70.85.116', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (663, N'123.70.85.117', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (664, N'123.70.85.118', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (665, N'123.70.85.119', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (666, N'123.70.85.120', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (667, N'123.70.85.121', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (668, N'123.70.85.122', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (669, N'123.70.85.123', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (670, N'123.70.85.124', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (671, N'123.70.85.125', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (672, N'123.70.85.126', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (673, N'123.70.85.127', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (674, N'123.70.85.128', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (675, N'123.70.85.129', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (676, N'123.70.85.130', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (677, N'123.70.85.131', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (678, N'123.70.85.132', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (679, N'123.70.85.133', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (680, N'123.70.85.134', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (681, N'123.70.85.135', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (682, N'123.70.85.136', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (683, N'123.70.85.137', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (684, N'123.70.85.138', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (685, N'123.70.85.139', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (686, N'123.70.85.140', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (687, N'123.70.85.141', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (688, N'123.70.85.142', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (689, N'123.70.85.143', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (690, N'123.70.85.144', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (691, N'123.70.85.145', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (692, N'123.70.85.146', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (693, N'123.70.85.147', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (694, N'123.70.85.148', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (695, N'123.70.85.149', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (696, N'123.70.85.150', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (697, N'123.70.85.151', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (698, N'123.70.85.152', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (699, N'123.70.85.153', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (700, N'123.70.85.154', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (701, N'123.70.85.155', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (702, N'123.70.85.156', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (703, N'123.70.85.157', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (704, N'123.70.85.158', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (705, N'123.70.85.159', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (706, N'123.70.85.160', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (707, N'123.70.85.161', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (708, N'123.70.85.162', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (709, N'123.70.85.163', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (710, N'123.70.85.164', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (711, N'123.70.85.165', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (712, N'123.70.85.166', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (713, N'123.70.85.167', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (714, N'123.70.85.168', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (715, N'123.70.85.169', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (716, N'123.70.85.170', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (717, N'123.70.85.171', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (718, N'123.70.85.172', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (719, N'123.70.85.173', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (720, N'123.70.85.174', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (721, N'123.70.85.175', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (722, N'123.70.85.176', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (723, N'123.70.85.177', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (724, N'123.70.85.178', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (725, N'123.70.85.179', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (726, N'123.70.85.180', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (727, N'123.70.85.181', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (728, N'123.70.85.182', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (729, N'123.70.85.183', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (730, N'123.70.85.184', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (731, N'123.70.85.185', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (732, N'123.70.85.186', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
GO
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (733, N'123.70.85.187', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (734, N'123.70.85.188', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (735, N'123.70.85.189', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (736, N'123.70.85.190', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (737, N'123.70.85.191', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (738, N'123.70.85.192', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (739, N'123.70.85.193', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (740, N'123.70.85.194', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (741, N'123.70.85.195', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (742, N'123.70.85.196', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (743, N'123.70.85.197', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (744, N'123.70.85.198', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (745, N'123.70.85.199', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (746, N'123.70.85.200', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (747, N'123.70.85.201', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (748, N'123.70.85.202', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (749, N'123.70.85.203', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (750, N'123.70.85.204', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (751, N'123.70.85.205', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (752, N'123.70.85.206', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (753, N'123.70.85.207', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (754, N'123.70.85.208', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (755, N'123.70.85.209', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (756, N'123.70.85.210', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (757, N'123.70.85.211', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (758, N'123.70.85.212', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (759, N'123.70.85.213', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (760, N'123.70.85.214', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (761, N'123.70.85.215', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (762, N'123.70.85.216', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (763, N'123.70.85.217', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (764, N'123.70.85.218', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (765, N'123.70.85.219', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (766, N'123.70.85.220', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (767, N'123.70.85.221', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (768, N'123.70.85.222', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (769, N'123.70.85.223', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (770, N'123.70.85.224', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (771, N'123.70.85.225', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (772, N'123.70.85.226', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (773, N'123.70.85.227', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (774, N'123.70.85.228', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (775, N'123.70.85.229', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (776, N'123.70.85.230', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (777, N'123.70.85.231', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (778, N'123.70.85.232', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (779, N'123.70.85.233', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (780, N'123.70.85.234', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (781, N'123.70.85.235', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (782, N'123.70.85.236', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (783, N'123.70.85.237', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (784, N'123.70.85.238', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (785, N'123.70.85.239', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (786, N'123.70.85.240', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (787, N'123.70.85.241', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (788, N'123.70.85.242', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (789, N'123.70.85.243', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (790, N'123.70.85.244', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (791, N'123.70.85.245', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (792, N'123.70.85.246', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (793, N'123.70.85.247', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (794, N'123.70.85.248', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (795, N'123.70.85.249', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (796, N'123.70.85.250', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (797, N'123.70.85.251', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (798, N'123.70.85.252', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (799, N'123.70.85.253', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (800, N'123.70.85.254', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (801, N'123.70.85.255', N'123.70.85.1', N'123.70.85.0', N'255.255.255.0', NULL, CAST(N'2016-03-18 22:22:09.667' AS DateTime), N'STATUS32', 0)
SET IDENTITY_INSERT [dbo].[IPAddressPool] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (331, N'L724387', N'R987624', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (332, N'L976853', N'R987624', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (333, N'L388528', N'R987624', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (334, N'L990473', N'R987624', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (335, N'L051143', N'R987624', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (336, N'L687452', N'R987624', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (337, N'L613703', N'R987624', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (338, N'L948026', N'R987624', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (339, N'L088580', N'R987624', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (340, N'L593466', N'R987624', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (341, N'L992327', N'R987624', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (342, N'L477819', N'R987624', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (343, N'L021312', N'R987624', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (344, N'L267854', N'R987624', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (345, N'L465007', N'R987624', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (346, N'L731913', N'R987624', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (347, N'L876901', N'R987624', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (348, N'L525481', N'R987624', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (349, N'L115618', N'R987624', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (350, N'L841340', N'R987624', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (351, N'L807825', N'R987624', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (352, N'L662743', N'R987624', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (353, N'L182549', N'R987624', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (354, N'L332575', N'R987624', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (355, N'L882531', N'R987624', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (356, N'L090530', N'R987624', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (357, N'L835181', N'R987624', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (358, N'L596987', N'R987624', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (359, N'L014066', N'R987624', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (360, N'L810887', N'R987624', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (361, N'L528505', N'R987624', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (362, N'L709877', N'R987624', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (363, N'L767825', N'R987624', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (364, N'L183828', N'R987624', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (365, N'L573822', N'R987624', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (366, N'L981239', N'R987624', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (367, N'L575786', N'R987624', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (368, N'L228070', N'R987624', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (369, N'L768663', N'R987624', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (370, N'L750114', N'R987624', 40, N'STATUS14', N'S128859342')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (371, N'L649129', N'R987624', 41, N'STATUS14', N'S128859342')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (372, N'L822080', N'R987624', 42, N'STATUS14', N'S707061668')
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (373, N'L453599', N'R941520', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (374, N'L909088', N'R941520', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (375, N'L372049', N'R941520', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (376, N'L674818', N'R941520', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (377, N'L132416', N'R941520', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (378, N'L528884', N'R941520', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (379, N'L608944', N'R941520', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (380, N'L037106', N'R941520', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (381, N'L840352', N'R941520', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (382, N'L583971', N'R941520', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (383, N'L212558', N'R941520', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (384, N'L060235', N'R941520', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (385, N'L024279', N'R941520', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (386, N'L467072', N'R941520', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (387, N'L454487', N'R941520', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (388, N'L979705', N'R941520', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (389, N'L839551', N'R941520', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (390, N'L060917', N'R941520', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (391, N'L386652', N'R941520', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (392, N'L960604', N'R941520', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (393, N'L669494', N'R941520', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (394, N'L070513', N'R941520', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (395, N'L310874', N'R941520', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (396, N'L524362', N'R941520', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (397, N'L482351', N'R941520', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (398, N'L781849', N'R941520', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (399, N'L496114', N'R941520', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (400, N'L982281', N'R941520', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (401, N'L229592', N'R941520', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (402, N'L278284', N'R941520', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (403, N'L950534', N'R941520', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (404, N'L621656', N'R941520', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (405, N'L842506', N'R941520', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (406, N'L483556', N'R941520', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (407, N'L073955', N'R941520', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (408, N'L975102', N'R941520', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (409, N'L278807', N'R941520', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (410, N'L701706', N'R941520', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (411, N'L891146', N'R941520', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (412, N'L406501', N'R941520', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (413, N'L154262', N'R941520', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (414, N'L709892', N'R941520', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (415, N'L771522', N'R052649', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (416, N'L446122', N'R052649', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (417, N'L733851', N'R052649', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (418, N'L705623', N'R052649', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (419, N'L147872', N'R052649', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (420, N'L238371', N'R052649', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (421, N'L820805', N'R052649', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (422, N'L188543', N'R052649', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (423, N'L177589', N'R052649', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (424, N'L613369', N'R052649', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (425, N'L500308', N'R052649', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (426, N'L104020', N'R052649', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (427, N'L618571', N'R052649', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (428, N'L377411', N'R052649', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (429, N'L386848', N'R052649', 15, N'STATUS13', NULL)
GO
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (430, N'L662131', N'R052649', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (431, N'L762972', N'R052649', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (432, N'L224153', N'R052649', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (433, N'L635207', N'R052649', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (434, N'L149477', N'R052649', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (435, N'L894725', N'R052649', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (436, N'L142612', N'R052649', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (437, N'L205111', N'R052649', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (438, N'L061733', N'R052649', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (439, N'L321486', N'R052649', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (440, N'L077708', N'R052649', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (441, N'L612472', N'R052649', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (442, N'L702050', N'R052649', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (443, N'L292011', N'R052649', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (444, N'L429204', N'R052649', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (446, N'L639720', N'R052649', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (447, N'L045589', N'R052649', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (448, N'L430037', N'R052649', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (449, N'L744775', N'R052649', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (450, N'L766641', N'R052649', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (451, N'L967895', N'R052649', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (452, N'L108470', N'R052649', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (453, N'L312494', N'R052649', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (454, N'L522973', N'R052649', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (455, N'L911883', N'R052649', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (456, N'L119290', N'R052649', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (457, N'L871149', N'R095415', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (458, N'L736090', N'R095415', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (459, N'L889577', N'R095415', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (460, N'L561672', N'R095415', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (461, N'L916441', N'R095415', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (462, N'L375914', N'R095415', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (463, N'L333598', N'R095415', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (464, N'L077107', N'R095415', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (465, N'L471187', N'R095415', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (466, N'L707728', N'R095415', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (467, N'L751651', N'R095415', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (468, N'L859141', N'R095415', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (469, N'L865900', N'R095415', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (470, N'L608822', N'R095415', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (471, N'L652622', N'R095415', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (472, N'L107464', N'R095415', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (473, N'L734579', N'R095415', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (474, N'L990377', N'R095415', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (475, N'L707250', N'R095415', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (476, N'L438835', N'R095415', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (477, N'L655630', N'R095415', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (478, N'L193382', N'R095415', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (479, N'L919651', N'R095415', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (480, N'L766174', N'R095415', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (481, N'L600553', N'R095415', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (482, N'L797412', N'R095415', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (483, N'L085923', N'R095415', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (484, N'L713482', N'R095415', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (485, N'L713331', N'R095415', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (486, N'L756993', N'R095415', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (487, N'L062977', N'R095415', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (488, N'L797401', N'R095415', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (489, N'L151898', N'R095415', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (490, N'L580309', N'R095415', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (491, N'L725523', N'R095415', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (492, N'L321336', N'R095415', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (493, N'L039860', N'R095415', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (494, N'L275441', N'R095415', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (495, N'L753046', N'R095415', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (496, N'L234331', N'R095415', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (497, N'L469842', N'R095415', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (498, N'L708603', N'R095415', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (499, N'L075252', N'R553036', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (500, N'L549872', N'R553036', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (501, N'L305564', N'R553036', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (502, N'L638693', N'R553036', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (503, N'L564400', N'R553036', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (504, N'L502779', N'R553036', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (505, N'L333581', N'R553036', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (506, N'L145379', N'R553036', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (507, N'L624009', N'R553036', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (508, N'L493754', N'R553036', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (509, N'L231081', N'R553036', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (510, N'L517663', N'R553036', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (511, N'L476171', N'R553036', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (512, N'L305263', N'R553036', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (513, N'L565675', N'R553036', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (514, N'L999186', N'R553036', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (515, N'L640933', N'R553036', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (516, N'L242113', N'R553036', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (517, N'L940351', N'R553036', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (518, N'L227403', N'R553036', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (519, N'L195818', N'R553036', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (520, N'L034410', N'R553036', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (521, N'L771037', N'R553036', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (522, N'L747177', N'R553036', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (523, N'L330858', N'R553036', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (524, N'L190154', N'R553036', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (525, N'L425277', N'R553036', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (526, N'L592835', N'R553036', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (527, N'L195484', N'R553036', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (528, N'L412822', N'R553036', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (529, N'L117462', N'R553036', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (530, N'L871936', N'R553036', 32, N'STATUS13', NULL)
GO
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (531, N'L471702', N'R553036', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (532, N'L891624', N'R553036', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (533, N'L108145', N'R553036', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (534, N'L494387', N'R553036', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (535, N'L381168', N'R553036', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (536, N'L857659', N'R553036', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (537, N'L712855', N'R553036', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (538, N'L121043', N'R553036', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (539, N'L202143', N'R553036', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (540, N'L795693', N'R553036', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (541, N'L240597', N'R308741', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (542, N'L710883', N'R308741', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (543, N'L741200', N'R308741', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (544, N'L826263', N'R308741', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (545, N'L547723', N'R308741', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (546, N'L680384', N'R308741', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (547, N'L672996', N'R308741', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (548, N'L074039', N'R308741', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (549, N'L251498', N'R308741', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (550, N'L769548', N'R308741', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (551, N'L722105', N'R308741', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (552, N'L548216', N'R308741', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (553, N'L838882', N'R308741', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (554, N'L535183', N'R308741', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (555, N'L843464', N'R308741', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (445, N'L203932', N'R052649', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (556, N'L196621', N'R308741', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (557, N'L626059', N'R308741', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (558, N'L403090', N'R308741', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (559, N'L913547', N'R308741', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (560, N'L449557', N'R308741', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (561, N'L739530', N'R308741', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (562, N'L968087', N'R308741', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (563, N'L855198', N'R308741', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (564, N'L171950', N'R308741', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (565, N'L648682', N'R308741', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (566, N'L538601', N'R308741', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (567, N'L496724', N'R308741', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (568, N'L452407', N'R308741', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (569, N'L718873', N'R308741', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (570, N'L281105', N'R308741', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (571, N'L465695', N'R308741', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (572, N'L701215', N'R308741', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (573, N'L479098', N'R308741', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (574, N'L271987', N'R308741', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (575, N'L028050', N'R308741', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (576, N'L249679', N'R308741', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (577, N'L489567', N'R308741', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (578, N'L940615', N'R308741', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (579, N'L813885', N'R308741', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (580, N'L330822', N'R308741', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (581, N'L427527', N'R308741', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (582, N'L652929', N'R308741', 42, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (583, N'L603553', N'R421697', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (584, N'L227634', N'R421697', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (585, N'L105599', N'R421697', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (586, N'L919412', N'R421697', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (587, N'L069816', N'R421697', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (588, N'L105702', N'R421697', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (589, N'L291814', N'R421697', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (590, N'L490489', N'R421697', 8, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (591, N'L992773', N'R421697', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (592, N'L997075', N'R421697', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (593, N'L592717', N'R421697', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (594, N'L422290', N'R421697', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (595, N'L550131', N'R421697', 13, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (596, N'L573585', N'R421697', 14, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (597, N'L448826', N'R421697', 15, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (598, N'L947494', N'R421697', 16, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (599, N'L346630', N'R421697', 17, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (600, N'L588177', N'R421697', 18, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (601, N'L833911', N'R421697', 19, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (602, N'L756965', N'R421697', 20, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (603, N'L364058', N'R421697', 21, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (604, N'L201707', N'R421697', 22, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (605, N'L287651', N'R421697', 23, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (606, N'L850520', N'R421697', 24, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (607, N'L467270', N'R421697', 25, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (608, N'L583480', N'R421697', 26, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (609, N'L053603', N'R421697', 27, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (610, N'L065024', N'R421697', 28, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (611, N'L129609', N'R421697', 29, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (612, N'L221399', N'R421697', 30, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (613, N'L804752', N'R421697', 31, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (614, N'L655807', N'R421697', 32, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (615, N'L398906', N'R421697', 33, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (616, N'L079959', N'R421697', 34, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (617, N'L973239', N'R421697', 35, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (618, N'L861480', N'R421697', 36, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (619, N'L606633', N'R421697', 37, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (620, N'L646761', N'R421697', 38, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (621, N'L815321', N'R421697', 39, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (622, N'L037246', N'R421697', 40, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (623, N'L980006', N'R421697', 41, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (624, N'L918441', N'R421697', 42, N'STATUS13', NULL)
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[LogChangedContent] ON 

INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (5951, N'R672630909', N'ADDSERVER', N'Server', N'S707061668', N'STATUS01', N'S707061668', NULL, NULL, CAST(N'2016-03-18 23:10:15.347' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (5952, N'R672630909', N'ADDSERVER', N'Server', N'S128859342', N'STATUS01', N'S128859342', NULL, NULL, CAST(N'2016-03-18 23:10:15.437' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (5953, N'R672630909', N'ADDSERVER', N'Request', N'R672630909', N'STATUS04', NULL, NULL, N'manhnh', CAST(N'2016-03-18 23:10:15.440' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (5954, N'R928270273', N'RENTRACK', N'Request', N'R928270273', N'STATUS04', NULL, NULL, NULL, CAST(N'2016-03-18 23:31:44.667' AS DateTime), N'{"NumberOfIp":0,"Description":"thue 1 rack","NumberOfRack":1}', 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (5955, N'R672630909', N'ADDSERVER', N'Request', N'R672630909', N'STATUS05', NULL, NULL, N'haltt', CAST(N'2016-03-19 14:44:33.030' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (5956, N'R672630909', N'ASSIGNDEFAULTIP', N'IPAddress', N'120.70.85.2', N'STATUS11', N'S707061668', NULL, NULL, CAST(N'2016-03-19 14:44:58.627' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (5957, N'R672630909', N'ASSIGNDEFAULTIP', N'IPAddress', N'123.70.85.3', N'STATUS11', N'S128859342', NULL, NULL, CAST(N'2016-03-19 14:46:11.383' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (5958, N'R672630909', N'ADDSERVER', N'Server', N'S707061668', N'STATUS02', NULL, NULL, NULL, CAST(N'2016-03-19 14:50:31.440' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (5959, N'R672630909', N'ADDSERVER', N'Server', N'S128859342', N'STATUS02', NULL, NULL, NULL, CAST(N'2016-03-19 14:50:35.543' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (5960, N'R672630909', N'ADDSERVER', N'Request', N'R672630909', N'STATUS07', NULL, NULL, N'haltt', CAST(N'2016-03-19 14:50:35.590' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Username], [LogTime], [Description], [PreviousId]) VALUES (5961, N'R928270273', N'RENTRACK', N'Request', N'R928270273', N'STATUS06', NULL, NULL, N'haltt', CAST(N'2016-03-19 15:02:14.893' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[LogChangedContent] OFF
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

INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (27, N'R987624', N'A1', N'STATUS33', CAST(N'2016-03-18 21:51:53.707' AS DateTime), 15, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (28, N'R941520', N'B1', N'STATUS19', CAST(N'2016-03-18 21:52:05.937' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (29, N'R052649', N'C1', N'STATUS19', CAST(N'2016-03-18 21:52:10.327' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (30, N'R095415', N'A2', N'STATUS19', CAST(N'2016-03-18 21:52:15.083' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (31, N'R553036', N'A3', N'STATUS19', CAST(N'2016-03-18 21:52:19.380' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (32, N'R308741', N'B2', N'STATUS19', CAST(N'2016-03-18 21:52:24.697' AS DateTime), 10, NULL)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (33, N'R421697', N'C2', N'STATUS19', CAST(N'2016-03-18 21:52:34.383' AS DateTime), 10, NULL)
SET IDENTITY_INSERT [dbo].[Rack] OFF
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee]) VALUES (5229, N'R672630909', N'RT003', N'manhnh', CAST(N'2016-03-03 00:00:00.000' AS DateTime), N'dat 2 servers', CAST(N'2016-03-18 23:10:14.967' AS DateTime), N'STATUS07', 0, N'haltt')
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed], [Assignee]) VALUES (5230, N'R928270273', N'RT011', N'manhnh', NULL, N'{"NumberOfIp":0,"Description":"thue 1 rack","NumberOfRack":1}', CAST(N'2016-03-18 23:31:44.390' AS DateTime), N'STATUS06', 0, N'haltt')
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

INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (1086, N'S707061668', N'manhnh', NULL, NULL, 600, 1, N'STATUS02', N'120.70.85.2', CAST(N'2016-03-18 23:10:15.267' AS DateTime), NULL, N'100Mbps', NULL, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth], [PartNumber], [SerialNumber]) VALUES (1087, N'S128859342', N'manhnh', NULL, NULL, 750, 2, N'STATUS02', N'123.70.85.3', CAST(N'2016-03-18 23:10:15.420' AS DateTime), NULL, N'100Mbps', N'123423423', N'123345345')
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

INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (1111, N'S707061668', N'120.70.85.2', N'STATUS29', CAST(N'2016-03-19 14:44:58.583' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (1112, N'S128859342', N'123.70.85.3', N'STATUS29', CAST(N'2016-03-19 14:46:11.377' AS DateTime), 0)
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
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (17, N'STATUS17', N'Done', N'Task', 3)
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
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (37, N'STATUS37', N'Cancel', N'Task', 5)
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[TempRequest] ON 

INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (2131, N'T065093794', N'R672630909', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"manhnh","Maker":null,"Model":null,"Power":600,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","PartNumber":null,"SerialNumber":null,"Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (2132, N'T709948982', N'R672630909', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"locations":null,"btnAction":"OK","ServerDefaultIP":null,"ServerCode":null,"Customer":"manhnh","Maker":null,"Model":null,"Power":750,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","PartNumber":"123423423","SerialNumber":"123345345","Id":0}')
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
