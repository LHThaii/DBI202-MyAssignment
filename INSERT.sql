USE [master]
GO
/****** Object:  Database [DBI_202_ASM]    Script Date: 7/18/2022 12:27:48 PM ******/
CREATE DATABASE [DBI_202_ASM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBI_202_ASM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.THAI\MSSQL\DATA\DBI_202_ASM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBI_202_ASM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.THAI\MSSQL\DATA\DBI_202_ASM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBI_202_ASM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBI_202_ASM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBI_202_ASM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBI_202_ASM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBI_202_ASM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBI_202_ASM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBI_202_ASM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET RECOVERY FULL 
GO
ALTER DATABASE [DBI_202_ASM] SET  MULTI_USER 
GO
ALTER DATABASE [DBI_202_ASM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBI_202_ASM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBI_202_ASM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBI_202_ASM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBI_202_ASM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBI_202_ASM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBI_202_ASM', N'ON'
GO
ALTER DATABASE [DBI_202_ASM] SET QUERY_STORE = OFF
GO
USE [DBI_202_ASM]
GO
/****** Object:  Table [dbo].[Assessment]    Script Date: 7/18/2022 12:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment](
	[AssessmentID] [int] NOT NULL,
	[AssessmentName] [varchar](150) NULL,
	[WEIGHT] [float] NULL,
	[CourseID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/18/2022 12:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] NOT NULL,
	[CourseName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/18/2022 12:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupID] [varchar](10) NOT NULL,
	[GroupName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_course]    Script Date: 7/18/2022 12:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_course](
	[CourseID] [int] NULL,
	[GroupID] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_lecturer]    Script Date: 7/18/2022 12:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_lecturer](
	[LectureID] [int] NULL,
	[GroupID] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_student]    Script Date: 7/18/2022 12:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_student](
	[StudentID] [varchar](10) NOT NULL,
	[GroupID] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 7/18/2022 12:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[LecturerID] [int] NOT NULL,
	[LecturerName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LecturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer_Course]    Script Date: 7/18/2022 12:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer_Course](
	[LectureID] [int] NULL,
	[CourseID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESULT]    Script Date: 7/18/2022 12:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESULT](
	[RESULTID] [int] NOT NULL,
	[StudentID] [varchar](10) NOT NULL,
	[AssessmentID] [int] NULL,
	[CourseID] [int] NULL,
	[Score] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[RESULTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/18/2022 12:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [varchar](10) NOT NULL,
	[StudentName] [nvarchar](30) NOT NULL,
	[gender] [bit] NULL,
	[DoB] [date] NOT NULL,
	[Address] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (1, N'Participation', 0.1, 4)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (2, N'PT1', 0.15, 4)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (3, N'PT2', 0.15, 4)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (4, N'PE', 0.3, 4)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (5, N'FE', 0.3, 4)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (6, N'WS1', 0.1, 1)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (7, N'WS2', 0.1, 1)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (8, N'ASM', 0.2, 1)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (9, N'PE', 0.3, 1)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (10, N'FE', 0.3, 1)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (11, N'LAB1', 0.1, 2)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (12, N'LAB2', 0.1, 2)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (13, N'ASM', 0.2, 2)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (14, N'PE', 0.3, 2)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (15, N'FE', 0.3, 2)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (16, N'PT1', 0.1, 3)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (17, N'PT2', 0.1, 3)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (18, N'ASM1', 0.1, 3)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (19, N'ASM2', 0.1, 3)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (20, N'PE', 0.3, 3)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (21, N'FE', 0.3, 3)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (22, N'ASM1', 0.1, 5)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (23, N'ASM2', 0.1, 5)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (24, N'ASM3', 0.1, 5)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (25, N'PT1', 0.1, 5)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (26, N'PT2', 0.1, 5)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (27, N'PT3', 0.1, 5)
INSERT [dbo].[Assessment] ([AssessmentID], [AssessmentName], [WEIGHT], [CourseID]) VALUES (28, N'FE', 0.4, 5)
GO
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (1, N'LAB211')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (2, N'DBI202')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (3, N'CSD201')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (4, N'JPD113')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (5, N'MAE101')
GO
INSERT [dbo].[Group] ([GroupID], [GroupName]) VALUES (N'1', N'SE161')
INSERT [dbo].[Group] ([GroupID], [GroupName]) VALUES (N'2', N'SE162')
INSERT [dbo].[Group] ([GroupID], [GroupName]) VALUES (N'3', N'SE163')
INSERT [dbo].[Group] ([GroupID], [GroupName]) VALUES (N'4', N'SE164')
GO
INSERT [dbo].[Group_course] ([CourseID], [GroupID]) VALUES (1, N'1')
INSERT [dbo].[Group_course] ([CourseID], [GroupID]) VALUES (2, N'2')
INSERT [dbo].[Group_course] ([CourseID], [GroupID]) VALUES (3, N'3')
INSERT [dbo].[Group_course] ([CourseID], [GroupID]) VALUES (4, N'4')
INSERT [dbo].[Group_course] ([CourseID], [GroupID]) VALUES (5, N'1')
GO
INSERT [dbo].[Group_lecturer] ([LectureID], [GroupID]) VALUES (1, N'1')
INSERT [dbo].[Group_lecturer] ([LectureID], [GroupID]) VALUES (2, N'2')
INSERT [dbo].[Group_lecturer] ([LectureID], [GroupID]) VALUES (3, N'3')
INSERT [dbo].[Group_lecturer] ([LectureID], [GroupID]) VALUES (4, N'4')
GO
INSERT [dbo].[Group_student] ([StudentID], [GroupID]) VALUES (N'HE161', N'4')
INSERT [dbo].[Group_student] ([StudentID], [GroupID]) VALUES (N'HE162', N'2')
INSERT [dbo].[Group_student] ([StudentID], [GroupID]) VALUES (N'HE163', N'3')
INSERT [dbo].[Group_student] ([StudentID], [GroupID]) VALUES (N'HE164', N'3')
INSERT [dbo].[Group_student] ([StudentID], [GroupID]) VALUES (N'HE160', N'1')
INSERT [dbo].[Group_student] ([StudentID], [GroupID]) VALUES (N'HE160', N'3')
GO
INSERT [dbo].[Lecturer] ([LecturerID], [LecturerName]) VALUES (1, N'SonNT')
INSERT [dbo].[Lecturer] ([LecturerID], [LecturerName]) VALUES (2, N'HaiLT')
INSERT [dbo].[Lecturer] ([LecturerID], [LecturerName]) VALUES (3, N'TuanVM')
INSERT [dbo].[Lecturer] ([LecturerID], [LecturerName]) VALUES (4, N'BanTQ')
GO
INSERT [dbo].[Lecturer_Course] ([LectureID], [CourseID]) VALUES (1, 1)
INSERT [dbo].[Lecturer_Course] ([LectureID], [CourseID]) VALUES (2, 2)
INSERT [dbo].[Lecturer_Course] ([LectureID], [CourseID]) VALUES (3, 3)
INSERT [dbo].[Lecturer_Course] ([LectureID], [CourseID]) VALUES (4, 4)
INSERT [dbo].[Lecturer_Course] ([LectureID], [CourseID]) VALUES (2, 4)
INSERT [dbo].[Lecturer_Course] ([LectureID], [CourseID]) VALUES (4, 1)
INSERT [dbo].[Lecturer_Course] ([LectureID], [CourseID]) VALUES (1, 5)
GO
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (1, N'HE160', 6, 1, 8)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (2, N'HE160', 7, 1, 7)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (3, N'HE160', 8, 1, 6)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (4, N'HE160', 9, 1, 7)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (5, N'HE160', 10, 1, 8)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (6, N'HE161', 1, 4, 7)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (7, N'HE161', 2, 4, 8)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (8, N'HE161', 3, 4, 9)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (9, N'HE161', 4, 4, 5)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (10, N'HE161', 5, 4, 7)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (11, N'HE162', 11, 2, 5)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (12, N'HE162', 12, 2, 7)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (13, N'HE162', 13, 2, 4)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (14, N'HE162', 14, 2, 8)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (15, N'HE162', 15, 2, 6)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (16, N'HE163', 16, 3, 7)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (17, N'HE163', 17, 3, 8)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (18, N'HE163', 18, 3, 9)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (19, N'HE163', 19, 3, 6)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (20, N'HE163', 20, 3, 4)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (21, N'HE163', 21, 3, 6)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (22, N'HE164', 11, 2, 7)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (23, N'HE164', 12, 2, 6)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (24, N'HE164', 13, 2, 7)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (25, N'HE164', 14, 2, 6)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (26, N'HE164', 15, 2, 8)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (27, N'HE160', 16, 3, 4)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (28, N'HE160', 17, 3, 7)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (29, N'HE160', 18, 3, 8)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (30, N'HE160', 19, 3, 5)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (31, N'HE160', 20, 3, 7)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (32, N'HE160', 21, 3, 5)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (33, N'HE160', 22, 5, 6)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (34, N'HE160', 23, 5, 7)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (35, N'HE160', 24, 5, 4)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (36, N'HE160', 25, 5, 8)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (37, N'HE160', 26, 5, 7)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (38, N'HE160', 27, 5, 4)
INSERT [dbo].[RESULT] ([RESULTID], [StudentID], [AssessmentID], [CourseID], [Score]) VALUES (39, N'HE160', 28, 5, 6)
GO
INSERT [dbo].[Student] ([StudentID], [StudentName], [gender], [DoB], [Address]) VALUES (N'HE160', N'Le Hoang Thai', 1, CAST(N'2002-12-08' AS Date), N'Hoa Binh')
INSERT [dbo].[Student] ([StudentID], [StudentName], [gender], [DoB], [Address]) VALUES (N'HE161', N'Nguyen Duc Huy', 1, CAST(N'2002-12-15' AS Date), N'Lang Son')
INSERT [dbo].[Student] ([StudentID], [StudentName], [gender], [DoB], [Address]) VALUES (N'HE162', N'Nguyen Huy Minh', 1, CAST(N'2002-08-04' AS Date), N'Ha Noi')
INSERT [dbo].[Student] ([StudentID], [StudentName], [gender], [DoB], [Address]) VALUES (N'HE163', N'Nguyen Hoang Hieu', 1, CAST(N'2002-06-05' AS Date), N'Bac Giang')
INSERT [dbo].[Student] ([StudentID], [StudentName], [gender], [DoB], [Address]) VALUES (N'HE164', N'Chu Lan Anh', 0, CAST(N'2002-01-08' AS Date), N'Cao Bang')
INSERT [dbo].[Student] ([StudentID], [StudentName], [gender], [DoB], [Address]) VALUES (N'HE165', N'Bui Thi Dung', 0, CAST(N'2002-03-01' AS Date), N'Ha Giang')
INSERT [dbo].[Student] ([StudentID], [StudentName], [gender], [DoB], [Address]) VALUES (N'HE166', N'Bui Thi Lan', 0, CAST(N'2002-01-01' AS Date), N'Ha Noi')
INSERT [dbo].[Student] ([StudentID], [StudentName], [gender], [DoB], [Address]) VALUES (N'HE167', N'Bui Thi Ngoc ', 0, CAST(N'2002-02-20' AS Date), N'Son La')
INSERT [dbo].[Student] ([StudentID], [StudentName], [gender], [DoB], [Address]) VALUES (N'HE168', N'Bui Bich Lan ', 0, CAST(N'2002-01-05' AS Date), N'Ha Giang')
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Group_course]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Group_course]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[Group_lecturer]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[Group_lecturer]  WITH CHECK ADD FOREIGN KEY([LectureID])
REFERENCES [dbo].[Lecturer] ([LecturerID])
GO
ALTER TABLE [dbo].[Group_student]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[Group_student]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Lecturer_Course]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Lecturer_Course]  WITH CHECK ADD FOREIGN KEY([LectureID])
REFERENCES [dbo].[Lecturer] ([LecturerID])
GO
ALTER TABLE [dbo].[RESULT]  WITH CHECK ADD FOREIGN KEY([AssessmentID])
REFERENCES [dbo].[Assessment] ([AssessmentID])
GO
ALTER TABLE [dbo].[RESULT]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[RESULT]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
/****** Object:  StoredProcedure [dbo].[info_student]    Script Date: 7/18/2022 12:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[info_student] AS

SELECT s.StudentID,s.StudentName,g.GroupName,l.LecturerName,c.CourseName 
FROM Student s INNER JOIN [Group_student] gs ON s.StudentID = gs.StudentID
			     INNER JOIN [Group] g ON gs.GroupID = g.GroupID 
			     INNER JOIN [Group_lecturer] gl ON g.GroupID = gl.GroupID
			     INNER JOIN [Lecturer] l ON gl.LectureID = l.LecturerID
			     INNER JOIN [Lecturer_Course] ls ON l.LecturerID = ls.LectureID
			     INNER JOIN [Course] c ON ls.CourseID = c.CourseID
ORDER BY s.StudentName

EXEC info_student
GO
/****** Object:  StoredProcedure [dbo].[INFO_STUDENTS]    Script Date: 7/18/2022 12:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INFO_STUDENTS] AS

SELECT s.StudentID,s.StudentName,g.GroupName,l.LecturerName,c.CourseName 
FROM Student s INNER JOIN [Group_student] gs ON s.StudentID = gs.StudentID
			     INNER JOIN [Group] g ON gs.GroupID = g.GroupID 
			     INNER JOIN [Group_lecturer] gl ON g.GroupID = gl.GroupID
			     INNER JOIN [Lecturer] l ON gl.LectureID = l.LecturerID
			     INNER JOIN [Lecturer_Course] ls ON l.LecturerID = ls.LectureID
			     INNER JOIN [Course] c ON ls.CourseID = c.CourseID
ORDER BY s.StudentName
GO
USE [master]
GO
ALTER DATABASE [DBI_202_ASM] SET  READ_WRITE 
GO
