USE [master]
GO
-- Create the 'bookMovie' database if it does not exist
IF NOT EXISTS (SELECT [name] FROM sys.databases WHERE [name] = 'bookMovie')
BEGIN
    CREATE DATABASE [bookMovie]
END
GO
-- Switch to the 'bookMovie' database context
USE [bookMovie]
GO
/****** Object:  Table [dbo].[MovieCategory]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieCategory](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](max) NULL,
 CONSTRAINT [PK_MovieCategory] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieImage]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieImage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[movieId] [int] NULL,
	[linkImage] [nvarchar](max) NULL,
	[publicId] [nvarchar](255) NULL,
 CONSTRAINT [PK_MovieImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[movieId] [int] IDENTITY(1,1) NOT NULL,
	[movieTitle] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[price] [float] NULL,
	[director] [nvarchar](50) NULL,
	[durations] [nvarchar](50) NULL,
	[trailer] [nvarchar](max) NULL,
	[releaseDate] [datetime] NULL,
	[categoryId] [int] NULL,
	[enable] [bit] NULL,
	[statusId] [int] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[movieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieStatus]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieStatus](
	[statusId] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_MovieStatus] PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[paymentId] [int] IDENTITY(1,1) NOT NULL,
	[reservationId] [int] NULL,
	[totalAmount] [float] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Revervations]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Revervations](
	[reservationId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[movieId] [int] NULL,
	[timeSlotId] [int] NULL,
	[seatId] [int] NULL,
	[reservationDate] [datetime] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Revervations] PRIMARY KEY CLUSTERED 
(
	[reservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[roomId] [int] IDENTITY(1,1) NOT NULL,
	[theaterId] [int] NULL,
	[roomNumber] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[schedulesId] [int] IDENTITY(1,1) NOT NULL,
	[movieId] [int] NULL,
	[theaterId] [int] NULL,
	[timeSlotId] [int] NULL,
	[scheduleDate] [datetime] NULL,
 CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED 
(
	[schedulesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[seatId] [int] IDENTITY(1,1) NOT NULL,
	[roomId] [int] NULL,
	[seatNumber] [nchar](10) NULL,
	[row] [nchar](10) NULL,
	[Status] [bit] NULL,
	[seatTypeId] [int] NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[seatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeatType]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatType](
	[seatTypeId] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [nvarchar](50) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_SeatType] PRIMARY KEY CLUSTERED 
(
	[seatTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Theaters]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theaters](
	[theaterId] [int] IDENTITY(1,1) NOT NULL,
	[theaterName] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[phoneNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_Theaters] PRIMARY KEY CLUSTERED 
(
	[theaterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlots]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlots](
	[timeSlotId] [int] IDENTITY(1,1) NOT NULL,
	[startTime] [varchar](10) NULL,
	[endTime] [varchar](10) NULL,
 CONSTRAINT [PK_TimeSlots] PRIMARY KEY CLUSTERED 
(
	[timeSlotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/1/2024 4:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[phoneNumber] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[gender] [bit] NULL,
	[dob] [datetime] NULL,
	[roleId] [int] NULL,
	[avatar] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MovieCategory] ON 

INSERT [dbo].[MovieCategory] ([categoryId], [categoryName]) VALUES (1, N'Hài, Hoạt Hình, Phiêu Lưu')
INSERT [dbo].[MovieCategory] ([categoryId], [categoryName]) VALUES (2, N'Tâm Lý')
INSERT [dbo].[MovieCategory] ([categoryId], [categoryName]) VALUES (3, N'Hành Động')
INSERT [dbo].[MovieCategory] ([categoryId], [categoryName]) VALUES (4, N'Hoạt Hình')
INSERT [dbo].[MovieCategory] ([categoryId], [categoryName]) VALUES (5, N'Kinh Dị')
INSERT [dbo].[MovieCategory] ([categoryId], [categoryName]) VALUES (6, N'Tình cảm')
SET IDENTITY_INSERT [dbo].[MovieCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieImage] ON 

INSERT [dbo].[MovieImage] ([id], [movieId], [linkImage], [publicId]) VALUES (1, 1, N'https://res.cloudinary.com/dwfo16yhs/image/upload/v1719050854/img_prn231/bwg2pcprjrb1graxbduh.jpg', NULL)
INSERT [dbo].[MovieImage] ([id], [movieId], [linkImage], [publicId]) VALUES (2, 1, N'https://res.cloudinary.com/dwfo16yhs/image/upload/v1719051186/img_prn231/ckot0oy4mghkm10yneja.jpg', NULL)
INSERT [dbo].[MovieImage] ([id], [movieId], [linkImage], [publicId]) VALUES (3, 2, N'https://res.cloudinary.com/dwfo16yhs/image/upload/v1719051344/img_prn231/objt8uiz3e002sl7ak90.jpg', NULL)
INSERT [dbo].[MovieImage] ([id], [movieId], [linkImage], [publicId]) VALUES (4, 2, N'https://res.cloudinary.com/dwfo16yhs/image/upload/v1719051343/img_prn231/wmyvulhmzspoe01sxbyr.jpg', NULL)
SET IDENTITY_INSERT [dbo].[MovieImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([movieId], [movieTitle], [description], [price], [director], [durations], [trailer], [releaseDate], [categoryId], [enable], [statusId]) VALUES (1, N'NHỮNG MẢNH GHÉP CẢM XÚC 2', N'Cuộc sống tuổi mới lớn của cô bé Riley lại tiếp tục trở nên hỗn loạn hơn bao giờ hết với sự xuất hiện của 4 cảm xúc hoàn toàn mới: Lo u, Ganh Tị, Xấu Hổ, Chán Nản. Mọi chuyện thậm chí còn rối rắm hơn khi nhóm cảm xúc mới này nổi loạn và nhốt nhóm cảm xúc cũ gồm Vui Vẻ, Buồn Bã, Giận Dữ, Sợ Hãi và Chán Ghét lại, khiến cô bé Riley rơi vào những tình huống dở khóc dở cười.', 70000, N'Kelsey Mann', N'96 phút', N'https://youtu.be/9phK0prtuJM', CAST(N'2024-06-14T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[Movies] ([movieId], [movieTitle], [description], [price], [director], [durations], [trailer], [releaseDate], [categoryId], [enable], [statusId]) VALUES (2, N'GIA TÀI CỦA NGOẠI', N'Gia Tài Của Ngoại xoay quanh câu chuyện về M (do Billkin Putthipong thủ vai) là một chàng trai thất nghiệp và đang tìm mọi cách để làm giàu. Một ngày nọ, M nhận ra có một cách làm giàu nhanh chóng: chăm sóc người bà đang mắc ung thư giai đoạn cuối để lấy tài sản thừa kế. Vì vậy, M quyết định đến chăm sóc người bà của mình. Tuy nhiên, trong khoảng thời gian sống cùng bà, M đã nhận ra những điều còn giá trị hơn cả tài sản.', 70000, N'Pat Boonnitipat', N'127 phút', N'https://youtu.be/Y_qYJ6To93k', CAST(N'2024-06-07T00:00:00.000' AS DateTime), 2, 1, 2)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieStatus] ON 

INSERT [dbo].[MovieStatus] ([statusId], [statusName]) VALUES (1, N'sắp chiếu')
INSERT [dbo].[MovieStatus] ([statusId], [statusName]) VALUES (2, N'đang chiếu')
INSERT [dbo].[MovieStatus] ([statusId], [statusName]) VALUES (3, N'Dừng công chiếu')
SET IDENTITY_INSERT [dbo].[MovieStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (2, N'Staff')
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([roomId], [theaterId], [roomNumber], [Status]) VALUES (1, 1, N'101', 1)
INSERT [dbo].[Rooms] ([roomId], [theaterId], [roomNumber], [Status]) VALUES (2, 1, N'102', 1)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [timeSlotId], [scheduleDate]) VALUES (1, 1, 1, 1, CAST(N'2024-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [timeSlotId], [scheduleDate]) VALUES (2, 1, 1, 3, CAST(N'2024-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [timeSlotId], [scheduleDate]) VALUES (3, 2, 1, 2, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [timeSlotId], [scheduleDate]) VALUES (4, 1, 1, 1, CAST(N'2024-06-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [timeSlotId], [scheduleDate]) VALUES (5, 1, 1, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [timeSlotId], [scheduleDate]) VALUES (6, 2, 1, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Schedules] OFF
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 

INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (1, 1, N'A1        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (2, 1, N'A2        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (3, 1, N'A3        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (4, 1, N'A4        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (5, 1, N'A5        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (6, 1, N'A6        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (7, 1, N'A7        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (8, 1, N'A8        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (9, 1, N'A9        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (10, 1, N'A10       ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (11, 1, N'A11       ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (12, 1, N'A12       ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (13, 1, N'B1        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (14, 1, N'B2        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (15, 1, N'B3        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (16, 1, N'B4        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (17, 1, N'B5        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (18, 1, N'B6        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (19, 1, N'B7        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (20, 1, N'B8        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (21, 1, N'B9        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (22, 1, N'B10       ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (23, 1, N'B11       ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (24, 1, N'B12       ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (25, 1, N'C1        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (26, 1, N'C2        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (27, 1, N'C3        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (28, 1, N'C4        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (29, 1, N'C5        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (30, 1, N'C6        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (31, 1, N'C7        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (32, 1, N'C8        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (33, 1, N'C9        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (34, 1, N'C10       ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (35, 1, N'C11       ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (36, 1, N'C12       ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (37, 1, N'D1        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (38, 1, N'D2        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (39, 1, N'D3        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (40, 1, N'D4        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (41, 1, N'D5        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (42, 1, N'D6        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (43, 1, N'D7        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (44, 1, N'D8        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (45, 1, N'D9        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (46, 1, N'D10       ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (47, 1, N'D11       ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (48, 1, N'D12       ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (49, 1, N'E1        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (50, 1, N'E2        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (51, 1, N'E3        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (52, 1, N'E4        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (53, 1, N'E5        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (54, 1, N'E6        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (55, 1, N'E7        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (56, 1, N'E8        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (57, 1, N'E9        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (58, 1, N'E10       ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (59, 1, N'E11       ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (60, 1, N'E12       ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (61, 1, N'F1        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (62, 1, N'F2        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (63, 1, N'F3        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (64, 1, N'F4        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (65, 1, N'F5        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (66, 1, N'F6        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (67, 1, N'F7        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (68, 1, N'F8        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (69, 1, N'F9        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (70, 1, N'F10       ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (71, 1, N'F11       ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (72, 1, N'F12       ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (73, 1, N'G1        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (74, 1, N'G2        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (75, 1, N'G3        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (76, 1, N'G4        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (77, 1, N'G5        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (78, 1, N'G6        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (79, 1, N'G7        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (80, 1, N'G8        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (81, 1, N'G9        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (82, 1, N'G10       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (83, 1, N'G11       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (84, 1, N'G12       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (85, 1, N'H1        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (86, 1, N'H2        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (87, 1, N'H3        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (88, 1, N'H4        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (89, 1, N'H5        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (90, 1, N'H6        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (91, 1, N'H7        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (92, 1, N'H8        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (93, 1, N'H9        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (94, 1, N'H10       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (95, 1, N'H11       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (96, 1, N'H12       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (97, 1, N'I1        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (98, 1, N'I2        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (99, 1, N'I3        ', N'I         ', 1, 3)
GO
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (100, 1, N'I4        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (101, 1, N'I5        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (102, 1, N'I6        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (103, 1, N'I7        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (104, 1, N'I8        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (105, 1, N'I9        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (106, 1, N'I10       ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (107, 1, N'I11       ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (108, 1, N'I12       ', N'I         ', 1, 3)
SET IDENTITY_INSERT [dbo].[Seats] OFF
GO
SET IDENTITY_INSERT [dbo].[SeatType] ON 

INSERT [dbo].[SeatType] ([seatTypeId], [typeName], [price]) VALUES (1, N'regular', 5)
INSERT [dbo].[SeatType] ([seatTypeId], [typeName], [price]) VALUES (2, N'vip', 10)
INSERT [dbo].[SeatType] ([seatTypeId], [typeName], [price]) VALUES (3, N'sweetbox', 15)
SET IDENTITY_INSERT [dbo].[SeatType] OFF
GO
SET IDENTITY_INSERT [dbo].[Theaters] ON 

INSERT [dbo].[Theaters] ([theaterId], [theaterName], [address], [phoneNumber]) VALUES (1, N'CGV Center', N'Hà Nội', N'0999999999')
SET IDENTITY_INSERT [dbo].[Theaters] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeSlots] ON 

INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (1, N'08:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (2, N'09:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (3, N'10:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (4, N'11:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (5, N'12:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (6, N'13:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (7, N'14:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (8, N'15:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (9, N'16:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (10, N'17:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (11, N'18:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (12, N'19:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (13, N'20:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (14, N'21:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (15, N'22:30', NULL)
INSERT [dbo].[TimeSlots] ([timeSlotId], [startTime], [endTime]) VALUES (16, N'23:00', NULL)
SET IDENTITY_INSERT [dbo].[TimeSlots] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userId], [userName], [email], [password], [phoneNumber], [address], [gender], [dob], [roleId], [avatar], [Status]) VALUES (1, N'hoan', N'hoan@gmail.com', N'123', NULL, NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Users] ([userId], [userName], [email], [password], [phoneNumber], [address], [gender], [dob], [roleId], [avatar], [Status]) VALUES (2, N'hoan2', N'hoan2@gmail.com', N'123', NULL, NULL, NULL, NULL, 2, NULL, 0)
INSERT [dbo].[Users] ([userId], [userName], [email], [password], [phoneNumber], [address], [gender], [dob], [roleId], [avatar], [Status]) VALUES (3, N'danghoan', N'abc@gmail.com', N'123', N'123456789', NULL, NULL, NULL, 3, NULL, 1)
INSERT [dbo].[Users] ([userId], [userName], [email], [password], [phoneNumber], [address], [gender], [dob], [roleId], [avatar], [Status]) VALUES (6, N'Test2', N'Test2@gmail.com', N'123', N'565656', N'Hà Nội', 1, CAST(N'2024-06-13T00:00:00.000' AS DateTime), 3, NULL, 1)
INSERT [dbo].[Users] ([userId], [userName], [email], [password], [phoneNumber], [address], [gender], [dob], [roleId], [avatar], [Status]) VALUES (1014, N'Nguyễn Đăng Hoàn K16_HL', N'hoanndhe161494@fpt.edu.vn', NULL, NULL, NULL, NULL, NULL, 3, NULL, 1)
INSERT [dbo].[Users] ([userId], [userName], [email], [password], [phoneNumber], [address], [gender], [dob], [roleId], [avatar], [Status]) VALUES (2008, N'danghoan', N'danghoan2382002@gmail.com', N'123', N'565656', N'Hà Nội', 1, CAST(N'2024-06-20T00:00:00.000' AS DateTime), 3, NULL, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[MovieImage]  WITH CHECK ADD  CONSTRAINT [FK_MovieImage_Movies] FOREIGN KEY([movieId])
REFERENCES [dbo].[Movies] ([movieId])
GO
ALTER TABLE [dbo].[MovieImage] CHECK CONSTRAINT [FK_MovieImage_Movies]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_MovieCategory] FOREIGN KEY([categoryId])
REFERENCES [dbo].[MovieCategory] ([categoryId])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_MovieCategory]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_MovieStatus] FOREIGN KEY([statusId])
REFERENCES [dbo].[MovieStatus] ([statusId])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_MovieStatus]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Revervations1] FOREIGN KEY([reservationId])
REFERENCES [dbo].[Revervations] ([reservationId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Revervations1]
GO
ALTER TABLE [dbo].[Revervations]  WITH CHECK ADD  CONSTRAINT [FK_Revervations_Movies] FOREIGN KEY([movieId])
REFERENCES [dbo].[Movies] ([movieId])
GO
ALTER TABLE [dbo].[Revervations] CHECK CONSTRAINT [FK_Revervations_Movies]
GO
ALTER TABLE [dbo].[Revervations]  WITH CHECK ADD  CONSTRAINT [FK_Revervations_Seats] FOREIGN KEY([seatId])
REFERENCES [dbo].[Seats] ([seatId])
GO
ALTER TABLE [dbo].[Revervations] CHECK CONSTRAINT [FK_Revervations_Seats]
GO
ALTER TABLE [dbo].[Revervations]  WITH CHECK ADD  CONSTRAINT [FK_Revervations_TimeSlots] FOREIGN KEY([timeSlotId])
REFERENCES [dbo].[TimeSlots] ([timeSlotId])
GO
ALTER TABLE [dbo].[Revervations] CHECK CONSTRAINT [FK_Revervations_TimeSlots]
GO
ALTER TABLE [dbo].[Revervations]  WITH CHECK ADD  CONSTRAINT [FK_Revervations_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Revervations] CHECK CONSTRAINT [FK_Revervations_Users]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Theaters] FOREIGN KEY([theaterId])
REFERENCES [dbo].[Theaters] ([theaterId])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Theaters]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedules_Movies] FOREIGN KEY([movieId])
REFERENCES [dbo].[Movies] ([movieId])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedules_Movies]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedules_Theaters] FOREIGN KEY([theaterId])
REFERENCES [dbo].[Theaters] ([theaterId])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedules_Theaters]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedules_TimeSlots] FOREIGN KEY([timeSlotId])
REFERENCES [dbo].[TimeSlots] ([timeSlotId])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedules_TimeSlots]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_Rooms] FOREIGN KEY([roomId])
REFERENCES [dbo].[Rooms] ([roomId])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_Rooms]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_SeatType] FOREIGN KEY([seatTypeId])
REFERENCES [dbo].[SeatType] ([seatTypeId])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_SeatType]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([roleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [bookMovie] SET  READ_WRITE 
GO
