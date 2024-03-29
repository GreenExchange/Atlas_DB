USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_INSURANCE_DETAILS]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_INSURANCE_DETAILS] 
	
	@INSURANCE_ID int
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT     InsuranceCompany_Id, InsuranceCompany_Name, InsuranceCompany_Local_Address, InsuranceCompany_Local_City, 
                      InsuranceCompany_Local_State, InsuranceCompany_Local_Zip, InsuranceCompany_Local_Phone, InsuranceCompany_Local_Fax, Active, 
                      BILLING_ADDRESS, BILLING_CITY, BILLING_STATE, BILLING_ZIP
FROM         tblInsuranceCompany
WHERE     (BILLING_ADDRESS IS NOT NULL) AND (InsuranceCompany_Id=@INSURANCE_ID)
END
GO
