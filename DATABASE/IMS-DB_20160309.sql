USE [master]
GO
/****** Object:  Database [IMS]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 3/9/2016 11:43:53 PM ******/
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
	[GroupCode] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignedShift]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[Attribute]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 3/9/2016 11:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IPAddressPool]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[Location]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[LogChangedContent]    Script Date: 3/9/2016 11:43:53 PM ******/
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
	[Description] [nvarchar](max) NULL,
	[PreviousId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Note]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 3/9/2016 11:43:53 PM ******/
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
	[IsRead] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Object]    Script Date: 3/9/2016 11:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Object](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Object] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rack]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[RackOfCustomer]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 3/9/2016 11:43:53 PM ******/
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
	[IsViewed] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestType]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 3/9/2016 11:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Server]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[ServerAttribute]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[ServerIP]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[Shift]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[StaffAssignment]    Script Date: 3/9/2016 11:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffAssignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShiftHead] [nvarchar](50) NULL,
	[AssignedStaff] [nvarchar](50) NULL,
	[PreAssignedStaff] [nvarchar](50) NULL,
	[RequestCode] [nvarchar](50) NULL,
	[AssignmentStatus] [nvarchar](50) NULL,
	[ChangedStatusTime] [datetime] NULL,
	[Comment] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[TempRequest]    Script Date: 3/9/2016 11:43:53 PM ******/
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
/****** Object:  Table [dbo].[TypeOfLog]    Script Date: 3/9/2016 11:43:53 PM ******/
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

INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (6, N'anndh', N'123', N'Manager', 1, N'Ngô Đăng Hà An', N'0964356773', N'sdfsfsdfsdf@email.com', N'Quận 7', N'324578023', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (2, N'haltt', N'123', N'Shift Head', 1, N'Lê Thi Thu Hà', N'0912345678', N'thuha051093@gmail.com', N'4/33 Văn Chung', N'331717456', N'Group 1')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (11, N'hieultt', N'BEXHNP', N'Customer', 1, N'Lê Trần Trung Hiếu', N'0912345679', N'letrantrunghieu@gmail.com', N'4/33 Văn Chung', N'3134567936', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (12, N'hungnh', N'NXLBXAXUML', N'Shift Head', 1, N'Nguyễn Huy Hùng', N'0912345672', N'hungnh@fpt.edu.vn', N'Quận 7', N'3134567938', N'Group 2')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (5, N'manhnh', N'123', N'Customer', 1, N'Nguyễn Hùng Mạnh', N'0945683220', N'manhnguyen@gmail.com', N'Phạm Văn Hai, Tân Bình, Hồ Chí Minh', N'339867411', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (4, N'namch', N'123', N'Shift Head', 1, N'Cao Hồng Nam', N'0933412886', N'namcao@gmail.com', N'Nha Trang', N'331818933', N'Group 3')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (8, N'namnt', N'123', N'Customer', 1, N'Nguyễn Trung Nam', N'0965834779', N'namnt@gmail.com', N'Quận 9, Hồ Chí Minh', N'378990467', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (9, N'nhink', N'123', N'Staff', 1, N'Nguyễn Khả Nhi', N'0974456331', N'nhink@gmail.com', N'Quận 3, Hồ Chí Minh', N'356789002', N'Group 4')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (10, N'phuoclh', N'1234', N'Staff', 1, N'Lâm Hữu Phước', N'0983124456', N'phuochl@gmail.com', N'Quận Phú Nhuận, Hồ Chí Minh', N'3134567931', N'Group 2')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (3, N'tienhl', N'123', N'Shift Head', 1, N'Huỳnh Lâm Hà Tiên', N'0935678002', N'tienhuynh@gmail.com', N'Gò Vấp', N'331789456', N'Group 4')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (7, N'thaohq', N'123', N'Customer', 1, N'Huỳnh Quang Thảo', N'0967345813', N'thaohq@gmail.com', N'Quận 1, Hồ Chí Minh', N'331783556', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (17, N'quyenttt', N'QJVJRKHSAI', N'Staff', 1, N'Truyền Thanh Thảo Quyên', N'0933412883', N'truyenthanhthaoquyen@gmail.com', N'Lý Thường Kiệt, Quận 10', N'331717499', N'Group 4')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (15, N'haovtm', N'HWSADFQXWL', N'Staff', 1, N'Vũ Thị Mỹ Hảo', N'0943245890', N'haovtm@gmail.com', N'Quận 9, Hồ Chí Minh, Việt Nam', N'3134567922', N'Group 3')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (18, N'thanhnd', N'PSWSYQOLTT', N'Customer', 1, N'Nguyễn Duy Thanh', N'0912345654', N'nguyenduythanh@gmail.com', N'Quận Bình Thạnh', N'3134567531', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (1018, N'halt', N'MSTMOEYBBN', N'Staff', 1, N'Lê Thu Hà', N'0933412888', N'thuha051093@gmail.com', N'Quận 7', N'331717457', N'Group 3')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (1019, N'bichtt', N'EIEQBKGCBO', N'Staff', 1, N'Trần Thị Bích', N'01689808484', N'thuha051093@gmail.com', N'Bà Rịa', N'324561422', N'Group 3')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (1020, N'trinhhl', N'KEESQDEYWT', N'Staff', 1, N'Lê Hồng Trịnh', N'0912345632', N'thuha051093@gmail.com', N'Quận 1', N'240818499', N'Group 1')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (1021, N'dunglh', N'KKZONLEMKM', N'Shift Head', 1, N'Lý Hoàng Dũng', N'0964235623', N'lyhoangdung@gmail.com', N'Quận Bình Thạnh', N'3134567932', N'Group 1')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (1022, N'bangnn', N'GSTFBFUDMR', N'Customer', 1, N'Nguyen Ngoc Bang', N'0912345675', N'thuha051093@gmail.com', N'Tan Binh', N'345646575467', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (1023, N'trungnh', N'TXMFEMWEFL', N'Customer', 1, N'Nguyen Hoang Trung', N'0912345674', N'thuha051093@gmail.com', N'Tan Binh', N'2314235345345', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (1024, N'Baont', N'GMEHAPMOSG', N'Customer', 1, N'Nguyen The Bao', N'0912345670', N'thuha051093@gmail.com', N'Tan Binh', N'253452323454', N'No Group')
INSERT [dbo].[Account] ([Id], [Username], [Password], [Role], [Status], [Fullname], [Phone], [Email], [Address], [Identification], [GroupCode]) VALUES (1025, N'Dangtt', N'LCPLPDPZVY', NULL, 0, N'Tran Trung Dang', N'0933412884', N'thuha051093@gmail.com', N'Quan 7', N'5345465758', N'No Group')
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
INSERT [dbo].[Group] ([Id], [GroupCode]) VALUES (5, N'No Group')
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[IPAddressPool] ON 

INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (6, N'128.3.11.228', N'128.3.11.1', NULL, N'255.255.254.0', N'haovtm', CAST(N'2016-01-16 23:22:00.320' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (1, N'192.168.0.1', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-16 23:17:30.243' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (13, N'192.168.0.10', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:01:11.713' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (14, N'192.168.0.11', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:01:25.193' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (15, N'192.168.0.12', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:01:37.740' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (16, N'192.168.0.13', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:01:56.283' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (17, N'192.168.0.14', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:02:11.347' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (18, N'192.168.0.15', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:02:32.367' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (19, N'192.168.0.16', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:02:45.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (20, N'192.168.0.17', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:03:02.780' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (21, N'192.168.0.18', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:03:15.830' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (22, N'192.168.0.19', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:03:29.947' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (3, N'192.168.0.2', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-16 23:18:00.927' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (23, N'192.168.0.20', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:03:40.750' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (24, N'192.168.0.21', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:04:09.367' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (25, N'192.168.0.22', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:04:26.540' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (26, N'192.168.0.23', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:04:43.087' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (27, N'192.168.0.24', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:04:56.713' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (28, N'192.168.0.25', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:05:09.627' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (29, N'192.168.0.26', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:05:28.560' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (30, N'192.168.0.27', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:05:41.023' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (31, N'192.168.0.28', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:05:52.467' AS DateTime), N'STATUS11', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (32, N'192.168.0.29', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:06:09.107' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (4, N'192.168.0.3', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-16 23:18:31.770' AS DateTime), N'STATUS10', 0)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (33, N'192.168.0.30', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:06:19.617' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (5, N'192.168.0.4', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-16 23:19:02.500' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (8, N'192.168.0.5', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 00:57:48.777' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (9, N'192.168.0.6', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 00:58:58.407' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (10, N'192.168.0.7', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 00:59:14.447' AS DateTime), N'STATUS11', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (11, N'192.168.0.8', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 00:59:14.447' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (12, N'192.168.0.9', N'192.168.0.253', NULL, N'255.255.255.0', N'nhink', CAST(N'2016-01-18 01:00:58.977' AS DateTime), N'STATUS10', 1)
INSERT [dbo].[IPAddressPool] ([Id], [IPAddress], [Gateway], [NetworkIP], [Subnetmask], [Staff], [RegisteredDate], [StatusCode], [IsDefault]) VALUES (7, N'192.168.1.2', N'192.168.1.254', NULL, N'255.255.255.0', N'phuoclh', CAST(N'2016-01-16 23:23:50.990' AS DateTime), N'STATUS10', 1)
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
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (37, N'L856022', N'R329695', 1, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (38, N'L474197', N'R329695', 2, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (39, N'L010818', N'R329695', 3, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (40, N'L770339', N'R329695', 4, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (41, N'L867151', N'R329695', 5, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (42, N'L921578', N'R329695', 6, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (43, N'L605052', N'R329695', 7, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (44, N'L930410', N'R329695', 8, N'STATUS14', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (45, N'L318748', N'R329695', 9, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (46, N'L589795', N'R329695', 10, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (47, N'L880589', N'R329695', 11, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (48, N'L889291', N'R329695', 12, N'STATUS13', NULL)
INSERT [dbo].[Location] ([Id], [LocationCode], [RackCode], [RackUnit], [StatusCode], [ServerCode]) VALUES (49, N'L387513', N'R329695', 13, N'STATUS13', NULL)
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

INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2171, N'R407959669', N'RENTRACK', N'Request', N'STATUS04', NULL, NULL, NULL, NULL, CAST(N'2016-03-08 09:41:19.657' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2172, N'R274503129', N'RENTRACK', N'Request', N'STATUS04', NULL, NULL, NULL, NULL, CAST(N'2016-03-08 10:05:53.707' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2173, N'R090789880', N'BASERVER', N'Request', N'R090789880', N'STATUS04', N'SDFCXVWX', NULL, NULL, CAST(N'2016-03-08 10:19:54.483' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2174, N'R090789880', N'BASERVER', N'Request', N'R090789880', N'STATUS04', N'SDFSDFWE', NULL, NULL, CAST(N'2016-03-08 10:19:54.557' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2175, N'R090789880', N'BASERVER', N'Server', N'SDFCXVWX', N'STATUS03', N'SDFCXVWX', NULL, NULL, CAST(N'2016-03-08 10:21:55.043' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2176, N'R090789880', N'BASERVER', N'Request', N'R090789880', N'STATUS07', N'SDFCXVWX', NULL, NULL, CAST(N'2016-03-08 10:21:57.527' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2177, N'R090789880', N'BASERVER', N'Server', N'SDFSDFWE', N'STATUS03', N'SDFSDFWE', NULL, NULL, CAST(N'2016-03-08 10:22:04.050' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2178, N'R090789880', N'BASERVER', N'Request', N'R090789880', N'STATUS07', N'SDFSDFWE', NULL, NULL, CAST(N'2016-03-08 10:22:04.060' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2179, N'R835941172', N'CHANGEIP', N'Request', N'R835941172', N'STATUS04', NULL, NULL, NULL, CAST(N'2016-03-08 10:43:47.773' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2180, N'R835941172', N'CHANGEIP', N'IPAddress', N'192.168.0.1', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-08 10:43:47.967' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2181, N'R835941172', N'CHANGEIP', N'IPAddress', N'192.168.0.11', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-08 10:43:47.973' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2182, N'R745023495', N'CHANGEIP', N'Request', N'R745023495', N'STATUS04', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 11:05:30.183' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2183, N'R745023495', N'CHANGEIP', N'IPAddress', N'192.168.0.11', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 11:05:30.257' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2184, N'R745023495', N'CHANGEIP', N'IPAddress', N'192.168.0.6', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 11:05:30.267' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2185, N'R444594034', N'CHANGEIP', N'Request', N'R444594034', N'STATUS04', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 11:08:16.987' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2186, N'R444594034', N'CHANGEIP', N'IPAddress', N'192.168.0.1', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 11:08:17.050' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2187, N'R444594034', N'CHANGEIP', N'IPAddress', N'192.168.0.11', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 11:08:17.063' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2188, N'R610845314', N'ASERVER', N'Request', N'R610845314', N'STATUS04', N'S720565656', NULL, NULL, CAST(N'2016-03-08 11:15:17.397' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2189, N'R610845314', N'ASERVER', N'Server', N'S720565656', N'STATUS01', N'S720565656', NULL, NULL, CAST(N'2016-03-08 11:15:17.797' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2190, N'R610845314', N'ASERVER', N'Request', N'R610845314', N'STATUS04', N'S718376923', NULL, NULL, CAST(N'2016-03-08 11:15:20.577' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2191, N'R610845314', N'ASERVER', N'Server', N'S718376923', N'STATUS01', N'S718376923', NULL, NULL, CAST(N'2016-03-08 11:15:20.600' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2192, N'R610845314', N'ASERVER', N'Server', N'R610845314', N'STATUS02', N'S720565656', NULL, NULL, CAST(N'2016-03-08 11:16:57.630' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2193, N'R610845314', N'ASERVER', N'Request', N'R610845314', N'STATUS07', N'S720565656', NULL, NULL, CAST(N'2016-03-08 11:16:57.653' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2194, N'R610845314', N'ASERVER', N'Server', N'R610845314', N'STATUS02', N'S718376923', NULL, NULL, CAST(N'2016-03-08 11:16:57.677' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2195, N'R610845314', N'ASERVER', N'Request', N'R610845314', N'STATUS07', N'S718376923', NULL, NULL, CAST(N'2016-03-08 11:16:57.680' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2196, N'R014390133', N'CHANGEIP', N'Request', N'R014390133', N'STATUS04', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 11:31:32.560' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2197, N'R014390133', N'CHANGEIP', N'IPAddress', N'192.168.0.13', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 11:31:32.687' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2198, N'R014390133', N'CHANGEIP', N'IPAddress', N'192.168.0.12', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 11:31:32.693' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2199, N'R014390133', N'CHANGEIP', N'IPAddress', N'192.168.0.11', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 11:31:32.700' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2200, N'R014390133', N'CHANGEIP', N'Request', N'R014390133', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-08 11:43:51.180' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2235, N'R904047212', N'CHANGEIP', N'Request', N'R904047212', N'STATUS04', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 23:00:48.597' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2236, N'R904047212', N'CHANGEIP', N'IPAddress', N'192.168.0.3', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 23:01:18.130' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2237, N'R904047212', N'CHANGEIP', N'IPAddress', N'192.168.0.18', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 23:01:20.310' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2238, N'R904047212', N'CHANGEIP', N'IPAddress', N'192.168.0.15', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 23:01:20.317' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2239, N'R868939787', N'CHANGEIP', N'Request', N'R868939787', N'STATUS04', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:02:19.647' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2240, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.13', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:02:28.507' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2241, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.12', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:02:28.513' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2242, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.11', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:02:28.537' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2243, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.14', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:05:57.277' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2244, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.11', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:05:58.717' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2245, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.2', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:06:13.170' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2246, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.12', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:06:13.173' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2247, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.30', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:06:13.317' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2248, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.13', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:06:13.337' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2249, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.27', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:06:14.063' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2250, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.15', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:06:14.077' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2251, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.4', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:06:14.663' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2252, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.18', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:06:14.707' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2253, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.5', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:06:15.353' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2254, N'R868939787', N'CHANGEIP', N'IPAddress', N'192.168.0.3', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:06:15.357' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2255, N'R868939787', N'CHANGEIP', N'Request', N'R868939787', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-09 00:06:16.587' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2256, N'R813178822', N'RETURNIP', N'Request', N'R813178822', N'STATUS04', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:07:01.407' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2257, N'R813178822', N'RETURNIP', N'IPAddress', N'192.168.0.30', N'STATUS30', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:07:01.417' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2258, N'R813178822', N'RETURNIP', N'IPAddress', N'192.168.0.2', N'STATUS30', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:07:01.500' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2259, N'R813178822', N'RETURNIP', N'IPAddress', N'192.168.0.14', N'STATUS30', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:07:01.507' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2260, N'R813178822', N'RETURNIP', N'IPAddress', N'System.Collections.Generic.List`1[System.String]', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:07:13.437' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2201, N'R069393510', N'CHANGEIP', N'Request', N'R069393510', N'STATUS04', N'BJIWEHDHQ', NULL, NULL, CAST(N'2016-03-08 11:55:22.437' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2261, N'R813178822', N'RETURNIP', N'Request', N'R813178822', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-09 00:07:13.477' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2262, N'R758320378', N'CHANGEIP', N'Request', N'R758320378', N'STATUS04', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:07:33.723' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2264, N'R758320378', N'CHANGEIP', N'IPAddress', N'192.168.0.4', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:07:33.743' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2265, N'R758320378', N'CHANGEIP', N'IPAddress', N'192.168.0.7', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:15:23.320' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2266, N'R758320378', N'CHANGEIP', N'IPAddress', N'192.168.0.14', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:15:23.327' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2267, N'R758320378', N'CHANGEIP', N'IPAddress', N'192.168.0.22', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:15:24.723' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2268, N'R758320378', N'CHANGEIP', N'IPAddress', N'192.168.0.2', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:15:24.727' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2269, N'R758320378', N'CHANGEIP', N'IPAddress', N'192.168.0.21', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:15:25.313' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2270, N'R758320378', N'CHANGEIP', N'IPAddress', N'192.168.0.30', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:15:25.317' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2271, N'R758320378', N'CHANGEIP', N'IPAddress', N'192.168.0.28', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:15:25.473' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2272, N'R758320378', N'CHANGEIP', N'IPAddress', N'192.168.0.4', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:15:25.477' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2273, N'R758320378', N'CHANGEIP', N'IPAddress', N'192.168.0.10', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:15:26.160' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2274, N'R758320378', N'CHANGEIP', N'IPAddress', N'192.168.0.5', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:15:26.163' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2275, N'R758320378', N'CHANGEIP', N'Request', N'R758320378', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-09 00:15:27.043' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2276, N'R206531576', N'RETURNIP', N'Request', N'R206531576', N'STATUS04', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:16:39.937' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2277, N'R206531576', N'RETURNIP', N'IPAddress', N'192.168.0.27', N'STATUS30', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:16:39.947' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2278, N'R206531576', N'RETURNIP', N'IPAddress', N'192.168.0.10', N'STATUS30', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:16:39.960' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2279, N'R206531576', N'RETURNIP', N'IPAddress', N'System.Collections.Generic.List`1[System.String]', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:20:42.987' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2280, N'R206531576', N'RETURNIP', N'Request', N'R206531576', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-09 00:20:43.007' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2281, N'R872923629', N'CHANGEIP', N'Request', N'R872923629', N'STATUS04', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:21:22.550' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2282, N'R872923629', N'CHANGEIP', N'IPAddress', N'192.168.0.12', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:21:22.577' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2283, N'R872923629', N'CHANGEIP', N'IPAddress', N'192.168.0.11', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:21:22.587' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2284, N'R872923629', N'CHANGEIP', N'IPAddress', N'192.168.0.30', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:23:01.840' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2285, N'R872923629', N'CHANGEIP', N'IPAddress', N'192.168.0.11', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:23:02.437' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2286, N'R872923629', N'CHANGEIP', N'IPAddress', N'192.168.0.2', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:23:08.540' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2287, N'R872923629', N'CHANGEIP', N'IPAddress', N'192.168.0.12', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:23:08.547' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2288, N'R872923629', N'CHANGEIP', N'Request', N'R872923629', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-09 00:23:08.813' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2289, N'R771039385', N'CHANGEIP', N'Request', N'R771039385', N'STATUS04', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:23:50.910' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2290, N'R771039385', N'CHANGEIP', N'IPAddress', N'192.168.0.2', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:23:50.933' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2291, N'R771039385', N'CHANGEIP', N'IPAddress', N'192.168.0.30', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:23:50.953' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2292, N'R771039385', N'CHANGEIP', N'IPAddress', N'192.168.0.15', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:23:50.967' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2293, N'R771039385', N'CHANGEIP', N'IPAddress', N'192.168.0.25', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:24:22.057' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2294, N'R771039385', N'CHANGEIP', N'IPAddress', N'192.168.0.15', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:24:22.067' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2295, N'R771039385', N'CHANGEIP', N'IPAddress', N'192.168.0.26', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:24:22.093' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2296, N'R771039385', N'CHANGEIP', N'IPAddress', N'192.168.0.30', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:24:22.097' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2297, N'R771039385', N'CHANGEIP', N'IPAddress', N'192.168.0.29', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-09 00:24:22.117' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2298, N'R771039385', N'CHANGEIP', N'IPAddress', N'192.168.0.2', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:24:22.120' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2299, N'R771039385', N'CHANGEIP', N'Request', N'R771039385', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-09 00:24:22.147' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2300, N'R427027839', N'RETURNIP', N'Request', N'R427027839', N'STATUS04', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:25:29.343' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2301, N'R427027839', N'RETURNIP', N'IPAddress', N'192.168.0.14', N'STATUS30', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:25:29.350' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2302, N'R427027839', N'RETURNIP', N'IPAddress', N'192.168.0.13', N'STATUS30', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:25:29.383' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2303, N'R427027839', N'RETURNIP', N'IPAddress', N'System.Collections.Generic.List`1[System.String]', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-09 00:26:59.387' AS DateTime), NULL, 0)
GO
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2304, N'R427027839', N'RETURNIP', N'Request', N'R427027839', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-09 00:26:59.400' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2305, N'R769159535', N'RENTRACK', N'Request', N'STATUS04', NULL, NULL, NULL, NULL, CAST(N'2016-03-09 09:05:11.217' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3305, N'R864506593', N'ASERVER', N'Request', N'R864506593', N'STATUS04', N'S446967830', NULL, NULL, CAST(N'2016-03-09 12:37:32.033' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3306, N'R864506593', N'ASERVER', N'Server', N'S446967830', N'STATUS01', N'S446967830', NULL, NULL, CAST(N'2016-03-09 12:37:32.487' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3307, N'R864506593', N'ASERVER', N'Request', N'R864506593', N'STATUS04', N'S416229445', NULL, NULL, CAST(N'2016-03-09 12:37:32.517' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3308, N'R864506593', N'ASERVER', N'Server', N'S416229445', N'STATUS01', N'S416229445', NULL, NULL, CAST(N'2016-03-09 12:37:32.523' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3309, N'R198073055', N'ASERVER', N'Request', N'R198073055', N'STATUS04', N'S045537132', NULL, NULL, CAST(N'2016-03-09 12:37:33.237' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3310, N'R198073055', N'ASERVER', N'Server', N'S045537132', N'STATUS01', N'S045537132', NULL, NULL, CAST(N'2016-03-09 12:37:33.243' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3311, N'R198073055', N'ASERVER', N'Request', N'R198073055', N'STATUS04', N'S440679246', NULL, NULL, CAST(N'2016-03-09 12:37:33.260' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3312, N'R198073055', N'ASERVER', N'Server', N'S440679246', N'STATUS01', N'S440679246', NULL, NULL, CAST(N'2016-03-09 12:37:33.263' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3313, N'R117177584', N'ASERVER', N'Request', N'R117177584', N'STATUS04', N'S897712091', NULL, NULL, CAST(N'2016-03-09 12:44:55.107' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3314, N'R117177584', N'ASERVER', N'Server', N'S897712091', N'STATUS01', N'S897712091', NULL, NULL, CAST(N'2016-03-09 12:44:55.113' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3315, N'R117177584', N'ASERVER', N'Request', N'R117177584', N'STATUS04', N'S864854551', NULL, NULL, CAST(N'2016-03-09 12:44:55.160' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2202, N'R069393510', N'CHANGEIP', N'IPAddress', N'192.168.0.6', N'STATUS11', N'BJIWEHDHQ', NULL, NULL, CAST(N'2016-03-08 11:55:39.863' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3316, N'R117177584', N'ASERVER', N'Server', N'S864854551', N'STATUS01', N'S864854551', NULL, NULL, CAST(N'2016-03-09 12:44:55.163' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3329, N'R623756472', N'ASERVER', N'Request', N'R623756472', N'STATUS04', N'S793818599', NULL, NULL, CAST(N'2016-03-09 21:58:28.070' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3330, N'R623756472', N'ASERVER', N'Server', N'S793818599', N'STATUS01', N'S793818599', NULL, NULL, CAST(N'2016-03-09 21:58:28.323' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3331, N'R623756472', N'ASERVER', N'Request', N'R623756472', N'STATUS04', N'S889737490', NULL, NULL, CAST(N'2016-03-09 21:58:28.360' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3332, N'R623756472', N'ASERVER', N'Server', N'S889737490', N'STATUS01', N'S889737490', NULL, NULL, CAST(N'2016-03-09 21:58:28.367' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2263, N'R758320378', N'CHANGEIP', N'IPAddress', N'192.168.0.5', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-09 00:07:33.733' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3317, N'R218254403', N'BASERVER', N'Request', N'R218254403', N'STATUS04', N'S387458389', NULL, NULL, CAST(N'2016-03-09 13:12:39.777' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3318, N'R218254403', N'BASERVER', N'Request', N'R218254403', N'STATUS04', N'S531171981', NULL, NULL, CAST(N'2016-03-09 13:12:39.867' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3319, N'R218254403', N'BASERVER', N'Request', N'R218254403', N'STATUS04', N'S199131323', NULL, NULL, CAST(N'2016-03-09 13:12:39.877' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3320, N'R775217926', N'RENTRACK', N'Request', N'STATUS04', NULL, NULL, NULL, NULL, CAST(N'2016-03-09 13:37:27.500' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3321, N'R775217926', N'RENTRACK', N'Request', N'R775217926', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-09 13:47:12.617' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3322, N'R706566483', N'RENTRACK', N'Request', N'STATUS04', NULL, NULL, NULL, NULL, CAST(N'2016-03-09 14:07:39.247' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3323, N'R706566483', N'RENTRACK', N'Rack', N'R280212', N'STATUS20', NULL, NULL, NULL, CAST(N'2016-03-09 14:14:15.387' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3324, N'R706566483', N'RENTRACK', N'Rack', N'R950566', N'STATUS20', NULL, NULL, NULL, CAST(N'2016-03-09 14:14:16.987' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3325, N'R706566483', N'RENTRACK', N'Rack', N'R461770', N'STATUS20', NULL, NULL, NULL, CAST(N'2016-03-09 14:14:17.157' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3326, N'R706566483', N'RENTRACK', N'Request', N'R706566483', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-09 14:14:18.293' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3327, N'R823178474', N'RENTRACK', N'Request', N'STATUS04', NULL, NULL, NULL, NULL, CAST(N'2016-03-09 14:18:01.213' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (3328, N'R050861220', N'RENTRACK', N'Request', N'STATUS04', NULL, NULL, NULL, NULL, CAST(N'2016-03-09 14:43:38.343' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2203, N'R069393510', N'CHANGEIP', N'IPAddress', N'192.168.0.10', N'STATUS11', N'BJIWEHDHQ', NULL, NULL, CAST(N'2016-03-08 11:55:39.873' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2204, N'R069393510', N'CHANGEIP', N'Request', N'R069393510', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-08 12:00:33.303' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2205, N'R227019289', N'CHANGEIP', N'Request', N'R227019289', N'STATUS04', N'BJIWEHDHQ', NULL, NULL, CAST(N'2016-03-08 12:01:51.370' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2206, N'R227019289', N'CHANGEIP', N'IPAddress', N'192.168.0.1', N'STATUS11', N'BJIWEHDHQ', NULL, NULL, CAST(N'2016-03-08 12:01:53.830' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2207, N'R227019289', N'CHANGEIP', N'IPAddress', N'192.168.0.11', N'STATUS11', N'BJIWEHDHQ', NULL, NULL, CAST(N'2016-03-08 12:01:53.907' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2208, N'R227019289', N'CHANGEIP', N'Request', N'R227019289', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-08 12:11:09.957' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2209, N'R596124033', N'CHANGEIP', N'Request', N'R596124033', N'STATUS04', N'BJIWEHDHQ', NULL, NULL, CAST(N'2016-03-08 12:27:42.977' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2210, N'R596124033', N'CHANGEIP', N'IPAddress', N'192.168.0.28', N'STATUS11', N'BJIWEHDHQ', NULL, NULL, CAST(N'2016-03-08 12:27:48.097' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2211, N'R596124033', N'CHANGEIP', N'IPAddress', N'192.168.0.19', N'STATUS11', N'BJIWEHDHQ', NULL, NULL, CAST(N'2016-03-08 12:27:48.110' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2212, N'R596124033', N'CHANGEIP', N'Request', N'R596124033', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-08 12:30:59.230' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2213, N'R143104039', N'CHANGEIP', N'Request', N'R143104039', N'STATUS04', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 12:35:57.627' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2214, N'R143104039', N'CHANGEIP', N'IPAddress', N'192.168.0.12', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 12:35:57.673' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2215, N'R143104039', N'CHANGEIP', N'IPAddress', N'192.168.0.11', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 12:35:57.687' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2216, N'R143104039', N'CHANGEIP', N'IPAddress', N'You,192.168.0.26,192.168.0.10', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-08 12:36:25.920' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2217, N'R143104039', N'CHANGEIP', N'IPAddress', N'192.168.0.10', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-08 12:36:26.013' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2218, N'R143104039', N'CHANGEIP', N'IPAddress', N'You,192.168.0.26,192.168.0.10', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-08 12:36:26.023' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2219, N'R143104039', N'CHANGEIP', N'IPAddress', N'192.168.0.26', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-08 12:36:26.040' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2220, N'R143104039', N'CHANGEIP', N'IPAddress', N'You,192.168.0.26,192.168.0.10', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-08 12:36:26.067' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2221, N'R143104039', N'CHANGEIP', N'IPAddress', N'You', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-08 12:36:26.077' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2222, N'R143104039', N'CHANGEIP', N'Request', N'R143104039', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-08 12:36:26.083' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2223, N'R267152837', N'CHANGEIP', N'Request', N'R267152837', N'STATUS04', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 12:45:43.430' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2224, N'R267152837', N'CHANGEIP', N'IPAddress', N'192.168.0.14', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 12:45:43.493' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2225, N'R267152837', N'CHANGEIP', N'IPAddress', N'192.168.0.13', N'STATUS11', N'GHJHKRN', NULL, NULL, CAST(N'2016-03-08 12:45:43.510' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2226, N'R444594034', N'CHANGEIP', N'IPAddress', N'192.168.0.18', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-08 12:51:43.643' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2227, N'R444594034', N'CHANGEIP', N'IPAddress', N'192.168.0.18', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-08 12:51:43.710' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2228, N'R444594034', N'CHANGEIP', N'IPAddress', N'192.168.0.3', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-08 12:51:43.737' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2229, N'R444594034', N'CHANGEIP', N'IPAddress', N'192.168.0.3', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-08 12:51:43.743' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2230, N'R444594034', N'CHANGEIP', N'IPAddress', N'192.168.0.27', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-08 12:51:43.753' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2231, N'R444594034', N'CHANGEIP', N'IPAddress', N'192.168.0.27', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-08 12:51:43.773' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2232, N'R444594034', N'CHANGEIP', N'IPAddress', N'192.168.0.10', N'STATUS11', NULL, NULL, NULL, CAST(N'2016-03-08 12:51:43.807' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2233, N'R444594034', N'CHANGEIP', N'IPAddress', N'192.168.0.10', N'STATUS10', NULL, NULL, NULL, CAST(N'2016-03-08 12:51:43.817' AS DateTime), NULL, 0)
INSERT [dbo].[LogChangedContent] ([Id], [RequestCode], [TypeOfLog], [Object], [ChangedValueOfObject], [ObjectStatus], [ServerCode], [IPAddress], [Staff], [LogTime], [Description], [PreviousId]) VALUES (2234, N'R444594034', N'CHANGEIP', N'Request', N'R444594034', N'STATUS07', NULL, NULL, NULL, CAST(N'2016-03-08 12:51:43.817' AS DateTime), NULL, 0)
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

INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (21, N'R280212', N'A1', N'STATUS20', CAST(N'2016-02-01 09:32:13.687' AS DateTime), 14400, 42)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (22, N'R117159', N'A2', N'STATUS19', CAST(N'2016-02-01 09:32:30.800' AS DateTime), 14400, 42)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (23, N'R950566', N'B1', N'STATUS20', CAST(N'2016-02-01 09:32:51.953' AS DateTime), 14400, 42)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (24, N'R461770', N'C1', N'STATUS20', CAST(N'2016-02-01 09:33:08.050' AS DateTime), 14400, 42)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (25, N'R416917', N'D1', N'STATUS19', CAST(N'2016-02-01 09:33:23.593' AS DateTime), 14400, 42)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (20, N'R329695', N'E1', N'STATUS19', CAST(N'2016-02-01 09:31:08.700' AS DateTime), 14400, 42)
INSERT [dbo].[Rack] ([Id], [RackCode], [RackName], [StatusCode], [AddedDate], [MaximumPower], [MaximumOutlet]) VALUES (26, N'R956229', N'A3', N'STATUS33', CAST(N'2016-02-11 22:58:05.573' AS DateTime), 14400, 41)
SET IDENTITY_INSERT [dbo].[Rack] OFF
SET IDENTITY_INSERT [dbo].[RackOfCustomer] ON 

INSERT [dbo].[RackOfCustomer] ([Id], [RackCode], [Customer], [RentedDate], [StatusCode], [PreviousId]) VALUES (3, N'R280212', N'thaohq', CAST(N'2015-05-05 00:00:00.000' AS DateTime), N'STATUS26', 0)
INSERT [dbo].[RackOfCustomer] ([Id], [RackCode], [Customer], [RentedDate], [StatusCode], [PreviousId]) VALUES (4, N'R950566', N'thaohq', CAST(N'2015-11-12 00:00:00.000' AS DateTime), N'STATUS26', 0)
SET IDENTITY_INSERT [dbo].[RackOfCustomer] OFF
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2085, N'R407959669', N'RT011', N'manhnh', NULL, N'{"NumberOfIp":0,"Description":"sfsfsdfsdf","NumberOfRack":3}', CAST(N'2016-03-08 09:41:19.643' AS DateTime), N'STATUS05', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2086, N'R274503129', N'RT011', N'manhnh', NULL, N'{"NumberOfIp":0,"Description":"wrwewererter","NumberOfRack":4}', CAST(N'2016-03-08 10:05:49.897' AS DateTime), N'STATUS05', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2087, N'R090789880', N'RT007', N'manhnh', NULL, N'adfsfdfgdgd', CAST(N'2016-03-08 10:19:51.807' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2088, N'R835941172', N'RT008', N'manhnh', NULL, N'sdfsdfsdf', CAST(N'2016-03-08 10:43:47.490' AS DateTime), N'STATUS05', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2089, N'R745023495', N'RT008', N'manhnh', NULL, N'hihiihihihih', CAST(N'2016-03-08 11:05:30.107' AS DateTime), N'STATUS05', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2090, N'R444594034', N'RT008', N'manhnh', NULL, N'sdfsfsdfsdf', CAST(N'2016-03-08 11:08:16.977' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2091, N'R610845314', N'RT003', N'manhnh', CAST(N'2016-03-24 11:00:00.000' AS DateTime), N'sdfsdfsfsdf', CAST(N'2016-03-08 11:14:40.410' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2092, N'R014390133', N'RT008', N'manhnh', NULL, N'sdfsfsdfsfd', CAST(N'2016-03-08 11:31:32.460' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2093, N'R069393510', N'RT008', N'manhnh', NULL, N'10 va 6', CAST(N'2016-03-08 11:55:22.370' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2094, N'R227019289', N'RT008', N'manhnh', NULL, N'11111111', CAST(N'2016-03-08 12:01:51.360' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2098, N'R904047212', N'RT008', N'manhnh', NULL, N'15 18 3 doi lien nha', CAST(N'2016-03-08 23:00:48.520' AS DateTime), N'STATUS05', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2099, N'R868939787', N'RT008', N'manhnh', NULL, N'kkjbkjbkjvhjvj', CAST(N'2016-03-09 00:02:19.570' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2100, N'R813178822', N'RT010', N'manhnh', NULL, N'dfsfsfsfsdf', CAST(N'2016-03-09 00:07:01.397' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2101, N'R758320378', N'RT008', N'manhnh', NULL, N'fsfdfsdfsdfsfsfsdfsdf', CAST(N'2016-03-09 00:07:33.717' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2102, N'R206531576', N'RT010', N'manhnh', NULL, N'tra 10, 27', CAST(N'2016-03-09 00:16:39.907' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2103, N'R872923629', N'RT008', N'manhnh', NULL, N'doi thanh 2, 30', CAST(N'2016-03-09 00:21:22.483' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2104, N'R771039385', N'RT008', N'manhnh', NULL, N'tra change 2,30,15', CAST(N'2016-03-09 00:23:50.897' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2105, N'R427027839', N'RT010', N'manhnh', NULL, N'cvbcfgfdgdgdfg', CAST(N'2016-03-09 00:25:29.333' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2106, N'R769159535', N'RT011', N'manhnh', NULL, N'{"NumberOfIp":0,"Description":"hihiihihihdsfgdfg","NumberOfRack":5}', CAST(N'2016-03-09 09:05:10.757' AS DateTime), N'STATUS05', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (3106, N'R864506593', N'RT003', N'manhnh', CAST(N'2016-03-29 12:00:00.000' AS DateTime), N'fsfsfsfsdf', CAST(N'2016-03-09 12:35:48.063' AS DateTime), N'STATUS05', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (3107, N'R198073055', N'RT003', N'manhnh', CAST(N'2016-03-29 12:00:00.000' AS DateTime), N'fsfsfsfsdf', CAST(N'2016-03-09 12:37:33.207' AS DateTime), N'STATUS05', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (3108, N'R117177584', N'RT003', N'manhnh', CAST(N'2016-03-22 12:00:00.000' AS DateTime), N'fsfsfsdfsf', CAST(N'2016-03-09 12:44:55.023' AS DateTime), N'STATUS05', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (3114, N'R623756472', N'RT003', N'manhnh', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'dfgdgdgdfgdfg', CAST(N'2016-03-09 21:58:26.513' AS DateTime), N'STATUS04', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2095, N'R596124033', N'RT008', N'manhnh', NULL, N'aafdajsdasd 19 28', CAST(N'2016-03-08 12:27:42.713' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2096, N'R143104039', N'RT008', N'manhnh', NULL, N'shitttttttt', CAST(N'2016-03-08 12:35:57.597' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (2097, N'R267152837', N'RT008', N'manhnh', NULL, N'13 14 thui nha', CAST(N'2016-03-08 12:45:43.217' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (3109, N'R218254403', N'RT007', N'manhnh', NULL, N'fyhjfghfgh', CAST(N'2016-03-09 13:12:38.370' AS DateTime), N'STATUS05', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (3110, N'R775217926', N'RT011', N'manhnh', NULL, N'{"NumberOfIp":0,"Description":"ưerwrwewerer","NumberOfRack":5}', CAST(N'2016-03-09 13:37:27.240' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (3111, N'R706566483', N'RT011', N'manhnh', NULL, N'{"NumberOfIp":0,"Description":"sdfsfsfgdghdetwsdfsxfsdf","NumberOfRack":5}', CAST(N'2016-03-09 14:07:39.023' AS DateTime), N'STATUS07', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (3112, N'R823178474', N'RT011', N'manhnh', NULL, N'{"NumberOfIp":0,"Description":"qwesadfsfggdfg","NumberOfRack":3}', CAST(N'2016-03-09 14:18:00.997' AS DateTime), N'STATUS05', 0)
INSERT [dbo].[Request] ([Id], [RequestCode], [RequestType], [Customer], [AppointmentTime], [Description], [RequestedTime], [StatusCode], [IsViewed]) VALUES (3113, N'R050861220', N'RT011', N'manhnh', NULL, N'{"NumberOfIp":0,"Description":"sdfxsdf","NumberOfRack":5}', CAST(N'2016-03-09 14:43:38.257' AS DateTime), N'STATUS05', 0)
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
INSERT [dbo].[RequestType] ([Id], [RequestTypeCode], [RequestTypeName]) VALUES (7, N'RT007', N'Bring server away')
SET IDENTITY_INSERT [dbo].[RequestType] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'Customer')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (3, N'Manager')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'Shift Head')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (4, N'Staff')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Server] ON 

INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (1, N'BJIWEHDHQ', N'manhnh', N'DELL ', N'POWEREDGE C2100', 750, 2, N'STATUS03', N'192.168.0.10', CAST(N'2016-01-16 23:26:41.550' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (2, N'ERTVDSFG', N'thaohq', N'HP', N'DL 180G6 ', 750, 2, N'STATUS02', N'192.168.0.10', CAST(N'2016-01-18 01:16:38.707' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (3, N'GHJHKRN', N'manhnh', N'SUPERMICRO ', N'X8 DTI', 600, 2, N'STATUS03', N'192.168.0.11', CAST(N'2016-01-18 01:19:12.470' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (4, N'HGDHERHW', N'thaohq', N'DELL ', N'POWEREDGE C6100', 1100, 2, N'STATUS02', N'192.168.0.6', CAST(N'2016-01-18 01:12:07.160' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (5, N'HGMTYJTR', N'thaohq', N'IBM', N'X3650 M1', 835, 2, N'STATUS02', N'192.168.0.7', CAST(N'2016-01-18 01:13:46.210' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (6, N'KYKHJNGR', N'thaohq', N'HP', N'DL 160G6', 500, 1, N'STATUS02', N'192.168.0.8', CAST(N'2016-01-18 01:14:53.833' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (7, N'QBFGWHZ', N'namnt', N'SUPERMICRO ', N'X8DTL-I', 600, 1, N'STATUS02', N'192.168.1.2', CAST(N'2016-01-18 00:56:26.783' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (8, N'RTYURDFD', N'thaohq', N'INTEL', N'S1200BT', 600, 1, N'STATUS02', N'192.168.0.9', CAST(N'2016-01-18 01:15:44.467' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (9, N'SDFCXVWX', N'manhnh', N'DELL ', N'R320', 550, 1, N'STATUS03', N'192.168.0.12', CAST(N'2016-01-18 01:19:49.787' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (10, N'SDFRWTBX', N'namnt', N'HP', N'DL380 G5', 675, 2, N'STATUS02', N'192.168.0.5', CAST(N'2016-01-18 01:10:26.697' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (11, N'SDFSDFWE', N'manhnh', N'DELL ', N'R710 - 6', 717, 2, N'STATUS03', N'192.168.0.29', CAST(N'2016-01-16 23:30:46.997' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (12, N'SDFSDFWG', N'thaohq', N'IBM', N'X3650 M3', 675, 2, N'STATUS02', N'192.168.0.30', CAST(N'2016-01-17 00:01:37.207' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (13, N'SGSWDFWT', N'manhnh', N'DELL ', N'POWEREDGE C1100', 650, 1, N'STATUS02', N'192.168.0.4', CAST(N'2016-01-16 23:28:23.020' AS DateTime), 2, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (14, N'XCVSDFWQ', N'namnt', N'HP', N'DL380 G6 ', 675, 2, N'STATUS02', N'128.3.11.228', CAST(N'2016-01-17 00:04:39.913' AS DateTime), 1, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (22, N'S786923157', N'manhnh', N'sdfsfsdf', N'sfsfsdf', 2345, 1, N'STATUS02', NULL, CAST(N'2016-03-03 10:41:40.880' AS DateTime), NULL, NULL)
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (23, N'S387458389', N'manhnh', N'ryhfghfgh', N'2343reresdf', 6546, 2, N'STATUS34', NULL, CAST(N'2016-03-03 10:41:49.103' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (24, N'S531171981', N'manhnh', N'sdfsdf', N'acfxzcsdf', 24234, 2, N'STATUS34', NULL, CAST(N'2016-03-03 15:01:10.107' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (25, N'S199131323', N'manhnh', N'gggggg', N'yyyyyyyyyyyyyy', 3435, 2, N'STATUS34', NULL, CAST(N'2016-03-03 15:01:10.313' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (26, N'S489512476', N'manhnh', N'wwwwwwww', N'oooooooo', 1243, 2, N'STATUS02', NULL, CAST(N'2016-03-03 15:43:32.153' AS DateTime), NULL, N'1Gbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (27, N'S562550534', N'manhnh', N'ggggg', N'ádsfsdf', 444, 2, N'STATUS02', NULL, CAST(N'2016-03-03 15:43:32.227' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (28, N'S574075648', N'manhnh', N'omg', N'omg1', 3424, 1, N'STATUS02', NULL, CAST(N'2016-03-03 16:25:46.287' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (29, N'S700629597', N'manhnh', N'dhfhjhg', N'fhngfhfgh', 7567, 1, N'STATUS02', NULL, CAST(N'2016-03-03 16:25:46.377' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (30, N'S894248644', N'manhnh', N'hihih', N'huhuhu', 321, 4, N'STATUS02', NULL, CAST(N'2016-03-04 13:11:21.097' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (31, N'S678422956', N'manhnh', N'hehehe', N'keke', 321, 1, N'STATUS02', NULL, CAST(N'2016-03-04 13:11:21.317' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (32, N'S417075961', N'manhnh', N'kkjkj', N'hgkjbklmnkl', 878, 2, N'STATUS02', NULL, CAST(N'2016-03-06 23:16:41.927' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (33, N'S010199860', N'manhnh', N'sdfsdfsdf', N'sdfsdf', 23424, 1, N'STATUS02', NULL, CAST(N'2016-03-07 23:27:57.283' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (34, N'S035426658', N'manhnh', N'5345345', N'32545', 324345, 2, N'STATUS02', NULL, CAST(N'2016-03-07 23:27:57.643' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (35, N'S720565656', N'manhnh', N'ưerdfsdf', N'sdf', 234, 1, N'STATUS02', NULL, CAST(N'2016-03-08 11:14:46.670' AS DateTime), NULL, N'1Gbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (36, N'S718376923', N'manhnh', N'dghtghyr', N'fgdfgdfg', 56456, 2, N'STATUS02', NULL, CAST(N'2016-03-08 11:15:19.453' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (37, N'S446967830', N'manhnh', N'sdfsdf', N'ưerssdfsdf', 23424, 2, N'STATUS01', NULL, CAST(N'2016-03-09 12:35:48.337' AS DateTime), NULL, N'1Gbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (38, N'S416229445', N'manhnh', N'wrwer', N'dfgdfg', 543, 2, N'STATUS01', NULL, CAST(N'2016-03-09 12:37:32.493' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (39, N'S045537132', N'manhnh', N'sdfsdf', N'ưerssdfsdf', 23424, 2, N'STATUS01', NULL, CAST(N'2016-03-09 12:37:33.220' AS DateTime), NULL, N'1Gbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (40, N'S440679246', N'manhnh', N'wrwer', N'dfgdfg', 543, 2, N'STATUS01', NULL, CAST(N'2016-03-09 12:37:33.250' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (41, N'S897712091', N'manhnh', N'sdfsdf', N'ưerssdfsdf', 23424, 2, N'STATUS01', NULL, CAST(N'2016-03-09 12:44:55.043' AS DateTime), NULL, N'1Gbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (42, N'S864854551', N'manhnh', N'wrwer', N'dfgdfg', 543, 2, N'STATUS01', NULL, CAST(N'2016-03-09 12:44:55.130' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (43, N'S793818599', N'manhnh', N'sdfsdfsdf', N'2dfsf', 2352, 4, N'STATUS01', NULL, CAST(N'2016-03-09 21:58:27.220' AS DateTime), NULL, N'100Mbps')
INSERT [dbo].[Server] ([Id], [ServerCode], [Customer], [Maker], [Model], [Power], [Size], [StatusCode], [DefaultIP], [RegisteredDate], [Outlet], [Bandwidth]) VALUES (44, N'S889737490', N'manhnh', N'4324', N'345345', 3453465, 4, N'STATUS01', NULL, CAST(N'2016-03-09 21:58:28.327' AS DateTime), NULL, N'1Gbps')
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
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (34, N'SAT001', N'234346546', N'S574075648', N'STATUS24', 0)
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
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (36, N'SAT004', N'346', N'S574075648', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (37, N'SAT001', N'4564576567', N'S700629597', N'STATUS24', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (38, N'SAT002', N'6587687', N'S700629597', N'STATUS22', 0)
INSERT [dbo].[ServerAttribute] ([Id], [AttributeCode], [AttributeValue], [ServerCode], [StatusCode], [UpdatedVersion]) VALUES (39, N'SAT004', N'678', N'S700629597', N'STATUS22', 0)
SET IDENTITY_INSERT [dbo].[ServerAttribute] OFF
SET IDENTITY_INSERT [dbo].[ServerIP] ON 

INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (10, N'GHJHKRN', N'192.168.0.11', N'STATUS31', CAST(N'2016-01-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (11, N'GHJHKRN', N'192.168.0.12', N'STATUS31', CAST(N'2016-01-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (12, N'GHJHKRN', N'192.168.0.13', N'STATUS30', CAST(N'2016-01-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (13, N'GHJHKRN', N'192.168.0.14', N'STATUS30', CAST(N'2016-01-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (14, N'GHJHKRN', N'192.168.0.15', N'STATUS31', CAST(N'2016-01-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (15, N'HGMTYJTR', N'192.168.0.7', N'STATUS29', CAST(N'2016-01-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (16, N'HGMTYJTR', N'192.168.0.22', N'STATUS29', CAST(N'2016-01-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (17, N'HGMTYJTR', N'192.168.0.23', N'STATUS29', CAST(N'2016-01-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (18, N'HGMTYJTR', N'192.168.0.24', N'STATUS29', CAST(N'2016-01-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (19, N'HGMTYJTR', N'192.168.0.25', N'STATUS29', CAST(N'2016-01-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (20, N'BJIWEHDHQ', N'192.168.0.10', N'STATUS30', CAST(N'2016-01-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (21, N'BJIWEHDHQ', N'192.168.0.6', N'STATUS29', CAST(N'2016-02-24 20:38:29.710' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (22, N'BJIWEHDHQ', N'192.168.0.11', N'STATUS29', CAST(N'2016-02-24 20:39:00.750' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (23, N'BJIWEHDHQ', N'192.168.0.1', N'STATUS29', CAST(N'2016-02-24 20:39:00.767' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (24, N'BJIWEHDHQ', N'192.168.0.19', N'STATUS29', CAST(N'2016-02-24 20:41:57.687' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (25, N'BJIWEHDHQ', N'192.168.0.28', N'STATUS29', CAST(N'2016-02-24 20:42:12.763' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (26, N'BJIWEHDHQ', N'192.168.0.12', N'STATUS29', CAST(N'2016-02-24 20:42:12.807' AS DateTime), 0)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (45, N'GHJHKRN', N'192.168.0.30', N'STATUS31', CAST(N'2016-03-09 00:22:29.927' AS DateTime), 10)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (46, N'GHJHKRN', N'192.168.0.2', N'STATUS31', CAST(N'2016-03-09 00:23:08.510' AS DateTime), 11)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (47, N'GHJHKRN', N'192.168.0.25', N'STATUS29', CAST(N'2016-03-09 00:24:22.020' AS DateTime), 14)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (48, N'GHJHKRN', N'192.168.0.26', N'STATUS29', CAST(N'2016-03-09 00:24:22.077' AS DateTime), 45)
INSERT [dbo].[ServerIP] ([Id], [ServerCode], [CurrentIP], [StatusCode], [AssignedDate], [PreviousId]) VALUES (49, N'GHJHKRN', N'192.168.0.29', N'STATUS29', CAST(N'2016-03-09 00:24:22.103' AS DateTime), 46)
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
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (15, N'STATUS15', N'Approving', N'StaffAssignment', 1)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (16, N'STATUS16', N'Doing', N'StaffAssignment', 2)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (17, N'STATUS17', N'Done', N'StaffAssignment', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (18, N'STATUS18', N'Not Finished', N'StaffAssignment', 4)
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
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (31, N'STATUS31', N'Old', N'ServerIP', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (32, N'STATUS32', N'Reserve', N'IPAddress', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (33, N'STATUS33', N'Used', N'Rack', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (34, N'STATUS34', N'Bringing away', N'Server', 3)
INSERT [dbo].[Status] ([Id], [StatusCode], [StatusName], [Object], [Priority]) VALUES (35, N'STATUS35', N'Deactivate', N'IPAddress', 5)
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[TempRequest] ON 

INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (26, N'T548378043', N'R749019483', NULL, N'{"TempCode":null,"Customer":null,"Maker":"dfgdg","Model":"fsdfsdf","Power":534,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"5234234","SerialNumber":"53534534","Memory":"123"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (27, N'T973689625', N'R749019483', NULL, N'{"TempCode":null,"Customer":null,"Maker":"wetdfg","Model":"dfsdfsdf","Power":54234,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"623434345","SerialNumber":"4534545654","Memory":"434"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (4, NULL, N'R841412956', NULL, N'{"Customer":null,"Maker":"asd","Model":null,"Power":3123,"Size":1,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":null,"PartNumber":null,"SerialNumber":null,"Memory":null}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (5, NULL, N'R841412956', NULL, N'{"Customer":null,"Maker":"asd","Model":null,"Power":3123,"Size":1,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":null,"PartNumber":null,"SerialNumber":null,"Memory":null}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (6, NULL, N'R340316724', NULL, N'{"Customer":null,"Maker":"fsfsdf","Model":null,"Power":123243,"Size":1,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":null,"PartNumber":null,"SerialNumber":null,"Memory":null}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (7, NULL, N'R340316724', NULL, N'{"Customer":null,"Maker":"hihihiih","Model":"hy","Power":123243,"Size":1,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"1Gbps","PartNumber":"23423","SerialNumber":"24235234","Memory":null}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (8, NULL, N'R340316724', NULL, N'{"Customer":null,"Maker":"hese","Model":"fdsrwsed","Power":4234,"Size":4,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":null,"SerialNumber":null,"Memory":null}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (9, NULL, N'R748328914', NULL, N'{"Customer":null,"Maker":"hihi","Model":"huhu","Power":1234567,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"1435345","SerialNumber":"1232342","Memory":"123"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (10, NULL, N'R748328914', NULL, N'{"Customer":null,"Maker":"fsff","Model":"ửefw","Power":123,"Size":1,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"756768","SerialNumber":"234235345","Memory":"798"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (11, N'TEMP445487144', N'R569872508', NULL, N'{"TempCode":null,"Customer":null,"Maker":"hihi","Model":"huhu","Power":234,"Size":4,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"124353","SerialNumber":"234235","Memory":"123"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (12, N'TEMP529292943', N'R640666966', NULL, N'{"TempCode":null,"Customer":null,"Maker":"metque","Model":"dfsdfv","Power":242,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"1Gbps","PartNumber":"234","SerialNumber":"54346456","Memory":"432"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (13, N'TEMP727412759', N'R702843525', NULL, N'{"TempCode":null,"Customer":null,"Maker":"fhj","Model":"kuhkijhk","Power":678,"Size":1,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"6465","SerialNumber":"9876898pi","Memory":"123"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (14, N'TEMP125830903', N'R702843525', NULL, N'{"TempCode":null,"Customer":null,"Maker":"oij","Model":"jhb,mnaqqq","Power":654,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"436546","SerialNumber":"09785","Memory":"124"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (15, N'TEMP948259990', N'R963588583', NULL, N'{"TempCode":null,"Customer":null,"Maker":"sdfsdf","Model":"gdfgfdg","Power":213234,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"5245234","SerialNumber":"3124234","Memory":"124"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (16, N'TEMP319714138', N'R963588583', NULL, N'{"TempCode":null,"Customer":null,"Maker":"sdfsdf","Model":"gdfgfdg","Power":213234,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"5245234","SerialNumber":"3124234","Memory":"124"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (17, N'TEMP373762008', N'R019226013', NULL, N'{"TempCode":null,"Customer":null,"Maker":"sf23sdf","Model":"sdfsdf","Power":123,"Size":4,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"2342323","SerialNumber":"23454235","Memory":"432"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (18, N'TEMP241668833', N'R019226013', NULL, N'{"TempCode":null,"Customer":null,"Maker":"kekeke","Model":"sdfsdf","Power":3453,"Size":1,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"3246456","SerialNumber":"234234","Memory":"545"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (19, N'TEMP785160157', N'R091926637', NULL, N'{"TempCode":null,"Customer":null,"Maker":"hathu","Model":"sdfsfd","Power":4234,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"1Gbps","PartNumber":"2343534","SerialNumber":"5686586786","Memory":"654"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (20, N'TEMP889010383', N'R333376533', NULL, N'{"TempCode":null,"Customer":null,"Maker":"rfgtsdfg","Model":"erwer","Power":2454,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"2341234","SerialNumber":"2354365","Memory":"431"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (22, N'T043762762', N'R680387006', NULL, N'{"TempCode":null,"Customer":null,"Maker":"thuha","Model":"hathu","Power":1234,"Size":4,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"423532546456","SerialNumber":"53453647","Memory":"345"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (23, N'T721102869', N'R680387006', NULL, N'{"TempCode":null,"Customer":null,"Maker":"bachdang","Model":"dangbach","Power":432,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"23434354","SerialNumber":"25345456546","Memory":"245"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (24, N'T917806914', N'R662365712', NULL, N'{"TempCode":null,"Customer":null,"Maker":"wersdf","Model":"sdfsdf","Power":3254,"Size":1,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"23434","SerialNumber":"425345345","Memory":"123"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (25, N'T093697596', N'R662365712', NULL, N'{"TempCode":null,"Customer":null,"Maker":"rwersdf","Model":"sdfsdf","Power":4234,"Size":1,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"1Gbps","PartNumber":"21342343","SerialNumber":"23435","Memory":"234"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (28, N'T792827816', N'R749019483', NULL, N'{"TempCode":null,"Customer":null,"Maker":"wetdfg","Model":"dfsdfsdf","Power":54234,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"623434345","SerialNumber":"4534545654","Memory":"434"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (29, N'T009686611', N'R749019483', NULL, N'{"TempCode":null,"Customer":null,"Maker":"wetdfg","Model":"dfsdfsdf","Power":54234,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"623434345","SerialNumber":"4534545654","Memory":"434"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (30, N'T487057876', N'R749019483', NULL, N'{"TempCode":null,"Customer":null,"Maker":"wetdfg","Model":"dfsdfsdf","Power":54234,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"623434345","SerialNumber":"4534545654","Memory":"434"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (31, N'T005768998', N'R749019483', NULL, N'{"TempCode":null,"Customer":null,"Maker":"wetdfg","Model":"dfsdfsdf","Power":54234,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"623434345","SerialNumber":"4534545654","Memory":"434"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1009, N'T845807152', N'R376458558', NULL, N'{"TempCode":null,"Customer":null,"Maker":"sdfsdf","Model":"ứetrsdfsdf","Power":3242,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"5345345","SerialNumber":"4234243","Memory":"343"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1010, N'T422341195', N'R376458558', NULL, N'{"TempCode":null,"Customer":null,"Maker":"rrtyry","Model":"ethfg46456","Power":456456,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"73534235345","SerialNumber":"45646564756","Memory":"654"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1011, N'T933045893', N'R398715936', NULL, N'{"TempCode":null,"Customer":null,"Maker":"sdfsfsdf","Model":"sfsfsdf","Power":2345,"Size":1,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":null,"PartNumber":"2324234","SerialNumber":"42354235345","Memory":"432"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1012, N'T702003095', N'R398715936', NULL, N'{"TempCode":null,"Customer":null,"Maker":"ryhfghfgh","Model":"2343reresdf","Power":6546,"Size":2,"DefaultIP":null,"LocationCode":null,"Outlet":null,"AssignedName":null,"Identification":null,"Bandwidth":"100Mbps","PartNumber":"645645654","SerialNumber":"63465353543","Memory":"543"}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1013, N'T190590181', N'R143071212', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"23424234","SerialNumber":"345345345435","Memory":"4534","TempCode":null,"Requests":null,"ServerCode":null,"Customer":null,"Maker":"sdfsdf","Model":"acfxzcsdf","Power":24234,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1014, N'T710324964', N'R143071212', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"4565867","SerialNumber":"567567","Memory":"567","TempCode":null,"Requests":null,"ServerCode":null,"Customer":null,"Maker":"gggggg","Model":"yyyyyyyyyyyyyy","Power":3435,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1015, N'T186356445', N'R282913935', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"213423432","SerialNumber":"3244535435","Memory":"433","TempCode":null,"Requests":null,"ServerCode":null,"Customer":null,"Maker":"wwwwwwww","Model":"oooooooo","Power":1243,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"1Gbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1016, N'T915291963', N'R282913935', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"2335345","SerialNumber":"2425345345","Memory":"124","TempCode":null,"Requests":null,"ServerCode":null,"Customer":null,"Maker":"ggggg","Model":"ádsfsdf","Power":444,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1019, N'T208926222', N'R440038046', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"5345435435","SerialNumber":"25345345","Memory":"1111","TempCode":null,"Requests":null,"ServerCode":null,"Customer":null,"Maker":"hihih","Model":"huhuhu","Power":321,"Size":4,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1020, N'T031448340', N'R440038046', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"234234","SerialNumber":"5345546456","Memory":"321","TempCode":null,"Requests":null,"ServerCode":null,"Customer":null,"Maker":"hehehe","Model":"keke","Power":321,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1021, N'T372097611', N'R617318426', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":null,"SerialNumber":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerCode":null,"Customer":null,"Maker":null,"Model":null,"Power":null,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":null,"Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1022, N'T980366392', N'R006683412', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":null,"SerialNumber":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerCode":null,"Customer":null,"Maker":null,"Model":null,"Power":null,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":null,"Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1023, N'T739621070', N'R006683412', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":null,"SerialNumber":"1232342","Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerCode":null,"Customer":null,"Maker":"AAA","Model":"CCC","Power":222,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":null,"Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1024, N'T153681156', N'R006683412', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"asdssfsfsdf","SerialNumber":"1232342","Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerCode":null,"Customer":null,"Maker":"AAA","Model":"CCC","Power":222,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":null,"Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1025, N'T515543369', N'R936186916', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"23423","SerialNumber":"234235","Memory":"798","TempCode":null,"Requests":null,"Checked":false,"ServerCode":null,"Customer":null,"Maker":"huu","Model":"qeqwe","Power":222,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":null,"Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1017, N'T418397613', N'R585420359', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"234346546","SerialNumber":"464567576","Memory":"346","TempCode":null,"Requests":null,"ServerCode":null,"Customer":null,"Maker":"omg","Model":"omg1","Power":3424,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1018, N'T183832965', N'R585420359', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"4564576567","SerialNumber":"6587687","Memory":"678","TempCode":null,"Requests":null,"ServerCode":null,"Customer":null,"Maker":"dhfhjhg","Model":"fhngfhfgh","Power":7567,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1026, N'T404698518', N'R624312169', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"234354463","SerialNumber":"534645675","Memory":"245","TempCode":null,"Requests":null,"Checked":false,"ServerCode":null,"Customer":null,"Maker":"rwrwer","Model":"fsdfsdf","Power":423,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1027, N'T642854849', N'R805981424', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"3453535","SerialNumber":"3647568=678","Memory":"777","TempCode":null,"Requests":null,"Checked":false,"ServerCode":null,"Customer":null,"Maker":"gdfgdfg","Model":"sfdsfsdf","Power":43,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1028, N'T165255178', N'R805981424', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"3453535","SerialNumber":"3647568=678","Memory":"777","TempCode":null,"Requests":null,"Checked":false,"ServerCode":null,"Customer":null,"Maker":"gdfgdfg","Model":"sfdsfsdf","Power":43,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1029, N'T314764924', N'R805981424', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"34535234","SerialNumber":"546567587","Memory":"4355","TempCode":null,"Requests":null,"Checked":false,"ServerCode":null,"Customer":null,"Maker":"wersfsdf","Model":"dfgdfgdfg","Power":432,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1030, N'T062548952', N'R637505926', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"34535345","SerialNumber":"47586868","Memory":"654","TempCode":null,"Requests":null,"Checked":false,"ServerCode":null,"Customer":null,"Maker":"dhfdhgfh","Model":"dfhfghfh","Power":456456,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1031, N'T476442074', N'R349426575', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"65765745","SerialNumber":"98098098908","Memory":"657","TempCode":null,"Requests":null,"Checked":false,"ServerCode":null,"Customer":null,"Maker":"kkjkj","Model":"hgkjbklmnkl","Power":878,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1032, N'T070066026', N'R901734989', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"3453423424","SerialNumber":"646547567","Memory":"6455","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"ứdfsdfsdf","Model":"dfgdgdfg","Power":456,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1033, N'T904063757', N'R887928600', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"3464656756","SerialNumber":"35645758758","Memory":"2345","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"hsfsfdsdf","Model":"fsdfsdfdf","Power":5345,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"1Gbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1034, N'T341654322', N'R887928600', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"234234","SerialNumber":"26y7567567","Memory":"542","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"fdgdgdsfg","Model":"sfdvsdf","Power":543,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1043, N'T052033629', N'R225313966', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"123234","SerialNumber":"4234234","Memory":"123","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"ưqeqweqwe","Model":"234234","Power":52452,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"1Gbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1036, N'T310884610', N'R134614536', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"2342546","SerialNumber":"543647567","Memory":"542","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"dsfvsdf","Model":"rwersfsfd","Power":5345,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"1Gbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1037, N'T052434488', N'R983990365', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"123","SerialNumber":"213123","Memory":"21313","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"213123","Model":"123213","Power":123,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":null,"Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1038, N'T884348327', N'R668357339', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":null,"SerialNumber":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":null,"Model":null,"Power":null,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":null,"Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1039, N'T312938530', N'R106066918', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"23542534","SerialNumber":"45436456456","Memory":"42","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"dfsdf","Model":"dfsdf","Power":543,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"1Gbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1042, N'T742231159', N'R478308663', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":null,"SerialNumber":null,"Memory":null,"TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"2","Model":null,"Power":null,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":null,"Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1044, N'T789108200', N'R225313966', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"34535345","SerialNumber":"4234234","Memory":"234","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"rưerwer","Model":"sdfsdf","Power":425,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1045, N'T740169120', N'R301639760', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"23425345","SerialNumber":"45345345","Memory":"222","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"sdfsdfsdf","Model":"sdfsdf","Power":23424,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1046, N'T621604560', N'R301639760', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"23234245","SerialNumber":"545345","Memory":"245","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"5345345","Model":"32545","Power":324345,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1047, N'T733725093', N'R033528989', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"34535234","SerialNumber":"5364564","Memory":"2345","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"ưerdfsdf","Model":"sdf","Power":234,"Size":1,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"1Gbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1048, N'T773091745', N'R033528989', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"345345345","SerialNumber":"6464566456","Memory":"234","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"dghtghyr","Model":"fgdfgdfg","Power":56456,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1049, N'T753629773', N'R327670049', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"213234324","SerialNumber":"2345345","Memory":"324","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"sdfsdf","Model":"ưerssdfsdf","Power":23424,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"1Gbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1050, N'T436511904', N'R327670049', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"234234","SerialNumber":"534525345","Memory":"234","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"wrwer","Model":"dfgdfg","Power":543,"Size":2,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1051, N'T052265876', N'R396184507', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"243235345","SerialNumber":"345345345","Memory":"3453","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"sdfsdfsdf","Model":"2dfsf","Power":2352,"Size":4,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"100Mbps","Id":0}')
INSERT [dbo].[TempRequest] ([Id], [TempCode], [RequestCode], [ObjectType], [Data]) VALUES (1052, N'T296701956', N'R396184507', NULL, N'{"CustomerName":null,"RackCode":null,"RackName":null,"RackUnit":null,"Status":null,"PartNumber":"234234234","SerialNumber":"235345345","Memory":"432","TempCode":null,"Requests":null,"Checked":false,"ServerIps":null,"ServerLocation":null,"ServerCode":null,"Customer":null,"Maker":"4324","Model":"345345","Power":3453465,"Size":4,"StatusCode":null,"DefaultIP":null,"RegisteredDate":null,"Outlet":null,"Bandwidth":"1Gbps","Id":0}')
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
SET IDENTITY_INSERT [dbo].[TypeOfLog] OFF
USE [master]
GO
ALTER DATABASE [IMS] SET  READ_WRITE 
GO
