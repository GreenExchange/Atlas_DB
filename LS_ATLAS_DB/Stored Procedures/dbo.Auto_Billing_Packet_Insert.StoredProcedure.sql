USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Auto_Billing_Packet_Insert]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Auto_Billing_Packet_Insert]
AS
BEGIN

	EXEC Auto_Update_Denial

---   active billing denial received
	TRUNCATE TABLE Auto_Billing_Packet

	INSERT INTO Auto_Billing_Packet
	SELECT distinct
		cas.DomainId,
		cas.Case_Id
	FROM dbo.tblCase cas With(Nolock)
		INNER JOIN dbo.tblprovider pro With(Nolock) on cas.provider_id=pro.provider_id 
		INNER JOIN dbo.tblinsurancecompany ins With(Nolock) on cas.insurancecompany_id=ins.insurancecompany_id
		LEFT OUTER JOIN dbo.tblTreatment tre With(Nolock) on tre.Case_Id= cas.Case_Id
		LEFT OUTER JOIN dbo.Billing_Packet pck With(Nolock) on cas.case_id = pck.Case_ID
	WHERE cas.CASE_ID LIKE 'ACT%' and status <> 'IN ARB OR LIT'
	AND (
		Status IN ('ACTIVE BILLING DENIAL RECEIVED','BILLING - DENIAL') 
		OR (Status IN ('ACTIVE BILLING DELAY INFO SENT','ACTIVE BILLING RESUBMITTED','BILLING - POM RECEIVED') AND CONVERT(int, CONVERT(VARCHAR,DATEDIFF(dd,cas.date_status_Changed,GETDATE()))) >= 60)
		OR (Status IN ('ACTIVE BILLING POM GENERATED','ACTIVE BILLING POM RECEIVED') AND CONVERT(int, CONVERT(VARCHAR,DATEDIFF(dd,cas.date_status_Changed,GETDATE()))) >= 120)
		)
		OR
		(
		(Initial_Status ='PRE-ARB' AND Status IN ('DENIAL - 120 DAY RULE','DENIAL - 45 DAY RULE','DENIAL - 8 UNIT RULE','DENIAL - FEE SCHEDULE','DENIAL - IME/EUO NO SHOW','DENIAL - PEER/IME','DENIAL - VAGUE')) --- For Denial BT
		OR
		(Status IN('BILLING SENT') AND CONVERT(int, CONVERT(VARCHAR,DATEDIFF(dd,cas.date_status_Changed,GETDATE()))) >= 60) -- Billing Sent and no response from the insurance company for more than 60 days
		OR
		(Status IN ('BILLING VR ANSWERED') AND CONVERT(int, CONVERT(VARCHAR,DATEDIFF(dd,cas.date_status_Changed,GETDATE()))) >= 50) -- Billing verification answered and no response from the ins com for more than 50 days
		OR
		(Status IN ('DENIAL - FEE SCHEDULE')) -- Partial payment received with EOB/EOR
		AND 
		cas.DomainId IN ('BT')
		)
	Group by 	
		cas.DomainId,
		cas.Case_Id


--*******************************************************************************
	--- All Patient for linked with above case
	DECLARE @Auto_Billing_Packet TABLE
	(
		DomainID VARCHAR(50),
		InjuredParty_LastName VARCHAR(200),
		InjuredParty_FirstName VARCHAR(200),
		Accident_Date DATETIME,
		provider_id int,
		InsuranceCompany_id int
	)
	
	Insert Into @Auto_Billing_Packet
	SELECT distinct
		cas.DomainID
		--, cas.Case_Id
		, cas.InjuredParty_LastName
	    , cas.InjuredParty_FirstName
		, cas.Accident_Date
		, cas.Provider_Id
		, cas.InsuranceCompany_Id
		--, CONVERT(int, CONVERT(VARCHAR,DATEDIFF(dd,min(tre.DateOfService_End),GETDATE())))
		--, min(tre.DateOfService_End)
	FROM dbo.tblCase cas With(Nolock)
		INNER JOIN dbo.tblprovider pro With(Nolock) on cas.provider_id=pro.provider_id 
		INNER JOIN dbo.tblinsurancecompany ins With(Nolock) on cas.insurancecompany_id=ins.insurancecompany_id
		INNER JOIN dbo.Auto_Billing_Packet pck With(Nolock)on cas.case_id = pck.Case_ID
		LEFT OUTER JOIN dbo.tblTreatment tre With(Nolock) on tre.Case_Id= cas.Case_Id
		
	WHERE 
		cas.CASE_ID LIKE 'ACT%' 
		and status <> 'IN ARB OR LIT'
		--and CONVERT(int, CONVERT(VARCHAR,DATEDIFF(dd,min(tre.DateOfService_End),GETDATE()))) > 45
	GROUP BY
		cas.DomainID
		--, cas.Case_Id
		, cas.InjuredParty_LastName
	    , cas.InjuredParty_FirstName
		, cas.Accident_Date
		, cas.Provider_Id
		, cas.InsuranceCompany_Id

