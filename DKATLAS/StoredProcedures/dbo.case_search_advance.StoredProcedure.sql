USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[case_search_advance]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[case_search_advance] -- [case_search_advance] 'localhost'
(
	 --@DomainID VARCHAR(50),
	 @s_a_MultipleCase_ID VARCHAR(MAX)	=	'',
	 @s_a_ProviderSel	VARCHAR(MAX)	=	'',
	 @s_a_InsuranceSel	VARCHAR(MAX)	=	'',
	 @s_a_CurrentStatusGroupSel	VARCHAR(500)	=	'',
	 @s_a_InitialStatusGroupSel	VARCHAR(500)	=	'',
	 @s_a_Case_ID	VARCHAR(100)	=	'',
	 @s_a_OldCaseId	VARCHAR(100)	=	'',
	 @s_a_InjuredName	VARCHAR(100)	=	'',
	 @s_a_InsuredName	VARCHAR(100)	=	'',
	 @s_a_PolicyNo	VARCHAR(100)	=	'',
	 @s_a_ClaimNo	VARCHAR(100)	=	'',
	 @s_a_BillNumber	VARCHAR(500)	=	'',
	 @s_a_IndexOrAAANo	VARCHAR(100)	=	'',
	 @i_a_DenailReason	INT	=	0,
	 @i_a_Court	INT	=	0,
	 @i_a_Defendant	INT	=	0,
	 @i_a_ReviewingDoctor INT = 0,
	 @s_a_ProviderGroup	VARCHAR(100)	=	'',
	 @s_a_InsuranceGroup	VARCHAR(100)	=	'',
	 @s_a_date_opened_from	VARCHAR(10)	=	'',
	 @s_a_date_opened_To	VARCHAR(10)	=	'',
	 @s_a_DOSFrom	VARCHAR(10)	=	'',
	 @s_a_DOSTo	VARCHAR(10)	=	'',	 
	 @s_a_date_status_changed_from	VARCHAR(10)	=	'',
	 @s_a_date_status_changed_To	VARCHAR(10)	=	''
											 
)
AS
BEGIN	
--DBCC FREEPROCCACHE
--DBCC DROPCLEANBUFFERS		
	
	SELECT distinct
		cas.Case_Id,
		cas.Case_AutoId,
		cas.InjuredParty_LastName + ', ' + cas.InjuredParty_FirstName as InjuredParty_Name,  
		Provider_Name + ISNULL(' [ ' + pro.Provider_Groupname + ' ]','') as Provider_Name,  
		ins.InsuranceCompany_Name,  
		cas.IndexOrAAA_Number,  
		convert(decimal(38,2),(convert(money,convert(float,cas.Claim_Amount)))) as Claim_Amount,
		convert(decimal(38,2),(convert(money,convert(float,cas.Paid_Amount)))) as Paid_Amount,
		convert(decimal(38,2),(convert(money,convert(float,cas.Claim_Amount) - convert(float,cas.Paid_Amount)))) as Claim_Balance,
		convert(decimal(38,2),(convert(money,convert(float,cas.Fee_Schedule)))) as Fee_Schedule,
		convert(decimal(38,2),(convert(money,convert(float,cas.Fee_Schedule) - convert(float,cas.Paid_Amount)))) as FS_Balance,
		cas.Status,  
		cas.Date_Status_Changed,
		CONVERT(int, CONVERT(VARCHAR,DATEDIFF(dd,cas.date_status_Changed,GETDATE()))) as Status_Age,
		cas.Initial_Status,
		cas.Ins_Claim_Number, 
		CONVERT(VARCHAR(10),Accident_Date,101) AS Accident_Date,
		CONVERT(VARCHAR(10),cas.DateOfService_Start,101) AS DateOfService_Start,
		CONVERT(VARCHAR(10),cas.DateOfService_End,101) AS DateOfService_End,
		cas.DenialReasons_Type as DenialReasons,
		dbo.fncGetServiceType(cas.Case_ID) AS ServiceType,
		pro.Provider_GroupName,
		ins.InsuranceCompany_GroupName
	FROM tblCase cas
	INNER JOIN tblprovider pro on cas.provider_id=pro.provider_id 
	INNER JOIN tblinsurancecompany ins on cas.insurancecompany_id=ins.insurancecompany_id
	LEFT OUTER JOIN tblTreatment tre on tre.Case_Id= cas.Case_Id
	LEFT OUTER JOIN TXN_CASE_PEER_REVIEW_DOCTOR prdoc on prdoc.TREATMENT_ID = tre.treatment_id
	LEFT OUTER JOIN TXN_tblTreatment t_tre on t_tre.Treatment_Id = tre.treatment_id
	WHERE
	--	cas.DomainId = @DomainID
		--AND
			(@s_a_MultipleCase_ID ='' OR cas.Case_Id IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,',')) OR  cas.Case_Id IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,' ')))
		AND (@s_a_ProviderSel  ='' OR cas.Provider_Id IN (SELECT items FROM dbo.SplitStringInt(@s_a_ProviderSel,',')))
		AND (@s_a_InsuranceSel  ='' OR cas.InsuranceCompany_Id IN (SELECT items FROM dbo.SplitStringInt(@s_a_InsuranceSel,',')))	
		AND (@s_a_CurrentStatusGroupSel ='' OR cas.Status IN (SELECT s FROM dbo.SplitString(@s_a_CurrentStatusGroupSel,',')))	
		AND (@s_a_InitialStatusGroupSel ='' OR cas.Initial_Status IN (SELECT s FROM dbo.SplitString(@s_a_InitialStatusGroupSel,',')))
		AND (@s_a_Case_ID ='' OR cas.Case_Id like '%'+ @s_a_Case_ID + '%')
		AND (@s_a_OldCaseId ='' OR cas.Case_Code like '%'+ @s_a_OldCaseId + '%')
		AND (@s_a_InjuredName ='' OR ISNULL(cas.InjuredParty_FirstName,'')+ISNULL(cas.InjuredParty_LastName,'') like '%'+ @s_a_InjuredName + '%'  OR  ISNULL(cas.InjuredParty_LastName,'') + ISNULL(cas.InjuredParty_FirstName,'') like '%'+ @s_a_InjuredName + '%'  OR ISNULL(cas.InjuredParty_LastName,'') like '%'+ @s_a_InjuredName + '%'  OR ISNULL(cas.InjuredParty_FirstName,'') like '%'+ @s_a_InjuredName + '%')
		AND (@s_a_InsuredName ='' OR ISNULL(cas.InsuredParty_FirstName,'')+ISNULL(cas.InsuredParty_LastName,'') like '%'+ @s_a_InsuredName + '%'  OR  ISNULL(cas.InsuredParty_LastName,'') + ISNULL(cas.InsuredParty_FirstName,'') like '%'+ @s_a_InsuredName + '%'  OR ISNULL(cas.InsuredParty_LastName,'') like '%'+ @s_a_InsuredName + '%'  OR ISNULL(cas.InsuredParty_FirstName,'') like '%'+ @s_a_InsuredName + '%')
		AND (@s_a_PolicyNo ='' OR cas.Policy_Number like '%'+ @s_a_PolicyNo + '%')
		AND (@s_a_ClaimNo ='' OR cas.Ins_Claim_Number like '%'+ @s_a_ClaimNo + '%')
		AND (@s_a_BillNumber ='' OR tre.BILL_NUMBER like '%'+ @s_a_BillNumber + '%')
		AND (@s_a_IndexOrAAANo ='' OR cas.IndexOrAAA_Number like '%'+ @s_a_IndexOrAAANo + '%')

		AND (@s_a_ProviderGroup ='' OR pro.Provider_GroupName = @s_a_ProviderGroup )
		AND (@s_a_InsuranceGroup='' OR ins.InsuranceCompany_GroupName = @s_a_InsuranceGroup )		
		AND (@i_a_DenailReason = 0 OR t_tre.DenialReasons_Id = @i_a_DenailReason)
		AND (@i_a_Court = 0 OR cas.Court_Id = @i_a_Court)
		AND (@i_a_Defendant = 0 OR cas.defendant_Id = @i_a_Defendant)
		AND (@i_a_ReviewingDoctor = 0 OR tre.PeerReviewDoctor_ID = @i_a_ReviewingDoctor) --- add logic of txn_
		
		AND (@s_a_date_opened_from='' OR (Date_Opened Between convert(datetime,@s_a_date_opened_from) And convert(datetime,@s_a_date_Opened_To)+1))
		AND (@s_a_DOSFrom ='' or (CONVERT(DATETIME,cas.DateOfService_Start) >=CONVERT(DATETIME, CONVERT(VARCHAR, @s_a_DOSFrom,101))  and cas.DateOfService_Start IS NOT NULL))
		AND (@s_a_DOSTo ='' or (CONVERT(DATETIME,cas.DateOfService_End) <=CONVERT(DATETIME, CONVERT(VARCHAR, @s_a_DOSTo,101))  and cas.DateOfService_End IS NOT NULL))
		AND (@s_a_date_status_changed_from = '' OR (Date_Status_Changed Between convert(datetime,@s_a_date_status_changed_from) And convert(datetime,@s_a_date_opened_To)+1))

	--Group by 	
	--	cas.Case_Id,
	--	cas.Case_AutoId,
	--	cas.InjuredParty_FirstName,
	--	cas.InjuredParty_LastName,
	--	pro.Provider_Name,
	--	ins.InsuranceCompany_Name,
	--	cas.Indexoraaa_number,
	--	cas.Claim_Amount,
	--	cas.Status,
	--	pro.Provider_GroupName,
	--	cas.Paid_Amount,
	--	cas.Ins_Claim_Number,
	--	Cas.Date_Opened,
	--	Cas.Date_Status_Changed
	ORDER BY Case_AutoId	desc


--DBCC FREEPROCCACHE
--DBCC DROPCLEANBUFFERS		
END

GO
