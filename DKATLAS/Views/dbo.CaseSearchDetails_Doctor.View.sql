USE [DKATLAS]
GO
/****** Object:  View [dbo].[CaseSearchDetails_Doctor]    Script Date: 6/17/2019 2:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CaseSearchDetails_Doctor]
AS
SELECT DISTINCT 
      dbo.tblcase.Case_Id [Case Id],dbo.tblProvider.Provider_SuitName [Provider Name],  
      ISNULL(dbo.tblcase.InjuredParty_FirstName, N'') + N'  ' + ISNULL(dbo.tblcase.InjuredParty_LastName, N'') [Patient Name], 
      dbo.tblInsuranceCompany.InsuranceCompany_Name [Insurance Company Name], 
      convert(nvarchar(12),dbo.tblcase.Accident_Date,101) [Accident Date]
                      
FROM dbo.tblcase LEFT OUTER JOIN
  dbo.tblInsuranceCompany ON dbo.tblcase.InsuranceCompany_Id = dbo.tblInsuranceCompany.InsuranceCompany_Id INNER JOIN
  dbo.tblProvider ON dbo.tblcase.Provider_Id = dbo.tblProvider.Provider_Id
GO
