USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[case_entity_emailids_retrieve]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--case_entity_emailids_retrieve 'localhost','ACT18-109361'

CREATE PROCEDURE [dbo].[case_entity_emailids_retrieve]
(
	@DomainId	VARCHAR(MAX),
	@case_id	VARCHAR(MAX)
)
AS
BEGIN
  SET NOCOUNT ON	
	
    CREATE TABLE #TBL_ENTITY_EMAILS
    (
		s_no		INT IDENTITY(1,1) NOT NULL,
		name		VARCHAR(MAX) NOT NULL,
		email_id	VARCHAR(MAX) NOT NULL,
		entity_type	VARCHAR(MAX) NOT NULL
    )
   
	--Staff Users
    INSERT INTO #TBL_ENTITY_EMAILS	
	SELECT						
			DisplayName + ' (Staff)',
			Email,
			'Staff'
	FROM
			IssueTracker_Users				
	WHERE
			DomainId			=	@DomainId	AND
			IsActive			=	1 AND
			ISNULL(Email,'')	<> ''
	ORDER BY
			DisplayName + ' (Staff)' ASC
    
    --Provider
    INSERT INTO #TBL_ENTITY_EMAILS
    SELECT DISTINCT
		Provider_Name + ' (Provider)',
		ISNULL(Provider_Email,''),
		'Provider'
	FROM
		tblcase C
		JOIN tblProvider p ON p.Provider_Id = C.Provider_Id
	WHERE
		C.DomainId					=	@DomainId	AND
		C.Case_Id					=	@case_id	AND
		ISNULL(Provider_Email,'')	<> ''
	UNION
	SELECT DISTINCT
		Provider_Name + ' (Provider)',
		ISNULL(Email_For_Arb_Awards,''),
		'Provider'
	FROM
		tblcase C
		JOIN tblProvider p ON p.Provider_Id = C.Provider_Id
	WHERE
		C.DomainId					=	@DomainId	AND
		C.Case_Id					=	@case_id	AND
		ISNULL(Email_For_Arb_Awards,'')	<> ''
	UNION
	SELECT DISTINCT
		Provider_Name + ' (Provider)',
		ISNULL(Email_For_Invoices,''),
		'Provider'
	FROM
		tblcase C
		JOIN tblProvider p ON p.Provider_Id = C.Provider_Id
	WHERE
		C.DomainId					=	@DomainId	AND
		C.Case_Id					=	@case_id	AND
		ISNULL(Email_For_Invoices,'')	<> ''
	UNION
	SELECT DISTINCT
		Provider_Name + ' (Provider)',
		ISNULL(Email_For_Closing_Reports,''),
		'Provider'
	FROM
		tblcase C
		JOIN tblProvider p ON p.Provider_Id = C.Provider_Id
	WHERE
		C.DomainId					=	@DomainId	AND
		C.Case_Id					=	@case_id	AND
		ISNULL(Email_For_Closing_Reports,'')	<> ''
	UNION
	SELECT DISTINCT
		Provider_Name + ' (Provider)',
		ISNULL(Email_For_Monthly_Report,''),
		'Provider'
	FROM
		tblcase C
		JOIN tblProvider p ON p.Provider_Id = C.Provider_Id
	WHERE
		C.DomainId					=	@DomainId	AND
		C.Case_Id					=	@case_id	AND
		ISNULL(Email_For_Monthly_Report,'')	<> ''
	ORDER BY
		Provider_Name + ' (Provider)' ASC
	
	--Insurance Company
	INSERT INTO #TBL_ENTITY_EMAILS
    SELECT DISTINCT
		InsuranceCompany_Name + ' (Ins. Company)',
		ISNULL(InsuranceCompany_Email,''),
		'Ins. Company'
	FROM
		tblcase C
		JOIN tblInsuranceCompany I ON I.InsuranceCompany_Id = C.InsuranceCompany_Id
	WHERE
		C.DomainId					=	@DomainId	AND
		C.Case_Id					=	@case_id	AND
		ISNULL(InsuranceCompany_Email,'')	<> ''
	ORDER BY
		InsuranceCompany_Name + ' (Ins. Company)' ASC

	--Defendant
	INSERT INTO #TBL_ENTITY_EMAILS
    SELECT DISTINCT
		Defendant_Name + ' (Defendant)',
		ISNULL(Defendant_Email,''),
		'Defendant'
	FROM
		tblcase C
		JOIN tblDefendant D ON D.Defendant_id = C.Defendant_id
	WHERE
		C.DomainId					=	@DomainId	AND
		C.Case_Id					=	@case_id	AND
		ISNULL(Defendant_Email,'')	<> ''
	ORDER BY
		Defendant_Name + ' (Defendant)' ASC

	--Adjuster
	INSERT INTO #TBL_ENTITY_EMAILS
    SELECT DISTINCT
		Adjuster_FirstName+' '+Adjuster_LastName + ' (Adjuster)',
		ISNULL(Adjuster_Email,''),
		'Adjuster'
	FROM
		tblcase C
		JOIN tblAdjusters A ON A.Adjuster_Id = C.Adjuster_Id
	WHERE
		C.DomainId					=	@DomainId	AND
		C.Case_Id					=	@case_id	AND
		ISNULL(Adjuster_Email,'')	<> ''
	ORDER BY
		Adjuster_FirstName+' '+Adjuster_LastName + ' (Adjuster)' ASC

	--Arbitrator
	INSERT INTO #TBL_ENTITY_EMAILS
    SELECT DISTINCT
		ARBITRATOR_NAME + ' (Arbitrator)',
		ISNULL(ARBITRATOR_Email,''),
		'Arbitrator'
	FROM
		tblcase C
		JOIN TblArbitrator A ON A.ARBITRATOR_ID = C.Arbitrator_ID
	WHERE
		C.DomainId					=	@DomainId	AND
		C.Case_Id					=	@case_id	AND
		ISNULL(ARBITRATOR_Email,'')	<> ''
	ORDER BY
		ARBITRATOR_NAME + ' (Arbitrator)' ASC

	--Attorney
	INSERT INTO #TBL_ENTITY_EMAILS
    SELECT DISTINCT
		Attorney_FirstName+' '+ Attorney_LastName + ' (Attorney)',
		ISNULL(Attorney_Email,''),
		'Attorney'
	FROM
		tblcase C
		JOIN tblAttorney A ON A.Attorney_Id = C.Attorney_Id
	WHERE
		C.DomainId					=	@DomainId	AND
		C.Case_Id					=	@case_id	AND
		ISNULL(Attorney_Email,'')	<> ''
	ORDER BY
		Attorney_FirstName+' '+ Attorney_LastName + ' (Attorney)' ASC

	--LawFirm
	INSERT INTO #TBL_ENTITY_EMAILS
    SELECT DISTINCT
		Firm_Name + ' (LawFirm)',
		ISNULL(Firm_Email,''),
		'LawFirm'
	FROM
		tblcase C
		JOIN tblFirms F ON F.Firm_Id = C.AttorneyFirmId
	WHERE
		C.DomainId					=	@DomainId	AND
		C.Case_Id					=	@case_id	AND
		ISNULL(Firm_Email,'')	<> ''
	ORDER BY
		Firm_Name + ' (LawFirm)' ASC
	
	SELECT DISTINCT
		name,
		email_id,
		entity_type
	FROM
		#TBL_ENTITY_EMAILS
	ORDER BY
		entity_type,name ASC
	
	DROP TABLE #TBL_ENTITY_EMAILS
   
  SET NOCOUNT OFF        
END

GO
