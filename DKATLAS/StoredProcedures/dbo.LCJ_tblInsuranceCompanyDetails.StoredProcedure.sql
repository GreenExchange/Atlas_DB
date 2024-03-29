USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_tblInsuranceCompanyDetails]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_tblInsuranceCompanyDetails]  ---[LCJ_tblInsuranceCompanyDetails] 4194
	
	(
		@InsuranceCompany_Id NVARCHAR(100)
		
	)

AS

BEGIN

	SELECT ins.*,COUNT(tcase.Case_Id) AS CaseCount
	FROM tblInsuranceCompany ins
	LEFT OUTER JOIN tblcase tcase ON ins.InsuranceCompany_Id=tcase.InsuranceCompany_Id
	WHERE    ins.InsuranceCompany_Id =@InsuranceCompany_Id
	GROUP BY ins.InsuranceCompany_Id,ins.InsuranceCompany_Name,ins.InsuranceCompany_SuitName,
	ins.InsuranceCompany_Type,ins.InsuranceCompany_Local_Address,ins.InsuranceCompany_Local_City,
	ins.InsuranceCompany_Local_State,ins.InsuranceCompany_Local_Zip,ins.InsuranceCompany_Local_Phone,
	ins.InsuranceCompany_Local_Fax,InsuranceCompany_Perm_Address,ins.InsuranceCompany_Perm_City,ins.InsuranceCompany_Perm_State,
	ins.InsuranceCompany_Perm_Zip,ins.InsuranceCompany_Perm_Phone,ins.InsuranceCompany_Perm_Fax,ins.InsuranceCompany_Contact,
	ins.InsuranceCompany_Email,ins.InsuranceCompany_GroupName,ins.Active,ins.SZ_SHORT_NAME,ins.BILLING_ADDRESS,ins.BILLING_CITY,ins.BILLING_STATE,
	ins.BILLING_ZIP,ins.ActiveStatus,ins.InsuranceCompany_Initial_Address,ins.InsuranceCompany_Initial_City,ins.InsuranceCompany_Initial_State,
	ins.InsuranceCompany_Initial_Zip,ins.InsuranceCompany_Address2_Address,ins.InsuranceCompany_Address2_City,ins.InsuranceCompany_Address2_State,
	ins.InsuranceCompany_Address2_Zip,ins.InsuranceCompany_Address2_Phone,ins.InsuranceCompany_Address2_Fax,ins.gbb_status,ins.gbb_initial_status,
	ins.RCF_initial_status

END
GO
