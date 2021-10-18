USE [master]
GO
/****** Object:  Database [D:\WKR\WKR\WKR\WKR.MDF]    Script Date: 18.10.2021 15:57:00 ******/
CREATE DATABASE [D:\WKR\WKR\WKR\WKR.MDF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WKR', FILENAME = N'D:\WKR\WKR\WKR\WKR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WKR_log', FILENAME = N'D:\WKR\WKR\WKR\WKR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [D:\WKR\WKR\WKR\WKR.MDF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET ARITHABORT OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET  ENABLE_BROKER 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET  MULTI_USER 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET QUERY_STORE = OFF
GO
USE [D:\WKR\WKR\WKR\WKR.MDF]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [D:\WKR\WKR\WKR\WKR.MDF]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 18.10.2021 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Manager_Surname] [nvarchar](50) NOT NULL,
	[Manager_Name] [nvarchar](50) NOT NULL,
	[Manager_Patronymic] [nvarchar](50) NULL,
	[Manager_Position] [nvarchar](50) NOT NULL,
	[Manager_surname_in_the_dative_case] [nvarchar](50) NOT NULL,
	[Manager_name_in_the_dative_case] [nvarchar](50) NOT NULL,
	[Manager_patronymic_in_the_dative_case] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 18.10.2021 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Group] [int] NOT NULL,
	[Birthday] [date] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Practice_company] [int] NULL,
	[Surname_in_the_accusative_case] [nvarchar](50) NOT NULL,
	[First_name_in_the_accusative_case] [nvarchar](50) NOT NULL,
	[Patronymic_in_the_accusative_case] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 18.10.2021 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Group_name] [nvarchar](50) NOT NULL,
	[Specialization] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Students_Company_Group]    Script Date: 18.10.2021 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Students_Company_Group]
AS
SELECT        dbo.Students.id, dbo.Students.Surname, dbo.Students.Name, dbo.Students.Patronymic, dbo.[Group].Group_name, dbo.Students.Birthday, dbo.Students.Email, dbo.Company.Name AS Company_name, 
                         dbo.Students.Surname_in_the_accusative_case, dbo.Students.First_name_in_the_accusative_case, dbo.Students.Patronymic_in_the_accusative_case, dbo.[Group].Specialization
FROM            dbo.Students INNER JOIN
                         dbo.[Group] ON dbo.Students.[Group] = dbo.[Group].id LEFT OUTER JOIN
                         dbo.Company ON dbo.Students.Practice_company = dbo.Company.id
GO
/****** Object:  Table [dbo].[Practice_dates]    Script Date: 18.10.2021 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice_dates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Professional_module] [nvarchar](100) NULL,
	[Name_of_the_practice] [nvarchar](100) NULL,
	[Pre_graduate_practice] [nvarchar](50) NOT NULL,
	[Group_name] [int] NOT NULL,
	[Pactice_start_date] [nvarchar](50) NOT NULL,
	[Pactice_termination_date] [nvarchar](50) NULL,
	[Date_of_continuation_of_the_practice] [nvarchar](50) NULL,
	[Pactice_termination_date_2] [nvarchar](50) NULL,
	[Date_of_continuation_of_the_practice_2] [nvarchar](50) NULL,
	[Practice_end_date] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Practice_dates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Practice_dates_Group]    Script Date: 18.10.2021 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Practice_dates_Group]
AS
SELECT        dbo.Practice_dates.id, dbo.Practice_dates.Professional_module, dbo.Practice_dates.Name_of_the_practice, dbo.Practice_dates.Pre_graduate_practice, dbo.[Group].Group_name, dbo.Practice_dates.Pactice_start_date, 
                         dbo.Practice_dates.Pactice_termination_date, dbo.Practice_dates.Date_of_continuation_of_the_practice, dbo.Practice_dates.Pactice_termination_date_2, dbo.Practice_dates.Date_of_continuation_of_the_practice_2, 
                         dbo.Practice_dates.Practice_end_date
FROM            dbo.Practice_dates INNER JOIN
                         dbo.[Group] ON dbo.Practice_dates.Group_name = dbo.[Group].id
GO
/****** Object:  View [dbo].[Students_Group]    Script Date: 18.10.2021 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Students_Group]
AS
SELECT        dbo.Students.id, dbo.Students.Surname, dbo.Students.Name, dbo.Students.Patronymic, dbo.[Group].Group_name, dbo.Students.Birthday, dbo.Students.Email, dbo.Students.Practice_company, 
                         dbo.Students.Surname_in_the_accusative_case, dbo.Students.First_name_in_the_accusative_case, dbo.Students.Patronymic_in_the_accusative_case
FROM            dbo.Students INNER JOIN
                         dbo.[Group] ON dbo.Students.[Group] = dbo.[Group].id
GO
/****** Object:  Table [dbo].[Documents_Flow]    Script Date: 18.10.2021 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents_Flow](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_Student] [int] NOT NULL,
	[id_Company] [int] NOT NULL,
	[Document_Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Documents_Flow] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_passwords]    Script Date: 18.10.2021 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_passwords](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role_passwords] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 18.10.2021 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Document_storage_location] [nvarchar](100) NULL,
	[Document_template_storage_location] [nvarchar](100) NULL,
	[Document2_template_storage_location] [nvarchar](100) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18.10.2021 15:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Settings] [int] NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Documents_Flow]  WITH CHECK ADD  CONSTRAINT [FK_Documents_Flow_Company] FOREIGN KEY([id_Company])
REFERENCES [dbo].[Company] ([id])
GO
ALTER TABLE [dbo].[Documents_Flow] CHECK CONSTRAINT [FK_Documents_Flow_Company]
GO
ALTER TABLE [dbo].[Documents_Flow]  WITH CHECK ADD  CONSTRAINT [FK_Documents_Flow_Students] FOREIGN KEY([id_Student])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[Documents_Flow] CHECK CONSTRAINT [FK_Documents_Flow_Students]
GO
ALTER TABLE [dbo].[Practice_dates]  WITH CHECK ADD  CONSTRAINT [FK_Practice_dates_Group] FOREIGN KEY([Group_name])
REFERENCES [dbo].[Group] ([id])
GO
ALTER TABLE [dbo].[Practice_dates] CHECK CONSTRAINT [FK_Practice_dates_Group]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Company] FOREIGN KEY([Practice_company])
REFERENCES [dbo].[Company] ([id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Company]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Group] FOREIGN KEY([Group])
REFERENCES [dbo].[Group] ([id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Group]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Settings] FOREIGN KEY([Settings])
REFERENCES [dbo].[Settings] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Settings]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Practice_dates"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 285
               Right = 336
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Group"
            Begin Extent = 
               Top = 6
               Left = 374
               Bottom = 159
               Right = 544
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Practice_dates_Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Practice_dates_Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Students"
            Begin Extent = 
               Top = 52
               Left = 336
               Bottom = 327
               Right = 611
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Group"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Company"
            Begin Extent = 
               Top = 58
               Left = 750
               Bottom = 318
               Right = 1054
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Students_Company_Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Students_Company_Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[18] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -52
      End
      Begin Tables = 
         Begin Table = "Students"
            Begin Extent = 
               Top = 41
               Left = 553
               Bottom = 381
               Right = 828
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Group"
            Begin Extent = 
               Top = 6
               Left = 90
               Bottom = 102
               Right = 260
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Students_Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Students_Group'
GO
USE [master]
GO
ALTER DATABASE [D:\WKR\WKR\WKR\WKR.MDF] SET  READ_WRITE 
GO
