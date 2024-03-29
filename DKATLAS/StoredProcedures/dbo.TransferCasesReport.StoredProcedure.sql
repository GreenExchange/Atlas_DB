USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[TransferCasesReport]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransferCasesReport] -- [TransferCasesReport] 'CO000000000000000180', 'Gyb' 
(
	@LawFirmID VARCHAR(100),
	@Gbb_Type VARCHAR(10)
)

AS
BEGIN

		select C.CASE_ID
		, CaseTypeName
		, P.Provider_Name AS Provider
		, InsuranceCompany_Name
		--, INSURANCE_GROUP_NAME
		, Ins_Claim_Number 
		, InjuredParty_FirstName AS PATIENT_FIRST_NAME
		, InjuredParty_LastName AS PATIENT_LAST_NAME
		, STATUS
		, INITIAL_STATUS
		, Date_Opened
		, Bill_Number
		, T.DateOfService_Start
		, T.DateOfService_End
		, T.Date_BillSent
		, DateOfTransferred
		, GB_CASE_ID
		, T.Claim_Amount,T.Paid_Amount, T.Claim_Amount - T.Paid_Amount AS Balance
		--, [CLIENTPRIORITY_LEVEL_NAME] As [PRIORITY LEVEL]
		--, BatchCode
		, (select top 1 notes_desc from tblNotes where Case_Id=c.Case_Id and Notes_Type='Provider') as notes_desc
		from TBLCASE C
		LEFT OUTER JOIN tbltreatment T on T.Case_Id= C.Case_Id
		LEFT OUTER JOIN TblProvider P  on C.provider_id= P.Provider_ID 
		LEFT OUTER JOIN tblInsuranceCompany I  on I.InsuranceCompany_ID= c.InsuranceCompany_ID 
		--LEFT OUTER JOIN dbo.tblClientPriorityLevel  on P.FK_ClientPriority_Level_ID = dbo.tblClientPriorityLevel.PK_ClientPriority_Level_ID
		--LEFT OUTER JOIN MST_INSURANCE_GROUPS  on I.FK_INSURANCE_GROUP_ID = PK_INSURANCE_GROUP_ID
		INNER JOIN XN_TEMP_GBB_ALL ON BillNumber= BILL_NUMBER --where c.Case_Id='RFA14-157060'
		where GB_CASE_ID is not null and Date_Created > CONVERT(DATE,GETDATE()) --and  BILL_NUMBER in (SELECT SZ_Bill_number FROM XN_TEMP_GoGBY$ ) 
		AND GB_LawFirm_ID = @LawFirmID
		AND C.gbb_type = @Gbb_Type
		ORDER BY InsuranceCompany_Name
		-------Case Wise Report-----------------------------------------

		select DISTINCT --C.Provider_Id,
		C.CASE_ID
		, Provider_Name AS Provider
		, InsuranceCompany_Name
		--, INSURANCE_GROUP_NAME
		, Ins_Claim_Number
		, InjuredParty_FirstName
		, InjuredParty_LastName
		, STATUS 
		--, gbb_status
		--, gbb_initial_status
		, INITIAL_STATUS
		, Date_Opened,accident_date,CONVERT(DATETIME,C.DateOfService_Start) AS DOS_START
		, CONVERT(DATETIME,C.DateOfService_End) AS DOS_END
		, dbo.fncGetBillNumber(C.case_id) as bill_number
		, dbo.fncGetDenialReasons(C.case_id) as DenialReasons
		--, [CLIENTPRIORITY_LEVEL_NAME] As [PRIORITY LEVEL]
		, GB_CASE_ID
		, C.Claim_Amount
		, C.Paid_Amount
		, (convert(decimal(38,2),c.Claim_Amount)-convert(decimal(38,2),c.Paid_Amount))[Claim Balance]
		, c.Fee_Schedule-c.Paid_Amount[Fee Schedule Balance]
		--, BatchCode
		, (select top 1 notes_desc from tblNotes where Case_Id=c.Case_Id and Notes_Type='Provider') as notes_desc
		from TBLCASE C
		LEFT OUTER JOIN TblProvider P  on C.provider_id= P.Provider_ID 
		LEFT OUTER JOIN tblInsuranceCompany I  on I.InsuranceCompany_ID= c.InsuranceCompany_ID 
	--	LEFT OUTER JOIN dbo.tblClientPriorityLevel  on P.FK_ClientPriority_Level_ID = dbo.tblClientPriorityLevel.PK_ClientPriority_Level_ID
		--LEFT OUTER JOIN MST_INSURANCE_GROUPS  on I.FK_INSURANCE_GROUP_ID = PK_INSURANCE_GROUP_ID
		where GB_CASE_ID is not null and  c.Case_Id in (SELECT case_ID from tblTreatment where   Date_Created > CONVERT(DATE,GETDATE())) --BILL_NUMBER in (SELECT SZ_Bill_number FROM XN_TEMP_GoGBY$ ) and
		--AND (P.Provider_Name like 'CitiMedical%' or P.Provider_Name like 'OPTIMUM%' ) 
		AND GB_LawFirm_ID = @LawFirmID
		AND C.gbb_type = @Gbb_Type
		ORDER BY Provider_Name,InsuranceCompany_Name

	
END
GO
