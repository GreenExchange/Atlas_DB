USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[case_search_saved_query_Save]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[case_search_saved_query_Save]
(	
	 @i_a_query_id	INT,
	 @s_a_query_name	NVARCHAR		(MAX),
	 @i_a_UserId	INT,
	-- @DomainID VARCHAR(50),
	 @s_column_value	VARCHAR(MAX)	=	'',
	 @s_a_column_name	VARCHAR(MAX)	=	'',
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
	DECLARE @s_l_message NVARCHAR(MAX)
	DECLARE @i_l_result int
	IF(@i_a_query_id = 0)
	BEGIN

	-- select * from case_search_saved_query
		INSERT INTO case_search_saved_query
		(
			query_name	,
			userid	,
			--domainid	,
			column_value	,
			column_name	,
			create_date	,
			providersel	,
			insurancesel	,
			currentstatussel	,
			initialstatussel	,
			case_id	,
			oldcaseid	,
			injuredname	,
			insuredname	,
			policyno	,
			claimno	,
			billnumber	,
			indexoraaano	,
			denailreasonid	,
			courtsel	,
			defendantsel	,
			reviewingdoctor	,
			providergroupsel	,
			insurancegroupsel	,
			date_opened_from	,
			date_opened_to	,
			dos_from	,
			dos_to	,
			date_status_changed_from	,
			date_status_changed_to	
		)
		VALUES
		(
			 @s_a_query_name	,
			 @i_a_UserId	,
			-- @DomainID	,
			 @s_column_value	,
			 @s_a_column_name	,
			 getdate()	,
			 @s_a_ProviderSel	,
			 @s_a_InsuranceSel	,
			 @s_a_CurrentStatusGroupSel	,
			 @s_a_InitialStatusGroupSel	,
			 @s_a_Case_ID	,
			 @s_a_OldCaseId	,
			 @s_a_InjuredName	,
			 @s_a_InsuredName	,
			 @s_a_PolicyNo	,
			 @s_a_ClaimNo	,
			 @s_a_BillNumber	,
			 @s_a_IndexOrAAANo	,
			 @i_a_DenailReason	,
			 @i_a_Court	,
			 @i_a_Defendant	,
			 @i_a_ReviewingDoctor	,
			 @s_a_ProviderGroup	,
			 @s_a_InsuranceGroup	,
			 @s_a_date_opened_from	,
			 @s_a_date_opened_To	,
			 @s_a_DOSFrom	,
			 @s_a_DOSTo	,
			 @s_a_date_status_changed_from	,
			 @s_a_date_status_changed_To	
		)		
		
		set @i_l_result=@@IDENTITY						
	END
	ELSE
	BEGIN
		UPDATE
			case_search_saved_query
		SET
			query_name	=	 @s_a_query_name	,
			modified_userid	=	 @i_a_UserId	,
			column_value	=	@s_column_value	,
			column_name	=	@s_a_column_name	,
			modified_date	=	getdate()	,
			providersel	=	 @s_a_ProviderSel	,
			insurancesel	=	 @s_a_InsuranceSel	,
			currentstatussel	=	 @s_a_CurrentStatusGroupSel	,
			initialstatussel	=	 @s_a_InitialStatusGroupSel	,
			case_id	=	 @s_a_Case_ID	,
			oldcaseid	=	 @s_a_OldCaseId	,
			injuredname	=	 @s_a_InjuredName	,
			insuredname	=	 @s_a_InsuredName	,
			policyno	=	 @s_a_PolicyNo	,
			claimno	=	 @s_a_ClaimNo	,
			billnumber	=	 @s_a_BillNumber	,
			indexoraaano	=	 @s_a_IndexOrAAANo	,
			denailreasonid	=	 @i_a_DenailReason	,
			courtsel	=	 @i_a_Court	,
			defendantsel	=	 @i_a_Defendant	,
			reviewingdoctor	=	 @i_a_ReviewingDoctor	,
			providergroupsel	=	 @s_a_ProviderGroup	,
			insurancegroupsel	=	 @s_a_InsuranceGroup	,
			date_opened_from	=	 @s_a_date_opened_from	,
			date_opened_to	=	 @s_a_date_opened_To	,
			dos_from	=	 @s_a_DOSFrom	,
			dos_to	=	 @s_a_DOSTo	,
			date_status_changed_from	=	 @s_a_date_status_changed_from	,
			date_status_changed_to	=	 @s_a_date_status_changed_To	

		WHERE
			pk_search_query_id	=	@i_a_query_id	--and
		--	domainid	=	 @DomainID	
				
		set @i_l_result=@i_a_query_id
	END
	
	
	SET @s_l_message = 'Advanced search query details saved successfully'
	SELECT @s_l_message AS [Message],@i_l_result as Result
END

--select * from case_search_saved_query_delete
GO
