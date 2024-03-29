USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GET_INSERT_CASE_DETAILS_NEW]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_INSERT_CASE_DETAILS_NEW]
	@SZ_COMPANY_ID VARCHAR(100),	
	@SZ_CASE_ID	VARCHAR(100),
	@SZ_CASE_NO	VARCHAR(100),
	@SZ_PATIENT_NAME	VARCHAR(500),
	@SZ_PATIENT_ADDRESS	VARCHAR(1000),
	@SZ_PATIENT_CITY	VARCHAR(100),
	@SZ_PATIENT_STATE VARCHAR(100),
	@SZ_PATIENT_ZIP	VARCHAR(100),
	@SZ_PATIENT_PHONE	VARCHAR(50),
	@DT_DATE_OF_ACCIDENT datetime,
	@DT_DOB	datetime,
	@SZ_POLICY_HOLDER VARCHAR(500),
	@SZ_POLICY_NUMBER VARCHAR(100),
	@SZ_CLAIM_NUMBER VARCHAR(100),
	@SZ_PROVIDER VARCHAR(1000),
	@SZ_BILL_NUMBER VARCHAR(100),
	@DT_START_VISIT_DATE datetime,
	@DT_END_VISIT_DATE datetime,
	@FLT_BILL_AMOUNT VARCHAR(100),
	@FLT_PAID VARCHAR(100),
	@InsuranceCompanyId VARCHAR(50),
	--@DefendantId VARCHAR(50),
	@ProviderId VARCHAR(50)
