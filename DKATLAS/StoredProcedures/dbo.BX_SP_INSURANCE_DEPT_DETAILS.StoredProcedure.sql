USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_INSURANCE_DEPT_DETAILS]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_INSURANCE_DEPT_DETAILS] 
	
	@INSURANCE_ID int
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT     tblInsuranceCompany.InsuranceCompany_Id, tblInsuranceCompany.InsuranceCompany_Local_Address, 
                      tblInsuranceCompany.InsuranceCompany_Local_City, tblInsuranceCompany.InsuranceCompany_Local_State, 
                      tblInsuranceCompany.InsuranceCompany_Local_Zip, tblInsuranceCompany.InsuranceCompany_Local_Phone, 
                      tblInsuranceCompany.InsuranceCompany_Local_Fax, tblInsuranceCompany.Active, tblInsuranceCompany.BILLING_ADDRESS, 
                      tblInsuranceCompany.BILLING_CITY, tblInsuranceCompany.BILLING_STATE, tblInsuranceCompany.BILLING_ZIP, BX_INSURANCE_DEPT.DEPT_NAME,
                       BX_INSURANCE_DEPT.DEPT_ADDRESS + ' ' + BX_INSURANCE_DEPT.DEPT_CITY + ', ' + BX_INSURANCE_DEPT.DEPT_STATE + ' ' + BX_INSURANCE_DEPT.DEPT_ZIP
                       AS FULL_ADDRESS, BX_INSURANCE_DEPT.DEPT_PHONE, BX_INSURANCE_DEPT.DEPT_FAX
FROM         tblInsuranceCompany INNER JOIN
                      BX_INSURANCE_DEPT ON tblInsuranceCompany.InsuranceCompany_Id = BX_INSURANCE_DEPT.INSURANCE_ID

where tblInsuranceCompany.InsuranceCompany_Id = @insurance_id


END
GO
