USE [master]
GO
/****** Object:  Database [AirlinesReservationSystem]    Script Date: 4/4/2024 10:04:58 PM ******/
CREATE DATABASE [AirlinesReservationSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AirlinesReservationSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER8\MSSQL\DATA\AirlinesReservationSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AirlinesReservationSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER8\MSSQL\DATA\AirlinesReservationSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AirlinesReservationSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AirlinesReservationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AirlinesReservationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AirlinesReservationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AirlinesReservationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AirlinesReservationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AirlinesReservationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AirlinesReservationSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AirlinesReservationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [AirlinesReservationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AirlinesReservationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AirlinesReservationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AirlinesReservationSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AirlinesReservationSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AirlinesReservationSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AirlinesReservationSystem] SET QUERY_STORE = OFF
GO
USE [AirlinesReservationSystem]
GO
/****** Object:  Table [dbo].[AirPort]    Script Date: 4/4/2024 10:04:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirPort](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_AirPort] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightSchedules]    Script Date: 4/4/2024 10:04:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightSchedules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[plane_id] [int] NOT NULL,
	[from_airport] [int] NOT NULL,
	[to_airport] [int] NOT NULL,
	[departures_at] [datetime] NOT NULL,
	[arrivals_at] [datetime] NOT NULL,
	[cost] [int] NOT NULL,
	[code] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_FlightSchedules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plane]    Script Date: 4/4/2024 10:04:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plane](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Plane] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketManager]    Script Date: 4/4/2024 10:04:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketManager](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[flight_schedules_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[code] [nchar](255) NOT NULL,
 CONSTRAINT [PK_TicketManager] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/4/2024 10:04:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NOT NULL,
	[cccd] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[phone_number] [nvarchar](255) NULL,
	[password] [nvarchar](255) NOT NULL,
	[user_type] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AirPort] ON 

INSERT [dbo].[AirPort] ([id], [name], [code], [address]) VALUES (1, N'CẢNG HÀNG KHÔNG QUỐC TẾ NỘI BÀI', N'NOI_BAI', N'Cảng hàng không quốc tế Nội Bài ​xã Phú Minh - huyện Sóc Sơn - Thành phố Hà Nội')
INSERT [dbo].[AirPort] ([id], [name], [code], [address]) VALUES (2, N'CẢNG HÀNG KHÔNG QUỐC TẾ TÂN SƠN NHẤT', N'TAN_SON_NHAT', N'Tòa Nhà Cảng Hàng Không Quốc Tế Tân Sơn Nhất - Phường 2, Q. Tân Bình, Tp.Hồ Chí Minh')
INSERT [dbo].[AirPort] ([id], [name], [code], [address]) VALUES (3, N'CẢNG HÀNG KHÔNG QUỐC TẾ ĐÀ NẴNG', N'DA_NANG', N'Phường Hòa Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng')
INSERT [dbo].[AirPort] ([id], [name], [code], [address]) VALUES (4, N'CẢNG HÀNG KHÔNG QUỐC TẾ PHÚ QUỐC', N'PHU_QUOC', N'Tổ 2, Ấp Dương Tơ, Xã Dương Tơ, H. Phú Quốc, T. Kiên Giang')
SET IDENTITY_INSERT [dbo].[AirPort] OFF
GO
SET IDENTITY_INSERT [dbo].[FlightSchedules] ON 

INSERT [dbo].[FlightSchedules] ([id], [plane_id], [from_airport], [to_airport], [departures_at], [arrivals_at], [cost], [code]) VALUES (2, 1, 1, 4, CAST(N'2022-05-08T00:14:00.000' AS DateTime), CAST(N'2022-05-08T02:14:00.000' AS DateTime), 200000, N'HN_PQ_200')
INSERT [dbo].[FlightSchedules] ([id], [plane_id], [from_airport], [to_airport], [departures_at], [arrivals_at], [cost], [code]) VALUES (3, 1, 4, 1, CAST(N'2022-05-10T11:28:00.000' AS DateTime), CAST(N'2022-05-17T23:28:00.000' AS DateTime), 20000000, N'PQ_HN_200')
INSERT [dbo].[FlightSchedules] ([id], [plane_id], [from_airport], [to_airport], [departures_at], [arrivals_at], [cost], [code]) VALUES (4, 2, 1, 4, CAST(N'2022-05-08T01:39:00.000' AS DateTime), CAST(N'2022-05-08T13:40:00.000' AS DateTime), 200000, N'HN_PQ_797')
INSERT [dbo].[FlightSchedules] ([id], [plane_id], [from_airport], [to_airport], [departures_at], [arrivals_at], [cost], [code]) VALUES (5, 2, 1, 2, CAST(N'2024-04-03T21:24:00.000' AS DateTime), CAST(N'2024-04-04T21:24:00.000' AS DateTime), 8000000, N'901659')
SET IDENTITY_INSERT [dbo].[FlightSchedules] OFF
GO
SET IDENTITY_INSERT [dbo].[Plane] ON 

INSERT [dbo].[Plane] ([id], [name], [code]) VALUES (1, N'Airbus A321-200', N'AIR-200')
INSERT [dbo].[Plane] ([id], [name], [code]) VALUES (2, N'Boeing 787-9 Dreamliner', N'BOE-787')
INSERT [dbo].[Plane] ([id], [name], [code]) VALUES (3, N'SAAB 340 Saab 2000', N'SAAB')
SET IDENTITY_INSERT [dbo].[Plane] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketManager] ON 

INSERT [dbo].[TicketManager] ([id], [flight_schedules_id], [user_id], [status], [code]) VALUES (1, 2, 14, 1, N'HN_PQ_200_12371231234                                                                                                                                                                                                                                          ')
INSERT [dbo].[TicketManager] ([id], [flight_schedules_id], [user_id], [status], [code]) VALUES (2, 5, 14, 0, N'HN_PQ_200_17121543140                                                                                                                                                                                                                                          ')
INSERT [dbo].[TicketManager] ([id], [flight_schedules_id], [user_id], [status], [code]) VALUES (3, 5, 1, 0, N'HN_PQ_200_17121590750                                                                                                                                                                                                                                          ')
INSERT [dbo].[TicketManager] ([id], [flight_schedules_id], [user_id], [status], [code]) VALUES (4, 5, 1, 0, N'HN_PQ_200_17122420290                                                                                                                                                                                                                                          ')
SET IDENTITY_INSERT [dbo].[TicketManager] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [email], [cccd], [address], [phone_number], [password], [user_type]) VALUES (1, N'PHAM VAN HAI', N'mitto.hai@gmail.com', N'123456789', N'HUNG YEN', N'1234565768', N'123456', 1)
INSERT [dbo].[User] ([id], [name], [email], [cccd], [address], [phone_number], [password], [user_type]) VALUES (2, N'PHAM HAi', N'mitto.hai.735@gmail.com', N'123456789', N'ưe', N'+844999999999', N'123456', 1)
INSERT [dbo].[User] ([id], [name], [email], [cccd], [address], [phone_number], [password], [user_type]) VALUES (12, N'PHAM HAi', N'mitto.hai.7385@gmail.com', N'1234567', N'ưe', N'+844999999999', N'123456', 1)
INSERT [dbo].[User] ([id], [name], [email], [cccd], [address], [phone_number], [password], [user_type]) VALUES (13, N'222', N'hai@gmail.com', N'22', N'22', N'22', N'123456', 1)
INSERT [dbo].[User] ([id], [name], [email], [cccd], [address], [phone_number], [password], [user_type]) VALUES (14, NULL, N'lehainam@gmail.com', NULL, NULL, NULL, N'123456', 1)
INSERT [dbo].[User] ([id], [name], [email], [cccd], [address], [phone_number], [password], [user_type]) VALUES (15, NULL, N'lehainam1@gmail.com', NULL, NULL, NULL, N'123456', 1)
INSERT [dbo].[User] ([id], [name], [email], [cccd], [address], [phone_number], [password], [user_type]) VALUES (16, NULL, N'admin_test01@gmail.com', NULL, NULL, NULL, N'123456', 1)
INSERT [dbo].[User] ([id], [name], [email], [cccd], [address], [phone_number], [password], [user_type]) VALUES (17, NULL, N'lehainam6@gmail.com', NULL, NULL, NULL, N'123456', 1)
INSERT [dbo].[User] ([id], [name], [email], [cccd], [address], [phone_number], [password], [user_type]) VALUES (18, NULL, N'lehainam5@gmail.com', NULL, NULL, NULL, N'123456', 1)
INSERT [dbo].[User] ([id], [name], [email], [cccd], [address], [phone_number], [password], [user_type]) VALUES (19, NULL, N'lehainam9@gmail.com', NULL, NULL, NULL, N'123456', 1)
INSERT [dbo].[User] ([id], [name], [email], [cccd], [address], [phone_number], [password], [user_type]) VALUES (20, NULL, N'lehainam91@gmail.com', NULL, NULL, NULL, N'123456', 1)
INSERT [dbo].[User] ([id], [name], [email], [cccd], [address], [phone_number], [password], [user_type]) VALUES (21, NULL, N'lehainam92@gmail.com', NULL, NULL, NULL, N'123456', 1)
INSERT [dbo].[User] ([id], [name], [email], [cccd], [address], [phone_number], [password], [user_type]) VALUES (22, NULL, N'huyen@gmail.com', NULL, NULL, NULL, N'123456', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[TicketManager]  WITH CHECK ADD  CONSTRAINT [FK_TicketManager_FlightSchedules] FOREIGN KEY([flight_schedules_id])
REFERENCES [dbo].[FlightSchedules] ([id])
GO
ALTER TABLE [dbo].[TicketManager] CHECK CONSTRAINT [FK_TicketManager_FlightSchedules]
GO
ALTER TABLE [dbo].[TicketManager]  WITH CHECK ADD  CONSTRAINT [FK_TicketManager_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[TicketManager] CHECK CONSTRAINT [FK_TicketManager_User]
GO
USE [master]
GO
ALTER DATABASE [AirlinesReservationSystem] SET  READ_WRITE 
GO
