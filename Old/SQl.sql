USE [AnujDemo]
GO
/****** Object:  Table [dbo].[_OrderEndPositions]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_OrderEndPositions](
	[OrderEndPositionId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[CountyId] [smallint] NOT NULL,
 CONSTRAINT [PK_OrderEndPositions] PRIMARY KEY CLUSTERED 
(
	[OrderEndPositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_OrderStartPositions]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_OrderStartPositions](
	[OrderStartPositionId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[CountyId] [smallint] NOT NULL,
 CONSTRAINT [PK_OrderStartPositions] PRIMARY KEY CLUSTERED 
(
	[OrderStartPositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DefLocationCities]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefLocationCities](
	[CityId] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[CountryId] [tinyint] NOT NULL,
	[LocalCode] [smallint] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DefLocationCounties]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefLocationCounties](
	[CountyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[CityId] [smallint] NOT NULL,
	[LocalCode] [smallint] NOT NULL,
 CONSTRAINT [PK_Counties] PRIMARY KEY CLUSTERED 
(
	[CountyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DefLocationCountries]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefLocationCountries](
	[CountryId] [tinyint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_DefCountries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DefLocationRegions]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefLocationRegions](
	[RegionId] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[CountryId] [tinyint] NOT NULL,
	[LocalCode] [tinyint] NOT NULL,
 CONSTRAINT [PK_DefLocationRegions] PRIMARY KEY CLUSTERED 
(
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DefOrderTypes]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefOrderTypes](
	[OrderTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[OrderTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_DefOrderTypes] PRIMARY KEY CLUSTERED 
(
	[OrderTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DefProductPackages]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefProductPackages](
	[ProductPackageId] [tinyint] IDENTITY(1,1) NOT NULL,
	[ProductPackageName] [nvarchar](20) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_DefLoadKinds_IsDeleted]  DEFAULT ((0)),
	[DeletedBy] [int] NULL,
	[DeletedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_DefProductPackages] PRIMARY KEY CLUSTERED 
(
	[ProductPackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DefProductProperties]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefProductProperties](
	[ProductPropertyId] [smallint] IDENTITY(1,1) NOT NULL,
	[ProductPropertyName] [nvarchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_DefLoadProperties_IsDeleted]  DEFAULT ((0)),
	[DeletedBy] [int] NULL,
	[DeletedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_DefProductProperties] PRIMARY KEY CLUSTERED 
(
	[ProductPropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DefProductTypes]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefProductTypes](
	[ProductTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_DefProductTypes_IsDeleted]  DEFAULT ((0)),
	[DeletedBy] [int] NULL,
	[DeletedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_DefProductTypes] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DefProductUnits]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefProductUnits](
	[ProductUnitId] [tinyint] IDENTITY(1,1) NOT NULL,
	[ProductUnitName] [nvarchar](10) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_DefLoadUnits_IsDeleted]  DEFAULT ((0)),
	[DeletedBy] [int] NULL,
	[DeletedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_DefLoadUnits] PRIMARY KEY CLUSTERED 
(
	[ProductUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DefVehicleTypes]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefVehicleTypes](
	[VehicleTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[VehicleTypeName] [nvarchar](30) NOT NULL,
	[VehicleWidth] [decimal](7, 2) NOT NULL,
	[VehicleLength] [decimal](7, 2) NOT NULL,
	[VehicleHeight] [decimal](7, 2) NOT NULL,
	[VehicleVolume] [decimal](10, 2) NOT NULL,
	[VehicleDesi] [int] NOT NULL,
	[VehicleWeight] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_DefVehicleTypes_IsActive]  DEFAULT ((0)),
	[DeletedBy] [int] NULL,
	[DeletedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_DefVehicleTypes] PRIMARY KEY CLUSTERED 
(
	[VehicleTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Firms]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firms](
	[FirmId] [int] IDENTITY(1,1) NOT NULL,
	[FirmName] [nvarchar](100) NOT NULL,
	[CountyId] [int] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Phone1] [nvarchar](17) NOT NULL,
	[Phone2] [nvarchar](17) NULL,
	[Fax] [nvarchar](17) NULL,
	[MobilePhone] [nvarchar](17) NULL,
	[Email] [nvarchar](64) NULL,
	[WebSite] [nvarchar](64) NULL,
	[TaxOffice] [nvarchar](30) NOT NULL,
	[TaxNo] [nvarchar](10) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[IsApproved] [bit] NOT NULL CONSTRAINT [DF_Firms_IsApproved]  DEFAULT ((0)),
	[ApprovedBy] [int] NULL,
	[ApprovedOn] [smalldatetime] NULL,
	[CreatedOn] [smalldatetime] NOT NULL CONSTRAINT [DF_Firms_CreatedOn]  DEFAULT (getdate()),
	[UpdatedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_Firms] PRIMARY KEY CLUSTERED 
(
	[FirmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogMembershipCheckPasswordRenewalCodes]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogMembershipCheckPasswordRenewalCodes](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](64) NULL,
	[Result] [tinyint] NULL,
	[IP] [nvarchar](15) NULL,
	[CreatedOn] [smalldatetime] NOT NULL CONSTRAINT [DF_LogMembershipCheckPasswordRenewalCodes_CreatedOn]  DEFAULT (getdate()),
 CONSTRAINT [PK_LogMembershipCheckPasswordRenewalCodes] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogMembershipLogins]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogMembershipLogins](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](64) NULL,
	[Result] [tinyint] NULL,
	[IP] [nvarchar](15) NULL,
	[CreatedOn] [smalldatetime] NOT NULL CONSTRAINT [DF_LogMembershipLogins_CreatedOn]  DEFAULT (getdate()),
 CONSTRAINT [PK_LogMembershipLogins] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogMembershipRegisterCheckCodes]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogMembershipRegisterCheckCodes](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](64) NULL,
	[Result] [tinyint] NULL,
	[IP] [nvarchar](15) NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Log_Mem_Reg_CheckCodes] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogMembershipRegisterReSendCodes]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogMembershipRegisterReSendCodes](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](64) NULL,
	[Result] [tinyint] NULL,
	[IP] [nvarchar](15) NULL,
	[CreatedOn] [smalldatetime] NOT NULL CONSTRAINT [DF_Log_Membership_Register_ReSendVeriCodes_CreatedOn]  DEFAULT (getdate()),
 CONSTRAINT [PK_Log_Mem_Reg_ReSendCodes] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogMembershipSendPasswordRenewalCodes]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogMembershipSendPasswordRenewalCodes](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](64) NULL,
	[Result] [tinyint] NULL,
	[IP] [nvarchar](15) NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_LogMembershipSendPasswordRenewalCodes] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogSystemMailSend]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogSystemMailSend](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](64) NULL,
	[ErrorMessage] [nvarchar](500) NULL,
	[PageName] [nvarchar](50) NULL,
	[IP] [nvarchar](15) NULL,
	[CreatedOn] [smalldatetime] NOT NULL CONSTRAINT [DF_Log_Error_SendingMail_CreatedOn]  DEFAULT (getdate()),
 CONSTRAINT [PK_Log_Error_MailSending] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MapFirmToUser]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MapFirmToUser](
	[MapId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirmId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsAdmin] [bit] NOT NULL CONSTRAINT [DF_MapFirmToUser_IsAdmin]  DEFAULT ((0)),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_MapBranchToUser_IsActive]  DEFAULT ((1)),
	[CreatedOn] [smalldatetime] NOT NULL CONSTRAINT [DF_MapBranchToUser_CreatedOn]  DEFAULT (getdate()),
 CONSTRAINT [PK_MapBranchToUser] PRIMARY KEY CLUSTERED 
(
	[MapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Membership]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Membership](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](64) NOT NULL,
	[Password] [nvarchar](64) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Surname] [nvarchar](30) NULL,
	[StatusId] [tinyint] NOT NULL CONSTRAINT [DF_Membership_StatusId]  DEFAULT ((1)),
	[RoleId] [tinyint] NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)),
	[FailedPasswordAttemptCount] [int] NULL CONSTRAINT [DF_Membership_FailedPasswordAttemptCount]  DEFAULT ((0)),
	[LastLoginDate] [smalldatetime] NULL,
	[LastPasswordChangeDate] [smalldatetime] NULL,
	[Comment] [nvarchar](500) NULL,
	[VerifyOn] [smalldatetime] NULL,
	[IP] [nvarchar](15) NULL,
	[CreatedOn] [smalldatetime] NOT NULL CONSTRAINT [DF_Users_CreatedOn]  DEFAULT (getdate()),
	[UpdatedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MembershipPasswordRenewals]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipPasswordRenewals](
	[RenewalId] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](64) NOT NULL,
	[ActivateCode] [nvarchar](36) NOT NULL,
	[IP] [nvarchar](15) NULL,
	[CreatedOn] [smalldatetime] NOT NULL CONSTRAINT [DF_MembershipPasswordRenewals_CreatedOn]  DEFAULT (getdate()),
 CONSTRAINT [PK_MembershipPasswordRenewals] PRIMARY KEY CLUSTERED 
(
	[RenewalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [bigint] NOT NULL,
	[OrderRouteId] [bigint] NOT NULL,
	[OrderDetailType] [bit] NOT NULL,
	[LoadProductPackageId] [tinyint] NOT NULL,
	[LoadProductTypeId] [smallint] NOT NULL,
	[LoadProductWeight] [int] NOT NULL,
	[LoadProductVolume] [decimal](10, 2) NOT NULL,
	[LoadProductVisibleVolume] [decimal](10, 0) NOT NULL,
	[LoadProductVolumeVisibleUnitId] [tinyint] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderProductProperties]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProductProperties](
	[OrderProductPropertiesId] [bigint] NOT NULL,
	[OrderDetailId] [bigint] NULL,
	[ProductPropertyId] [smallint] NULL,
 CONSTRAINT [PK_OrderProductProperties] PRIMARY KEY CLUSTERED 
(
	[OrderProductPropertiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderRoutes]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderRoutes](
	[OrderRootId] [bigint] NOT NULL,
	[OrderId] [bigint] NULL,
	[StartCountyId] [int] NULL,
	[EndCountyId] [int] NULL,
 CONSTRAINT [PK_OrderRoots] PRIMARY KEY CLUSTERED 
(
	[OrderRootId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 28.1.2015 05:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirmId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderTypeId] [tinyint] NOT NULL,
	[VehicleTypeId] [tinyint] NULL,
	[DepartureDate] [smalldatetime] NULL,
	[DepartureTime] [time](7) NULL,
	[DepartureDateType] [tinyint] NOT NULL,
	[ArrivalDate] [smalldatetime] NULL,
	[ArrivalDateType] [tinyint] NULL,
	[Comment] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[UpdatedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DefLocationCities] ON 

INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (1, N'Adana', 90, 1)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (2, N'Adıyaman', 90, 2)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (3, N'Afyonkarahisar', 90, 3)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (4, N'Ağrı', 90, 4)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (5, N'Amasya', 90, 5)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (6, N'Ankara', 90, 6)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (7, N'Antalya', 90, 7)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (8, N'Artvin', 90, 8)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (9, N'Aydın', 90, 9)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (10, N'Balıkesir', 90, 10)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (11, N'Bilecik', 90, 11)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (12, N'Bingöl', 90, 12)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (13, N'Bitlis', 90, 13)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (14, N'Bolu', 90, 14)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (15, N'Burdur', 90, 15)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (16, N'Bursa', 90, 16)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (17, N'Çanakkale', 90, 17)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (18, N'Çankırı', 90, 18)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (19, N'Çorum', 90, 19)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (20, N'Denizli', 90, 20)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (21, N'Diyarbakır', 90, 21)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (22, N'Edirne', 90, 22)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (23, N'Elazığ', 90, 23)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (24, N'Erzincan', 90, 24)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (25, N'Erzurum', 90, 25)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (26, N'Eskişehir', 90, 26)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (27, N'Gaziantep', 90, 27)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (28, N'Giresun', 90, 28)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (29, N'Gümüşhane', 90, 29)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (30, N'Hakkari', 90, 30)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (31, N'Hatay', 90, 31)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (32, N'Isparta', 90, 32)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (33, N'Mersin', 90, 33)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (34, N'İstanbul', 90, 34)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (35, N'İzmir', 90, 35)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (36, N'Kars', 90, 36)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (37, N'Kastamonu', 90, 37)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (38, N'Kayseri', 90, 38)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (39, N'Kırklareli', 90, 39)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (40, N'Kırşehir', 90, 40)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (41, N'Kocaeli', 90, 41)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (42, N'Konya', 90, 42)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (43, N'Kütahya', 90, 43)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (44, N'Malatya', 90, 44)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (45, N'Manisa', 90, 45)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (46, N'Kahramanmaraş', 90, 46)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (47, N'Mardin', 90, 47)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (48, N'Muğla', 90, 48)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (49, N'Muş', 90, 49)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (50, N'Nevşehir', 90, 50)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (51, N'Niğde', 90, 51)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (52, N'Ordu', 90, 52)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (53, N'Rize', 90, 53)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (54, N'Sakarya', 90, 54)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (55, N'Samsun', 90, 55)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (56, N'Siirt', 90, 56)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (57, N'Sinop', 90, 57)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (58, N'Sivas', 90, 58)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (59, N'Tekirdağ', 90, 59)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (60, N'Tokat', 90, 60)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (61, N'Trabzon', 90, 61)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (62, N'Tunceli', 90, 62)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (63, N'Şanlıurfa', 90, 63)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (64, N'Uşak', 90, 64)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (65, N'Van', 90, 65)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (66, N'Yozgat', 90, 66)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (67, N'Zonguldak', 90, 67)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (68, N'Aksaray', 90, 68)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (69, N'Bayburt', 90, 69)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (70, N'Karaman', 90, 70)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (71, N'Kırıkkale', 90, 71)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (72, N'Batman', 90, 72)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (73, N'Şırnak', 90, 73)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (74, N'Bartın', 90, 74)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (75, N'Ardahan', 90, 75)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (76, N'Iğdır', 90, 76)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (77, N'Yalova', 90, 77)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (78, N'Karabük', 90, 78)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (79, N'Kilis', 90, 79)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (80, N'Osmaniye', 90, 80)
INSERT [dbo].[DefLocationCities] ([CityId], [Name], [CountryId], [LocalCode]) VALUES (81, N'Düzce', 90, 81)
SET IDENTITY_INSERT [dbo].[DefLocationCities] OFF
SET IDENTITY_INSERT [dbo].[DefLocationCounties] ON 

INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (1, N'Seyhan', 1, 1104)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (2, N'Ceyhan', 1, 1219)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (3, N'Feke', 1, 1329)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (4, N'Karaisalı', 1, 1437)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (5, N'Karataş', 1, 1443)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (6, N'Kozan', 1, 1486)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (7, N'Pozantı', 1, 1580)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (8, N'Saimbeyli', 1, 1588)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (9, N'Tufanbeyli', 1, 1687)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (10, N'Yumurtalık', 1, 1734)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (11, N'Yüreğir', 1, 1748)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (12, N'Aladağ', 1, 1757)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (13, N'İmamoğlu', 1, 1806)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (14, N'Sarıçam', 1, 2032)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (15, N'Çukurova', 1, 2033)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (16, N'Adıyaman Merkez', 2, 1105)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (17, N'Besni', 2, 1182)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (18, N'Çelikhan', 2, 1246)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (19, N'Gerger', 2, 1347)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (20, N'Gölbaşı / Adıyaman', 2, 1354)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (21, N'Kahta', 2, 1425)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (22, N'Samsat', 2, 1592)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (23, N'Sincik', 2, 1985)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (24, N'Tut', 2, 1989)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (25, N'Afyonkarahisar Merkez', 3, 1108)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (26, N'Bolvadin', 3, 1200)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (27, N'Çay', 3, 1239)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (28, N'Dazkırı', 3, 1267)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (29, N'Dinar', 3, 1281)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (30, N'Emirdağ', 3, 1306)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (31, N'İhsaniye', 3, 1404)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (32, N'Sandıklı', 3, 1594)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (33, N'Sinanpaşa', 3, 1626)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (34, N'Sultandağı', 3, 1639)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (35, N'Şuhut', 3, 1664)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (36, N'Başmakçı', 3, 1771)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (37, N'Bayat / Afyonkarahisar', 3, 1773)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (38, N'İscehisar', 3, 1809)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (39, N'Çobanlar', 3, 1906)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (40, N'Evciler', 3, 1923)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (41, N'Hocalar', 3, 1944)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (42, N'Kızılören', 3, 1961)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (43, N'Ağrı Merkez', 4, 1111)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (44, N'Diyadin', 4, 1283)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (45, N'Doğubayazıt', 4, 1287)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (46, N'Eleşkirt', 4, 1301)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (47, N'Hamur', 4, 1379)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (48, N'Patnos', 4, 1568)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (49, N'Taşlıçay', 4, 1667)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (50, N'Tutak', 4, 1691)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (51, N'Amasya Merkez', 5, 1134)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (52, N'Göynücek', 5, 1363)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (53, N'Gümüşhacıköy', 5, 1368)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (54, N'Merzifon', 5, 1524)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (55, N'Suluova', 5, 1641)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (56, N'Taşova', 5, 1668)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (57, N'Hamamözü', 5, 1938)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (58, N'Altındağ', 6, 1130)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (59, N'Ayaş', 6, 1157)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (60, N'Bala', 6, 1167)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (61, N'Beypazarı', 6, 1187)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (62, N'Çamlıdere', 6, 1227)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (63, N'Çankaya', 6, 1231)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (64, N'Çubuk', 6, 1260)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (65, N'Elmadağ', 6, 1302)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (66, N'Güdül', 6, 1365)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (67, N'Haymana', 6, 1387)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (68, N'Kalecik', 6, 1427)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (69, N'Kızılcahamam', 6, 1473)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (70, N'Nallıhan', 6, 1539)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (71, N'Polatlı', 6, 1578)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (72, N'Şereflikoçhisar', 6, 1658)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (73, N'Yenimahalle', 6, 1723)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (74, N'Gölbaşı / Ankara', 6, 1744)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (75, N'Keçiören', 6, 1745)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (76, N'Mamak', 6, 1746)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (77, N'Sincan', 6, 1747)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (78, N'Kazan', 6, 1815)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (79, N'Akyurt', 6, 1872)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (80, N'Etimesgut', 6, 1922)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (81, N'Evren', 6, 1924)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (82, N'Pursaklar', 6, 2034)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (83, N'Akseki', 7, 1121)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (84, N'Alanya', 7, 1126)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (85, N'Elmalı', 7, 1303)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (86, N'Finike', 7, 1333)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (87, N'Gazipaşa', 7, 1337)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (88, N'Gündoğmuş', 7, 1370)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (89, N'Kaş', 7, 1451)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (90, N'Korkuteli', 7, 1483)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (91, N'Kumluca', 7, 1492)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (92, N'Manavgat', 7, 1512)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (93, N'Serik', 7, 1616)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (94, N'Demre', 7, 1811)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (95, N'İbradı', 7, 1946)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (96, N'Kemer / Antalya', 7, 1959)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (97, N'Aksu / Antalya', 7, 2035)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (98, N'Döşemealtı', 7, 2036)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (99, N'Kepez', 7, 2037)
GO
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (100, N'Konyaaltı', 7, 2038)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (101, N'Muratpaşa', 7, 2039)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (102, N'Ardanuç', 8, 1145)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (103, N'Arhavi', 8, 1147)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (104, N'Artvin Merkez', 8, 1152)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (105, N'Borçka', 8, 1202)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (106, N'Hopa', 8, 1395)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (107, N'Şavşat', 8, 1653)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (108, N'Yusufeli', 8, 1736)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (109, N'Murgul', 8, 1828)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (110, N'Bozdoğan', 9, 1206)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (111, N'Çine', 9, 1256)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (112, N'Germencik', 9, 1348)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (113, N'Karacasu', 9, 1435)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (114, N'Koçarlı', 9, 1479)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (115, N'Kuşadası', 9, 1497)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (116, N'Kuyucak', 9, 1498)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (117, N'Nazilli', 9, 1542)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (118, N'Söke', 9, 1637)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (119, N'Sultanhisar', 9, 1640)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (120, N'Yenipazar / Aydın', 9, 1724)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (121, N'Buharkent', 9, 1781)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (122, N'İncirliova', 9, 1807)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (123, N'Karpuzlu', 9, 1957)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (124, N'Köşk', 9, 1968)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (125, N'Didim', 9, 2000)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (126, N'Efeler', 9, 2076)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (127, N'Ayvalık', 10, 1161)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (128, N'Balya', 10, 1169)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (129, N'Bandırma', 10, 1171)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (130, N'Bigadiç', 10, 1191)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (131, N'Burhaniye', 10, 1216)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (132, N'Dursunbey', 10, 1291)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (133, N'Edremit / Balıkesir', 10, 1294)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (134, N'Erdek', 10, 1310)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (135, N'Gönen / Balıkesir', 10, 1360)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (136, N'Havran', 10, 1384)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (137, N'İvrindi', 10, 1418)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (138, N'Kepsut', 10, 1462)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (139, N'Manyas', 10, 1514)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (140, N'Savaştepe', 10, 1608)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (141, N'Sındırgı', 10, 1619)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (142, N'Susurluk', 10, 1644)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (143, N'Marmara', 10, 1824)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (144, N'Gömeç', 10, 1928)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (145, N'Altıeylül', 10, 2077)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (146, N'Karesi', 10, 2078)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (147, N'Bilecik Merkez', 11, 1192)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (148, N'Bozüyük', 11, 1210)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (149, N'Gölpazarı', 11, 1359)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (150, N'Osmaneli', 11, 1559)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (151, N'Pazaryeri', 11, 1571)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (152, N'Söğüt', 11, 1636)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (153, N'Yenipazar / Bilecik', 11, 1857)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (154, N'İnhisar', 11, 1948)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (155, N'Bingöl Merkez', 12, 1193)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (156, N'Genç', 12, 1344)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (157, N'Karlıova', 12, 1446)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (158, N'Kiğı', 12, 1475)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (159, N'Solhan', 12, 1633)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (160, N'Adaklı', 12, 1750)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (161, N'Yayladere', 12, 1855)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (162, N'Yedisu', 12, 1996)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (163, N'Adilcevaz', 13, 1106)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (164, N'Ahlat', 13, 1112)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (165, N'Bitlis Merkez', 13, 1196)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (166, N'Hizan', 13, 1394)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (167, N'Mutki', 13, 1537)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (168, N'Tatvan', 13, 1669)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (169, N'Güroymak', 13, 1798)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (170, N'Bolu Merkez', 14, 1199)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (171, N'Gerede', 14, 1346)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (172, N'Göynük', 14, 1364)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (173, N'Kıbrıscık', 14, 1466)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (174, N'Mengen', 14, 1522)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (175, N'Mudurnu', 14, 1531)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (176, N'Seben', 14, 1610)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (177, N'Dörtdivan', 14, 1916)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (178, N'Yeniçağa', 14, 1997)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (179, N'Ağlasun', 15, 1109)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (180, N'Bucak', 15, 1211)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (181, N'Burdur Merkez', 15, 1215)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (182, N'Gölhisar', 15, 1357)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (183, N'Tefenni', 15, 1672)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (184, N'Yeşilova', 15, 1728)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (185, N'Karamanlı', 15, 1813)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (186, N'Kemer / Burdur', 15, 1816)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (187, N'Altınyayla / Burdur', 15, 1874)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (188, N'Çavdır', 15, 1899)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (189, N'Çeltikçi', 15, 1903)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (190, N'Gemlik', 16, 1343)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (191, N'İnegöl', 16, 1411)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (192, N'İznik', 16, 1420)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (193, N'Karacabey', 16, 1434)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (194, N'Keles', 16, 1457)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (195, N'Mudanya', 16, 1530)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (196, N'Mustafakemalpaşa', 16, 1535)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (197, N'Orhaneli', 16, 1553)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (198, N'Orhangazi', 16, 1554)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (199, N'Yenişehir / Bursa', 16, 1725)
GO
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (200, N'Büyükorhan', 16, 1783)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (201, N'Harmancık', 16, 1799)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (202, N'Nilüfer', 16, 1829)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (203, N'Osmangazi', 16, 1832)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (204, N'Yıldırım', 16, 1859)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (205, N'Gürsu', 16, 1935)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (206, N'Kestel', 16, 1960)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (207, N'Ayvacık / Çanakkale', 17, 1160)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (208, N'Bayramiç', 17, 1180)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (209, N'Biga', 17, 1190)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (210, N'Bozcaada', 17, 1205)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (211, N'Çan', 17, 1229)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (212, N'Çanakkale Merkez', 17, 1230)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (213, N'Eceabat', 17, 1293)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (214, N'Ezine', 17, 1326)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (215, N'Gelibolu', 17, 1340)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (216, N'Gökçeada', 17, 1408)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (217, N'Lapseki', 17, 1503)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (218, N'Yenice / Çanakkale', 17, 1722)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (219, N'Çankırı Merkez', 18, 1232)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (220, N'Çerkeş', 18, 1248)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (221, N'Eldivan', 18, 1300)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (222, N'Ilgaz', 18, 1399)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (223, N'Kurşunlu', 18, 1494)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (224, N'Orta', 18, 1555)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (225, N'Şabanözü', 18, 1649)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (226, N'Yapraklı', 18, 1718)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (227, N'Atkaracalar', 18, 1765)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (228, N'Kızılırmak', 18, 1817)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (229, N'Bayramören', 18, 1885)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (230, N'Korgun', 18, 1963)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (231, N'Alaca', 19, 1124)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (232, N'Bayat / Çorum', 19, 1177)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (233, N'Çorum Merkez', 19, 1259)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (234, N'İskilip', 19, 1414)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (235, N'Kargı', 19, 1445)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (236, N'Mecitözü', 19, 1520)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (237, N'Ortaköy / Çorum', 19, 1556)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (238, N'Osmancık', 19, 1558)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (239, N'Sungurlu', 19, 1642)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (240, N'Boğazkale', 19, 1778)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (241, N'Uğurludağ', 19, 1850)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (242, N'Dodurga', 19, 1911)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (243, N'Laçin', 19, 1972)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (244, N'Oğuzlar', 19, 1976)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (245, N'Acıpayam', 20, 1102)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (246, N'Buldan', 20, 1214)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (247, N'Çal', 20, 1224)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (248, N'Çameli', 20, 1226)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (249, N'Çardak', 20, 1233)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (250, N'Çivril', 20, 1257)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (251, N'Güney', 20, 1371)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (252, N'Kale / Denizli', 20, 1426)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (253, N'Sarayköy', 20, 1597)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (254, N'Tavas', 20, 1670)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (255, N'Babadağ', 20, 1769)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (256, N'Bekilli', 20, 1774)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (257, N'Honaz', 20, 1803)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (258, N'Serinhisar', 20, 1840)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (259, N'Pamukkale', 20, 1871)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (260, N'Baklan', 20, 1881)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (261, N'Beyağaç', 20, 1888)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (262, N'Bozkurt / Denizli', 20, 1889)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (263, N'Merkezefendi', 20, 2079)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (264, N'Bismil', 21, 1195)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (265, N'Çermik', 21, 1249)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (266, N'Çınar', 21, 1253)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (267, N'Çüngüş', 21, 1263)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (268, N'Dicle', 21, 1278)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (269, N'Ergani', 21, 1315)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (270, N'Hani', 21, 1381)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (271, N'Hazro', 21, 1389)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (272, N'Kulp', 21, 1490)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (273, N'Lice', 21, 1504)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (274, N'Silvan', 21, 1624)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (275, N'Eğil', 21, 1791)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (276, N'Kocaköy', 21, 1962)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (277, N'Bağlar', 21, 2040)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (278, N'Kayapınar', 21, 2041)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (279, N'Sur', 21, 2042)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (280, N'Yenişehir / Diyarbakır', 21, 2043)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (281, N'Edirne Merkez', 22, 1295)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (282, N'Enez', 22, 1307)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (283, N'Havsa', 22, 1385)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (284, N'İpsala', 22, 1412)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (285, N'Keşan', 22, 1464)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (286, N'Lalapaşa', 22, 1502)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (287, N'Meriç', 22, 1523)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (288, N'Uzunköprü', 22, 1705)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (289, N'Süloğlu', 22, 1988)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (290, N'Ağın', 23, 1110)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (291, N'Baskil', 23, 1173)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (292, N'Elazığ Merkez', 23, 1298)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (293, N'Karakoçan', 23, 1438)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (294, N'Keban', 23, 1455)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (295, N'Maden', 23, 1506)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (296, N'Palu', 23, 1566)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (297, N'Sivrice', 23, 1631)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (298, N'Arıcak', 23, 1762)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (299, N'Kovancılar', 23, 1820)
GO
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (300, N'Alacakaya', 23, 1873)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (301, N'Çayırlı', 24, 1243)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (302, N'Erzincan Merkez', 24, 1318)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (303, N'İliç', 24, 1406)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (304, N'Kemah', 24, 1459)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (305, N'Kemaliye', 24, 1460)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (306, N'Refahiye', 24, 1583)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (307, N'Tercan', 24, 1675)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (308, N'Üzümlü', 24, 1853)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (309, N'Otlukbeli', 24, 1977)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (310, N'Aşkale', 25, 1153)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (311, N'Çat', 25, 1235)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (312, N'Hınıs', 25, 1392)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (313, N'Horasan', 25, 1396)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (314, N'İspir', 25, 1416)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (315, N'Karayazı', 25, 1444)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (316, N'Narman', 25, 1540)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (317, N'Oltu', 25, 1550)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (318, N'Olur', 25, 1551)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (319, N'Pasinler', 25, 1567)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (320, N'Şenkaya', 25, 1657)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (321, N'Tekman', 25, 1674)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (322, N'Tortum', 25, 1683)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (323, N'Karaçoban', 25, 1812)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (324, N'Uzundere', 25, 1851)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (325, N'Pazaryolu', 25, 1865)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (326, N'Aziziye', 25, 1945)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (327, N'Köprüköy', 25, 1967)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (328, N'Palandöken', 25, 2044)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (329, N'Yakutiye', 25, 2045)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (330, N'Çifteler', 26, 1255)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (331, N'Mahmudiye', 26, 1508)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (332, N'Mihalıççık', 26, 1527)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (333, N'Sarıcakaya', 26, 1599)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (334, N'Seyitgazi', 26, 1618)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (335, N'Sivrihisar', 26, 1632)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (336, N'Alpu', 26, 1759)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (337, N'Beylikova', 26, 1777)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (338, N'İnönü', 26, 1808)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (339, N'Günyüzü', 26, 1934)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (340, N'Han', 26, 1939)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (341, N'Mihalgazi', 26, 1973)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (342, N'Odunpazarı', 26, 2046)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (343, N'Tepebaşı', 26, 2047)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (344, N'Araban', 27, 1139)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (345, N'İslahiye', 27, 1415)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (346, N'Nizip', 27, 1546)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (347, N'Oğuzeli', 27, 1549)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (348, N'Yavuzeli', 27, 1720)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (349, N'Şahinbey', 27, 1841)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (350, N'Şehitkamil', 27, 1844)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (351, N'Karkamış', 27, 1956)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (352, N'Nurdağı', 27, 1974)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (353, N'Alucra', 28, 1133)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (354, N'Bulancak', 28, 1212)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (355, N'Dereli', 28, 1272)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (356, N'Espiye', 28, 1320)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (357, N'Eynesil', 28, 1324)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (358, N'Giresun Merkez', 28, 1352)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (359, N'Görele', 28, 1361)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (360, N'Keşap', 28, 1465)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (361, N'Şebinkarahisar', 28, 1654)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (362, N'Tirebolu', 28, 1678)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (363, N'Piraziz', 28, 1837)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (364, N'Yağlıdere', 28, 1854)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (365, N'Çamoluk', 28, 1893)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (366, N'Çanakçı', 28, 1894)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (367, N'Doğankent', 28, 1912)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (368, N'Güce', 28, 1930)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (369, N'Gümüşhane Merkez', 29, 1369)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (370, N'Kelkit', 29, 1458)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (371, N'Şiran', 29, 1660)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (372, N'Torul', 29, 1684)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (373, N'Köse', 29, 1822)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (374, N'Kürtün', 29, 1971)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (375, N'Çukurca', 30, 1261)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (376, N'Hakkari Merkez', 30, 1377)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (377, N'Şemdinli', 30, 1656)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (378, N'Yüksekova', 30, 1737)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (379, N'Altınözü', 31, 1131)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (380, N'Dörtyol', 31, 1289)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (381, N'Hassa', 31, 1382)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (382, N'İskenderun', 31, 1413)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (383, N'Kırıkhan', 31, 1468)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (384, N'Reyhanlı', 31, 1585)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (385, N'Samandağ', 31, 1591)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (386, N'Yayladağı', 31, 1721)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (387, N'Erzin', 31, 1792)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (388, N'Belen', 31, 1887)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (389, N'Kumlu', 31, 1970)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (390, N'Antakya', 31, 2080)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (391, N'Arsuz', 31, 2081)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (392, N'Defne', 31, 2082)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (393, N'Payas', 31, 2083)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (394, N'Atabey', 32, 1154)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (395, N'Eğirdir', 32, 1297)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (396, N'Gelendost', 32, 1341)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (397, N'Isparta Merkez', 32, 1401)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (398, N'Keçiborlu', 32, 1456)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (399, N'Senirkent', 32, 1615)
GO
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (400, N'Sütçüler', 32, 1648)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (401, N'Şarkikaraağaç', 32, 1651)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (402, N'Uluborlu', 32, 1699)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (403, N'Yalvaç', 32, 1717)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (404, N'Aksu / Isparta', 32, 1755)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (405, N'Gönen / Isparta', 32, 1929)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (406, N'Yenişarbademli', 32, 2001)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (407, N'Anamur', 33, 1135)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (408, N'Erdemli', 33, 1311)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (409, N'Gülnar', 33, 1366)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (410, N'Mut', 33, 1536)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (411, N'Silifke', 33, 1621)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (412, N'Tarsus', 33, 1665)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (413, N'Aydıncık / Mersin', 33, 1766)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (414, N'Bozyazı', 33, 1779)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (415, N'Çamlıyayla', 33, 1892)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (416, N'Akdeniz', 33, 2064)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (417, N'Mezitli', 33, 2065)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (418, N'Toroslar', 33, 2066)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (419, N'Yenişehir / Mersin', 33, 2067)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (420, N'Adalar', 34, 1103)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (421, N'Bakırköy', 34, 1166)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (422, N'Beşiktaş', 34, 1183)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (423, N'Beykoz', 34, 1185)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (424, N'Beyoğlu', 34, 1186)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (425, N'Çatalca', 34, 1237)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (426, N'Eyüp', 34, 1325)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (427, N'Fatih', 34, 1327)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (428, N'Gaziosmanpaşa', 34, 1336)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (429, N'Kadıköy', 34, 1421)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (430, N'Kartal', 34, 1449)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (431, N'Sarıyer', 34, 1604)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (432, N'Silivri', 34, 1622)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (433, N'Şile', 34, 1659)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (434, N'Şişli', 34, 1663)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (435, N'Üsküdar', 34, 1708)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (436, N'Zeytinburnu', 34, 1739)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (437, N'Büyükçekmece', 34, 1782)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (438, N'Kağıthane', 34, 1810)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (439, N'Küçükçekmece', 34, 1823)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (440, N'Pendik', 34, 1835)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (441, N'Ümraniye', 34, 1852)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (442, N'Bayrampaşa', 34, 1886)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (443, N'Avcılar', 34, 2003)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (444, N'Bağcılar', 34, 2004)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (445, N'Bahçelievler', 34, 2005)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (446, N'Güngören', 34, 2010)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (447, N'Maltepe', 34, 2012)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (448, N'Sultanbeyli', 34, 2014)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (449, N'Tuzla', 34, 2015)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (450, N'Esenler', 34, 2016)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (451, N'Arnavutköy', 34, 2048)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (452, N'Ataşehir', 34, 2049)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (453, N'Başakşehir', 34, 2050)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (454, N'Beylikdüzü', 34, 2051)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (455, N'Çekmeköy', 34, 2052)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (456, N'Esenyurt', 34, 2053)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (457, N'Sancaktepe', 34, 2054)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (458, N'Sultangazi', 34, 2055)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (459, N'Aliağa', 35, 1128)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (460, N'Bayındır', 35, 1178)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (461, N'Bergama', 35, 1181)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (462, N'Bornova', 35, 1203)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (463, N'Çeşme', 35, 1251)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (464, N'Dikili', 35, 1280)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (465, N'Foça', 35, 1334)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (466, N'Karaburun', 35, 1432)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (467, N'Karşıyaka', 35, 1448)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (468, N'Kemalpaşa', 35, 1461)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (469, N'Kınık', 35, 1467)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (470, N'Kiraz', 35, 1477)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (471, N'Menemen', 35, 1521)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (472, N'Ödemiş', 35, 1563)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (473, N'Seferihisar', 35, 1611)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (474, N'Selçuk', 35, 1612)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (475, N'Tire', 35, 1677)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (476, N'Torbalı', 35, 1682)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (477, N'Urla', 35, 1703)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (478, N'Beydağ', 35, 1776)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (479, N'Buca', 35, 1780)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (480, N'Konak', 35, 1819)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (481, N'Menderes', 35, 1826)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (482, N'Balçova', 35, 2006)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (483, N'Çiğli', 35, 2007)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (484, N'Gaziemir', 35, 2009)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (485, N'Narlıdere', 35, 2013)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (486, N'Güzelbahçe', 35, 2018)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (487, N'Bayraklı', 35, 2056)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (488, N'Karabağlar', 35, 2057)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (489, N'Arpaçay', 36, 1149)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (490, N'Digor', 36, 1279)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (491, N'Kağızman', 36, 1424)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (492, N'Kars Merkez', 36, 1447)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (493, N'Sarıkamış', 36, 1601)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (494, N'Selim', 36, 1614)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (495, N'Susuz', 36, 1645)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (496, N'Akyaka', 36, 1756)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (497, N'Abana', 37, 1101)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (498, N'Araç', 37, 1140)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (499, N'Azdavay', 37, 1162)
GO
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (500, N'Bozkurt / Kastamonu', 37, 1208)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (501, N'Cide', 37, 1221)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (502, N'Çatalzeytin', 37, 1238)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (503, N'Daday', 37, 1264)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (504, N'Devrekani', 37, 1277)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (505, N'İnebolu', 37, 1410)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (506, N'Kastamonu Merkez', 37, 1450)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (507, N'Küre', 37, 1499)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (508, N'Taşköprü', 37, 1666)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (509, N'Tosya', 37, 1685)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (510, N'İhsangazi', 37, 1805)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (511, N'Pınarbaşı / Kastamonu', 37, 1836)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (512, N'Şenpazar', 37, 1845)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (513, N'Ağlı', 37, 1867)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (514, N'Doğanyurt', 37, 1915)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (515, N'Hanönü', 37, 1940)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (516, N'Seydiler', 37, 1984)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (517, N'Bünyan', 38, 1218)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (518, N'Develi', 38, 1275)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (519, N'Felahiye', 38, 1330)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (520, N'İncesu', 38, 1409)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (521, N'Pınarbaşı / Kayseri', 38, 1576)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (522, N'Sarıoğlan', 38, 1603)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (523, N'Sarız', 38, 1605)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (524, N'Tomarza', 38, 1680)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (525, N'Yahyalı', 38, 1715)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (526, N'Yeşilhisar', 38, 1727)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (527, N'Akkışla', 38, 1752)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (528, N'Talas', 38, 1846)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (529, N'Kocasinan', 38, 1863)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (530, N'Melikgazi', 38, 1864)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (531, N'Hacılar', 38, 1936)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (532, N'Özvatan', 38, 1978)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (533, N'Babaeski', 39, 1163)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (534, N'Demirköy', 39, 1270)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (535, N'Kırklareli Merkez', 39, 1471)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (536, N'Kofçaz', 39, 1480)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (537, N'Lüleburgaz', 39, 1505)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (538, N'Pehlivanköy', 39, 1572)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (539, N'Pınarhisar', 39, 1577)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (540, N'Vize', 39, 1714)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (541, N'Çiçekdağı', 40, 1254)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (542, N'Kaman', 40, 1429)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (543, N'Kırşehir Merkez', 40, 1472)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (544, N'Mucur', 40, 1529)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (545, N'Akpınar', 40, 1754)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (546, N'Akçakent', 40, 1869)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (547, N'Boztepe', 40, 1890)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (548, N'Gebze', 41, 1338)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (549, N'Gölcük', 41, 1355)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (550, N'Kandıra', 41, 1430)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (551, N'Karamürsel', 41, 1440)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (552, N'Körfez', 41, 1821)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (553, N'Derince', 41, 2030)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (554, N'Başiskele', 41, 2058)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (555, N'Çayırova', 41, 2059)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (556, N'Darıca', 41, 2060)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (557, N'Dilovası', 41, 2061)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (558, N'İzmit', 41, 2062)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (559, N'Kartepe', 41, 2063)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (560, N'Akşehir', 42, 1122)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (561, N'Beyşehir', 42, 1188)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (562, N'Bozkır', 42, 1207)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (563, N'Cihanbeyli', 42, 1222)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (564, N'Çumra', 42, 1262)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (565, N'Doğanhisar', 42, 1285)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (566, N'Ereğli / Konya', 42, 1312)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (567, N'Hadim', 42, 1375)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (568, N'Ilgın', 42, 1400)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (569, N'Kadınhanı', 42, 1422)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (570, N'Karapınar', 42, 1441)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (571, N'Kulu', 42, 1491)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (572, N'Sarayönü', 42, 1598)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (573, N'Seydişehir', 42, 1617)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (574, N'Yunak', 42, 1735)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (575, N'Akören', 42, 1753)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (576, N'Altınekin', 42, 1760)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (577, N'Derebucak', 42, 1789)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (578, N'Hüyük', 42, 1804)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (579, N'Karatay', 42, 1814)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (580, N'Meram', 42, 1827)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (581, N'Selçuklu', 42, 1839)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (582, N'Taşkent', 42, 1848)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (583, N'Ahırlı', 42, 1868)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (584, N'Çeltik', 42, 1902)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (585, N'Derbent', 42, 1907)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (586, N'Emirgazi', 42, 1920)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (587, N'Güneysınır', 42, 1933)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (588, N'Halkapınar', 42, 1937)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (589, N'Tuzlukçu', 42, 1990)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (590, N'Yalıhüyük', 42, 1994)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (591, N'Altıntaş', 43, 1132)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (592, N'Domaniç', 43, 1288)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (593, N'Emet', 43, 1304)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (594, N'Gediz', 43, 1339)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (595, N'Kütahya Merkez', 43, 1500)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (596, N'Simav', 43, 1625)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (597, N'Tavşanlı', 43, 1671)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (598, N'Aslanapa', 43, 1764)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (599, N'Dumlupınar', 43, 1790)
GO
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (600, N'Hisarcık', 43, 1802)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (601, N'Şaphane', 43, 1843)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (602, N'Çavdarhisar', 43, 1898)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (603, N'Pazarlar', 43, 1979)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (604, N'Akçadağ', 44, 1114)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (605, N'Arapgir', 44, 1143)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (606, N'Arguvan', 44, 1148)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (607, N'Darende', 44, 1265)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (608, N'Doğanşehir', 44, 1286)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (609, N'Hekimhan', 44, 1390)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (610, N'Pütürge', 44, 1582)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (611, N'Yeşilyurt / Malatya', 44, 1729)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (612, N'Battalgazi', 44, 1772)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (613, N'Doğanyol', 44, 1914)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (614, N'Kale / Malatya', 44, 1953)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (615, N'Kuluncak', 44, 1969)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (616, N'Yazıhan', 44, 1995)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (617, N'Akhisar', 45, 1118)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (618, N'Alaşehir', 45, 1127)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (619, N'Demirci', 45, 1269)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (620, N'Gördes', 45, 1362)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (621, N'Kırkağaç', 45, 1470)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (622, N'Kula', 45, 1489)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (623, N'Salihli', 45, 1590)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (624, N'Sarıgöl', 45, 1600)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (625, N'Saruhanlı', 45, 1606)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (626, N'Selendi', 45, 1613)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (627, N'Soma', 45, 1634)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (628, N'Turgutlu', 45, 1689)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (629, N'Ahmetli', 45, 1751)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (630, N'Gölmarmara', 45, 1793)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (631, N'Köprübaşı / Manisa', 45, 1965)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (632, N'Şehzadeler', 45, 2086)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (633, N'Yunusemre', 45, 2087)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (634, N'Afşin', 46, 1107)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (635, N'Andırın', 46, 1136)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (636, N'Elbistan', 46, 1299)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (637, N'Göksun', 46, 1353)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (638, N'Pazarcık', 46, 1570)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (639, N'Türkoğlu', 46, 1694)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (640, N'Çağlayancerit', 46, 1785)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (641, N'Ekinözü', 46, 1919)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (642, N'Nurhak', 46, 1975)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (643, N'Dulkadiroğlu', 46, 2084)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (644, N'Onikişubat', 46, 2085)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (645, N'Derik', 47, 1273)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (646, N'Kızıltepe', 47, 1474)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (647, N'Mazıdağı', 47, 1519)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (648, N'Midyat', 47, 1526)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (649, N'Nusaybin', 47, 1547)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (650, N'Ömerli', 47, 1564)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (651, N'Savur', 47, 1609)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (652, N'Dargeçit', 47, 1787)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (653, N'Yeşilli', 47, 2002)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (654, N'Artuklu', 47, 2088)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (655, N'Bodrum', 48, 1197)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (656, N'Datça', 48, 1266)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (657, N'Fethiye', 48, 1331)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (658, N'Köyceğiz', 48, 1488)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (659, N'Marmaris', 48, 1517)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (660, N'Milas', 48, 1528)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (661, N'Ula', 48, 1695)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (662, N'Yatağan', 48, 1719)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (663, N'Dalaman', 48, 1742)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (664, N'Ortaca', 48, 1831)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (665, N'Kavaklıdere', 48, 1958)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (666, N'Menteşe', 48, 2089)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (667, N'Seydikemer', 48, 2090)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (668, N'Bulanık', 49, 1213)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (669, N'Malazgirt', 49, 1510)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (670, N'Muş Merkez', 49, 1534)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (671, N'Varto', 49, 1711)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (672, N'Hasköy', 49, 1801)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (673, N'Korkut', 49, 1964)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (674, N'Avanos', 50, 1155)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (675, N'Derinkuyu', 50, 1274)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (676, N'Gülşehir', 50, 1367)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (677, N'Hacıbektaş', 50, 1374)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (678, N'Kozaklı', 50, 1485)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (679, N'Nevşehir Merkez', 50, 1543)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (680, N'Ürgüp', 50, 1707)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (681, N'Acıgöl', 50, 1749)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (682, N'Bor', 51, 1201)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (683, N'Çamardı', 51, 1225)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (684, N'Niğde Merkez', 51, 1544)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (685, N'Ulukışla', 51, 1700)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (686, N'Altunhisar', 51, 1876)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (687, N'Çiftlik', 51, 1904)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (688, N'Akkuş', 52, 1119)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (689, N'Aybastı', 52, 1158)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (690, N'Fatsa', 52, 1328)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (691, N'Gölköy', 52, 1358)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (692, N'Korgan', 52, 1482)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (693, N'Kumru', 52, 1493)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (694, N'Mesudiye', 52, 1525)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (695, N'Perşembe', 52, 1573)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (696, N'Ulubey / Ordu', 52, 1696)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (697, N'Ünye', 52, 1706)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (698, N'Gülyalı', 52, 1795)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (699, N'Gürgentepe', 52, 1797)
GO
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (700, N'Çamaş', 52, 1891)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (701, N'Çatalpınar', 52, 1897)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (702, N'Çaybaşı', 52, 1900)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (703, N'İkizce', 52, 1947)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (704, N'Kabadüz', 52, 1950)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (705, N'Kabataş', 52, 1951)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (706, N'Altınordu', 52, 2103)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (707, N'Ardeşen', 53, 1146)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (708, N'Çamlıhemşin', 53, 1228)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (709, N'Çayeli', 53, 1241)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (710, N'Fındıklı', 53, 1332)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (711, N'İkizdere', 53, 1405)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (712, N'Kalkandere', 53, 1428)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (713, N'Pazar / Rize', 53, 1569)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (714, N'Rize Merkez', 53, 1586)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (715, N'Güneysu', 53, 1796)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (716, N'Derepazarı', 53, 1908)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (717, N'Hemşin', 53, 1943)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (718, N'İyidere', 53, 1949)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (719, N'Akyazı', 54, 1123)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (720, N'Geyve', 54, 1351)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (721, N'Hendek', 54, 1391)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (722, N'Karasu', 54, 1442)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (723, N'Kaynarca', 54, 1453)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (724, N'Sapanca', 54, 1595)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (725, N'Kocaali', 54, 1818)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (726, N'Pamukova', 54, 1833)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (727, N'Taraklı', 54, 1847)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (728, N'Ferizli', 54, 1925)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (729, N'Karapürçek', 54, 1955)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (730, N'Söğütlü', 54, 1986)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (731, N'Adapazarı', 54, 2068)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (732, N'Arifiye', 54, 2069)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (733, N'Erenler', 54, 2070)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (734, N'Serdivan', 54, 2071)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (735, N'Alaçam', 55, 1125)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (736, N'Bafra', 55, 1164)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (737, N'Çarşamba', 55, 1234)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (738, N'Havza', 55, 1386)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (739, N'Kavak', 55, 1452)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (740, N'Ladik', 55, 1501)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (741, N'Terme', 55, 1676)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (742, N'Vezirköprü', 55, 1712)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (743, N'Asarcık', 55, 1763)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (744, N'19 Mayıs', 55, 1830)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (745, N'Salıpazarı', 55, 1838)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (746, N'Tekkeköy', 55, 1849)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (747, N'Ayvacık / Samsun', 55, 1879)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (748, N'Yakakent', 55, 1993)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (749, N'Atakum', 55, 2072)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (750, N'Canik', 55, 2073)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (751, N'İlkadım', 55, 2074)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (752, N'Baykan', 56, 1179)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (753, N'Eruh', 56, 1317)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (754, N'Kurtalan', 56, 1495)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (755, N'Pervari', 56, 1575)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (756, N'Siirt Merkez', 56, 1620)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (757, N'Şirvan', 56, 1662)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (758, N'Tillo', 56, 1878)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (759, N'Ayancık', 57, 1156)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (760, N'Boyabat', 57, 1204)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (761, N'Durağan', 57, 1290)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (762, N'Erfelek', 57, 1314)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (763, N'Gerze', 57, 1349)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (764, N'Sinop Merkez', 57, 1627)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (765, N'Türkeli', 57, 1693)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (766, N'Dikmen', 57, 1910)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (767, N'Saraydüzü', 57, 1981)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (768, N'Divriği', 58, 1282)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (769, N'Gemerek', 58, 1342)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (770, N'Gürün', 58, 1373)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (771, N'Hafik', 58, 1376)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (772, N'İmranlı', 58, 1407)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (773, N'Kangal', 58, 1431)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (774, N'Koyulhisar', 58, 1484)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (775, N'Sivas Merkez', 58, 1628)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (776, N'Suşehri', 58, 1646)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (777, N'Şarkışla', 58, 1650)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (778, N'Yıldızeli', 58, 1731)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (779, N'Zara', 58, 1738)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (780, N'Akıncılar', 58, 1870)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (781, N'Altınyayla / Sivas', 58, 1875)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (782, N'Doğanşar', 58, 1913)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (783, N'Gölova', 58, 1927)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (784, N'Ulaş', 58, 1991)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (785, N'Çerkezköy', 59, 1250)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (786, N'Çorlu', 59, 1258)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (787, N'Hayrabolu', 59, 1388)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (788, N'Malkara', 59, 1511)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (789, N'Muratlı', 59, 1538)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (790, N'Saray / Tekirdağ', 59, 1596)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (791, N'Şarköy', 59, 1652)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (792, N'Marmaraereğlisi', 59, 1825)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (793, N'Ergene', 59, 2094)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (794, N'Süleymanpaşa', 59, 2096)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (795, N'Almus', 60, 1129)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (796, N'Artova', 60, 1151)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (797, N'Erbaa', 60, 1308)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (798, N'Niksar', 60, 1545)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (799, N'Reşadiye', 60, 1584)
GO
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (800, N'Tokat Merkez', 60, 1679)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (801, N'Turhal', 60, 1690)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (802, N'Zile', 60, 1740)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (803, N'Pazar / Tokat', 60, 1834)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (804, N'Yeşilyurt / Tokat', 60, 1858)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (805, N'Başçiftlik', 60, 1883)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (806, N'Sulusaray', 60, 1987)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (807, N'Akçaabat', 61, 1113)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (808, N'Araklı', 61, 1141)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (809, N'Arsin', 61, 1150)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (810, N'Çaykara', 61, 1244)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (811, N'Maçka', 61, 1507)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (812, N'Of', 61, 1548)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (813, N'Sürmene', 61, 1647)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (814, N'Tonya', 61, 1681)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (815, N'Vakfıkebir', 61, 1709)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (816, N'Yomra', 61, 1732)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (817, N'Beşikdüzü', 61, 1775)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (818, N'Şalpazarı', 61, 1842)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (819, N'Çarşıbaşı', 61, 1896)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (820, N'Dernekpazarı', 61, 1909)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (821, N'Düzköy', 61, 1917)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (822, N'Hayrat', 61, 1942)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (823, N'Köprübaşı / Trabzon', 61, 1966)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (824, N'Ortahisar', 61, 2097)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (825, N'Çemişgezek', 62, 1247)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (826, N'Hozat', 62, 1397)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (827, N'Mazgirt', 62, 1518)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (828, N'Nazımiye', 62, 1541)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (829, N'Ovacık / Tunceli', 62, 1562)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (830, N'Pertek', 62, 1574)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (831, N'Pülümür', 62, 1581)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (832, N'Tunceli Merkez', 62, 1688)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (833, N'Akçakale', 63, 1115)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (834, N'Birecik', 63, 1194)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (835, N'Bozova', 63, 1209)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (836, N'Ceylanpınar', 63, 1220)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (837, N'Halfeti', 63, 1378)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (838, N'Hilvan', 63, 1393)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (839, N'Siverek', 63, 1630)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (840, N'Suruç', 63, 1643)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (841, N'Viranşehir', 63, 1713)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (842, N'Harran', 63, 1800)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (843, N'Eyyübiye', 63, 2091)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (844, N'Haliliye', 63, 2092)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (845, N'Karaköprü', 63, 2093)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (846, N'Banaz', 64, 1170)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (847, N'Eşme', 64, 1323)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (848, N'Karahallı', 64, 1436)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (849, N'Sivaslı', 64, 1629)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (850, N'Ulubey / Uşak', 64, 1697)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (851, N'Uşak Merkez', 64, 1704)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (852, N'Başkale', 65, 1175)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (853, N'Çatak', 65, 1236)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (854, N'Erciş', 65, 1309)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (855, N'Gevaş', 65, 1350)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (856, N'Gürpınar', 65, 1372)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (857, N'Muradiye', 65, 1533)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (858, N'Özalp', 65, 1565)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (859, N'Bahçesaray', 65, 1770)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (860, N'Çaldıran', 65, 1786)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (861, N'Edremit / Van', 65, 1918)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (862, N'Saray / Van', 65, 1980)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (863, N'İpekyolu', 65, 2098)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (864, N'Tuşba', 65, 2099)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (865, N'Akdağmadeni', 66, 1117)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (866, N'Boğazlıyan', 66, 1198)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (867, N'Çayıralan', 66, 1242)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (868, N'Çekerek', 66, 1245)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (869, N'Sarıkaya', 66, 1602)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (870, N'Sorgun', 66, 1635)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (871, N'Şefaatli', 66, 1655)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (872, N'Yerköy', 66, 1726)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (873, N'Yozgat Merkez', 66, 1733)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (874, N'Aydıncık / Yozgat', 66, 1877)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (875, N'Çandır', 66, 1895)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (876, N'Kadışehri', 66, 1952)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (877, N'Saraykent', 66, 1982)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (878, N'Yenifakılı', 66, 1998)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (879, N'Çaycuma', 67, 1240)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (880, N'Devrek', 67, 1276)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (881, N'Ereğli / Zonguldak', 67, 1313)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (882, N'Zonguldak Merkez', 67, 1741)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (883, N'Alaplı', 67, 1758)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (884, N'Gökçebey', 67, 1926)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (885, N'Aksaray Merkez', 68, 1120)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (886, N'Ortaköy / Aksaray', 68, 1557)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (887, N'Ağaçören', 68, 1860)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (888, N'Güzelyurt', 68, 1861)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (889, N'Sarıyahşi', 68, 1866)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (890, N'Eskil', 68, 1921)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (891, N'Gülağaç', 68, 1932)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (892, N'Bayburt Merkez', 69, 1176)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (893, N'Aydıntepe', 69, 1767)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (894, N'Demirözü', 69, 1788)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (895, N'Ermenek', 70, 1316)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (896, N'Karaman Merkez', 70, 1439)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (897, N'Ayrancı', 70, 1768)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (898, N'Kazımkarabekir', 70, 1862)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (899, N'Başyayla', 70, 1884)
GO
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (900, N'Sarıveliler', 70, 1983)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (901, N'Delice', 71, 1268)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (902, N'Keskin', 71, 1463)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (903, N'Kırıkkale Merkez', 71, 1469)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (904, N'Sulakyurt', 71, 1638)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (905, N'Bahşili', 71, 1880)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (906, N'Balışeyh', 71, 1882)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (907, N'Çelebi', 71, 1901)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (908, N'Karakeçili', 71, 1954)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (909, N'Yahşihan', 71, 1992)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (910, N'Batman Merkez', 72, 1174)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (911, N'Beşiri', 72, 1184)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (912, N'Gercüş', 72, 1345)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (913, N'Kozluk', 72, 1487)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (914, N'Sason', 72, 1607)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (915, N'Hasankeyf', 72, 1941)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (916, N'Beytüşşebap', 73, 1189)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (917, N'Cizre', 73, 1223)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (918, N'İdil', 73, 1403)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (919, N'Silopi', 73, 1623)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (920, N'Şırnak Merkez', 73, 1661)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (921, N'Uludere', 73, 1698)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (922, N'Güçlükonak', 73, 1931)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (923, N'Bartın Merkez', 74, 1172)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (924, N'Kurucaşile', 74, 1496)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (925, N'Ulus', 74, 1701)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (926, N'Amasra', 74, 1761)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (927, N'Ardahan Merkez', 75, 1144)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (928, N'Çıldır', 75, 1252)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (929, N'Göle', 75, 1356)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (930, N'Hanak', 75, 1380)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (931, N'Posof', 75, 1579)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (932, N'Damal', 75, 2008)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (933, N'Aralık', 76, 1142)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (934, N'Iğdır Merkez', 76, 1398)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (935, N'Tuzluca', 76, 1692)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (936, N'Karakoyunlu', 76, 2011)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (937, N'Yalova Merkez', 77, 1716)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (938, N'Altınova', 77, 2019)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (939, N'Armutlu', 77, 2020)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (940, N'Çınarcık', 77, 2021)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (941, N'Çiftlikköy', 77, 2022)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (942, N'Termal', 77, 2026)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (943, N'Eflani', 78, 1296)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (944, N'Eskipazar', 78, 1321)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (945, N'Karabük Merkez', 78, 1433)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (946, N'Ovacık / Karabük', 78, 1561)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (947, N'Safranbolu', 78, 1587)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (948, N'Yenice / Karabük', 78, 1856)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (949, N'Kilis Merkez', 79, 1476)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (950, N'Elbeyli', 79, 2023)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (951, N'Musabeyli', 79, 2024)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (952, N'Polateli', 79, 2025)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (953, N'Bahçe', 80, 1165)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (954, N'Kadirli', 80, 1423)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (955, N'Osmaniye Merkez', 80, 1560)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (956, N'Düziçi', 80, 1743)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (957, N'Hasanbeyli', 80, 2027)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (958, N'Sumbas', 80, 2028)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (959, N'Toprakkale', 80, 2029)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (960, N'Akçakoca', 81, 1116)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (961, N'Düzce Merkez', 81, 1292)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (962, N'Yığılca', 81, 1730)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (963, N'Cumayeri', 81, 1784)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (964, N'Gölyaka', 81, 1794)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (965, N'Çilimli', 81, 1905)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (966, N'Gümüşova', 81, 2017)
INSERT [dbo].[DefLocationCounties] ([CountyId], [Name], [CityId], [LocalCode]) VALUES (967, N'Kaynaşlı', 81, 2031)
SET IDENTITY_INSERT [dbo].[DefLocationCounties] OFF
INSERT [dbo].[DefLocationCountries] ([CountryId], [Name]) VALUES (90, N'Türkiye')
SET IDENTITY_INSERT [dbo].[DefOrderTypes] ON 

INSERT [dbo].[DefOrderTypes] ([OrderTypeId], [OrderTypeName]) VALUES (1, N'Komple araç arıyorum')
INSERT [dbo].[DefOrderTypes] ([OrderTypeId], [OrderTypeName]) VALUES (2, N'Araçta boş yer arıyorum')
INSERT [dbo].[DefOrderTypes] ([OrderTypeId], [OrderTypeName]) VALUES (3, N'Komple boş aracım var')
INSERT [dbo].[DefOrderTypes] ([OrderTypeId], [OrderTypeName]) VALUES (4, N'Araçta boş yerim var')
SET IDENTITY_INSERT [dbo].[DefOrderTypes] OFF
SET IDENTITY_INSERT [dbo].[DefProductPackages] ON 

INSERT [dbo].[DefProductPackages] ([ProductPackageId], [ProductPackageName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (1, N'Koli', 15, CAST(N'2014-12-26 02:32:00' AS SmallDateTime), 0, NULL, NULL)
INSERT [dbo].[DefProductPackages] ([ProductPackageId], [ProductPackageName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (2, N'Palet', 15, CAST(N'2014-12-26 02:32:00' AS SmallDateTime), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DefProductPackages] OFF
SET IDENTITY_INSERT [dbo].[DefProductProperties] ON 

INSERT [dbo].[DefProductProperties] ([ProductPropertyId], [ProductPropertyName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (1, N'Narin', 15, CAST(N'2014-12-25 13:41:00' AS SmallDateTime), 0, NULL, NULL)
INSERT [dbo].[DefProductProperties] ([ProductPropertyId], [ProductPropertyName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (2, N'Soğuk Hava Ürünü', 15, CAST(N'2014-12-25 13:41:00' AS SmallDateTime), 0, NULL, NULL)
INSERT [dbo].[DefProductProperties] ([ProductPropertyId], [ProductPropertyName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (3, N'Koku Yayan Ürün', 15, CAST(N'2014-12-25 13:42:00' AS SmallDateTime), 0, 15, CAST(N'2014-12-25 13:42:00' AS SmallDateTime))
INSERT [dbo].[DefProductProperties] ([ProductPropertyId], [ProductPropertyName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (4, N'Değerli Ürün', 15, CAST(N'2014-12-25 13:42:00' AS SmallDateTime), 0, 15, CAST(N'2014-12-25 13:42:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[DefProductProperties] OFF
SET IDENTITY_INSERT [dbo].[DefProductTypes] ON 

INSERT [dbo].[DefProductTypes] ([ProductTypeId], [ProductTypeName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (1, N'Zzzz', 15, CAST(N'2014-12-25 13:54:00' AS SmallDateTime), 1, 15, CAST(N'2014-12-25 13:55:00' AS SmallDateTime))
INSERT [dbo].[DefProductTypes] ([ProductTypeId], [ProductTypeName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (2, N'Yok', 15, CAST(N'2014-12-25 13:54:00' AS SmallDateTime), 1, 15, CAST(N'2014-12-25 13:55:00' AS SmallDateTime))
INSERT [dbo].[DefProductTypes] ([ProductTypeId], [ProductTypeName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (3, N'Ayakkabı', 15, CAST(N'2014-12-26 02:41:00' AS SmallDateTime), 0, NULL, NULL)
INSERT [dbo].[DefProductTypes] ([ProductTypeId], [ProductTypeName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (4, N'Dondurulmuş Gıda', 15, CAST(N'2014-12-26 02:45:00' AS SmallDateTime), 0, NULL, NULL)
INSERT [dbo].[DefProductTypes] ([ProductTypeId], [ProductTypeName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (5, N'Gıda', 15, CAST(N'2014-12-26 02:46:00' AS SmallDateTime), 0, NULL, NULL)
INSERT [dbo].[DefProductTypes] ([ProductTypeId], [ProductTypeName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (6, N'Elektronik', 15, CAST(N'2014-12-26 02:47:00' AS SmallDateTime), 0, NULL, NULL)
INSERT [dbo].[DefProductTypes] ([ProductTypeId], [ProductTypeName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (7, N'Mobilya', 15, CAST(N'2014-12-26 02:47:00' AS SmallDateTime), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DefProductTypes] OFF
SET IDENTITY_INSERT [dbo].[DefProductUnits] ON 

INSERT [dbo].[DefProductUnits] ([ProductUnitId], [ProductUnitName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (3, N'Hakan', 15, CAST(N'2014-12-25 12:06:00' AS SmallDateTime), 1, 15, CAST(N'2014-12-25 13:19:00' AS SmallDateTime))
INSERT [dbo].[DefProductUnits] ([ProductUnitId], [ProductUnitName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (4, N'Kilo', 15, CAST(N'2014-12-25 13:09:00' AS SmallDateTime), 1, 15, CAST(N'2014-12-25 13:10:00' AS SmallDateTime))
INSERT [dbo].[DefProductUnits] ([ProductUnitId], [ProductUnitName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (5, N'Deneme', 15, CAST(N'2014-12-25 13:18:00' AS SmallDateTime), 1, 15, CAST(N'2014-12-25 13:19:00' AS SmallDateTime))
INSERT [dbo].[DefProductUnits] ([ProductUnitId], [ProductUnitName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (6, N'Test', 15, CAST(N'2014-12-25 13:19:00' AS SmallDateTime), 1, 15, CAST(N'2014-12-25 13:19:00' AS SmallDateTime))
INSERT [dbo].[DefProductUnits] ([ProductUnitId], [ProductUnitName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (7, N'M³', 15, CAST(N'2014-12-26 02:41:00' AS SmallDateTime), 0, NULL, NULL)
INSERT [dbo].[DefProductUnits] ([ProductUnitId], [ProductUnitName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (8, N'Kg', 15, CAST(N'2014-12-26 02:41:00' AS SmallDateTime), 0, NULL, NULL)
INSERT [dbo].[DefProductUnits] ([ProductUnitId], [ProductUnitName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (9, N'Desi', 14, CAST(N'2014-12-26 03:36:00' AS SmallDateTime), 0, NULL, NULL)
INSERT [dbo].[DefProductUnits] ([ProductUnitId], [ProductUnitName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (10, N'Adet', 14, CAST(N'2014-12-26 03:37:00' AS SmallDateTime), 0, NULL, NULL)
INSERT [dbo].[DefProductUnits] ([ProductUnitId], [ProductUnitName], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (11, N'Kasa', 15, CAST(N'2014-12-31 14:25:00' AS SmallDateTime), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DefProductUnits] OFF
SET IDENTITY_INSERT [dbo].[DefVehicleTypes] ON 

INSERT [dbo].[DefVehicleTypes] ([VehicleTypeId], [VehicleTypeName], [VehicleWidth], [VehicleLength], [VehicleHeight], [VehicleVolume], [VehicleDesi], [VehicleWeight], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (26, N'Eryertyerty', CAST(1.11 AS Decimal(7, 2)), CAST(3.33 AS Decimal(7, 2)), CAST(4.44 AS Decimal(7, 2)), CAST(16.41 AS Decimal(10, 2)), 5471, 312321, 15, CAST(N'2014-12-25 13:11:00' AS SmallDateTime), 1, 15, CAST(N'2014-12-25 13:21:00' AS SmallDateTime))
INSERT [dbo].[DefVehicleTypes] ([VehicleTypeId], [VehicleTypeName], [VehicleWidth], [VehicleLength], [VehicleHeight], [VehicleVolume], [VehicleDesi], [VehicleWeight], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (27, N'Tır Tenteli', CAST(2.45 AS Decimal(7, 2)), CAST(13.60 AS Decimal(7, 2)), CAST(2.65 AS Decimal(7, 2)), CAST(88.30 AS Decimal(10, 2)), 29433, 28000, 14, CAST(N'2014-12-26 03:34:00' AS SmallDateTime), 0, NULL, NULL)
INSERT [dbo].[DefVehicleTypes] ([VehicleTypeId], [VehicleTypeName], [VehicleWidth], [VehicleLength], [VehicleHeight], [VehicleVolume], [VehicleDesi], [VehicleWeight], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (28, N'40 Ayak', CAST(2.45 AS Decimal(7, 2)), CAST(9.60 AS Decimal(7, 2)), CAST(2.60 AS Decimal(7, 2)), CAST(61.15 AS Decimal(10, 2)), 20383, 20000, 14, CAST(N'2014-12-26 03:35:00' AS SmallDateTime), 0, NULL, NULL)
INSERT [dbo].[DefVehicleTypes] ([VehicleTypeId], [VehicleTypeName], [VehicleWidth], [VehicleLength], [VehicleHeight], [VehicleVolume], [VehicleDesi], [VehicleWeight], [CreatedBy], [CreatedOn], [IsDeleted], [DeletedBy], [DeletedOn]) VALUES (29, N'Deneme Arabası', CAST(1.25 AS Decimal(7, 2)), CAST(1.22 AS Decimal(7, 2)), CAST(3.33 AS Decimal(7, 2)), CAST(5.08 AS Decimal(10, 2)), 1693, 256323, 15, CAST(N'2014-12-29 02:17:00' AS SmallDateTime), 1, 15, CAST(N'2014-12-29 02:17:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[DefVehicleTypes] OFF
SET IDENTITY_INSERT [dbo].[Firms] ON 

INSERT [dbo].[Firms] ([FirmId], [FirmName], [CountyId], [Address], [Phone1], [Phone2], [Fax], [MobilePhone], [Email], [WebSite], [TaxOffice], [TaxNo], [CreatedBy], [IsApproved], [ApprovedBy], [ApprovedOn], [CreatedOn], [UpdatedOn]) VALUES (14, N'Karamsa', 848, N'Kargı Çıkmazı No:2/1 Cerrahpaşa', N'2125465465', NULL, N'2132165465', N'5322118390', NULL, N'http://hakanhamzaoglu.com', N'Karaçalı', N'0002525363', 19, 1, 15, CAST(N'2014-12-27 04:18:00' AS SmallDateTime), CAST(N'2014-12-21 15:55:00' AS SmallDateTime), CAST(N'2014-12-21 20:03:00' AS SmallDateTime))
INSERT [dbo].[Firms] ([FirmId], [FirmName], [CountyId], [Address], [Phone1], [Phone2], [Fax], [MobilePhone], [Email], [WebSite], [TaxOffice], [TaxNo], [CreatedBy], [IsApproved], [ApprovedBy], [ApprovedOn], [CreatedOn], [UpdatedOn]) VALUES (15, N'Hakan Lojistik', 644, N'Cadde Sokak', N'5558889996', NULL, NULL, N'5322118390', N'hakan@hakanhamzaoglu.com', NULL, N'Sefer', N'0022113366', 20, 1, 15, CAST(N'2014-12-27 04:16:00' AS SmallDateTime), CAST(N'2014-12-21 16:53:00' AS SmallDateTime), CAST(N'2014-12-21 20:57:00' AS SmallDateTime))
INSERT [dbo].[Firms] ([FirmId], [FirmName], [CountyId], [Address], [Phone1], [Phone2], [Fax], [MobilePhone], [Email], [WebSite], [TaxOffice], [TaxNo], [CreatedBy], [IsApproved], [ApprovedBy], [ApprovedOn], [CreatedOn], [UpdatedOn]) VALUES (16, N'Ekan Lojistik', 453, N'Teknopark Sokak Teknopark Ap. No:112', N'4534534534', NULL, N'2342342344', N'5492641804', N'ekanmehmetoyman@hotmail.com', NULL, N'Başakşehir', N'2222222222', 32, 0, 14, CAST(N'2014-12-26 06:08:00' AS SmallDateTime), CAST(N'2014-12-22 11:03:00' AS SmallDateTime), NULL)
INSERT [dbo].[Firms] ([FirmId], [FirmName], [CountyId], [Address], [Phone1], [Phone2], [Fax], [MobilePhone], [Email], [WebSite], [TaxOffice], [TaxNo], [CreatedBy], [IsApproved], [ApprovedBy], [ApprovedOn], [CreatedOn], [UpdatedOn]) VALUES (17, N'Ahmet Lojistik', 422, N'Jasdlkasdjalksdjalskdjasdkajsdlkasjd', N'2323234234', NULL, N'3453453453', N'5322118390', N'ahmet@ltsyazilim.com', NULL, N'Beşiktaş', N'2342342342', 33, 1, 15, CAST(N'2014-12-29 02:17:00' AS SmallDateTime), CAST(N'2014-12-23 10:50:00' AS SmallDateTime), CAST(N'2014-12-23 10:51:00' AS SmallDateTime))
INSERT [dbo].[Firms] ([FirmId], [FirmName], [CountyId], [Address], [Phone1], [Phone2], [Fax], [MobilePhone], [Email], [WebSite], [TaxOffice], [TaxNo], [CreatedBy], [IsApproved], [ApprovedBy], [ApprovedOn], [CreatedOn], [UpdatedOn]) VALUES (18, N'Emmioğlu Tic.', 417, N'Mezitli', N'2121212212', NULL, NULL, N'5466761200', NULL, NULL, N'Mezitli', N'8787878787', 27, 0, 15, CAST(N'2014-12-26 14:47:00' AS SmallDateTime), CAST(N'2014-12-24 10:13:00' AS SmallDateTime), NULL)
SET IDENTITY_INSERT [dbo].[Firms] OFF
SET IDENTITY_INSERT [dbo].[LogMembershipCheckPasswordRenewalCodes] ON 

INSERT [dbo].[LogMembershipCheckPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (40, N'www@hakanhamzaoglu.com', 7, N'178.240.143.38', CAST(N'2014-12-14 13:13:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipCheckPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (41, N'www@hakanhamzaoglu.com', 0, N'178.240.143.38', CAST(N'2014-12-14 13:13:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipCheckPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (42, N'4@hakanhamzaoglu.com', 0, N'178.240.143.38', CAST(N'2014-12-14 14:57:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipCheckPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (43, N'5@hakanhamzaoglu.com', 0, N'::1', CAST(N'2014-12-15 12:04:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipCheckPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (44, N'3@hakanhamzaoglu.com', 0, N'::1', CAST(N'2014-12-15 12:05:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipCheckPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (45, N'2@hakanhamzaoglu.com', 0, N'::1', CAST(N'2014-12-15 12:06:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipCheckPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (46, N'5@hakanhamzaoglu.com', 7, N'85.99.226.201', CAST(N'2014-12-15 09:40:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipCheckPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (47, N'ekan@ltsyazilim.com', 0, N'85.105.43.133', CAST(N'2014-12-16 10:41:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipCheckPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (48, N'ekan@ltsyazilim.com', 0, N'85.99.226.201', CAST(N'2014-12-19 02:13:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipCheckPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (49, N'www@hakanhamzaoglu.com', 0, N'::1', CAST(N'2014-12-21 20:52:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[LogMembershipCheckPasswordRenewalCodes] OFF
SET IDENTITY_INSERT [dbo].[LogMembershipLogins] ON 

INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (51, N'gsdgsd', 3, N'178.240.143.38', CAST(N'2014-12-14 12:32:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (52, N'www@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-14 20:32:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (53, N'sdfasdf', 3, N'178.240.143.38', CAST(N'2014-12-14 12:51:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (54, N'www@hakanhamzaoglu.com', 4, N'178.240.143.38', CAST(N'2014-12-14 12:51:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (55, N'hakan@hakanhamzaoglu.com', 2, N'178.240.143.38', CAST(N'2014-12-14 12:51:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (56, N'dere@hakanhamzaoglu.com', 1, N'178.240.143.38', CAST(N'2014-12-14 12:51:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (57, N'dere@hakanhamzaoglu.com', 1, N'178.240.143.38', CAST(N'2014-12-14 12:56:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (58, N'dere@hakanhamzaoglu.com', 1, N'178.240.143.38', CAST(N'2014-12-14 12:56:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (59, N'dere@hakanhamzaoglu.com', 1, N'178.240.143.38', CAST(N'2014-12-14 12:57:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (60, N'dere@hakanhamzaoglu.com', 1, N'178.240.143.38', CAST(N'2014-12-14 12:57:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (61, N'dere@hakanhamzaoglu.com', 1, N'178.240.143.38', CAST(N'2014-12-14 12:58:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (62, N'sdfasdsdgfsqsdfgsdfgsdf', 3, N'::1', CAST(N'2014-12-14 20:58:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (63, N'sdfasdfgsdgfsd', 3, N'::1', CAST(N'2014-12-14 20:58:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (64, N'sdgfsdfgsdg', 3, N'::1', CAST(N'2014-12-14 20:59:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (65, N'sadfasdf', 3, N'::1', CAST(N'2014-12-14 20:59:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (66, N'ffsdf', 3, N'::1', CAST(N'2014-12-14 21:00:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (67, N'gsdfg', 3, N'::1', CAST(N'2014-12-14 21:00:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (68, N'sdfgsdgf', 3, N'::1', CAST(N'2014-12-14 21:00:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (69, N'sdfgsdgf', 3, N'::1', CAST(N'2014-12-14 21:01:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (70, N'hakan@hakanhamzaoglu.com', 2, N'::1', CAST(N'2014-12-14 21:01:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (71, N'www@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-14 21:01:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (72, N'hakan', 3, N'178.240.143.38', CAST(N'2014-12-14 13:03:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (73, N'hakan@hakanhamzaoglu.com', 2, N'178.240.143.38', CAST(N'2014-12-14 13:03:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (74, N'www@hakanhamzaoglu.com', 4, N'178.240.143.38', CAST(N'2014-12-14 13:03:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (75, N'4@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-14 22:56:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (76, N'4@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-14 22:58:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (77, N'4@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-14 22:58:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (78, N'4@hakanhamzaoglu.com', 4, N'178.240.143.38', CAST(N'2014-12-14 14:58:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (79, N'4@hakanhamzaoglu.com', 4, N'178.240.143.38', CAST(N'2014-12-14 15:00:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (80, N'4@hakanhamzaoglu.com', 4, N'188.58.132.71', CAST(N'2014-12-14 15:25:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (81, N'4@hakanhamzaoglu.com', 4, N'188.58.132.71', CAST(N'2014-12-14 15:25:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (82, N'4@hakanhamzaoglu.com', 4, N'188.58.132.71', CAST(N'2014-12-14 15:50:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (83, N'4@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-15 00:24:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (84, N'3@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-15 00:25:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (85, N'3@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-15 11:01:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (86, N'5@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-15 12:03:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (87, N'3@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-15 12:04:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (88, N'2@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-15 12:05:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (89, N'mehmet@ltsyazilim.com', 4, N'85.99.226.201', CAST(N'2014-12-15 09:24:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (90, N'www@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-15 17:37:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (91, N'www@hakanhamzaoglu.com', 4, N'85.99.226.201', CAST(N'2014-12-15 09:41:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (92, N'ekan@ltsyazilim.com', 2, N'85.99.226.201', CAST(N'2014-12-16 10:39:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (93, N'ekan@ltsyazilim.com', 2, N'85.105.43.133', CAST(N'2014-12-16 10:39:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (94, N'ekan@ltsyazilim.com', 4, N'85.105.43.133', CAST(N'2014-12-16 10:40:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (95, N'www@hakanhamzaoglu.com', 4, N'178.240.175.69', CAST(N'2014-12-17 10:20:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (96, N'ekan@ltsyazilim.com', 4, N'85.99.226.201', CAST(N'2014-12-19 02:11:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (97, N'ekan@ltsyazilim.com', 4, N'85.99.226.201', CAST(N'2014-12-19 02:12:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (98, N'usersuper2@outlook.com', 3, N'84.240.9.6', CAST(N'2014-12-20 19:15:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (99, N'usersuper2@outlook.com', 3, N'84.240.9.6', CAST(N'2014-12-20 19:15:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (100, N'www@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-21 20:46:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (101, N'19@hakanhamzaoglu.com', 3, N'::1', CAST(N'2014-12-22 02:19:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (102, N'ekan@ltsyazilim.com', 4, N'85.99.226.201', CAST(N'2014-12-22 10:56:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (103, N'www@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-25 13:15:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (104, N'www@hakanhamzaoglu.com', 4, N'141.196.42.184', CAST(N'2014-12-25 14:02:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (105, N'www@hakanhamzaoglu.com', 4, N'141.196.42.184', CAST(N'2014-12-25 14:02:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (106, N'g@hakanhamzaoglu.com', 3, N'141.196.42.184', CAST(N'2014-12-25 14:02:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (107, N'g@hakanhamzaoglu.com', 3, N'141.196.42.184', CAST(N'2014-12-25 14:02:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (108, N'www@hakanhamzaoglu.com', 4, N'5.27.165.32', CAST(N'2014-12-26 02:09:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (109, N'www@hakanhamzaoglu.com', 4, N'5.27.165.32', CAST(N'2014-12-26 02:09:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (110, N'3@hakanhamzaoglu.com', 0, N'::1', CAST(N'2014-12-26 14:50:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (111, N'3@hakanhamzaoglu.com', 0, N'85.99.226.201', CAST(N'2014-12-26 09:26:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (112, N'hhhh@hakanhmzaoglu.com', 3, N'85.99.226.201', CAST(N'2014-12-27 04:10:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (113, N'hhhh@hakanhamzaoglu.com', 3, N'85.99.226.201', CAST(N'2014-12-27 04:13:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (114, N'hhhh@hakanhamzaoglu.com', 3, N'85.99.226.201', CAST(N'2014-12-27 04:14:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (115, N'sdgsdfgs', 3, N'192.168.2.2', CAST(N'2014-12-28 15:10:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (116, N'www@hakanhamzaoglu.com', 4, N'141.196.52.28', CAST(N'2014-12-29 01:36:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (117, N'sdfsdf', 3, N'141.196.52.28', CAST(N'2014-12-29 01:37:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (118, N'sdfsdfsdfgsdf', 3, N'141.196.52.28', CAST(N'2014-12-29 01:37:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (119, N'www@hakanhamzaoglu.com', 4, N'141.196.52.28', CAST(N'2014-12-29 02:15:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (120, N'www@hakanhamzaoglu.com', 4, N'141.196.52.28', CAST(N'2014-12-29 02:16:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (121, N'dsfgsdgs', 3, N'141.196.52.28', CAST(N'2014-12-29 02:16:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (122, N'www@hakanhamzaoglu.com', 4, N'141.196.52.28', CAST(N'2014-12-29 02:23:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (123, N'www@hakanhamzaoglu.com', 4, N'141.196.52.28', CAST(N'2014-12-29 02:26:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (124, N'www@hakanhamzaoglu.com', 4, N'141.196.52.28', CAST(N'2014-12-29 02:26:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (125, N'hhhh@hakanhmzaoglu.com', 1, N'141.196.52.28', CAST(N'2014-12-29 02:31:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (126, N'www@hakanhmzaoglu.com', 3, N'141.196.52.28', CAST(N'2014-12-29 02:32:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (127, N'sdfgsdgs', 3, N'141.196.52.28', CAST(N'2014-12-29 02:43:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (128, N'www@hakanhamzaoglu.com', 4, N'141.196.52.28', CAST(N'2014-12-29 02:43:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (129, N'wdfgsdfg', 3, N'5.27.161.222', CAST(N'2014-12-29 12:43:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (130, N'wdfgsdfg', 3, N'5.27.161.222', CAST(N'2014-12-29 12:43:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (131, N'wdfgsdfg', 3, N'5.27.161.222', CAST(N'2014-12-29 12:43:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (132, N'sadfasdf', 3, N'192.168.2.2', CAST(N'2014-12-29 13:53:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (133, N'sdfsdfsd', 3, N'192.168.2.2', CAST(N'2014-12-29 14:14:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (134, N'asdfasdfa', 3, N'192.168.2.2', CAST(N'2014-12-29 14:28:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (135, N' ilkay', 3, N'141.196.216.114', CAST(N'2014-12-30 14:01:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (136, N'ekan@ltsyazilim.com', 4, N'::1', CAST(N'2015-01-24 22:06:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (137, N'www@gmaıl.com', 3, N'::1', CAST(N'2015-01-24 22:10:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (138, N'www@gmaıl.com', 1, N'::1', CAST(N'2015-01-24 22:16:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (139, N'www@gmaıl.com', 1, N'::1', CAST(N'2015-01-24 22:16:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (140, N'anuj.rohila94@gmail.com', 0, N'::1', CAST(N'2015-01-25 14:49:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (141, N'anuj.rohila94@gmail.com', 0, N'::1', CAST(N'2015-01-25 19:25:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipLogins] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (142, N'anuj.rohila94@gmail.com', 0, N'::1', CAST(N'2015-01-25 19:35:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[LogMembershipLogins] OFF
SET IDENTITY_INSERT [dbo].[LogMembershipRegisterCheckCodes] ON 

INSERT [dbo].[LogMembershipRegisterCheckCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (46, N'2@hakanhamzaoglu.com', 0, N'178.240.143.38', CAST(N'2014-12-14 13:18:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterCheckCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (47, N'5@hakanhamzaoglu.com', 0, N'::1', CAST(N'2014-12-15 12:01:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterCheckCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (48, N'mehmet@ltsyazilim.com', 0, N'85.99.226.201', CAST(N'2014-12-15 09:23:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterCheckCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (49, N'ahmet@ltsyazilim.com', 0, N'85.99.226.201', CAST(N'2014-12-24 07:00:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterCheckCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (50, N'ahmet@ltsyazilim.com', 0, N'85.99.226.201', CAST(N'2014-12-27 06:22:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[LogMembershipRegisterCheckCodes] OFF
SET IDENTITY_INSERT [dbo].[LogMembershipRegisterReSendCodes] ON 

INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (91, N'hakan2@hakanhamzaoglu.com', 1, N'88.238.97.150', CAST(N'2014-12-12 15:23:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (92, N'hakan2@hakanhamzaoglu.com', 4, N'88.238.97.150', CAST(N'2014-12-12 15:23:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (93, N'www@hakanhamzaoglu.com', 1, N'::1', CAST(N'2014-12-13 01:15:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (94, N'www@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-13 01:16:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (95, N'www@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-13 01:16:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (96, N'dere@hakanhamzaoglu.com', 1, N'::1', CAST(N'2014-12-13 10:49:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (97, N'dere@hakanhamzaoglu.com', 4, N'::1', CAST(N'2014-12-13 10:49:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (98, N'dere@hakanhamzaoglu.com', 1, N'::1', CAST(N'2014-12-14 19:24:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (99, N'2@hakanhamzaoglu.com', 1, N'178.240.143.38', CAST(N'2014-12-14 13:17:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (100, N'metinzontul@gmail.com', 1, N'85.99.226.201', CAST(N'2014-12-15 02:29:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (101, N'metin@hakanhamzaoglu.com', 1, N'85.99.226.201', CAST(N'2014-12-15 02:32:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (102, N'metin@hakanhamzaoglu.com', 4, N'85.99.226.201', CAST(N'2014-12-15 02:32:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (103, N'mehmet@ltsyazilim.com', 1, N'85.99.226.201', CAST(N'2014-12-15 09:22:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (104, N'lokmanceylan1991@gmail.com', 1, N'85.99.226.201', CAST(N'2014-12-15 09:22:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (105, N'mehmet@ltsyazilim.com', 4, N'85.99.226.201', CAST(N'2014-12-15 09:22:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (106, N'ahmet@ltsyazilim.com', 3, N'85.99.226.201', CAST(N'2014-12-15 09:22:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (107, N'hhhh@hakanhmzaoglu.com', 1, N'85.99.226.201', CAST(N'2014-12-27 04:11:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (108, N'hhhh@hakanhmzaoglu.com', 4, N'85.99.226.201', CAST(N'2014-12-27 04:11:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (109, N'hhhh@hakanhmzaoglu.com', 254, N'141.196.52.28', CAST(N'2014-12-29 02:31:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (110, N'hhhh@hakanhmzaoglu.com', 254, N'141.196.52.28', CAST(N'2014-12-29 02:31:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipRegisterReSendCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (111, N'hhhh@hakanhmzaoglu.com', 254, N'141.196.52.28', CAST(N'2014-12-29 02:31:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[LogMembershipRegisterReSendCodes] OFF
SET IDENTITY_INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ON 

INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (294, N'www@hakanhamzaoglu.com', 3, N'178.240.143.38', CAST(N'2014-12-14 13:05:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (295, N'www@hakanhamzaoglu.com', 3, N'178.240.143.38', CAST(N'2014-12-14 13:06:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (296, N'www@hakanhamzaoglu.com', 3, N'178.240.143.38', CAST(N'2014-12-14 13:07:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (297, N'www@hakanhamzaoglu.com', 0, N'178.240.143.38', CAST(N'2014-12-14 13:07:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (298, N'www@hakanhamzaoglu.com', 3, N'178.240.143.38', CAST(N'2014-12-14 13:07:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (299, N'www@hakanhamzaoglu.com', 3, N'178.240.143.38', CAST(N'2014-12-14 13:08:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (300, N'1@hakanhamzaoglu.com', 4, N'178.240.143.38', CAST(N'2014-12-14 13:08:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (301, N'4@hakanhamzaoglu.com', 0, N'::1', CAST(N'2014-12-14 22:57:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (302, N'3@hakanhamzaoglu.com', 0, N'::1', CAST(N'2014-12-15 11:01:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (303, N'3@hakanhamzaoglu.com', 3, N'::1', CAST(N'2014-12-15 11:01:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (304, N'5@hakanhamzaoglu.com', 0, N'::1', CAST(N'2014-12-15 12:03:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (305, N'3@hakanhamzaoglu.com', 0, N'::1', CAST(N'2014-12-15 12:04:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (306, N'2@hakanhamzaoglu.com', 0, N'::1', CAST(N'2014-12-15 12:05:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (307, N'5@hakanhamzaoglu.com', 0, N'::1', CAST(N'2014-12-15 17:37:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (308, N'5@hakanhamzaoglu.com', 3, N'85.99.226.201', CAST(N'2014-12-15 09:40:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (309, N'ekan@ltsyazilim.com', 0, N'85.105.43.133', CAST(N'2014-12-16 10:40:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (310, N'ekan@ltsyazilim.com', 0, N'85.99.226.201', CAST(N'2014-12-19 02:12:00' AS SmallDateTime))
INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] ([LogId], [Email], [Result], [IP], [CreatedOn]) VALUES (311, N'www@hakanhamzaoglu.com', 0, N'::1', CAST(N'2014-12-21 20:47:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[LogMembershipSendPasswordRenewalCodes] OFF
SET IDENTITY_INSERT [dbo].[LogSystemMailSend] ON 

INSERT [dbo].[LogSystemMailSend] ([LogId], [Email], [ErrorMessage], [PageName], [IP], [CreatedOn]) VALUES (6, N'dsfgsdfgsdfgsdf', N'The specified string is not in the form required for an e-mail address.', N'Register', N'85.99.226.201', CAST(N'2014-12-15 02:32:00' AS SmallDateTime))
INSERT [dbo].[LogSystemMailSend] ([LogId], [Email], [ErrorMessage], [PageName], [IP], [CreatedOn]) VALUES (7, N'hhhh@hakanhmzaoglu.com', N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'RegisterReSendActivateCode', N'141.196.52.28', CAST(N'2014-12-29 02:31:00' AS SmallDateTime))
INSERT [dbo].[LogSystemMailSend] ([LogId], [Email], [ErrorMessage], [PageName], [IP], [CreatedOn]) VALUES (8, N'hhhh@hakanhmzaoglu.com', N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'RegisterReSendActivateCode', N'141.196.52.28', CAST(N'2014-12-29 02:31:00' AS SmallDateTime))
INSERT [dbo].[LogSystemMailSend] ([LogId], [Email], [ErrorMessage], [PageName], [IP], [CreatedOn]) VALUES (9, N'hhhh@hakanhmzaoglu.com', N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'RegisterReSendActivateCode', N'141.196.52.28', CAST(N'2014-12-29 02:31:00' AS SmallDateTime))
INSERT [dbo].[LogSystemMailSend] ([LogId], [Email], [ErrorMessage], [PageName], [IP], [CreatedOn]) VALUES (10, N'ilkayyelmen@ltsyazilim.com', N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'Register', N'141.196.216.114', CAST(N'2014-12-30 14:07:00' AS SmallDateTime))
INSERT [dbo].[LogSystemMailSend] ([LogId], [Email], [ErrorMessage], [PageName], [IP], [CreatedOn]) VALUES (11, N'ilkayyelmen@hotmail.com', N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'Register', N'141.196.216.114', CAST(N'2014-12-30 14:07:00' AS SmallDateTime))
INSERT [dbo].[LogSystemMailSend] ([LogId], [Email], [ErrorMessage], [PageName], [IP], [CreatedOn]) VALUES (12, N'ekan1@ltsyazilim.com', N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'Register', N'::1', CAST(N'2015-01-24 21:43:00' AS SmallDateTime))
INSERT [dbo].[LogSystemMailSend] ([LogId], [Email], [ErrorMessage], [PageName], [IP], [CreatedOn]) VALUES (13, N'www@gmaıl.com', N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'Register', N'::1', CAST(N'2015-01-24 22:09:00' AS SmallDateTime))
INSERT [dbo].[LogSystemMailSend] ([LogId], [Email], [ErrorMessage], [PageName], [IP], [CreatedOn]) VALUES (14, N'anuj.rohila94@gmail.com', NULL, N'Register', N'::1', CAST(N'2015-01-25 14:44:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[LogSystemMailSend] OFF
SET IDENTITY_INSERT [dbo].[MapFirmToUser] ON 

INSERT [dbo].[MapFirmToUser] ([MapId], [FirmId], [UserId], [IsAdmin], [IsActive], [CreatedOn]) VALUES (15, 14, 19, 1, 1, CAST(N'2014-12-21 15:55:00' AS SmallDateTime))
INSERT [dbo].[MapFirmToUser] ([MapId], [FirmId], [UserId], [IsAdmin], [IsActive], [CreatedOn]) VALUES (16, 15, 20, 1, 1, CAST(N'2014-12-21 16:54:00' AS SmallDateTime))
INSERT [dbo].[MapFirmToUser] ([MapId], [FirmId], [UserId], [IsAdmin], [IsActive], [CreatedOn]) VALUES (17, 16, 32, 1, 1, CAST(N'2014-12-22 11:03:00' AS SmallDateTime))
INSERT [dbo].[MapFirmToUser] ([MapId], [FirmId], [UserId], [IsAdmin], [IsActive], [CreatedOn]) VALUES (18, 17, 33, 1, 0, CAST(N'2014-12-23 10:50:00' AS SmallDateTime))
INSERT [dbo].[MapFirmToUser] ([MapId], [FirmId], [UserId], [IsAdmin], [IsActive], [CreatedOn]) VALUES (19, 18, 27, 1, 0, CAST(N'2014-12-24 10:13:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[MapFirmToUser] OFF
SET IDENTITY_INSERT [dbo].[Membership] ON 

INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (14, N'ekan@ltsyazilim.com', N'MqD0X3XQgL9MAjnzpbpZCziF3m8owp55NmGOLVFA9wfnkpPyov8vopO+ofb81Poe', N'Ekan', N'Oyman', 0, 3, 0, 5, CAST(N'2014-12-26 06:09:00' AS SmallDateTime), CAST(N'2014-12-19 02:13:00' AS SmallDateTime), N'', CAST(N'2014-12-12 15:24:00' AS SmallDateTime), N'88.238.97.150', CAST(N'2014-12-12 15:23:00' AS SmallDateTime), CAST(N'2014-12-26 06:09:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (15, N'www@hakanhamzaoglu.com', N'kIcvByX7TBiQe4MnjF3mOHI/WobwY123DLOUZJNfg3cM9GDmCqYV7N38ZnA1/fKb', N'Hakan', N'Hamzaoğlu', 0, 3, 0, 28, CAST(N'2014-12-31 14:24:00' AS SmallDateTime), CAST(N'2014-12-21 20:52:00' AS SmallDateTime), N'', CAST(N'2014-12-12 17:19:00' AS SmallDateTime), N'::1', CAST(N'2014-12-13 01:15:00' AS SmallDateTime), CAST(N'2014-12-31 14:24:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (16, N'dere@hakanhamzaoglu.com', N'v7s1ZRcZXUbAX9PuSkPcpa0fPup1DQiRdzX6ZwhmYKHxNUFrdRIGSUi7CnBD+8lh', N'Hakan', N'Dere', 1, 0, 0, 0, NULL, NULL, N'645d0d8b-4f1f-4107-8d1b-bb934570f0ea', NULL, N'::1', CAST(N'2014-12-13 10:48:00' AS SmallDateTime), NULL)
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (17, N'1@hakanhamzaoglu.com', N'kIcvByX7TBiQe4MnjF3mOHI/WobwY123DLOUZJNfg3cM9GDmCqYV7N38ZnA1/fKb', N'Hakan', N'Hamzaoğlu', 0, 0, 0, 0, CAST(N'2014-12-14 13:15:00' AS SmallDateTime), NULL, N'', CAST(N'2014-12-14 13:15:00' AS SmallDateTime), N'178.240.143.38', CAST(N'2014-12-14 13:08:00' AS SmallDateTime), CAST(N'2014-12-14 13:15:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (18, N'2@hakanhamzaoglu.com', N'IhSdQDCb5UnxMdzrI9Ilxw35cbaCWzYMdAOlhzpKs0DuWkfWM9eCNxrXw6Wi7Zni', N'Hakan', N'Hamzaoğlu', 0, 0, 0, 1, CAST(N'2014-12-15 12:06:00' AS SmallDateTime), CAST(N'2014-12-15 12:06:00' AS SmallDateTime), N'', CAST(N'2014-12-14 13:17:00' AS SmallDateTime), N'178.240.143.38', CAST(N'2014-12-14 13:17:00' AS SmallDateTime), CAST(N'2014-12-15 12:06:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (19, N'3@hakanhamzaoglu.com', N'kIcvByX7TBiQe4MnjF3mOHI/WobwY123DLOUZJNfg3cM9GDmCqYV7N38ZnA1/fKb', N'Hakan', N'Hamzaoğlu', 0, 1, 0, 3, CAST(N'2014-12-26 09:26:00' AS SmallDateTime), CAST(N'2014-12-15 12:05:00' AS SmallDateTime), N'', CAST(N'2014-12-14 13:19:00' AS SmallDateTime), N'178.240.143.38', CAST(N'2014-12-14 13:19:00' AS SmallDateTime), CAST(N'2014-12-26 09:26:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (20, N'4@hakanhamzaoglu.com', N'kIcvByX7TBiQe4MnjF3mOHI/WobwY123DLOUZJNfg3cM9GDmCqYV7N38ZnA1/fKb', N'Hakan', N'Hamzaoğlu', 0, 2, 0, 9, CAST(N'2014-12-30 10:07:00' AS SmallDateTime), CAST(N'2014-12-14 14:57:00' AS SmallDateTime), N'', CAST(N'2014-12-14 14:54:00' AS SmallDateTime), N'178.240.143.38', CAST(N'2014-12-14 14:54:00' AS SmallDateTime), CAST(N'2014-12-30 10:07:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (21, N'metinzontul@gmail.com', N'nWPnBOvtuXnxI+UKInfpU8FpgW1I3f3Znymzk3xXmI2vC8I0z68/b0XUaP+XlPBF', N'Metin', N'Zontul', 1, 0, 0, 0, NULL, NULL, N'3771acf7-c514-48bb-a677-4935ad52d6e1', NULL, N'85.99.226.201', CAST(N'2014-12-15 02:28:00' AS SmallDateTime), NULL)
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (22, N'metinasdfasdf@gmail.com.comcmcm', N'HeabqyQWjhvcQdWcgI/6hQOlhQY8/uOi2jMG02Gn339hfC5xEgUXSUOpuAKmR81s', N'Metin', N'Zontul', 1, 0, 0, 0, NULL, NULL, N'f9291e4c-6de0-40ed-b772-e551982fe063', NULL, N'85.99.226.201', CAST(N'2014-12-15 02:31:00' AS SmallDateTime), NULL)
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (23, N'metin@hakanhamzaoglu.com', N'kIcvByX7TBiQe4MnjF3mOHI/WobwY123DLOUZJNfg3cM9GDmCqYV7N38ZnA1/fKb', N'Metin', N'Zontul', 0, 0, 0, 0, CAST(N'2014-12-15 02:33:00' AS SmallDateTime), NULL, N'', CAST(N'2014-12-15 02:33:00' AS SmallDateTime), N'85.99.226.201', CAST(N'2014-12-15 02:32:00' AS SmallDateTime), CAST(N'2014-12-15 02:33:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (24, N'5@hakanhamzaoglu.com', N'kIcvByX7TBiQe4MnjF3mOHI/WobwY123DLOUZJNfg3cM9GDmCqYV7N38ZnA1/fKb', N'Hakan', N'Hamzaoğlu', 0, 0, 0, 1, CAST(N'2014-12-22 06:03:00' AS SmallDateTime), CAST(N'2014-12-15 12:04:00' AS SmallDateTime), N'', CAST(N'2014-12-15 04:01:00' AS SmallDateTime), N'::1', CAST(N'2014-12-15 12:00:00' AS SmallDateTime), CAST(N'2014-12-22 06:03:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (25, N'6@hakanhamzaoglu.com', N'kIcvByX7TBiQe4MnjF3mOHI/WobwY123DLOUZJNfg3cM9GDmCqYV7N38ZnA1/fKb', N'Hakan', N'Hamzaoğlu', 0, 0, 0, 0, CAST(N'2014-12-15 12:02:00' AS SmallDateTime), NULL, N'', CAST(N'2014-12-15 12:02:00' AS SmallDateTime), N'::1', CAST(N'2014-12-15 12:02:00' AS SmallDateTime), CAST(N'2014-12-15 12:02:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (26, N'lokmanceylan1991@gmail.com', N'yIhKRU4nHoUYLtUqCH59KH3INcwC48HUbVNIEOqpThjFhWqsZWjSbE1ucMtPV80U', N'Lokman', N'Ceylan', 1, 0, 0, 0, NULL, NULL, N'40090564-7bc5-4287-a5a5-661297e23cc8', NULL, N'85.99.226.201', CAST(N'2014-12-15 09:21:00' AS SmallDateTime), NULL)
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (27, N'mehmet@ltsyazilim.com', N'9/n/z1szpmYp141/wa6lk+F5J5kwQYf9lUgJtEpiFMXrq2yRrJHEk9P6T+W0EyWZ', N'Mehmet', N'Alkaş', 0, 1, 0, 1, CAST(N'2014-12-24 10:29:00' AS SmallDateTime), NULL, N'', CAST(N'2014-12-15 09:22:00' AS SmallDateTime), N'85.99.226.201', CAST(N'2014-12-15 09:21:00' AS SmallDateTime), CAST(N'2014-12-24 10:29:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (28, N'alihakan@hakanhamzaoglu.com', N'kIcvByX7TBiQe4MnjF3mOHI/WobwY123DLOUZJNfg3cM9GDmCqYV7N38ZnA1/fKb', N'Ali Hakan', N'Tertemiz', 1, 0, 0, 0, NULL, NULL, N'f6632d89-bf4b-45fb-ac34-fd2ff9890541', NULL, N'::1', CAST(N'2014-12-21 14:39:00' AS SmallDateTime), NULL)
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (29, N'ahe@hakanhamzaoglu.com', N'kIcvByX7TBiQe4MnjF3mOHI/WobwY123DLOUZJNfg3cM9GDmCqYV7N38ZnA1/fKb', N'Ali Haydar', N'Egesoy', 1, 0, 0, 0, NULL, NULL, N'89ba35d2-e5e9-4680-81c0-35a9c91f0f5f', NULL, N'::1', CAST(N'2014-12-21 14:41:00' AS SmallDateTime), NULL)
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (30, N'aheg@hakanhamzaoglu.com', N'kIcvByX7TBiQe4MnjF3mOHI/WobwY123DLOUZJNfg3cM9GDmCqYV7N38ZnA1/fKb', N'Ali Haydar', N'Egesoy', 1, 0, 0, 0, NULL, NULL, N'1dd1600a-2bd4-434d-a576-0d3ed0b4e887', NULL, N'::1', CAST(N'2014-12-21 14:43:00' AS SmallDateTime), NULL)
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (31, N'mkb@hakanhamzaoglu.com', N'kIcvByX7TBiQe4MnjF3mOHI/WobwY123DLOUZJNfg3cM9GDmCqYV7N38ZnA1/fKb', N'Mustafa Kemal', N'Belek', 1, 0, 0, 0, NULL, NULL, N'a67920e6-44b7-4de7-a8e2-02fb14c3c559', NULL, N'::1', CAST(N'2014-12-21 14:47:00' AS SmallDateTime), NULL)
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (32, N'ekanmehmetoyman@hotmail.com', N'MqD0X3XQgL9MAjnzpbpZCziF3m8owp55NmGOLVFA9wfnkpPyov8vopO+ofb81Poe', N'Ekan Mehmet', N'Oyman', 0, 2, 0, 0, CAST(N'2014-12-26 06:10:00' AS SmallDateTime), NULL, N'', CAST(N'2014-12-22 11:00:00' AS SmallDateTime), N'85.99.226.201', CAST(N'2014-12-22 10:59:00' AS SmallDateTime), CAST(N'2014-12-26 06:10:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (33, N'ahmet@ltsyazilim.com', N'+jBEBX3G6VO7vvc1BI0ewYGh49kV9uuKJnsaNdh8Wckt0Os7b0TOH/QJDWMXC26S', N'Ahmet', N'Mehmet', 0, 1, 0, 0, CAST(N'2014-12-23 10:47:00' AS SmallDateTime), NULL, N'', CAST(N'2014-12-23 10:47:00' AS SmallDateTime), N'85.99.226.201', CAST(N'2014-12-23 10:46:00' AS SmallDateTime), CAST(N'2014-12-23 10:47:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (34, N'hhhh@hakanhmzaoglu.com', N'kIcvByX7TBiQe4MnjF3mOHI/WobwY123DLOUZJNfg3cM9GDmCqYV7N38ZnA1/fKb', N'Hakan', N'Hamzaoğlu', 1, 0, 0, 0, NULL, NULL, N'675b5838-e0a6-4dda-a1ac-79ac6b9b54ef', NULL, N'85.99.226.201', CAST(N'2014-12-27 04:11:00' AS SmallDateTime), NULL)
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (35, N'hhhh@hakanhamzaoglu.com', N'kIcvByX7TBiQe4MnjF3mOHI/WobwY123DLOUZJNfg3cM9GDmCqYV7N38ZnA1/fKb', N'Hakan', N'Hamzaoğlu', 0, 0, 0, 0, CAST(N'2014-12-27 04:14:00' AS SmallDateTime), NULL, N'', CAST(N'2014-12-27 04:14:00' AS SmallDateTime), N'85.99.226.201', CAST(N'2014-12-27 04:14:00' AS SmallDateTime), CAST(N'2014-12-27 04:14:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (36, N'www@gmaıl.com', N'+nKi0ETltsn4UbGy6lJl8dBN+bmmLrFJ0ZAdR9sfhQlFJgu6to8NkvsE8F+KVCEp', N'User1', N'User1', 0, 0, 0, 0, CAST(N'2015-01-24 22:19:00' AS SmallDateTime), NULL, N'3c832106-0653-47fb-8cdc-bd3d2d40f4ce', NULL, N'::1', CAST(N'2015-01-24 22:15:00' AS SmallDateTime), CAST(N'2015-01-24 22:19:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (42, N'anuj.rohila94@gmail.com', N'mHGUkzbm6QEEpgXCjIsYPz+SFatvyJocUyj42EAyKykiCzbz29wFgD0UenvI/r4P', N'Anuj', N'Rohıla', 0, 2, 0, 0, CAST(N'2015-01-26 08:11:00' AS SmallDateTime), NULL, N'5b2ca858-c90b-42c9-868f-e47c3f0e371d', NULL, N'::1', CAST(N'2015-01-25 19:44:00' AS SmallDateTime), CAST(N'2015-01-26 08:11:00' AS SmallDateTime))
INSERT [dbo].[Membership] ([UserId], [Email], [Password], [Name], [Surname], [StatusId], [RoleId], [IsDeleted], [FailedPasswordAttemptCount], [LastLoginDate], [LastPasswordChangeDate], [Comment], [VerifyOn], [IP], [CreatedOn], [UpdatedOn]) VALUES (43, N'sorathiyamayur111@gmail.com', N'+nKi0ETltsn4UbGy6lJl8dBN+bmmLrFJ0ZAdR9sfhQlFJgu6to8NkvsE8F+KVCEp', N'Mayur', N'Sorthiya', 0, 2, 0, 0, CAST(N'2015-01-26 20:08:00' AS SmallDateTime), NULL, N'356bd45e-73ed-4623-afe7-d45d1d5b0645', NULL, N'::1', CAST(N'2015-01-26 09:15:00' AS SmallDateTime), CAST(N'2015-01-26 20:08:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Membership] OFF
SET IDENTITY_INSERT [dbo].[MembershipPasswordRenewals] ON 

INSERT [dbo].[MembershipPasswordRenewals] ([RenewalId], [Email], [ActivateCode], [IP], [CreatedOn]) VALUES (17, N'4@hakanhamzaoglu.com', N'd964d3f6-640f-4bbe-9bbc-ad0621bb9e01', N'::1', CAST(N'2014-12-14 22:56:00' AS SmallDateTime))
INSERT [dbo].[MembershipPasswordRenewals] ([RenewalId], [Email], [ActivateCode], [IP], [CreatedOn]) VALUES (20, N'3@hakanhamzaoglu.com', N'e5ad65ba-fd25-45fa-b33f-f066e37af835', N'::1', CAST(N'2014-12-15 12:04:00' AS SmallDateTime))
INSERT [dbo].[MembershipPasswordRenewals] ([RenewalId], [Email], [ActivateCode], [IP], [CreatedOn]) VALUES (21, N'2@hakanhamzaoglu.com', N'673d2095-9b01-48d8-a536-939f063e5568', N'::1', CAST(N'2014-12-15 12:05:00' AS SmallDateTime))
INSERT [dbo].[MembershipPasswordRenewals] ([RenewalId], [Email], [ActivateCode], [IP], [CreatedOn]) VALUES (22, N'5@hakanhamzaoglu.com', N'fd08c845-d2a7-4e60-8be6-40df76eb4e7f', N'::1', CAST(N'2014-12-15 17:37:00' AS SmallDateTime))
INSERT [dbo].[MembershipPasswordRenewals] ([RenewalId], [Email], [ActivateCode], [IP], [CreatedOn]) VALUES (24, N'ekan@ltsyazilim.com', N'e092c907-ca96-48d8-b649-cfeba6f67abd', N'85.99.226.201', CAST(N'2014-12-19 02:12:00' AS SmallDateTime))
INSERT [dbo].[MembershipPasswordRenewals] ([RenewalId], [Email], [ActivateCode], [IP], [CreatedOn]) VALUES (25, N'www@hakanhamzaoglu.com', N'c5dc5d93-1880-4c4a-9823-3582280532c6', N'::1', CAST(N'2014-12-21 20:47:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[MembershipPasswordRenewals] OFF
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
