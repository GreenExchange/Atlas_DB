USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_ADMIN_GETINSURANCECOMPANY]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_ADMIN_GETINSURANCECOMPANY]


AS

Select InsuranceCompany_Id, LTRIM(RTRIM(UPPER(InsuranceCompany_Name))) AS InsuranceCompany_Name  from tblInsuranceCompany where 1=1
GO