AS
BEGIN
	DECLARE @Case_Id AS NVARCHAR(20)
	DECLARE @CurrentDate AS SMALLDATETIME  
	DECLARE @Date_Opened AS DATETIME
	DECLARE @InjuredParty_LastName AS VARCHAR(100)
	DECLARE @InjuredParty_FirstName AS VARCHAR(100)
	DECLARE @InsuredParty_LastName AS VARCHAR(100)
	DECLARE @InsuredParty_FirstName AS VARCHAR(100)
	DECLARE @COUNT INT
	DECLARE @NOTES AS VARCHAR(MAX)

	-- Remove Leading and ending spaces from the input parameters  
	SET @InjuredParty_LastName = RTRIM(LTRIM(SUBSTRING(@SZ_PATIENT_NAME,CHARINDEX(' ',@SZ_PATIENT_NAME) + 1,LEN(@SZ_PATIENT_NAME))))
	SET @InjuredParty_FirstName = RTRIM(LTRIM(SUBSTRING(@SZ_PATIENT_NAME,0,CHARINDEX(' ',@SZ_PATIENT_NAME)))) 

	SET @InsuredParty_FirstName = RTRIM(LTRIM(SUBSTRING(@SZ_POLICY_HOLDER,CHARINDEX(',',@SZ_POLICY_HOLDER) + 1,LEN(@SZ_POLICY_HOLDER))))
	SET @InsuredParty_LastName = RTRIM(LTRIM(SUBSTRING(@SZ_POLICY_HOLDER,0,CHARINDEX(',',@SZ_POLICY_HOLDER)))) 

	SET @CurrentDate = Convert(Varchar(15), GetDate(),102)
	SET @Case_Id = (Select Case_Id    
		FROM  tblCase  
		WHERE   
		Provider_Id = @ProviderId and   
		InjuredParty_LastName = @InjuredParty_LastName and   
		InjuredParty_FirstName = @InjuredParty_FirstName and  
		Accident_Date = @DT_DATE_OF_ACCIDENT and   
		Policy_Number = @SZ_POLICY_NUMBER)

	IF @Case_Id != '' OR @Case_Id IS NOT NULL
	BEGIN
		DECLARE @BILLNUM AS INT
		IF EXISTS(SELECT BILL_NUMBER FROM TBLTREATMENT WHERE BILL_NUMBER = @SZ_BILL_NUMBER AND CASE_ID = @Case_Id)
		BEGIN			
			UPDATE
				TBLTREATMENT
			SET
				DateOfService_Start = @DT_START_VISIT_DATE,
				DateOfService_End = @DT_END_VISIT_DATE,
				Claim_Amount = @FLT_BILL_AMOUNT,
				Paid_Amount = @FLT_PAID
			WHERE
				CASE_ID = @Case_Id
				and
				BILL_NUMBER = @SZ_BILL_NUMBER
			SET @NOTES = 'Bill updated for DOS ' + convert(varchar(9),@DT_START_VISIT_DATE) + ' - ' + convert(varchar(9),@DT_END_VISIT_DATE)
			exec LCJ_AddNotes @case_id=@Case_Id,@notes_type='Activity',@Ndesc=@NOTES,@User_id='system',@Applytogroup=0	
		END
		ELSE
		BEGIN
			INSERT INTO TBLTREATMENT
				(
					Case_Id,
					DateOfService_Start,
					DateOfService_End,
					Claim_Amount,
					Paid_Amount,
					BILL_NUMBER
				)
				VALUES
				(
					@Case_Id,
					@DT_START_VISIT_DATE,
					@DT_END_VISIT_DATE,
					@FLT_BILL_AMOUNT,
					@FLT_PAID,
					@SZ_BILL_NUMBER
				)
				
				SET @NOTES = 'Bill added for DOS ' + convert(varchar(9),@DT_START_VISIT_DATE) + ' - ' + convert(varchar(9),@DT_END_VISIT_DATE)
				exec LCJ_AddNotes @case_id=@Case_Id,@notes_type='Activity',@Ndesc=@NOTES,@User_id='system',@Applytogroup=0


		END
		
	END  
   
	ELSE  
	BEGIN     
		DECLARE @MaxCase_Id INTEGER  
		DECLARE @Case_Id_IDENTITY INTEGER  
		DECLARE @MaxCase_AUTOID INTEGER  

		SELECT  @MaxCase_AUTOID=MAX(Case_AUTOID)+1 FROM TBLCASE
		Insert INTO tblCase   
		(  
			Case_Id,  
			Provider_Id,  
			InsuranceCompany_Id,  
			InjuredParty_LastName,  
			InjuredParty_FirstName,  
			InsuredParty_LastName,  
			InsuredParty_FirstName, 
			InjuredParty_Address,
			InjuredParty_City,
			InjuredParty_State,
			InjuredParty_Zip,
			InjuredParty_Phone,
			Accident_Date,  
			Policy_Number,  
			Ins_Claim_Number,
			Status,  
			Date_Opened,  
			Initial_Status,
			GB_CASE_ID,
			GB_CASE_NO,
			GB_COMPANY_ID,
			Bit_FromGB
		)       
		VALUES  
		(  
			'',
			@ProviderId,  
			@InsuranceCompanyId, 
			@InjuredParty_LastName, 
			@InjuredParty_FirstName,  
			@InsuredParty_LastName,  
			@InsuredParty_FirstName, 
			@SZ_PATIENT_ADDRESS,
			@SZ_PATIENT_CITY,
			@SZ_PATIENT_STATE,
			@SZ_PATIENT_ZIP,
			@SZ_PATIENT_PHONE,
			Convert(nvarchar(15), @DT_DATE_OF_ACCIDENT, 101),  
			@SZ_POLICY_NUMBER,  
			@SZ_CLAIM_NUMBER, 
			'GBB',  
			GETDATE(),
			'GB-LIT',
			@SZ_CASE_ID,
			@SZ_CASE_NO,
			@SZ_COMPANY_ID,
			1
		)

		SET  @Case_Id_IDENTITY = @@IDENTITY   
		SET @Case_Id  = 'RFA' + RIGHT(CAST(DATEPART(year, GETDATE()) AS NVARCHAR),2) + '-' + CAST(@Case_Id_IDENTITY AS NVARCHAR)  
		UPDATE tblCase SET Case_Id = @Case_Id where Case_AutoId = @Case_Id_IDENTITY
		EXEC LCJ_AddNotes @Case_Id = @Case_Id,@Notes_Type='A',@NDesc='Case Opened',@User_Id='system',@ApplyToGroup=0
		
		
			INSERT INTO TBLTREATMENT
			(
				Case_Id,
				DateOfService_Start,
				DateOfService_End,
				Claim_Amount,
				Paid_Amount,
				BILL_NUMBER			)
			VALUES
			(
				@Case_Id,
				@DT_START_VISIT_DATE,
				@DT_END_VISIT_DATE,
				@FLT_BILL_AMOUNT,
				@FLT_PAID,
				@SZ_BILL_NUMBER
			)
			SET @NOTES = 'Bill added for DOS ' + convert(varchar(9),@DT_START_VISIT_DATE) + ' - ' + convert(varchar(9),@DT_END_VISIT_DATE)
					exec LCJ_AddNotes @case_id=@Case_Id,@notes_type='Activity',@Ndesc=@NOTES,@User_id='system',@Applytogroup=0
		
		--UPDATE GREENBILLSCASES SET FHKP_CASE_ID = @Case_Id WHERE SZ_COMPANY_ID = @SZ_COMPANY_ID AND SZ_CASE_ID = @SZ_CASE_ID		
	END

	--DROP TABLE #TEMP
END
GO
