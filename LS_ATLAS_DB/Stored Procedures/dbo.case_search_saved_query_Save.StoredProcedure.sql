USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[case_search_saved_query_Save]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[case_search_saved_query_Save]
(	
	@i_a_query_id					INT,
	@s_a_query_name					NVARCHAR		(MAX),
	@i_a_UserId						INT,
	@DomainID						VARCHAR(50),
	@s_column_value					VARCHAR(MAX)	=	'',
	@s_a_column_name				VARCHAR(MAX)	=	'',
	@s_a_MultipleCase_ID			VARCHAR(MAX)	=	'',
	@s_a_ProviderSel				VARCHAR(MAX)	=	'',
	@s_a_InsuranceSel				VARCHAR(MAX)	=	'',
	@s_a_CurrentStatusGroupSel		VARCHAR(500)	=	'',
	@s_a_InitialStatusGroupSel		VARCHAR(500)	=	'',
	@s_a_Case_ID					VARCHAR(100)	=	'',
	@s_a_OldCaseId					VARCHAR(100)	=	'',
	@s_a_InjuredName				VARCHAR(100)	=	'',
	@s_a_InsuredName				VARCHAR(100)	=	'',
	@s_a_PolicyNo					VARCHAR(100)	=	'',
	@s_a_ClaimNo					VARCHAR(100)	=	'',
	@s_a_BillNumber					VARCHAR(500)	=	'',
	@s_a_IndexOrAAANo				VARCHAR(100)	=	'',
	@i_a_DenailReason				INT				=	0,
	@i_a_Court						INT				=	0,
	@i_a_Defendant					INT				=	0,
	@i_a_ReviewingDoctor			INT				=	0,
	@s_a_ProviderGroup				VARCHAR(100)	=	'',
	@s_a_InsuranceGroup				VARCHAR(100)	=	'',
	@s_a_date_opened_from			VARCHAR(10)		=	'',
	@s_a_date_opened_To				VARCHAR(10)		=	'',
	@s_a_DOSFrom					VARCHAR(10)		=	'',
	@s_a_DOSTo						VARCHAR(10)		=	'',	 
	@s_a_date_status_changed_from	VARCHAR(10)		=	'',
	@s_a_date_status_changed_To		VARCHAR(10)		=	'',
	@s_a_FinalStatus				VARCHAR(10)		=	'',
	@s_a_Forum						VARCHAR(10)		=	'',
	@s_a_injuredfirstname			varchar(100)	=	'',
	@s_a_injuredlastname			varchar(100)	=	'',
	@s_a_insuredfirstname			varchar(100)	=	'',
	@s_a_insuredlastname			varchar(100)	=	'',
	@s_a_packetid					varchar(100)	=	'',
	@s_a_adjusterfirstname			varchar(100)	=	'',
	@s_a_adjusterlastname			varchar(100)	=	'',
	@s_a_accidentdate				varchar(10)		=	'',
	@s_a_accountno					varchar(100)	=	'',
	@s_a_checknumber				varchar(100)	=	'',
	@s_a_paymentdatefrom			varchar(10)		=	'',
	@s_a_paymentdateto				varchar(10)		=	'',
	@s_a_filledunfiled				varchar(20)		=	'',
	@s_a_specialityid				varchar(max)	=	'',
	@s_a_attorneyfirmid				varchar(max)	=	'',
	@s_a_rebuttalstatusid			varchar(max)	=	'',
	@s_a_casetypeid					varchar(max)	=	'',
	@s_a_locationid					varchar(max)	=	'',
	@s_a_PortfolioId				varchar(max)	=	'',
	@s_a_Date_BillSent             VARCHAR(10)		=	''
)
AS
BEGIN	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	DECLARE @s_l_message NVARCHAR(MAX)
	DECLARE @i_l_result int
	IF(@i_a_query_id = 0)
	BEGIN
		INSERT INTO case_search_saved_query
		(
			query_name,
			userid,
			domainid,
			column_value,
			column_name,
			create_date,
			providersel,
			insurancesel,
			currentstatussel,
			initialstatussel,
			case_id,
			oldcaseid,
			injuredname,
			insuredname,
			policyno,
			claimno,
			billnumber,
			indexoraaano,
			denailreasonid,
			courtsel,
			defendantsel,
			reviewingdoctor,
			providergroupsel,
			insurancegroupsel,
			date_opened_from,
			date_opened_to,
			dos_from,
			dos_to,
			date_status_changed_from,
			date_status_changed_to,
			Final_Status,
			forum,
			injuredfirstname,
			injuredlastname,
			insuredfirstname,
			insuredlastname,
			packetid,
			adjusterfirstname,
			adjusterlastname,
			accidentdate,
			accountno,
			checknumber,
			paymentdatefrom,
			paymentdateto,
			filledunfiled,
			specialityid,
			attorneyfirmid,
			rebuttalstatusid,
			casetypeid,
			locationid,
			PortfolioId,
			Date_BillSent

		)
		VALUES
		(
			 @s_a_query_name,
			 @i_a_UserId,
			 @DomainID,
			 @s_column_value,
			 @s_a_column_name,
			 getdate(),
			 @s_a_ProviderSel,
			 @s_a_InsuranceSel,
			 @s_a_CurrentStatusGroupSel,
			 @s_a_InitialStatusGroupSel,
			 @s_a_MultipleCase_ID,
			 @s_a_OldCaseId,
			 @s_a_InjuredName,
			 @s_a_InsuredName,
			 @s_a_PolicyNo,
			 @s_a_ClaimNo,
			 @s_a_BillNumber,
			 @s_a_IndexOrAAANo,
			 @i_a_DenailReason,
			 @i_a_Court,
			 @i_a_Defendant,
			 @i_a_ReviewingDoctor,
			 @s_a_ProviderGroup,
			 @s_a_InsuranceGroup,
			 @s_a_date_opened_from,
			 @s_a_date_opened_To,
			 @s_a_DOSFrom,
			 @s_a_DOSTo,
			 @s_a_date_status_changed_from,
			 @s_a_date_status_changed_To,						 
			 @s_a_FinalStatus,
	         @s_a_Forum,
			 @s_a_injuredfirstname,
			 @s_a_injuredlastname,
			 @s_a_insuredfirstname,
			 @s_a_insuredlastname,
			 @s_a_packetid,
			 @s_a_adjusterfirstname,
			 @s_a_adjusterlastname,
			 @s_a_accidentdate,
			 @s_a_accountno,
			 @s_a_checknumber,
			 @s_a_paymentdatefrom,
			 @s_a_paymentdateto,
			 @s_a_filledunfiled,
			 @s_a_specialityid,
			 @s_a_attorneyfirmid,
			 @s_a_rebuttalstatusid,
			 @s_a_casetypeid,
			 @s_a_locationid,
			 @s_a_PortfolioId,
			@s_a_Date_BillSent
		)		
		
		set @i_l_result=@@IDENTITY						
	END
	ELSE
	BEGIN
		UPDATE
			case_search_saved_query
		SET
			query_name					=	@s_a_query_name,
			modified_userid				=	@i_a_UserId,
			column_value				=	@s_column_value,
			column_name					=	@s_a_column_name,
			modified_date				=	getdate(),
			providersel					=	@s_a_ProviderSel,
			insurancesel				=	@s_a_InsuranceSel,
			currentstatussel			=	@s_a_CurrentStatusGroupSel,
			initialstatussel			=	@s_a_InitialStatusGroupSel,
			case_id						=	@s_a_MultipleCase_ID,
			oldcaseid					=	@s_a_OldCaseId,
			injuredname					=	@s_a_InjuredName,
			insuredname					=	@s_a_InsuredName,
			policyno					=	@s_a_PolicyNo,
			claimno						=	@s_a_ClaimNo,
			billnumber					=	@s_a_BillNumber,
			indexoraaano				=	@s_a_IndexOrAAANo,
			denailreasonid				=	@i_a_DenailReason,
			courtsel					=	@i_a_Court,
			defendantsel				=	@i_a_Defendant,
			reviewingdoctor				=	@i_a_ReviewingDoctor,
			providergroupsel			=	@s_a_ProviderGroup,
			insurancegroupsel			=	@s_a_InsuranceGroup,
			date_opened_from			=	@s_a_date_opened_from,
			date_opened_to				=	@s_a_date_opened_To,
			dos_from					=	@s_a_DOSFrom,
			dos_to						=	@s_a_DOSTo,
			date_status_changed_from	=	@s_a_date_status_changed_from,
			date_status_changed_to		=	@s_a_date_status_changed_To,
			Final_Status				=	@s_a_FinalStatus,
			forum						=	@s_a_Forum,
			injuredfirstname			=	@s_a_injuredfirstname,
			injuredlastname				=	@s_a_injuredlastname, 
			insuredfirstname			=	@s_a_insuredfirstname, 
			insuredlastname				=	@s_a_insuredlastname, 
			packetid					=	@s_a_packetid, 
			adjusterfirstname			=	@s_a_adjusterfirstname, 
			adjusterlastname			=	@s_a_adjusterlastname, 
			accidentdate				=	@s_a_accidentdate, 
			accountno					=	@s_a_accountno, 
			checknumber					=	@s_a_checknumber, 
			paymentdatefrom				=	@s_a_paymentdatefrom, 
			paymentdateto				=	@s_a_paymentdateto, 
			filledunfiled				=	@s_a_filledunfiled, 
			specialityid				=	@s_a_specialityid, 
			attorneyfirmid				=	@s_a_attorneyfirmid, 
			rebuttalstatusid			=	@s_a_rebuttalstatusid, 
			casetypeid					=	@s_a_casetypeid, 
			locationid					=	@s_a_locationid,
			PortfolioId				    =   @s_a_PortfolioId,
			Date_BillSent		  	    =	@s_a_Date_BillSent
		WHERE
			pk_search_query_id			=	@i_a_query_id	and
			domainid					=	@DomainID	
				
		set @i_l_result=@i_a_query_id
	END	
	
	SET @s_l_message = 'Search query details saved successfully'
	SELECT @s_l_message AS [Message],@i_l_result as Result
END

--select * from case_search_saved_query_delete
GO
