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
/****** Object:  Table [dbo].[MovieCategory]    Script Date: 7/21/2024 12:24:22 PM ******/
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
/****** Object:  Table [dbo].[MovieImage]    Script Date: 7/21/2024 12:24:22 PM ******/
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
/****** Object:  Table [dbo].[Movies]    Script Date: 7/21/2024 12:24:22 PM ******/
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
/****** Object:  Table [dbo].[MovieStatus]    Script Date: 7/21/2024 12:24:22 PM ******/
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
/****** Object:  Table [dbo].[Revervations]    Script Date: 7/21/2024 12:24:22 PM ******/
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
	[totalAmount] [float] NULL,
 CONSTRAINT [PK_Revervations] PRIMARY KEY CLUSTERED 
(
	[reservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/21/2024 12:24:22 PM ******/
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
/****** Object:  Table [dbo].[Rooms]    Script Date: 7/21/2024 12:24:22 PM ******/
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
/****** Object:  Table [dbo].[Schedules]    Script Date: 7/21/2024 12:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[schedulesId] [int] IDENTITY(1,1) NOT NULL,
	[movieId] [int] NULL,
	[theaterId] [int] NULL,
	[roomId] [int] NULL,
	[timeSlotId] [int] NULL,
	[scheduleDate] [datetime] NULL,
 CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED 
(
	[schedulesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 7/21/2024 12:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[seatId] [int] IDENTITY(1,1) NOT NULL,
	[roomId] [int] NULL,
	[theatersId] [int] NULL,
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
/****** Object:  Table [dbo].[SeatType]    Script Date: 7/21/2024 12:24:22 PM ******/
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
/****** Object:  Table [dbo].[Theaters]    Script Date: 7/21/2024 12:24:22 PM ******/
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
/****** Object:  Table [dbo].[TimeSlots]    Script Date: 7/21/2024 12:24:22 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 7/21/2024 12:24:22 PM ******/
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
INSERT [dbo].[MovieImage] ([id], [movieId], [linkImage], [publicId]) VALUES (5, 3, N'https://res.cloudinary.com/dwfo16yhs/image/upload/v1721495163/img_prn231/eom3kcwzb5lvimz4f4m7.jpg', N'img_prn231/eom3kcwzb5lvimz4f4m7')
INSERT [dbo].[MovieImage] ([id], [movieId], [linkImage], [publicId]) VALUES (6, 3, N'https://res.cloudinary.com/dwfo16yhs/image/upload/v1721495164/img_prn231/kze6htq940861sgicxlg.jpg', N'img_prn231/kze6htq940861sgicxlg')
SET IDENTITY_INSERT [dbo].[MovieImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([movieId], [movieTitle], [description], [price], [director], [durations], [trailer], [releaseDate], [categoryId], [enable], [statusId]) VALUES (1, N'NHỮNG MẢNH GHÉP CẢM XÚC 2', N'Cuộc sống tuổi mới lớn của cô bé Riley lại tiếp tục trở nên hỗn loạn hơn bao giờ hết với sự xuất hiện của 4 cảm xúc hoàn toàn mới: Lo u, Ganh Tị, Xấu Hổ, Chán Nản. Mọi chuyện thậm chí còn rối rắm hơn khi nhóm cảm xúc mới này nổi loạn và nhốt nhóm cảm xúc cũ gồm Vui Vẻ, Buồn Bã, Giận Dữ, Sợ Hãi và Chán Ghét lại, khiến cô bé Riley rơi vào những tình huống dở khóc dở cười.', 70000, N'Kelsey Mann', N'96 phút', N'https://youtu.be/9phK0prtuJM', CAST(N'2024-06-14T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[Movies] ([movieId], [movieTitle], [description], [price], [director], [durations], [trailer], [releaseDate], [categoryId], [enable], [statusId]) VALUES (2, N'GIA TÀI CỦA NGOẠI', N'Gia Tài Của Ngoại xoay quanh câu chuyện về M (do Billkin Putthipong thủ vai) là một chàng trai thất nghiệp và đang tìm mọi cách để làm giàu. Một ngày nọ, M nhận ra có một cách làm giàu nhanh chóng: chăm sóc người bà đang mắc ung thư giai đoạn cuối để lấy tài sản thừa kế. Vì vậy, M quyết định đến chăm sóc người bà của mình. Tuy nhiên, trong khoảng thời gian sống cùng bà, M đã nhận ra những điều còn giá trị hơn cả tài sản.', 70000, N'Pat Boonnitipat', N'127 phút', N'https://youtu.be/Y_qYJ6To93k', CAST(N'2024-06-07T00:00:00.000' AS DateTime), 2, 1, 2)
INSERT [dbo].[Movies] ([movieId], [movieTitle], [description], [price], [director], [durations], [trailer], [releaseDate], [categoryId], [enable], [statusId]) VALUES (3, N'DỰ ÁN MẬT: THẢM HOẠ TRÊN CẦU', N'Do điều kiện thời tiết xấu đi đột ngột, tầm nhìn trên cây cầu đến sân bay bị suy giảm nghiêm trọng, khiến người dân bị mắc kẹt và có nguy cơ sập cầu do hàng loạt va chạm dây chuyền và các vụ nổ. Giữa sự hỗn loạn, những chú chó "Echo" từ thí nghiệm quân sự "Dự án Mật", đang được vận chuyển bí mật, thoát ra ngoài và tất cả những người sống sót đều trở thành mục tiêu của các cuộc tấn công không ngừng. Nhiều người bị mắc kẹt trên cầu vì nhiều lý do khác nhau - một quan chức chính phủ từ văn phòng tổng thống (LEE Sun Kyun), người đang tiễn con gái mình (KIM Su An) tại sân bay; tài xế xe đầu kéo (JU Ji Hoon) đang trên đường đến hiện trường vụ va chạm; một cặp vợ chồng già (MOON Sung Geun, YE Su Jeong) đang trở về sau chuyến đi nước ngoài; chị em (PARK Hee Von, PARK Ju Hyun) đã lỡ chuyến bay và Tiến sĩ Yang (Kim Hie Won), nhà nghiên cứu chịu trách nhiệm về Dự án Mật - và một cuộc đấu tranh tuyệt vọng bắt đầu để họ trốn thoát đến nơi an toàn.', 646, N'gf', N'96 phút', N'https://www.youtube.com/embed/MghlJ1SksGE', CAST(N'2024-07-20T00:00:00.000' AS DateTime), 2, 1, 1)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieStatus] ON 

INSERT [dbo].[MovieStatus] ([statusId], [statusName]) VALUES (1, N'sắp chiếu')
INSERT [dbo].[MovieStatus] ([statusId], [statusName]) VALUES (2, N'đang chiếu')
INSERT [dbo].[MovieStatus] ([statusId], [statusName]) VALUES (3, N'Dừng công chiếu')
SET IDENTITY_INSERT [dbo].[MovieStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Revervations] ON 

INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1, 1014, 1, 1, 1, CAST(N'2024-07-05T00:00:00.000' AS DateTime), 1, 70000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2, 1014, 1, 1, 2, CAST(N'2024-07-05T00:00:00.000' AS DateTime), 1, 70000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3, 1014, 1, 4, 5, CAST(N'2024-07-06T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (4, 2008, 1, 4, 2, CAST(N'2024-07-06T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (5, 6, 1, 4, 40, CAST(N'2024-07-06T00:00:00.000' AS DateTime), 0, 231000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (6, 6, 1, 4, 41, CAST(N'2024-07-06T00:00:00.000' AS DateTime), 0, 231000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (7, 6, 1, 4, 42, CAST(N'2024-07-06T00:00:00.000' AS DateTime), 0, 231000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (8, 3, 1, 4, 101, CAST(N'2024-07-06T00:00:00.000' AS DateTime), 0, 80500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (9, 3, 1, 4, 102, CAST(N'2024-07-06T00:00:00.000' AS DateTime), 0, 80500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (10, 1014, 2, 2, 41, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 0, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (11, 1014, 2, 2, 42, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 0, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (12, 1014, 2, 2, 43, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 0, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1002, 1014, 2, 2, 52, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 0, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1003, 1014, 2, 2, 53, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 0, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1004, 1014, 2, 2, 54, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 0, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1005, 1014, 2, 2, 55, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 0, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1006, 1014, 2, 2, 56, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 0, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1007, 1014, 2, 2, 17, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 0, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1008, 1014, 2, 2, 19, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 1, 10500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1009, 1014, 2, 2, 20, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 1, 10500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1010, 2008, 2, 2, 102, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 1, 11500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1011, 2008, 2, 2, 77, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 1, 11000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1012, 2008, 2, 2, 78, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 1, 11000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1013, 2008, 2, 2, 79, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 1, 11000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1014, 2008, 2, 2, 80, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 1, 11000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1015, 2008, 2, 2, 64, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1016, 2008, 2, 2, 66, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (1017, 2008, 2, 2, 65, CAST(N'2024-07-07T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2002, 1014, 1, 1, 41, CAST(N'2024-07-15T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2003, 1014, 1, 1, 42, CAST(N'2024-07-15T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2004, 1014, 1, 1, 43, CAST(N'2024-07-15T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2005, 1014, 1, 1, 52, CAST(N'2024-07-15T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2006, 1014, 1, 1, 53, CAST(N'2024-07-15T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2007, 1014, 1, 1, 54, CAST(N'2024-07-15T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2008, 1014, 1, 1, 55, CAST(N'2024-07-15T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2009, 1014, 1, 1, 56, CAST(N'2024-07-15T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2010, 1014, 1, 8, 29, CAST(N'2024-07-16T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2011, 1014, 1, 8, 30, CAST(N'2024-07-16T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2012, 1014, 1, 8, 31, CAST(N'2024-07-16T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2013, 1014, 1, 4, 30, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (2014, 1014, 1, 4, 31, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3002, 1014, 1, 4, 75, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3003, 1014, 1, 4, 64, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3004, 1014, 1, 4, 53, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3005, 1014, 1, 4, 42, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3006, 1014, 1, 4, 43, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3007, 1014, 1, 4, 56, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3008, 1014, 1, 4, 69, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3009, 1014, 1, 4, 82, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3010, 1014, 1, 4, 81, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3011, 1014, 1, 4, 80, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3012, 1014, 1, 4, 79, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3013, 1014, 1, 4, 78, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3014, 1014, 1, 4, 77, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3015, 1014, 1, 4, 76, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3016, 1014, 1, 4, 17, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3017, 1014, 1, 4, 18, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3018, 1014, 1, 4, 19, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3019, 1014, 1, 4, 20, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3020, 1014, 1, 4, 101, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 80500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3021, 1014, 1, 4, 102, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 80500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3022, 1014, 1, 4, 103, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 80500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3023, 2008, 1, 4, 106, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 80500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3024, 1014, 1, 4, 99, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 80500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3025, 2008, 1, 4, 90, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3026, 1014, 1, 4, 72, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3027, 1014, 1, 4, 48, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3028, 2008, 1, 4, 36, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3029, 1014, 1, 4, 12, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3030, 2008, 1, 4, 25, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3031, 1014, 1, 4, 38, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3032, 2008, 1, 4, 1, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3033, 2008, 1, 4, 2, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3034, 2008, 1, 4, 3, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3035, 2008, 1, 4, 66, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3036, 2008, 1, 4, 67, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3037, 2008, 1, 4, 7, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3038, 2008, 1, 4, 8, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (3039, 2008, 1, 4, 9, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (4002, 2008, 1, 7, 43, CAST(N'2024-07-25T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (4003, 2008, 1, 7, 42, CAST(N'2024-07-25T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (4004, 2008, 1, 7, 41, CAST(N'2024-07-25T00:00:00.000' AS DateTime), 1, 77000)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (4005, 1014, 1, 7, 31, CAST(N'2024-07-25T00:00:00.000' AS DateTime), 1, 73500)
INSERT [dbo].[Revervations] ([reservationId], [userId], [movieId], [timeSlotId], [seatId], [reservationDate], [status], [totalAmount]) VALUES (4006, 1014, 1, 7, 33, CAST(N'2024-07-25T00:00:00.000' AS DateTime), 1, 73500)
SET IDENTITY_INSERT [dbo].[Revervations] OFF
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
INSERT [dbo].[Rooms] ([roomId], [theaterId], [roomNumber], [Status]) VALUES (3, 2, N'101', 1)
INSERT [dbo].[Rooms] ([roomId], [theaterId], [roomNumber], [Status]) VALUES (4, 2, N'102', 1)
INSERT [dbo].[Rooms] ([roomId], [theaterId], [roomNumber], [Status]) VALUES (5, 2, N'103', 1)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (1, 1, 1, 1, 1, CAST(N'2024-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (2, 1, 1, 1, 3, CAST(N'2024-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (3, 2, 1, 1, 2, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (4, 1, 1, 1, 1, CAST(N'2024-06-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (5, 1, 1, 1, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (6, 2, 1, 1, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (7, 1, 1, 1, 4, CAST(N'2024-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (8, 1, 1, 1, 6, CAST(N'2024-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (9, 1, 1, 1, 7, CAST(N'2024-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (10, 1, 1, 1, 3, CAST(N'2024-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (11, 2, 1, 1, 5, CAST(N'2024-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (1007, 1, 1, 1, 1, CAST(N'2024-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (1008, 1, 1, 1, 3, CAST(N'2024-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (1009, 1, 1, 1, 4, CAST(N'2024-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (1010, 2, 1, 1, 2, CAST(N'2024-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (2007, 1, 1, 1, 1, CAST(N'2024-07-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (3007, 1, 1, 1, 8, CAST(N'2024-07-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (3008, 1, 1, 1, 4, CAST(N'2024-07-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (4007, 2, 1, 1, 12, CAST(N'2024-07-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (4008, 1, 1, 1, 7, CAST(N'2024-07-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (4009, 1, 1, 2, 3, CAST(N'2024-07-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (4010, 1, 2, 4, 4, CAST(N'2024-07-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (4020, 1, 2, 4, 1, CAST(N'2024-07-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (4021, 1, 2, 4, 2, CAST(N'2024-07-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (4022, 1, 2, 4, 3, CAST(N'2024-07-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (4023, 1, 2, 4, 4, CAST(N'2024-07-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Schedules] ([schedulesId], [movieId], [theaterId], [roomId], [timeSlotId], [scheduleDate]) VALUES (4024, 1, 2, 4, 5, CAST(N'2024-07-23T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Schedules] OFF
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 

INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (1, 1, 1, N'A1        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (2, 1, 1, N'A2        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (3, 1, 1, N'A3        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (4, 1, 1, N'A4        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (5, 1, 1, N'A5        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (6, 1, 1, N'A6        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (7, 1, 1, N'A7        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (8, 1, 1, N'A8        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (9, 1, 1, N'A9        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (10, 1, 1, N'A10       ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (11, 1, 1, N'A11       ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (12, 1, 1, N'A12       ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (13, 1, 1, N'B1        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (14, 1, 1, N'B2        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (15, 1, 1, N'B3        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (16, 1, 1, N'B4        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (17, 1, 1, N'B5        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (18, 1, 1, N'B6        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (19, 1, 1, N'B7        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (20, 1, 1, N'B8        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (21, 1, 1, N'B9        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (22, 1, 1, N'B10       ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (23, 1, 1, N'B11       ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (24, 1, 1, N'B12       ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (25, 1, 1, N'C1        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (26, 1, 1, N'C2        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (27, 1, 1, N'C3        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (28, 1, 1, N'C4        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (29, 1, 1, N'C5        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (30, 1, 1, N'C6        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (31, 1, 1, N'C7        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (32, 1, 1, N'C8        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (33, 1, 1, N'C9        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (34, 1, 1, N'C10       ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (35, 1, 1, N'C11       ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (36, 1, 1, N'C12       ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (37, 1, 1, N'D1        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (38, 1, 1, N'D2        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (39, 1, 1, N'D3        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (40, 1, 1, N'D4        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (41, 1, 1, N'D5        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (42, 1, 1, N'D6        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (43, 1, 1, N'D7        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (44, 1, 1, N'D8        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (45, 1, 1, N'D9        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (46, 1, 1, N'D10       ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (47, 1, 1, N'D11       ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (48, 1, 1, N'D12       ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (49, 1, 1, N'E1        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (50, 1, 1, N'E2        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (51, 1, 1, N'E3        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (52, 1, 1, N'E4        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (53, 1, 1, N'E5        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (54, 1, 1, N'E6        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (55, 1, 1, N'E7        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (56, 1, 1, N'E8        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (57, 1, 1, N'E9        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (58, 1, 1, N'E10       ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (59, 1, 1, N'E11       ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (60, 1, 1, N'E12       ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (61, 1, 1, N'F1        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (62, 1, 1, N'F2        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (63, 1, 1, N'F3        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (64, 1, 1, N'F4        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (65, 1, 1, N'F5        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (66, 1, 1, N'F6        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (67, 1, 1, N'F7        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (68, 1, 1, N'F8        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (69, 1, 1, N'F9        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (70, 1, 1, N'F10       ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (71, 1, 1, N'F11       ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (72, 1, 1, N'F12       ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (73, 1, 1, N'G1        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (74, 1, 1, N'G2        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (75, 1, 1, N'G3        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (76, 1, 1, N'G4        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (77, 1, 1, N'G5        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (78, 1, 1, N'G6        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (79, 1, 1, N'G7        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (80, 1, 1, N'G8        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (81, 1, 1, N'G9        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (82, 1, 1, N'G10       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (83, 1, 1, N'G11       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (84, 1, 1, N'G12       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (85, 1, 1, N'H1        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (86, 1, 1, N'H2        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (87, 1, 1, N'H3        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (88, 1, 1, N'H4        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (89, 1, 1, N'H5        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (90, 1, 1, N'H6        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (91, 1, 1, N'H7        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (92, 1, 1, N'H8        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (93, 1, 1, N'H9        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (94, 1, 1, N'H10       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (95, 1, 1, N'H11       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (96, 1, 1, N'H12       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (97, 1, 1, N'I1        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (98, 1, 1, N'I2        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (99, 1, 1, N'I3        ', N'I         ', 1, 3)
GO
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (100, 1, 1, N'I4        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (101, 1, 1, N'I5        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (102, 1, 1, N'I6        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (103, 1, 1, N'I7        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (104, 1, 1, N'I8        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (105, 1, 1, N'I9        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (106, 1, 1, N'I10       ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (107, 1, 1, N'I11       ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (108, 1, 1, N'I12       ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (109, 3, 2, N'A1        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (110, 3, 2, N'A2        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (111, 3, 2, N'A3        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (112, 3, 2, N'A4        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (113, 3, 2, N'A5        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (114, 3, 2, N'A6        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (115, 3, 2, N'A7        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (116, 3, 2, N'A8        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (117, 3, 2, N'A9        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (118, 3, 2, N'A10       ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (119, 3, 2, N'A11       ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (120, 3, 2, N'A12       ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (121, 3, 2, N'B1        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (122, 3, 2, N'B2        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (123, 3, 2, N'B3        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (124, 3, 2, N'B4        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (125, 3, 2, N'B5        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (126, 3, 2, N'B6        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (127, 3, 2, N'B7        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (128, 3, 2, N'B8        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (129, 3, 2, N'B9        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (130, 3, 2, N'B10       ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (131, 3, 2, N'B11       ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (132, 3, 2, N'B12       ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (133, 3, 2, N'C1        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (134, 3, 2, N'C2        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (135, 3, 2, N'C3        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (136, 3, 2, N'C4        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (137, 3, 2, N'C5        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (138, 3, 2, N'C6        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (139, 3, 2, N'C7        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (140, 3, 2, N'C8        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (141, 3, 2, N'C9        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (142, 3, 2, N'C10       ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (143, 3, 2, N'C11       ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (144, 3, 2, N'C12       ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (145, 3, 2, N'D1        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (146, 3, 2, N'D2        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (147, 3, 2, N'D3        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (148, 3, 2, N'D4        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (149, 3, 2, N'D5        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (150, 3, 2, N'D6        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (151, 3, 2, N'D7        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (152, 3, 2, N'D8        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (153, 3, 2, N'D9        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (154, 3, 2, N'D10       ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (155, 3, 2, N'D11       ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (156, 3, 2, N'D12       ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (157, 3, 2, N'E1        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (158, 3, 2, N'E2        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (159, 3, 2, N'E3        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (160, 3, 2, N'E4        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (161, 3, 2, N'E5        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (162, 3, 2, N'E6        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (163, 3, 2, N'E7        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (164, 3, 2, N'E8        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (165, 3, 2, N'E9        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (166, 3, 2, N'E10       ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (167, 3, 2, N'E11       ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (168, 3, 2, N'E12       ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (169, 3, 2, N'F1        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (170, 3, 2, N'F2        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (171, 3, 2, N'F3        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (172, 3, 2, N'F4        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (173, 3, 2, N'F5        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (174, 3, 2, N'F6        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (175, 3, 2, N'F7        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (176, 3, 2, N'F8        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (177, 3, 2, N'F9        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (178, 3, 2, N'F10       ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (179, 3, 2, N'F11       ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (180, 3, 2, N'F12       ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (181, 3, 2, N'G1        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (182, 3, 2, N'G2        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (183, 3, 2, N'G3        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (184, 3, 2, N'G4        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (185, 3, 2, N'G5        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (186, 3, 2, N'G6        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (187, 3, 2, N'G7        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (188, 3, 2, N'G8        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (189, 3, 2, N'G9        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (190, 3, 2, N'G10       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (191, 3, 2, N'G11       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (192, 3, 2, N'G12       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (193, 3, 2, N'H1        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (194, 3, 2, N'H2        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (195, 3, 2, N'H3        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (196, 3, 2, N'H4        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (197, 3, 2, N'H5        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (198, 3, 2, N'H6        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (199, 3, 2, N'H7        ', N'H         ', 1, 2)
GO
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (200, 3, 2, N'H8        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (201, 3, 2, N'H9        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (202, 3, 2, N'H10       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (203, 3, 2, N'H11       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (204, 3, 2, N'H12       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (205, 3, 2, N'I1        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (206, 3, 2, N'I2        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (207, 3, 2, N'I3        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (208, 3, 2, N'I4        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (209, 3, 2, N'I5        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (210, 3, 2, N'I6        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (211, 3, 2, N'I7        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (212, 3, 2, N'I8        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (213, 3, 2, N'I9        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (214, 3, 2, N'I10       ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (215, 3, 2, N'I11       ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (216, 3, 2, N'I12       ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (217, 2, 1, N'G1        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (218, 2, 1, N'G2        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (219, 2, 1, N'G3        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (220, 2, 1, N'G4        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (221, 2, 1, N'G5        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (222, 2, 1, N'G6        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (223, 2, 1, N'G7        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (224, 2, 1, N'G8        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (225, 2, 1, N'G9        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (226, 2, 1, N'G10       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (227, 2, 1, N'G11       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (228, 2, 1, N'G12       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (229, 2, 1, N'H1        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (230, 2, 1, N'H2        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (231, 2, 1, N'H3        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (232, 2, 1, N'H4        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (233, 2, 1, N'H5        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (234, 2, 1, N'H6        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (235, 2, 1, N'H7        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (236, 2, 1, N'H8        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (237, 2, 1, N'H9        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (238, 2, 1, N'H10       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (239, 2, 1, N'H11       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (240, 2, 1, N'H12       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (241, 2, 1, N'I1        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (242, 2, 1, N'I2        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (243, 2, 1, N'I3        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (244, 2, 1, N'I4        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (245, 2, 1, N'I5        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (246, 2, 1, N'I6        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (247, 2, 1, N'I7        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (248, 2, 1, N'I8        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (249, 2, 1, N'I9        ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (250, 2, 1, N'I10       ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (251, 2, 1, N'I11       ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (252, 2, 1, N'I12       ', N'I         ', 1, 3)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (253, 4, 2, N'A1        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (254, 4, 2, N'A2        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (255, 4, 2, N'A3        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (256, 4, 2, N'A4        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (257, 4, 2, N'A5        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (258, 4, 2, N'A6        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (259, 4, 2, N'A7        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (260, 4, 2, N'A8        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (261, 4, 2, N'A9        ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (262, 4, 2, N'A10       ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (263, 4, 2, N'A11       ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (264, 4, 2, N'A12       ', N'A         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (265, 4, 2, N'B1        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (266, 4, 2, N'B2        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (267, 4, 2, N'B3        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (268, 4, 2, N'B4        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (269, 4, 2, N'B5        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (270, 4, 2, N'B6        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (271, 4, 2, N'B7        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (272, 4, 2, N'B8        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (273, 4, 2, N'B9        ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (274, 4, 2, N'B10       ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (275, 4, 2, N'B11       ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (276, 4, 2, N'B12       ', N'B         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (277, 4, 2, N'C1        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (278, 4, 2, N'C2        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (279, 4, 2, N'C3        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (280, 4, 2, N'C4        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (281, 4, 2, N'C5        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (282, 4, 2, N'C6        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (283, 4, 2, N'C7        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (284, 4, 2, N'C8        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (285, 4, 2, N'C9        ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (286, 4, 2, N'C10       ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (287, 4, 2, N'C11       ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (288, 4, 2, N'C12       ', N'C         ', 1, 1)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (289, 5, 2, N'D1        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (290, 5, 2, N'D2        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (291, 5, 2, N'D3        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (292, 5, 2, N'D4        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (293, 5, 2, N'D5        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (294, 5, 2, N'D6        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (295, 5, 2, N'D7        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (296, 5, 2, N'D8        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (297, 5, 2, N'D9        ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (298, 5, 2, N'D10       ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (299, 5, 2, N'D11       ', N'D         ', 1, 2)
GO
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (300, 5, 2, N'D12       ', N'D         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (301, 5, 2, N'E1        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (302, 5, 2, N'E2        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (303, 5, 2, N'E3        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (304, 5, 2, N'E4        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (305, 5, 2, N'E5        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (306, 5, 2, N'E6        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (307, 5, 2, N'E7        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (308, 5, 2, N'E8        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (309, 5, 2, N'E9        ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (310, 5, 2, N'E10       ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (311, 5, 2, N'E11       ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (312, 5, 2, N'E12       ', N'E         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (313, 5, 2, N'F1        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (314, 5, 2, N'F2        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (315, 5, 2, N'F3        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (316, 5, 2, N'F4        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (317, 5, 2, N'F5        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (318, 5, 2, N'F6        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (319, 5, 2, N'F7        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (320, 5, 2, N'F8        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (321, 5, 2, N'F9        ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (322, 5, 2, N'F10       ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (323, 5, 2, N'F11       ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (324, 5, 2, N'F12       ', N'F         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (325, 5, 2, N'G1        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (326, 5, 2, N'G2        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (327, 5, 2, N'G3        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (328, 5, 2, N'G4        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (329, 5, 2, N'G5        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (330, 5, 1, N'G6        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (331, 5, 1, N'G7        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (332, 5, 2, N'G8        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (333, 5, 2, N'G9        ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (334, 5, 2, N'G10       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (335, 5, 2, N'G11       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (336, 5, 2, N'G12       ', N'G         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (337, 5, 2, N'H1        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (338, 5, 1, N'H2        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (339, 5, 2, N'H3        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (340, 5, 2, N'H4        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (341, 5, 2, N'H5        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (342, 5, 2, N'H6        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (343, 5, 2, N'H7        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (344, 5, 2, N'H8        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (345, 5, 2, N'H9        ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (346, 5, 2, N'H10       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (347, 5, 2, N'H11       ', N'H         ', 1, 2)
INSERT [dbo].[Seats] ([seatId], [roomId], [theatersId], [seatNumber], [row], [Status], [seatTypeId]) VALUES (348, 5, 2, N'H12       ', N'H         ', 1, 2)
SET IDENTITY_INSERT [dbo].[Seats] OFF
GO
SET IDENTITY_INSERT [dbo].[SeatType] ON 

INSERT [dbo].[SeatType] ([seatTypeId], [typeName], [price]) VALUES (1, N'regular', 5)
INSERT [dbo].[SeatType] ([seatTypeId], [typeName], [price]) VALUES (2, N'vip', 10)
INSERT [dbo].[SeatType] ([seatTypeId], [typeName], [price]) VALUES (3, N'sweetbox', 15)
SET IDENTITY_INSERT [dbo].[SeatType] OFF
GO
SET IDENTITY_INSERT [dbo].[Theaters] ON 

INSERT [dbo].[Theaters] ([theaterId], [theaterName], [address], [phoneNumber]) VALUES (1, N'CGV Center', N'Hai Bà Trưng - Hà Nội', N'0999999999')
INSERT [dbo].[Theaters] ([theaterId], [theaterName], [address], [phoneNumber]) VALUES (2, N'CGV Center 2', N'Cầu Giấy - Hà Nội', N'0254646565')
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
INSERT [dbo].[Users] ([userId], [userName], [email], [password], [phoneNumber], [address], [gender], [dob], [roleId], [avatar], [Status]) VALUES (2, N'hoan2', N'hoan2@gmail.com', N'123', NULL, NULL, NULL, NULL, 2, NULL, 1)
INSERT [dbo].[Users] ([userId], [userName], [email], [password], [phoneNumber], [address], [gender], [dob], [roleId], [avatar], [Status]) VALUES (3, N'danghoan', N'abc@gmail.com', N'123', N'123456789', NULL, NULL, NULL, 3, NULL, 1)
INSERT [dbo].[Users] ([userId], [userName], [email], [password], [phoneNumber], [address], [gender], [dob], [roleId], [avatar], [Status]) VALUES (6, N'Test2', N'Test2@gmail.com', N'123', N'565656', N'Hà Nội', 1, CAST(N'2024-06-13T00:00:00.000' AS DateTime), 3, NULL, 0)
INSERT [dbo].[Users] ([userId], [userName], [email], [password], [phoneNumber], [address], [gender], [dob], [roleId], [avatar], [Status]) VALUES (1014, N'Nguyễn Đăng Hoàn K16_HL', N'hoanndhe161494@fpt.edu.vn', NULL, N'No Data', N'No Data', 1, NULL, 3, NULL, 1)
INSERT [dbo].[Users] ([userId], [userName], [email], [password], [phoneNumber], [address], [gender], [dob], [roleId], [avatar], [Status]) VALUES (2008, N'danghoan', N'danghoan2382002@gmail.com', N'123', N'565656', N'Hà Nội', 1, CAST(N'2024-06-20T00:00:00.000' AS DateTime), 3, NULL, 1)
INSERT [dbo].[Users] ([userId], [userName], [email], [password], [phoneNumber], [address], [gender], [dob], [roleId], [avatar], [Status]) VALUES (2010, N'hoan dang', N'hoannguyen232002@gmail.com', NULL, NULL, NULL, NULL, NULL, 3, NULL, 1)
INSERT [dbo].[Users] ([userId], [userName], [email], [password], [phoneNumber], [address], [gender], [dob], [roleId], [avatar], [Status]) VALUES (3009, N'Test3', N'Test3@gmail.com', N'123', NULL, NULL, 1, NULL, 3, NULL, 1)
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
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedules_Rooms] FOREIGN KEY([roomId])
REFERENCES [dbo].[Rooms] ([roomId])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedules_Rooms]
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
