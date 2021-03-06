/****** Object:  Database [AbortionRights]    Script Date: 7/6/2022 1:41:33 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'AbortionRights')
BEGIN
CREATE DATABASE [AbortionRights]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AbortionRights', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AbortionRights.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AbortionRights_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AbortionRights_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
END
GO
ALTER DATABASE [AbortionRights] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AbortionRights].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AbortionRights] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AbortionRights] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AbortionRights] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AbortionRights] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AbortionRights] SET ARITHABORT OFF 
GO
ALTER DATABASE [AbortionRights] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AbortionRights] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AbortionRights] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AbortionRights] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AbortionRights] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AbortionRights] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AbortionRights] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AbortionRights] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AbortionRights] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AbortionRights] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AbortionRights] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AbortionRights] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AbortionRights] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AbortionRights] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AbortionRights] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AbortionRights] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AbortionRights] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AbortionRights] SET RECOVERY FULL 
GO
ALTER DATABASE [AbortionRights] SET  MULTI_USER 
GO
ALTER DATABASE [AbortionRights] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AbortionRights] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AbortionRights] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AbortionRights] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AbortionRights] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AbortionRights] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AbortionRights', N'ON'
GO
ALTER DATABASE [AbortionRights] SET QUERY_STORE = OFF
GO
/****** Object:  User [test]    Script Date: 7/6/2022 1:41:33 PM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'test')
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/6/2022 1:41:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](300) NULL,
	[Email] [varchar](300) NULL,
	[Phone] [varchar](300) NULL,
	[Skills] [varchar](max) NULL,
	[Other] [varchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER DATABASE [AbortionRights] SET  READ_WRITE 
GO
