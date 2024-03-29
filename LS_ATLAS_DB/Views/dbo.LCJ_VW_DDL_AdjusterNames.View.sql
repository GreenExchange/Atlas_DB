USE [LS_ATLAS_DB]
GO
/****** Object:  View [dbo].[LCJ_VW_DDL_AdjusterNames]    Script Date: 6/17/2019 2:29:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[LCJ_VW_DDL_AdjusterNames]
AS
SELECT     ISNULL(dbo.tblAdjusters.Adjuster_FirstName, N'') + N'  ' + ISNULL(dbo.tblAdjusters.Adjuster_LastName, N'') AS Adjuster_Name, 
                      dbo.tblAdjusters.Adjuster_Id, dbo.tblAdjusters.Adjuster_Phone, dbo.tblInsuranceCompany.InsuranceCompany_Name, 
                      ISNULL(dbo.tblInsuranceCompany.InsuranceCompany_Local_Phone, 'N/A') AS InsuranceCompany_Local_Phone, tblAdjusters.DomainId
FROM         dbo.tblAdjusters LEFT OUTER JOIN
                      dbo.tblInsuranceCompany ON dbo.tblAdjusters.InsuranceCompany_Id = dbo.tblInsuranceCompany.InsuranceCompany_Id
GO