-----------------------------------------------------------------------------------------------------------------------
	INSERT INTO Auto_Billing_Packet
	SELECT distinct
		cas.DomainId,
		cas.Case_Id
	FROM dbo.tblCase cas With(Nolock)
		INNER JOIN dbo.tblprovider pro With(Nolock) on cas.provider_id=pro.provider_id 
		INNER JOIN dbo.tblinsurancecompany ins With(Nolock) on cas.insurancecompany_id=ins.insurancecompany_id
		LEFT OUTER JOIN dbo.tblTreatment tre With(Nolock) on tre.Case_Id= cas.Case_Id
		LEFT OUTER JOIN dbo.Billing_Packet pck With(Nolock) on cas.case_id = pck.Case_ID
		INNER JOIN @Auto_Billing_Packet auto_bp  on 
					 auto_bp.Accident_Date = cas.Accident_Date
				 and auto_bp.InjuredParty_FirstName = cas.InjuredParty_FirstName
				 and auto_bp.InjuredParty_LastName = cas.InjuredParty_LastName
				 and auto_bp.provider_id = cas.Provider_Id
				 -- and auto_bp.InsuranceCompany_id = cas.InsuranceCompany_id
				 and auto_bp.DomainID = cas.DomainId
	WHERE cas.Case_Id NOT in (SELECT Case_ID FROM Auto_Billing_Packet)
		  AND status <> 'IN ARB OR LIT'
	Group by 	
		cas.DomainId,
		cas.Case_Id
--*******************************************************************************
 


	--- Last Date Of Service > 45
	--DECLARE @Auto_Billing_Packet TABLE
	--(
	--	DomainID VARCHAR(50),
	--	InjuredParty_LastName VARCHAR(200),
	--	InjuredParty_FirstName VARCHAR(200),
	--	Accident_Date DATETIME,
	--	provider_id int,
	--	InsuranceCompany_id int
	--)
	
	--Insert Into @Auto_Billing_Packet
	--SELECT distinct
	--	cas.DomainID
	--	, cas.InjuredParty_LastName
	--    , cas.InjuredParty_FirstName
	--	, cas.Accident_Date
	--	, cas.Provider_Id
	--	, cas.InsuranceCompany_Id
	--	--, CONVERT(int, CONVERT(VARCHAR,DATEDIFF(dd,min(tre.DateOfService_End),GETDATE())))
	--	--, min(tre.DateOfService_End)
	--FROM dbo.tblCase cas With(Nolock)
	--	INNER JOIN dbo.tblprovider pro With(Nolock) on cas.provider_id=pro.provider_id 
	--	INNER JOIN dbo.tblinsurancecompany ins With(Nolock) on cas.insurancecompany_id=ins.insurancecompany_id
	--	LEFT OUTER JOIN dbo.tblTreatment tre With(Nolock) on tre.Case_Id= cas.Case_Id
	--	LEFT OUTER JOIN dbo.Billing_Packet pck With(Nolock)on cas.case_id = pck.Case_ID
	--WHERE 
	--	cas.Initial_Status = 'Active' 
	--	and status <> 'IN ARB OR LIT'
	--	--and CONVERT(int, CONVERT(VARCHAR,DATEDIFF(dd,min(tre.DateOfService_End),GETDATE()))) > 45
	--GROUP BY
	--	cas.DomainID
	--	, cas.InjuredParty_LastName
	--    , cas.InjuredParty_FirstName
	--	, cas.Accident_Date
	--	, cas.Provider_Id
	--	, cas.InsuranceCompany_Id
	--HAVING CONVERT(int, CONVERT(VARCHAR,DATEDIFF(dd,min(tre.DateOfService_End),GETDATE()))) > 45
	--	AND convert(decimal(38,2),(convert(money,sum(convert(float,cas.Claim_Amount)) - sum(convert(float,cas.Paid_Amount))))) > 0

