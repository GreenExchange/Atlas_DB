USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GET_POM_CASES]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_POM_CASES]
	@POM_ID INT
AS
BEGIN
	select CASE_ID,Injuredparty_name,Provider_name,Insurancecompany_name,Ins_Claim_Number,
	isnull(DOS_Start,'') as DOS_Start, isnull(DOS_End,'') as DOS_End, Accident_Date, 
	isnull(claim_amount,0.00) as claim_amount,
	InsuranceCompany_Perm_Address As InsuranceCompany_Address,
	InsuranceCompany_Perm_City As InsuranceCompany_City,
	InsuranceCompany_Perm_State As InsuranceCompany_State,
	InsuranceCompany_Perm_Zip As InsuranceCompany_Zip from lcj_vw_casesearchdetails
	WHERE CASE_ID IN(SELECT CASE_ID FROM TBLPOMCASE WHERE POM_ID=@POM_ID)
END

GO
