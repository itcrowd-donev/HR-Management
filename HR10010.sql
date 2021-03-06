USE [master]
GO
/****** Object:  Database [HR10010]    Script Date: 8/24/2018 2:53:40 PM ******/
CREATE DATABASE [HR10010]
GO
ALTER DATABASE [HR10010] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HR10010].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HR10010] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HR10010] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HR10010] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HR10010] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HR10010] SET ARITHABORT OFF 
GO
ALTER DATABASE [HR10010] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HR10010] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HR10010] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HR10010] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HR10010] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HR10010] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HR10010] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HR10010] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HR10010] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HR10010] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HR10010] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HR10010] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HR10010] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HR10010] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HR10010] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HR10010] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HR10010] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HR10010] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HR10010] SET  MULTI_USER 
GO
ALTER DATABASE [HR10010] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HR10010] SET DB_CHAINING OFF 
GO
USE [HR10010]
GO
/****** Object:  Table [dbo].[CompanyInfo]    Script Date: 8/24/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Office] [nvarchar](100) NULL,
	[Position] [nvarchar](100) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[EmpId] [int] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_CompanyInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpCertificateInfo]    Script Date: 8/24/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpCertificateInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Title] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[EduId] [int] NOT NULL,
 CONSTRAINT [PK_EmpCertificateInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpEducationInfo]    Script Date: 8/24/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpEducationInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NULL,
	[Institution] [nvarchar](200) NULL,
	[EmpId] [int] NOT NULL,
 CONSTRAINT [PK_EmpEducationInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 8/24/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[IsActive] [smallint] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpPersonalInfo]    Script Date: 8/24/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpPersonalInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Age] [int] NULL,
	[Phone] [nvarchar](50) NULL,
	[Phone2] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[EmpId] [int] NOT NULL,
 CONSTRAINT [PK_EmpPersonalInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpSocialInfo]    Script Date: 8/24/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpSocialInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[LinkedIn] [nvarchar](100) NULL,
	[Facebook] [nvarchar](100) NULL,
	[Twitter] [nvarchar](100) NULL,
	[Other] [nvarchar](100) NULL,
 CONSTRAINT [PK_EmpSocialInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 8/24/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VacationId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_TimeSheet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VacationEvents]    Script Date: 8/24/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VacationEvents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[EmpId] [int] NOT NULL,
 CONSTRAINT [PK_VacationEvents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[EmployeeFullDetailsView]    Script Date: 8/24/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EmployeeFullDetailsView]
AS
SELECT        dbo.Employees.Id, dbo.Employees.FirstName, dbo.Employees.LastName, dbo.Employees.Email, dbo.Employees.IsActive, dbo.EmpPersonalInfo.Age, dbo.EmpPersonalInfo.Phone, dbo.EmpPersonalInfo.Phone2, 
                         dbo.EmpPersonalInfo.Address, dbo.EmpPersonalInfo.City, dbo.EmpPersonalInfo.Country, dbo.EmpSocialInfo.LinkedIn, dbo.EmpSocialInfo.Facebook, dbo.EmpSocialInfo.Twitter, dbo.EmpSocialInfo.Other
FROM            dbo.Employees INNER JOIN
                         dbo.EmpPersonalInfo ON dbo.Employees.Id = dbo.EmpPersonalInfo.EmpId INNER JOIN
                         dbo.EmpSocialInfo ON dbo.Employees.Id = dbo.EmpSocialInfo.EmpId
GO
SET IDENTITY_INSERT [dbo].[EmpCertificateInfo] ON 
GO
INSERT [dbo].[EmpCertificateInfo] ([Id], [Type], [Title], [Name], [EduId]) VALUES (2, N'Microsoft', N'Microsoft Certified Professional', N'Microsoft Certified Professional', 9)
GO
INSERT [dbo].[EmpCertificateInfo] ([Id], [Type], [Title], [Name], [EduId]) VALUES (4, N'Microsoft', N'Microsoft Certified Professional', N'Microsoft Certified Professional', 11)
GO
INSERT [dbo].[EmpCertificateInfo] ([Id], [Type], [Title], [Name], [EduId]) VALUES (7, N'Microsoft', N'Microsoft Certified Professional', N'Microsoft Certified Professional', 13)
GO
INSERT [dbo].[EmpCertificateInfo] ([Id], [Type], [Title], [Name], [EduId]) VALUES (8, N'Microsoft', N'Microsoft Certified Professional', N'Microsoft Certified Professional', 15)
GO
INSERT [dbo].[EmpCertificateInfo] ([Id], [Type], [Title], [Name], [EduId]) VALUES (9, N'Microsoft', N'Microsoft Specialist', N'Programming in HTML5 with JavaScript and CSS3', 9)
GO
INSERT [dbo].[EmpCertificateInfo] ([Id], [Type], [Title], [Name], [EduId]) VALUES (11, N'Microsoft', N'Microsoft Specialist', N'Programming in C#', 11)
GO
INSERT [dbo].[EmpCertificateInfo] ([Id], [Type], [Title], [Name], [EduId]) VALUES (12, N'Microsoft', N'MCSD', N'Web Applications', 15)
GO
INSERT [dbo].[EmpCertificateInfo] ([Id], [Type], [Title], [Name], [EduId]) VALUES (14, N'Microsoft', N'MCSD', N'App Builder', 15)
GO
INSERT [dbo].[EmpCertificateInfo] ([Id], [Type], [Title], [Name], [EduId]) VALUES (15, N'Microsoft', N'MCSA', N'Web Applications', 15)
GO
SET IDENTITY_INSERT [dbo].[EmpCertificateInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[EmpEducationInfo] ON 
GO
INSERT [dbo].[EmpEducationInfo] ([Id], [Type], [Institution], [EmpId]) VALUES (9, N'Programming in HTML5 with JavaScript and CSS3', N'Semos Education Center', 0)
GO
INSERT [dbo].[EmpEducationInfo] ([Id], [Type], [Institution], [EmpId]) VALUES (11, N'Programming in C#', N'Semos Education Center', 0)
GO
INSERT [dbo].[EmpEducationInfo] ([Id], [Type], [Institution], [EmpId]) VALUES (13, N'Developing ASP.NET MVC Web Applications', N'Semos Education Center', 0)
GO
INSERT [dbo].[EmpEducationInfo] ([Id], [Type], [Institution], [EmpId]) VALUES (15, N'Developing Microsoft Azure and Web Services', N'Semos Education Center', 0)
GO
SET IDENTITY_INSERT [dbo].[EmpEducationInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [Email], [IsActive]) VALUES (0, N'Marjan', N'Donev', N'marjan.donev@itcrowd.me', 1)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[EmpPersonalInfo] ON 
GO
INSERT [dbo].[EmpPersonalInfo] ([Id], [Age], [Phone], [Phone2], [Address], [City], [Country], [EmpId]) VALUES (1, 32, N'38977610369', NULL, N'Ljubljanska 6', N'Skopje', N'Macedonia', 0)
GO
SET IDENTITY_INSERT [dbo].[EmpPersonalInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[EmpSocialInfo] ON 
GO
INSERT [dbo].[EmpSocialInfo] ([Id], [EmpId], [LinkedIn], [Facebook], [Twitter], [Other]) VALUES (1, 0, N'https://www.linkedin.com/in/marjan-donev-aa004510b/', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[EmpSocialInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeSheet] ON 
GO
INSERT [dbo].[TimeSheet] ([Id], [VacationId], [StartDate], [EndDate]) VALUES (1, 1, CAST(N'2018-09-01T00:00:00.000' AS DateTime), CAST(N'2018-09-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[TimeSheet] ([Id], [VacationId], [StartDate], [EndDate]) VALUES (3, 1, CAST(N'2018-08-13T00:00:00.000' AS DateTime), CAST(N'2018-08-13T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TimeSheet] OFF
GO
SET IDENTITY_INSERT [dbo].[VacationEvents] ON 
GO
INSERT [dbo].[VacationEvents] ([Id], [Name], [Description], [EmpId]) VALUES (1, N'Odmor', N'Odmor', 0)
GO
SET IDENTITY_INSERT [dbo].[VacationEvents] OFF
GO
ALTER TABLE [dbo].[CompanyInfo]  WITH CHECK ADD  CONSTRAINT [FK_CompanyInfo_Employees] FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[CompanyInfo] CHECK CONSTRAINT [FK_CompanyInfo_Employees]
GO
ALTER TABLE [dbo].[EmpCertificateInfo]  WITH CHECK ADD  CONSTRAINT [FK_EmpCertificateInfo_EmpEducationInfo] FOREIGN KEY([EduId])
REFERENCES [dbo].[EmpEducationInfo] ([Id])
GO
ALTER TABLE [dbo].[EmpCertificateInfo] CHECK CONSTRAINT [FK_EmpCertificateInfo_EmpEducationInfo]
GO
ALTER TABLE [dbo].[EmpEducationInfo]  WITH CHECK ADD  CONSTRAINT [FK_EmpEducationInfo_Employees] FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[EmpEducationInfo] CHECK CONSTRAINT [FK_EmpEducationInfo_Employees]
GO
ALTER TABLE [dbo].[EmpPersonalInfo]  WITH CHECK ADD  CONSTRAINT [FK_EmpPersonalInfo_Employees] FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[EmpPersonalInfo] CHECK CONSTRAINT [FK_EmpPersonalInfo_Employees]
GO
ALTER TABLE [dbo].[EmpSocialInfo]  WITH CHECK ADD  CONSTRAINT [FK_EmpSocialInfo_Employees] FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[EmpSocialInfo] CHECK CONSTRAINT [FK_EmpSocialInfo_Employees]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_VacationEvents] FOREIGN KEY([VacationId])
REFERENCES [dbo].[VacationEvents] ([Id])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_VacationEvents]
GO
ALTER TABLE [dbo].[VacationEvents]  WITH CHECK ADD  CONSTRAINT [FK_VacationEvents_Employees] FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[VacationEvents] CHECK CONSTRAINT [FK_VacationEvents_Employees]
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
         Begin Table = "Employees"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "EmpPersonalInfo"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "EmpSocialInfo"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 136
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EmployeeFullDetailsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EmployeeFullDetailsView'
GO
USE [master]
GO
ALTER DATABASE [HR10010] SET  READ_WRITE 
GO
