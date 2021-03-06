USE [LtsWeb]
GO
/****** Object:  StoredProcedure [dbo].[AdministratorSelectFirmDetails]    Script Date: 31.1.2015 08:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdministratorSelectFirmDetails]
(
@FirmId int
)
AS
BEGIN
SELECT  Firms.FirmId,
		Firms.FirmName,
		Firms.CreatedOn,
		DefLocationCounties.Name AS CountyName,
		DefLocationCities.Name AS CityName, 
		Membership.Name + ' ' + Membership.Surname AS [User], 
		DefLocationCountries.Name, 
		Membership.UserId, 
		Firms.Address, 
        Firms.Email, 
		Firms.WebSite, 
		Firms.TaxOffice, 
		'(' + SUBSTRING(Firms.Phone1,1,3) + ') ' + SUBSTRING(Firms.Phone1,4,3) + ' ' + SUBSTRING(Firms.Phone1,7,2) + ' ' + SUBSTRING(Firms.Phone1,9,2)  AS Phone1,
		'(' + SUBSTRING(Firms.Phone2,1,3) + ') ' + SUBSTRING(Firms.Phone2,4,3) + ' ' + SUBSTRING(Firms.Phone2,7,2) + ' ' + SUBSTRING(Firms.Phone2,9,2)  AS Phone2,
		'(' + SUBSTRING(Firms.Fax,1,3) + ') ' + SUBSTRING(Firms.Fax,4,3) + ' ' + SUBSTRING(Firms.Fax,7,2) + '' + SUBSTRING(Firms.Fax,9,2)  AS Fax,
		'(' + SUBSTRING(Firms.MobilePhone,1,3) + ') ' + SUBSTRING(Firms.MobilePhone,4,3) + ' ' + SUBSTRING(Firms.MobilePhone,7,2) + '' + SUBSTRING(Firms.MobilePhone,9,2)  AS MobilePhone,
		 SUBSTRING(Firms.TaxNo,1,3) + '-' + SUBSTRING(Firms.TaxNo,4,3) + '-' + SUBSTRING(Firms.TaxNo,7,2) + '-' + SUBSTRING(Firms.TaxNo,9,2)  AS TaxNo
FROM					 DefLocationCountries INNER JOIN
                         DefLocationCities INNER JOIN
                         DefLocationCounties ON DefLocationCities.CityId = DefLocationCounties.CityId ON DefLocationCountries.CountryId = DefLocationCities.CountryId RIGHT OUTER JOIN
                         Firms INNER JOIN
                         Membership ON Firms.CreatedBy = Membership.UserId ON DefLocationCounties.CountyId = Firms.CountyId
WHERE        (Firms.FirmId = @FirmId) AND (Firms.IsApproved = 'true')
ORDER BY Firms.CreatedOn DESC
END

GO
/****** Object:  StoredProcedure [dbo].[AdministratorSelectFirms]    Script Date: 31.1.2015 08:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdministratorSelectFirms]
AS
BEGIN
SELECT        Firms.FirmId, Firms.FirmName, Firms.CreatedOn, DefLocationCounties.Name AS CountyName, DefLocationCities.Name AS CityName, 
                         Membership.Name + ' ' + Membership.Surname AS [User]
FROM            Firms INNER JOIN
                         Membership ON Firms.CreatedBy = Membership.UserId LEFT OUTER JOIN
                         DefLocationCities INNER JOIN
                         DefLocationCounties ON DefLocationCities.CityId = DefLocationCounties.CityId ON Firms.CountyId = DefLocationCounties.CountyId
WHERE Firms.IsApproved = 'true'
ORDER BY Firms.CreatedOn DESC
END

GO
/****** Object:  StoredProcedure [dbo].[AdministratorSelectUnApprovedFirmDetails]    Script Date: 31.1.2015 08:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdministratorSelectUnApprovedFirmDetails]
(
@FirmId int
)
AS
BEGIN
SELECT  Firms.FirmId,
		Firms.FirmName,
		Firms.CreatedOn,
		DefLocationCounties.Name AS CountyName,
		DefLocationCities.Name AS CityName, 
		Membership.Name + ' ' + Membership.Surname AS [User], 
		DefLocationCountries.Name, 
		Membership.UserId, 
		Firms.Address, 
        Firms.Email, 
		Firms.WebSite, 
		Firms.TaxOffice, 
		'(' + SUBSTRING(Firms.Phone1,1,3) + ') ' + SUBSTRING(Firms.Phone1,4,3) + ' ' + SUBSTRING(Firms.Phone1,7,2) + ' ' + SUBSTRING(Firms.Phone1,9,2)  AS Phone1,
		'(' + SUBSTRING(Firms.Phone2,1,3) + ') ' + SUBSTRING(Firms.Phone2,4,3) + ' ' + SUBSTRING(Firms.Phone2,7,2) + ' ' + SUBSTRING(Firms.Phone2,9,2)  AS Phone2,
		'(' + SUBSTRING(Firms.Fax,1,3) + ') ' + SUBSTRING(Firms.Fax,4,3) + ' ' + SUBSTRING(Firms.Fax,7,2) + '' + SUBSTRING(Firms.Fax,9,2)  AS Fax,
		'(' + SUBSTRING(Firms.MobilePhone,1,3) + ') ' + SUBSTRING(Firms.MobilePhone,4,3) + ' ' + SUBSTRING(Firms.MobilePhone,7,2) + '' + SUBSTRING(Firms.MobilePhone,9,2)  AS MobilePhone,
		 SUBSTRING(Firms.TaxNo,1,3) + '-' + SUBSTRING(Firms.TaxNo,4,3) + '-' + SUBSTRING(Firms.TaxNo,7,2) + '-' + SUBSTRING(Firms.TaxNo,9,2)  AS TaxNo
FROM					 DefLocationCountries INNER JOIN
                         DefLocationCities INNER JOIN
                         DefLocationCounties ON DefLocationCities.CityId = DefLocationCounties.CityId ON DefLocationCountries.CountryId = DefLocationCities.CountryId RIGHT OUTER JOIN
                         Firms INNER JOIN
                         Membership ON Firms.CreatedBy = Membership.UserId ON DefLocationCounties.CountyId = Firms.CountyId
WHERE        (Firms.FirmId = @FirmId) AND (Firms.IsApproved = 'false')
ORDER BY Firms.CreatedOn DESC
END

GO
/****** Object:  StoredProcedure [dbo].[AdministratorSelectUnapprovedFirms]    Script Date: 31.1.2015 08:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdministratorSelectUnapprovedFirms]
AS
BEGIN
SELECT        Firms.FirmId, Firms.FirmName, Firms.CreatedOn, DefLocationCounties.Name AS CountyName, DefLocationCities.Name AS CityName, 
                         Membership.Name + ' ' + Membership.Surname AS [User]
FROM            Firms INNER JOIN
                         Membership ON Firms.CreatedBy = Membership.UserId LEFT OUTER JOIN
                         DefLocationCities INNER JOIN
                         DefLocationCounties ON DefLocationCities.CityId = DefLocationCounties.CityId ON Firms.CountyId = DefLocationCounties.CountyId
WHERE Firms.IsApproved = 'false'
ORDER BY Firms.CreatedOn DESC
END

GO
/****** Object:  StoredProcedure [dbo].[ManageSelectCountyListForTreeView]    Script Date: 31.1.2015 08:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ManageSelectCountyListForTreeView]
AS
BEGIN
(SELECT        dbo.DefLocationCounties.CityId * 1000 AS CityId, dbo.DefLocationCounties.CountyId, dbo.DefLocationCounties.Name
FROM            dbo.DefLocationCities INNER JOIN
                         dbo.DefLocationCounties ON dbo.DefLocationCities.CityId = dbo.DefLocationCounties.CityId
)
UNION
(SELECT        0 AS CityId, dbo.DefLocationCities.CityId * 1000, dbo.DefLocationCities.Name
FROM            dbo.DefLocationCities) ORDER BY Name
END
GO
