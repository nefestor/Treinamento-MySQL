USE [master]
GO
/****** Object:  Database [Banquinho]    Script Date: 16/03/2018 09:07:50 ******/
CREATE DATABASE [Banquinho]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Banquinho', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Banquinho.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Banquinho_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Banquinho_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Banquinho] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Banquinho].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Banquinho] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Banquinho] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Banquinho] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Banquinho] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Banquinho] SET ARITHABORT OFF 
GO
ALTER DATABASE [Banquinho] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Banquinho] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Banquinho] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Banquinho] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Banquinho] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Banquinho] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Banquinho] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Banquinho] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Banquinho] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Banquinho] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Banquinho] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Banquinho] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Banquinho] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Banquinho] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Banquinho] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Banquinho] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Banquinho] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Banquinho] SET RECOVERY FULL 
GO
ALTER DATABASE [Banquinho] SET  MULTI_USER 
GO
ALTER DATABASE [Banquinho] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Banquinho] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Banquinho] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Banquinho] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Banquinho] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Banquinho', N'ON'
GO
ALTER DATABASE [Banquinho] SET QUERY_STORE = OFF
GO
USE [Banquinho]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Banquinho]
GO
/****** Object:  Schema [Classes]    Script Date: 16/03/2018 09:07:50 ******/
CREATE SCHEMA [Classes]
GO
/****** Object:  Schema [Contents]    Script Date: 16/03/2018 09:07:50 ******/
CREATE SCHEMA [Contents]
GO
/****** Object:  Schema [Courses]    Script Date: 16/03/2018 09:07:50 ******/
CREATE SCHEMA [Courses]
GO
/****** Object:  Schema [Persons]    Script Date: 16/03/2018 09:07:50 ******/
CREATE SCHEMA [Persons]
GO
/****** Object:  Table [Courses].[Courses]    Script Date: 16/03/2018 09:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Courses].[Courses](
	[id_course] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Courses].[Tutors]    Script Date: 16/03/2018 09:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Courses].[Tutors](
	[id_course_tutor] [int] IDENTITY(1,1) NOT NULL,
	[id_course] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_course_tutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GlobalVisualization]    Script Date: 16/03/2018 09:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GlobalVisualization] AS
SELECT c.id_course, c.name, t.id_user
FROM Courses.Courses c, Courses.Tutors t
GO
/****** Object:  Table [Classes].[Courses_Class_Tutors]    Script Date: 16/03/2018 09:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Classes].[Courses_Class_Tutors](
	[id_courses_classes_tutors] [int] IDENTITY(1,1) NOT NULL,
	[id_course_class] [int] NOT NULL,
	[id_course_tutor] [int] NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_courses_classes_tutors] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Classes].[Courses_Classes]    Script Date: 16/03/2018 09:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Classes].[Courses_Classes](
	[id_course_class] [int] IDENTITY(1,1) NOT NULL,
	[id_course] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_course_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Classes].[Courses_Classes_Contents]    Script Date: 16/03/2018 09:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Classes].[Courses_Classes_Contents](
	[id_courses_classes_contents] [int] IDENTITY(1,1) NOT NULL,
	[id_course_class] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_courses_classes_contents] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Classes].[Courses_Classes_Schedule]    Script Date: 16/03/2018 09:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Classes].[Courses_Classes_Schedule](
	[id_schedule] [int] IDENTITY(1,1) NOT NULL,
	[id_course_class] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[date_finished] [datetime] NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_schedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Classes].[Courses_Classes_Students]    Script Date: 16/03/2018 09:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Classes].[Courses_Classes_Students](
	[id_course_class_student] [int] IDENTITY(1,1) NOT NULL,
	[id_course_class] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[removed] [int] NOT NULL,
	[student_score] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_course_class_student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Contents].[Assessements_Students]    Script Date: 16/03/2018 09:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contents].[Assessements_Students](
	[id_assessement_student] [int] IDENTITY(1,1) NOT NULL,
	[id_course_class_student] [int] NOT NULL,
	[id_assessement] [int] NOT NULL,
	[note] [decimal](5, 1) NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_assessement_student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Contents].[Courses_Classes_Activities]    Script Date: 16/03/2018 09:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contents].[Courses_Classes_Activities](
	[id_activity] [int] IDENTITY(1,1) NOT NULL,
	[id_course_classe] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[scheduled_date] [datetime] NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_activity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Contents].[Courses_Classes_Activities_Students]    Script Date: 16/03/2018 09:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contents].[Courses_Classes_Activities_Students](
	[id_activity_classes_students] [int] IDENTITY(1,1) NOT NULL,
	[id_activity] [int] NOT NULL,
	[id_course_class_student] [int] NOT NULL,
	[delivery_date] [datetime] NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_activity_classes_students] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Contents].[Courses_Classes_Assessements]    Script Date: 16/03/2018 09:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contents].[Courses_Classes_Assessements](
	[id_assessement] [int] IDENTITY(1,1) NOT NULL,
	[id_course_class] [int] NOT NULL,
	[scheduled_date] [datetime] NOT NULL,
	[realization_date] [datetime] NULL,
	[description] [nvarchar](max) NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_assessement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Persons].[Users]    Script Date: 16/03/2018 09:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Persons].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[removed] [int] NOT NULL,
	[id_user_type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Persons].[Users_Logins]    Script Date: 16/03/2018 09:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Persons].[Users_Logins](
	[id_user_login] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[id_user] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Persons].[Users_Types]    Script Date: 16/03/2018 09:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Persons].[Users_Types](
	[id_user_type] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Classes].[Courses_Classes_Students] ADD  DEFAULT ((0)) FOR [student_score]
GO
ALTER TABLE [Classes].[Courses_Class_Tutors]  WITH CHECK ADD  CONSTRAINT [fk_id_course_class_tutors] FOREIGN KEY([id_course_class])
REFERENCES [Classes].[Courses_Classes] ([id_course_class])
GO
ALTER TABLE [Classes].[Courses_Class_Tutors] CHECK CONSTRAINT [fk_id_course_class_tutors]
GO
ALTER TABLE [Classes].[Courses_Class_Tutors]  WITH CHECK ADD  CONSTRAINT [fk_id_course_tutor] FOREIGN KEY([id_course_tutor])
REFERENCES [Courses].[Tutors] ([id_course_tutor])
GO
ALTER TABLE [Classes].[Courses_Class_Tutors] CHECK CONSTRAINT [fk_id_course_tutor]
GO
ALTER TABLE [Classes].[Courses_Classes]  WITH CHECK ADD  CONSTRAINT [fk_id_course] FOREIGN KEY([id_course])
REFERENCES [Courses].[Courses] ([id_course])
GO
ALTER TABLE [Classes].[Courses_Classes] CHECK CONSTRAINT [fk_id_course]
GO
ALTER TABLE [Classes].[Courses_Classes_Contents]  WITH CHECK ADD  CONSTRAINT [fk_id_course_class_contents] FOREIGN KEY([id_course_class])
REFERENCES [Classes].[Courses_Classes] ([id_course_class])
GO
ALTER TABLE [Classes].[Courses_Classes_Contents] CHECK CONSTRAINT [fk_id_course_class_contents]
GO
ALTER TABLE [Classes].[Courses_Classes_Schedule]  WITH CHECK ADD  CONSTRAINT [fk_id_course_class_schedule] FOREIGN KEY([id_course_class])
REFERENCES [Classes].[Courses_Classes] ([id_course_class])
GO
ALTER TABLE [Classes].[Courses_Classes_Schedule] CHECK CONSTRAINT [fk_id_course_class_schedule]
GO
ALTER TABLE [Classes].[Courses_Classes_Students]  WITH CHECK ADD  CONSTRAINT [fk_id_course_class] FOREIGN KEY([id_course_class])
REFERENCES [Classes].[Courses_Classes] ([id_course_class])
GO
ALTER TABLE [Classes].[Courses_Classes_Students] CHECK CONSTRAINT [fk_id_course_class]
GO
ALTER TABLE [Classes].[Courses_Classes_Students]  WITH CHECK ADD  CONSTRAINT [fk_id_user] FOREIGN KEY([id_user])
REFERENCES [Persons].[Users] ([id_user])
GO
ALTER TABLE [Classes].[Courses_Classes_Students] CHECK CONSTRAINT [fk_id_user]
GO
ALTER TABLE [Contents].[Assessements_Students]  WITH CHECK ADD  CONSTRAINT [fk_id_assessements] FOREIGN KEY([id_assessement])
REFERENCES [Contents].[Courses_Classes_Assessements] ([id_assessement])
GO
ALTER TABLE [Contents].[Assessements_Students] CHECK CONSTRAINT [fk_id_assessements]
GO
ALTER TABLE [Contents].[Assessements_Students]  WITH CHECK ADD  CONSTRAINT [fk_id_course_class_student_assessemenets] FOREIGN KEY([id_course_class_student])
REFERENCES [Classes].[Courses_Classes_Students] ([id_course_class_student])
GO
ALTER TABLE [Contents].[Assessements_Students] CHECK CONSTRAINT [fk_id_course_class_student_assessemenets]
GO
ALTER TABLE [Contents].[Courses_Classes_Activities]  WITH CHECK ADD  CONSTRAINT [fk_id_course_classe_activities] FOREIGN KEY([id_course_classe])
REFERENCES [Classes].[Courses_Classes] ([id_course_class])
GO
ALTER TABLE [Contents].[Courses_Classes_Activities] CHECK CONSTRAINT [fk_id_course_classe_activities]
GO
ALTER TABLE [Contents].[Courses_Classes_Activities_Students]  WITH CHECK ADD  CONSTRAINT [fk_id_activity] FOREIGN KEY([id_activity])
REFERENCES [Contents].[Courses_Classes_Activities] ([id_activity])
GO
ALTER TABLE [Contents].[Courses_Classes_Activities_Students] CHECK CONSTRAINT [fk_id_activity]
GO
ALTER TABLE [Contents].[Courses_Classes_Activities_Students]  WITH CHECK ADD  CONSTRAINT [fk_id_course_class_student] FOREIGN KEY([id_course_class_student])
REFERENCES [Classes].[Courses_Classes_Students] ([id_course_class_student])
GO
ALTER TABLE [Contents].[Courses_Classes_Activities_Students] CHECK CONSTRAINT [fk_id_course_class_student]
GO
ALTER TABLE [Contents].[Courses_Classes_Assessements]  WITH CHECK ADD  CONSTRAINT [fk_id_course_classe_assessements] FOREIGN KEY([id_course_class])
REFERENCES [Classes].[Courses_Classes] ([id_course_class])
GO
ALTER TABLE [Contents].[Courses_Classes_Assessements] CHECK CONSTRAINT [fk_id_course_classe_assessements]
GO
ALTER TABLE [Courses].[Tutors]  WITH CHECK ADD  CONSTRAINT [fk_id_course] FOREIGN KEY([id_course])
REFERENCES [Courses].[Courses] ([id_course])
GO
ALTER TABLE [Courses].[Tutors] CHECK CONSTRAINT [fk_id_course]
GO
ALTER TABLE [Courses].[Tutors]  WITH CHECK ADD  CONSTRAINT [fk_id_user] FOREIGN KEY([id_user])
REFERENCES [Persons].[Users] ([id_user])
GO
ALTER TABLE [Courses].[Tutors] CHECK CONSTRAINT [fk_id_user]
GO
ALTER TABLE [Persons].[Users]  WITH CHECK ADD  CONSTRAINT [fk_id_user_type] FOREIGN KEY([id_user_type])
REFERENCES [Persons].[Users_Types] ([id_user_type])
GO
ALTER TABLE [Persons].[Users] CHECK CONSTRAINT [fk_id_user_type]
GO
ALTER TABLE [Persons].[Users_Logins]  WITH CHECK ADD  CONSTRAINT [fk_id_user] FOREIGN KEY([id_user])
REFERENCES [Persons].[Users] ([id_user])
GO
ALTER TABLE [Persons].[Users_Logins] CHECK CONSTRAINT [fk_id_user]
GO
USE [master]
GO
ALTER DATABASE [Banquinho] SET  READ_WRITE 
GO
