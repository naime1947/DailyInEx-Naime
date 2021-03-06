USE [master]
GO
/****** Object:  Database [DailyInExDB]    Script Date: 5/19/2019 7:29:48 PM ******/
CREATE DATABASE [DailyInExDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DailyInExDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DailyInExDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DailyInExDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DailyInExDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DailyInExDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DailyInExDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DailyInExDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DailyInExDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DailyInExDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DailyInExDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DailyInExDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DailyInExDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DailyInExDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DailyInExDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DailyInExDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DailyInExDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DailyInExDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DailyInExDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DailyInExDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DailyInExDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DailyInExDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DailyInExDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DailyInExDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DailyInExDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DailyInExDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DailyInExDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DailyInExDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DailyInExDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DailyInExDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DailyInExDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DailyInExDB] SET  MULTI_USER 
GO
ALTER DATABASE [DailyInExDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DailyInExDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DailyInExDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DailyInExDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DailyInExDB]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 5/19/2019 7:29:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 5/19/2019 7:29:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[CompanyEmail] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 5/19/2019 7:29:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [char](2) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Expense]    Script Date: 5/19/2019 7:29:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Expense](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [float] NOT NULL,
	[Cash] [bit] NULL,
	[Cheque] [bit] NULL,
	[ChequeNo] [varchar](50) NULL,
	[BankId] [int] NULL,
	[Particular] [varchar](50) NULL,
	[Date] [date] NOT NULL,
	[IsApproved] [bit] NULL,
 CONSTRAINT [PK_Expense] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Income]    Script Date: 5/19/2019 7:29:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Income](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [float] NOT NULL,
	[Cash] [bit] NULL,
	[Cheque] [bit] NULL,
	[ChequeNo] [varchar](50) NULL,
	[BankId] [int] NULL,
	[Particular] [varchar](50) NULL,
	[Date] [date] NOT NULL,
	[IsApproved] [bit] NULL,
 CONSTRAINT [PK_Income] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[approvedIncome]    Script Date: 5/19/2019 7:29:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[approvedIncome]
AS
SELECT        Id, Amount, Cash, Cheque, ChequeNo, BankId, Particular, Date
FROM            dbo.Income
WHERE        (IsApproved = 1)

GO
/****** Object:  View [dbo].[IncomeMonthlyViewWithBankName]    Script Date: 5/19/2019 7:29:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[IncomeMonthlyViewWithBankName]
AS
SELECT        dbo.approvedIncome.Id, dbo.approvedIncome.Amount, dbo.approvedIncome.Cash, dbo.approvedIncome.Cheque, dbo.approvedIncome.ChequeNo, dbo.approvedIncome.BankId, dbo.Bank.Name AS BankName, 
                         dbo.approvedIncome.Particular, dbo.approvedIncome.Date
FROM            dbo.approvedIncome LEFT OUTER JOIN
                         dbo.Bank ON dbo.approvedIncome.BankId = dbo.Bank.Id

GO
/****** Object:  View [dbo].[approvedExpense]    Script Date: 5/19/2019 7:29:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[approvedExpense]
AS
SELECT        Id, Amount, Cash, Cheque, ChequeNo, BankId, Particular, Date
FROM            dbo.expense
WHERE        (IsApproved = 1)
GO
/****** Object:  View [dbo].[ExpenseMonthlyViewWithBankName]    Script Date: 5/19/2019 7:29:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ExpenseMonthlyViewWithBankName]
AS
SELECT        dbo.approvedExpense.Id, dbo.approvedExpense.Amount, dbo.approvedExpense.Cash, dbo.approvedExpense.Cheque, dbo.approvedExpense.ChequeNo, dbo.approvedExpense.BankId, dbo.Bank.Name AS BankName, 
                         dbo.approvedExpense.Particular, dbo.approvedExpense.Date
FROM            dbo.approvedExpense LEFT OUTER JOIN
                         dbo.Bank ON dbo.approvedExpense.BankId = dbo.Bank.Id
GO
/****** Object:  View [dbo].[pendingIncome]    Script Date: 5/19/2019 7:29:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[pendingIncome] as 
select Id, Date, Amount, Cash, Cheque, Particular from income where Isapproved is null;
GO
/****** Object:  View [dbo].[pendingIncomes]    Script Date: 5/19/2019 7:29:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[pendingIncomes] as 
select Id, Date, Amount, Cash, Cheque, Particular from income where Isapproved is null;
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Company] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Company]
GO
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_Bank] FOREIGN KEY([BankId])
REFERENCES [dbo].[Bank] ([Id])
GO
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_Bank]
GO
ALTER TABLE [dbo].[Income]  WITH CHECK ADD  CONSTRAINT [FK_Income_Bank] FOREIGN KEY([BankId])
REFERENCES [dbo].[Bank] ([Id])
GO
ALTER TABLE [dbo].[Income] CHECK CONSTRAINT [FK_Income_Bank]
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
         Begin Table = "Income"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 5
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'approvedIncome'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'approvedIncome'
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
         Begin Table = "approvedIncome"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Bank"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'IncomeMonthlyViewWithBankName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'IncomeMonthlyViewWithBankName'
GO
USE [master]
GO
ALTER DATABASE [DailyInExDB] SET  READ_WRITE 
GO
