USE [master]
GO
/****** Object:  Database [Itog]    Script Date: 21.04.2023 20:33:36 ******/
CREATE DATABASE [Itog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Itog', FILENAME = N'D:\Development Related\Stupid SQL Express 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Itog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Itog_log', FILENAME = N'D:\Development Related\Stupid SQL Express 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Itog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Itog] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Itog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Itog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Itog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Itog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Itog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Itog] SET ARITHABORT OFF 
GO
ALTER DATABASE [Itog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Itog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Itog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Itog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Itog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Itog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Itog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Itog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Itog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Itog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Itog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Itog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Itog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Itog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Itog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Itog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Itog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Itog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Itog] SET  MULTI_USER 
GO
ALTER DATABASE [Itog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Itog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Itog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Itog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Itog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Itog] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Itog] SET QUERY_STORE = OFF
GO
USE [Itog]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 21.04.2023 20:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameOfAgent] [varchar](50) NOT NULL,
	[TypeOfAgent] [varchar](50) NULL,
	[INN] [int] NOT NULL,
	[Rating] [int] NULL,
	[StartWorkDate] [varchar](50) NULL,
 CONSTRAINT [PK_Agents_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 21.04.2023 20:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[NameOfMaterial] [varchar](50) NOT NULL,
	[Type] [varchar](50) NULL,
	[Picture] [image] NULL,
	[Price] [varchar](50) NULL,
	[Amount] [varchar](50) NULL,
	[MinAmount] [int] NULL,
	[AmountInBox] [int] NULL,
	[Measurement] [char](5) NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[NameOfMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PossibleSupplier]    Script Date: 21.04.2023 20:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PossibleSupplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameOfAgent] [varchar](50) NOT NULL,
	[NameOfMaterial] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PossibleSupplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storage]    Script Date: 21.04.2023 20:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage](
	[NameOfMaterial] [varchar](50) NOT NULL,
	[Type] [varchar](50) NULL,
	[Amount] [varchar](50) NULL,
	[Measurement] [char](5) NULL,
	[ID] [int] NULL,
 CONSTRAINT [PK_Storage] PRIMARY KEY CLUSTERED 
(
	[NameOfMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21.04.2023 20:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[FIO] [varchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Employee] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Agents]  WITH CHECK ADD  CONSTRAINT [FK_Agents_PossibleSupplier] FOREIGN KEY([ID])
REFERENCES [dbo].[PossibleSupplier] ([ID])
GO
ALTER TABLE [dbo].[Agents] CHECK CONSTRAINT [FK_Agents_PossibleSupplier]
GO
ALTER TABLE [dbo].[PossibleSupplier]  WITH CHECK ADD  CONSTRAINT [FK_PossibleSupplier_Materials] FOREIGN KEY([NameOfMaterial])
REFERENCES [dbo].[Materials] ([NameOfMaterial])
GO
ALTER TABLE [dbo].[PossibleSupplier] CHECK CONSTRAINT [FK_PossibleSupplier_Materials]
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD  CONSTRAINT [FK_Storage_Materials] FOREIGN KEY([NameOfMaterial])
REFERENCES [dbo].[Materials] ([NameOfMaterial])
GO
ALTER TABLE [dbo].[Storage] CHECK CONSTRAINT [FK_Storage_Materials]
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD  CONSTRAINT [FK_Storage_User] FOREIGN KEY([ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Storage] CHECK CONSTRAINT [FK_Storage_User]
GO
USE [master]
GO
ALTER DATABASE [Itog] SET  READ_WRITE 
GO
