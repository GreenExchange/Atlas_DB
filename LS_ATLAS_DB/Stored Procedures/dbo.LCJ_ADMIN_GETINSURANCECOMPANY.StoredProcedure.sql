USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_ADMIN_GETINSURANCECOMPANY]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_ADMIN_GETINSURANCECOMPANY]
@DomainId NVARCHAR(50)

AS

Select InsuranceCompany_Id, LTRIM(RTRIM(UPPER(InsuranceCompany_Name))) AS InsuranceCompany_Name  from tblInsuranceCompany where 1=1 and DomainId=@DomainId

GO