-------------------------------------------------------------------------------------------------------------------------
	--INSERT INTO Auto_Billing_Packet
	--SELECT distinct
	--	cas.DomainId,
	--	cas.Case_Id
	--FROM dbo.tblCase cas With(Nolock)
	--	INNER JOIN dbo.tblprovider pro With(Nolock) on cas.provider_id=pro.provider_id 
	--	INNER JOIN dbo.tblinsurancecompany ins With(Nolock) on cas.insurancecompany_id=ins.insurancecompany_id
	--	LEFT OUTER JOIN dbo.tblTreatment tre With(Nolock) on tre.Case_Id= cas.Case_Id
	--	LEFT OUTER JOIN dbo.Billing_Packet pck With(Nolock) on cas.case_id = pck.Case_ID
	--	INNER JOIN @Auto_Billing_Packet auto_bp  on 
	--				 auto_bp.Accident_Date = cas.Accident_Date
	--			 and auto_bp.InjuredParty_FirstName = cas.InjuredParty_FirstName
	--			 and auto_bp.InjuredParty_LastName = cas.InjuredParty_LastName
	--			 and auto_bp.provider_id = cas.Provider_Id
	--			 and auto_bp.InsuranceCompany_id = cas.InsuranceCompany_id
	--			 and auto_bp.DomainID = cas.DomainId
	--WHERE cas.Case_Id NOT in (SELECT Case_ID FROM Auto_Billing_Packet) and status <> 'IN ARB OR LIT'
	--Group by 	
	--	cas.DomainId,
	--	cas.Case_Id

	-- SELECT * FROM Auto_Billing_Packet

	TRUNCATE TABLE Auto_Billing_Packet_Info

	INSERT INTO Auto_Billing_Packet_Info
	SELECT distinct
				cas.DomainId,
				cas.Case_Id,
				cas.Case_AutoId,
				cas.Case_Code AS Case_Code,
				pck.Packeted_Case_ID as Packeted_Case_ID,
				cas.InjuredParty_LastName,
				cas.InjuredParty_FirstName,  
				cas.InsuredParty_LastName,
				cas.InsuredParty_FirstName,
				Provider_Name,  
				ins.InsuranceCompany_Name,  
				convert(decimal(38,2),(convert(money,convert(float,cas.Claim_Amount)))) as Claim_Amount,
				
				convert(decimal(38,2),(convert(money,convert(float,cas.Claim_Amount) - convert(float,cas.Paid_Amount)))) as Claim_Balance,
				convert(decimal(38,2),cas.Paid_Amount) AS Paid_Amount,
				convert(decimal(38,2),(convert(money,convert(float,cas.Fee_Schedule)))) as Fee_Schedule,
				convert(decimal(38,2),(convert(money,convert(float,cas.Fee_Schedule) - convert(float,cas.Paid_Amount)))) as FS_Balance,
				cas.Status,  
				cas.Initial_Status,
				cas.Accident_Date,		
				cas.Ins_Claim_Number,
				cas.Policy_Number, 
				pro.Provider_GroupName,
				CONVERT(int, CONVERT(VARCHAR,DATEDIFF(dd,cas.date_status_Changed,GETDATE()))) as Status_Age,
				CONVERT(varchar(10), min(tre.DateOfService_Start), 101) AS DateOfService_Start, 
				CONVERT(varchar(12), min(tre.DateOfService_End), 1) AS DateOfService_End,
				CONVERT(varchar(12), min(tre.Date_BillSent), 1) AS Date_BillSent,
				cas.DenialReasons_Type as  DenialReasons,
				--dbo.fncGetDenialReasons(cas.Case_Id) AS DenialReasons,
				dbo.fncGetServiceType(cas.Case_ID) AS ServiceType,
				cas.Provider_Id,
				cas.InsuranceCompany_Id,
				cas.Date_Opened,
				cas.Date_Status_Changed,
				pro.packet_type
			FROM dbo.tblCase cas With(Nolock)
				INNER JOIN dbo.tblprovider pro With(Nolock) on cas.provider_id=pro.provider_id 
				INNER JOIN dbo.tblinsurancecompany ins With(Nolock) on cas.insurancecompany_id=ins.insurancecompany_id
				INNER JOIN Auto_Billing_Packet abp With(Nolock) ON  cas.Case_Id = abp.Case_Id and cas.DomainId= abp.DomainId
				LEFT OUTER JOIN dbo.tblTreatment tre With(Nolock) on tre.Case_Id= cas.Case_Id
				LEFT OUTER JOIN dbo.Billing_Packet pck With(Nolock) on cas.case_id = pck.Case_ID
				AND ISNULL(pck.case_id,'') =''
			Group by 	
				cas.DomainId,
				cas.Case_Id,
				cas.Case_AutoId,
				cas.Case_Code,
				pck.Packeted_Case_ID,
				cas.InjuredParty_FirstName,
				cas.InjuredParty_LastName,
				cas.InsuredParty_LastName,
				cas.InsuredParty_FirstName,
				pro.Provider_Name,
				ins.InsuranceCompany_Name,
				cas.Claim_Amount,
				cas.Fee_Schedule,
				cas.Status,
				cas.Accident_Date,		
				cas.Initial_Status,
				pro.Provider_GroupName,
				cas.Paid_Amount,
				cas.Ins_Claim_Number,
				cas.Policy_Number,
				Cas.Date_Opened,
				Cas.Date_Status_Changed,
				cas.DenialReasons_Type,
				cas.Provider_Id,
				cas.InsuranceCompany_Id,
				cas.Date_Opened,
				pro.packet_type
			ORDER BY Provider_Name




    ---- Remove cases which have zero balance

	DECLARE @Auto_Billing_Packet_Zero_Balance TABLE
	(
		DomainID VARCHAR(50),
		InjuredParty_LastName VARCHAR(200),
		InjuredParty_FirstName VARCHAR(200),
		Accident_Date DATETIME,
		provider_id int,
		InsuranceCompany_id int
	)
	
	Insert Into @Auto_Billing_Packet_Zero_Balance

	SELECT 
		cas.DomainID
		, cas.InjuredParty_LastName
	    , cas.InjuredParty_FirstName
		, cas.Accident_Date
		, cas.Provider_Id
		, cas.InsuranceCompany_Id from Auto_Billing_Packet_Info cas With(Nolock)
		GROUP BY
		cas.DomainID
		, cas.InjuredParty_LastName
	    , cas.InjuredParty_FirstName
		, cas.Accident_Date
		, cas.Provider_Id
		, cas.InsuranceCompany_Id
	HAVING CONVERT(int, CONVERT(VARCHAR,DATEDIFF(dd,min(cas.DateOfService_End),GETDATE()))) > 45
		AND convert(decimal(38,2),(convert(money,sum(convert(float,cas.Claim_Amount)) - sum(convert(float,cas.Paid_Amount))))) <= 0 



		DELETE FROM dbo.Auto_Billing_Packet_Info WHERE Case_id IN(
		SELECT cas.Case_Id FROM dbo.Auto_Billing_Packet_Info cas With(Nolock)
			INNER JOIN @Auto_Billing_Packet_Zero_Balance auto_bp  on 
						 auto_bp.Accident_Date = cas.Accident_Date
					 and auto_bp.InjuredParty_FirstName = cas.InjuredParty_FirstName
					 and auto_bp.InjuredParty_LastName = cas.InjuredParty_LastName
					 and auto_bp.provider_id = cas.Provider_Id
					 and auto_bp.InsuranceCompany_id = cas.InsuranceCompany_id
					 and auto_bp.DomainID = cas.DomainId)
		

END
GO
