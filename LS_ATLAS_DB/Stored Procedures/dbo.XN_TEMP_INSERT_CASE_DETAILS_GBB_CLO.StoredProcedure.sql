USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[XN_TEMP_INSERT_CASE_DETAILS_GBB_CLO]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[XN_TEMP_INSERT_CASE_DETAILS_GBB_CLO]
	
AS
BEGIN
	DECLARE @AUTOID varchar(10)
	DECLARE @SZ_COMPANY_ID VARCHAR(100)
	DECLARE @SZ_CASE_ID	VARCHAR(100)
	DECLARE @SZ_CASE_NO	VARCHAR(100)
	DECLARE @SZ_PATIENT_NAME	VARCHAR(500)
	DECLARE @SZ_PATIENT_ADDRESS	VARCHAR(1000)
	DECLARE @SZ_PATIENT_CITY	VARCHAR(100)
	DECLARE @SZ_PATIENT_STATE VARCHAR(100)
	DECLARE @SZ_PATIENT_ZIP	VARCHAR(100)
	DECLARE @SZ_PATIENT_PHONE	VARCHAR(50)
	DECLARE @DT_DATE_OF_ACCIDENT datetime
	DECLARE @DT_DOB	datetime
	DECLARE @SZ_POLICY_HOLDER VARCHAR(500)
	DECLARE @SZ_POLICY_NUMBER VARCHAR(100)
	DECLARE @SZ_CLAIM_NUMBER VARCHAR(100)
	DECLARE @SZ_BILL_NUMBER VARCHAR(100)
	DECLARE @DT_START_VISIT_DATE datetime
	DECLARE @DT_END_VISIT_DATE datetime
	DECLARE @FLT_BILL_AMOUNT VARCHAR(100)
	DECLARE @FLT_PAID VARCHAR(100)
	DECLARE @InsuranceCompanyId VARCHAR(50)
	DECLARE @Provider_Id VARCHAR(50)
	DECLARE @BILL_DATE datetime
	DECLARE @Denial_Reason1 Varchar(200)
	DECLARE @Denial_Reason2 Varchar(200)
	DECLARE @Denial_Reason3 Varchar(200)
	DECLARE @CASE_TYPE_NAME Varchar(100)
	
	DECLARE @Case_Id AS NVARCHAR(100)
	DECLARE @CurrentDate AS SMALLDATETIME  
	DECLARE @Date_Opened AS DATETIME
	DECLARE @InjuredParty_LastName AS VARCHAR(100)
	DECLARE @InjuredParty_FirstName AS VARCHAR(100)
	DECLARE @InsuredParty_LastName AS VARCHAR(100)
	DECLARE @InsuredParty_FirstName AS VARCHAR(100)
	DECLARE @COUNT INT
	DECLARE @NOTES AS VARCHAR(MAX)
	
	DECLARE @autoidtblcase VARCHAR(100)
	DECLARE @s_a_DomainId nvarchar(50)
	
	
	----- set max id here and change table name-----
	SET @autoidtblcase = 0 --(select max(case_autoid) from tblcase Where  [DomainId] = 'CLO') -- 0
	Set @s_a_DomainId = 'CLO'

	DECLARE CUR_GBB_CASES CURSOR READ_ONLY FORWARD_ONLY LOCAL FOR
	
	SELECT  AUTOID, SZ_CASE_ID, SZ_CASE_NO, SZ_PATIENT_FIRST_NAME,SZ_PATIENT_LAST_NAME, SZ_PATIENT_ADDRESS, SZ_PATIENT_CITY, SZ_PATIENT_STATE, SZ_PATIENT_ZIP, SZ_PATIENT_PHONE, DT_DATE_OF_ACCIDENT, DT_DOB, SZ_POLICY_HOLDER, SZ_POLICY_NUMBER, SZ_CLAIM_NUMBER, SZ_BILL_NUMBER, DT_FIRST_VISIT_DATE, dt_last_visit_date, FLT_BILL_AMOUNT, FLT_PAID, InsuranceCompanyId, Provider_Id,SZ_COMPANY_ID,Denial_Reason1,Denial_Reason2,Denial_Reason3,SZ_CASE_TYPE_NAME,BILL_DATE,DomainId
	FROM [XN_TEMP_TABLE_GBB_DATA_GoGYB_ALL_CLO] where ISNULL(insurancecompanyid ,'') <> ''  and ISNULL(Status_Done,'') = ''  and ISNULL(provider_id,'') <> ''
	--AND (CONVERT(money,FLT_BILL_AMOUNT)- convert(money,FLT_PAID)) > 0 And [DomainId] = @s_a_DomainId
	--AND YEAR(DT_DATE_OF_TRANSFERRED) = 2016

	--AND (FLT_BILL_AMOUNT - FLT_PAID)  < 0.1 and YEAR(DT_DATE_OF_TRANSFERRED) = 2016 --FLT_BALANCE not like '%-%' AND
	

	  
	OPEN CUR_GBB_CASES
	FETCH NEXT FROM CUR_GBB_CASES INTO @AUTOID, @SZ_CASE_ID, @SZ_CASE_NO, @InjuredParty_FirstName, @InjuredParty_LastName, @SZ_PATIENT_ADDRESS, @SZ_PATIENT_CITY, @SZ_PATIENT_STATE, @SZ_PATIENT_ZIP, @SZ_PATIENT_PHONE, @DT_DATE_OF_ACCIDENT, @DT_DOB, @SZ_POLICY_HOLDER, @SZ_POLICY_NUMBER, @SZ_CLAIM_NUMBER, @SZ_BILL_NUMBER, @DT_START_VISIT_DATE, @DT_END_VISIT_DATE, @FLT_BILL_AMOUNT, @FLT_PAID, @InsuranceCompanyId, @Provider_Id,@SZ_COMPANY_ID,@Denial_Reason1,@Denial_Reason2,@Denial_Reason3,@CASE_TYPE_NAME,@BILL_DATE,@s_a_DomainId

	WHILE @@FETCH_STATUS <> -1
	BEGIN
		print @SZ_BILL_NUMBER
		SET @InsuredParty_FirstName = RTRIM(LTRIM(SUBSTRING(@SZ_POLICY_HOLDER,CHARINDEX(',',@SZ_POLICY_HOLDER) + 1,LEN(@SZ_POLICY_HOLDER))))
		SET @InsuredParty_LastName = RTRIM(LTRIM(SUBSTRING(@SZ_POLICY_HOLDER,0,CHARINDEX(',',@SZ_POLICY_HOLDER)))) 
		SET @CurrentDate = Convert(Varchar(15), GetDate(),102)		
		SET @Case_Id = (Select TOP 1 Case_Id FROM  tblCase  
						WHERE  GB_CASE_ID =@SZ_CASE_ID and GB_CASE_NO=@SZ_CASE_NO and  Provider_Id =@Provider_Id and GB_COMPANY_ID=@SZ_COMPANY_ID And [DomainId] = @s_a_DomainId
						and Case_AutoId > @autoidtblcase )--(Status='GBB' or Status like 'AAA PACKAGE INCOMPLETE%' or Status='AAA OPEN' or Status ='AAA PACKAGE READY-WITHOUT TEMPLATE') ) -- AND Case_AutoId >168845 and (Case_AutoId > 167580 (Status='GBB' or Status like 'AAA PACKAGE INCOMPLETE%' or Status='AAA OPEN') 
		
		
		IF @Case_Id != '' OR @Case_Id IS NOT NULL
		BEGIN
			DECLARE @BILLNUM AS INT
			IF EXISTS(SELECT BILL_NUMBER FROM TBLTREATMENT WHERE BILL_NUMBER = @SZ_BILL_NUMBER AND CASE_ID = @Case_Id And [DomainId] = @s_a_DomainId)
			BEGIN			
				UPDATE
					TBLTREATMENT
				SET
					DateOfService_Start = @DT_START_VISIT_DATE,
					DateOfService_End = @DT_END_VISIT_DATE,
					Claim_Amount = @FLT_BILL_AMOUNT,
					Fee_Schedule = @FLT_BILL_AMOUNT,
					Paid_Amount = @FLT_PAID,
					date_billsent = @BILL_DATE, 
					DenialReason_ID = (SELECT DenialReasons_Id from tblDenialReasons WHERE DENIALREASONS_TYPE = @Denial_Reason1),
					[DomainId] = @s_a_DomainId
				WHERE
					CASE_ID = @Case_Id
					and
					BILL_NUMBER = @SZ_BILL_NUMBER
				And [DomainId] = @s_a_DomainId
				IF NOT EXISTS(SELECT * FROM TXN_tblTreatment WHERE Treatment_Id = (select Treatment_Id from tblTreatment WHERE CASE_ID = @Case_Id and BILL_NUMBER = @SZ_BILL_NUMBER And [DomainId] = @s_a_DomainId)
				AND DenialReasons_Id = (SELECT DenialReasons_Id from tblDenialReasons WHERE DENIALREASONS_TYPE = @Denial_Reason2))
				BEGIN
					INSERT TXN_tblTreatment (Treatment_Id,DenialReasons_Id)
					Select Treatment_Id,(select DenialReasons_Id from tblDenialReasons where DENIALREASONS_TYPE = @Denial_Reason2 and DENIALREASONS_TYPE <> '') as DenialReasons_Id  from TBLTREATMENT WHERE CASE_ID = @Case_Id and BILL_NUMBER = @SZ_BILL_NUMBER And [DomainId] = @s_a_DomainId
				END
				
				
				IF NOT EXISTS(SELECT * FROM TXN_tblTreatment WHERE Treatment_Id = (select Treatment_Id from tblTreatment WHERE CASE_ID = @Case_Id and BILL_NUMBER = @SZ_BILL_NUMBER And [DomainId] = @s_a_DomainId)
				AND DenialReasons_Id = (SELECT DenialReasons_Id from tblDenialReasons WHERE DENIALREASONS_TYPE = @Denial_Reason3))
				BEGIN
					INSERT TXN_tblTreatment (Treatment_Id,DenialReasons_Id)
					Select Treatment_Id,(select DenialReasons_Id from tblDenialReasons where DENIALREASONS_TYPE = @Denial_Reason3 and DENIALREASONS_TYPE <> '') as DenialReasons_Id  from TBLTREATMENT WHERE CASE_ID = @Case_Id and BILL_NUMBER = @SZ_BILL_NUMBER 
				END
				
				SET @NOTES = 'Bill updated for DOS ' + convert(varchar(9),@DT_START_VISIT_DATE) + ' - ' + convert(varchar(9),@DT_END_VISIT_DATE)
				exec LCJ_AddNotes @case_id=@Case_Id,@notes_type='Activity',@Ndesc=@NOTES,@User_id='system',@Applytogroup=0, @DomainId = @s_a_DomainId
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
						BILL_NUMBER,
						Fee_Schedule,
						Date_BillSent,
						DenialReason_ID,
						DomainId
					)
					VALUES
					(
						@Case_Id,
						@DT_START_VISIT_DATE,
						@DT_END_VISIT_DATE,
						@FLT_BILL_AMOUNT,
						@FLT_PAID,
						@SZ_BILL_NUMBER,
						@FLT_BILL_AMOUNT,
						@BILL_DATE,
						(SELECT TOP 1 DenialReasons_Id from tblDenialReasons WHERE DENIALREASONS_TYPE = @Denial_Reason1 and DomainId = @s_a_DomainId),
						@s_a_DomainId
					)
					if((select TOP 1 DenialReasons_Id from tblDenialReasons where DENIALREASONS_TYPE = @Denial_Reason2 and DENIALREASONS_TYPE <> '' and DomainId = @s_a_DomainId) is not null)
					BEGIN
						INSERT TXN_tblTreatment (Treatment_Id, DenialReasons_Id, DomainId)
						Select Treatment_Id,(select DenialReasons_Id from tblDenialReasons where DENIALREASONS_TYPE = @Denial_Reason2 and DENIALREASONS_TYPE <> '') as DenialReasons_Id, @s_a_DomainId  from TBLTREATMENT WHERE CASE_ID = @Case_Id and BILL_NUMBER = @SZ_BILL_NUMBER and DomainId = @s_a_DomainId
					END
					
					IF((select TOP 1 DenialReasons_Id from tblDenialReasons where DENIALREASONS_TYPE = @Denial_Reason3 and DENIALREASONS_TYPE <> '' and DomainId = @s_a_DomainId) is not null)
					BEGIN
						INSERT TXN_tblTreatment (Treatment_Id, DenialReasons_Id, DomainId)
						Select Treatment_Id,(select DenialReasons_Id from tblDenialReasons where DENIALREASONS_TYPE = @Denial_Reason3 and DENIALREASONS_TYPE <> '') as DenialReasons_Id, @s_a_DomainId  from TBLTREATMENT WHERE CASE_ID = @Case_Id and BILL_NUMBER = @SZ_BILL_NUMBER and DomainId = @s_a_DomainId
				
					END

					SET @NOTES = 'Bill added for DOS ' + convert(varchar(9),@DT_START_VISIT_DATE) + ' - ' + convert(varchar(9),@DT_END_VISIT_DATE)
					exec LCJ_AddNotes @case_id=@Case_Id,@notes_type='Activity',@Ndesc=@NOTES,@User_id='system',@Applytogroup=0,@DomainId = @s_a_DomainId
			END
			
		END  
		ELSE  
		BEGIN     
			DECLARE @MaxCase_Id VARCHAR(100)  
			DECLARE @Case_Id_IDENTITY INTEGER    
			DECLARE @MaxCase_AUTOID INTEGER    

		SET @MaxCase_ID=ISNULL((SELECT top 1 tblCase.Case_ID FROM tblCase  WHERE DomainId=@s_a_DomainId ORDER BY Case_AUTOID DESC),'100000')
		print @MaxCase_ID
		SET @MaxCase_AUTOID = (SELECT top 1 items + 1 FROM dbo.[STRING_SPLIT](@MaxCase_ID,'-') Order by autoid desc)
		print @MaxCase_AUTOID
		SET @Case_Id  = UPPER(@s_a_DomainId) + RIGHT(CAST(DATEPART(year, GETDATE()) AS NVARCHAR),2) + '-' + CAST(@MaxCase_AUTOID AS NVARCHAR)
		print @Case_Id



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
				Bit_FromGB,
				DomainId
			)       
			VALUES  
			(  
				@Case_Id,
				@Provider_Id,  
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
				'AAA - NEW CASE ENTERED',--'AAA OPEN',  
				GETDATE(),
				'ARB', --'ARB',
				@SZ_CASE_ID,
				@SZ_CASE_NO,
				@SZ_COMPANY_ID,
				1,
				@s_a_DomainId
			)

			--SET  @Case_Id_IDENTITY = @@IDENTITY   
			--SET @Case_Id  = @s_a_DomainId + RIGHT(CAST(DATEPART(year, GETDATE()) AS NVARCHAR),2) + '-' + CAST(@Case_Id_IDENTITY AS NVARCHAR) 
			 
			--UPDATE tblCase SET Case_Id = @Case_Id where Case_AutoId = @Case_Id_IDENTITY And DomainId = @s_a_DomainId

			exec LCJ_AddNotes @Case_Id = @Case_Id,@Notes_Type='Activity',@NDesc='Case Opened',@User_Id='System',@ApplyToGroup=0,@DomainId = @s_a_DomainId
			
			
				INSERT INTO TBLTREATMENT
				(
					Case_Id,
					DateOfService_Start,
					DateOfService_End,
					Claim_Amount,
					Paid_Amount,
					BILL_NUMBER,
					Fee_Schedule,
					date_billsent,
					DenialReason_ID,
					DomainId
				)
				VALUES
				(
					@Case_Id,
					@DT_START_VISIT_DATE,
					@DT_END_VISIT_DATE,
					@FLT_BILL_AMOUNT,
					@FLT_PAID,
					@SZ_BILL_NUMBER,
					@FLT_BILL_AMOUNT,
					@BILL_DATE,
					(SELECT top 1 DenialReasons_Id from tblDenialReasons WHERE DENIALREASONS_TYPE = @Denial_Reason1 and DomainId = @s_a_DomainId ),
					@s_a_DomainId
				)
				
				
				IF((select top 1 DenialReasons_Id from tblDenialReasons where DENIALREASONS_TYPE = @Denial_Reason2 and DENIALREASONS_TYPE <> '' and DomainId = @s_a_DomainId ) is not null)
				BEGIN
					INSERT TXN_tblTreatment (Treatment_Id,DenialReasons_Id, DomainId)
					Select Treatment_Id,(select top 1 DenialReasons_Id from tblDenialReasons where DENIALREASONS_TYPE = @Denial_Reason2 and DENIALREASONS_TYPE <> '' and DomainId = @s_a_DomainId) as DenialReasons_Id, @s_a_DomainId from TBLTREATMENT WHERE CASE_ID = @Case_Id and BILL_NUMBER = @SZ_BILL_NUMBER and DomainId = @s_a_DomainId 
				END
				
				IF((select top 1 DenialReasons_Id from tblDenialReasons where DENIALREASONS_TYPE = @Denial_Reason3 and DENIALREASONS_TYPE <> '' and DomainId = @s_a_DomainId ) is not null)
				BEGIN
					INSERT TXN_tblTreatment (Treatment_Id,DenialReasons_Id, DomainId)
					Select Treatment_Id,(select top 1 DenialReasons_Id from tblDenialReasons where DENIALREASONS_TYPE = @Denial_Reason3 and DENIALREASONS_TYPE <> '' and DomainId = @s_a_DomainId) as DenialReasons_Id, @s_a_DomainId from TBLTREATMENT WHERE CASE_ID = @Case_Id and BILL_NUMBER = @SZ_BILL_NUMBER and DomainId = @s_a_DomainId 
				END

				SET @NOTES = 'Bill added for DOS ' + convert(varchar(9),@DT_START_VISIT_DATE) + ' - ' + convert(varchar(9),@DT_END_VISIT_DATE)
				exec LCJ_AddNotes @case_id=@Case_Id,@notes_type='Activity',@Ndesc=@NOTES,@User_id='system',@Applytogroup=0,@DomainId = @s_a_DomainId
		END
		
		
		IF(@CASE_TYPE_NAME <> 'NoFault' AND @CASE_TYPE_NAME <> 'NO FAULT' AND @CASE_TYPE_NAME <> 'No-Fault' AND @CASE_TYPE_NAME <> 'NF'  AND @CASE_TYPE_NAME <> 'ARB' AND @CASE_TYPE_NAME <> 'SP')
		BEGIN
			UPDATE TBLCASE 
			SET status = 'AAA - REJECT - RETURN TO CLIENT - WC FILE', initial_status ='Closed'
			WHERE Case_Id=@Case_Id And DomainId = @s_a_DomainId
			
			
			exec LCJ_AddNotes @case_id=@Case_Id,@notes_type='PROVIDER',@Ndesc='cannot pursue a non no-fault case.',@User_id='system',@Applytogroup=0 ,@DomainId = @s_a_DomainId
		END

	  UPDATE [XN_TEMP_TABLE_GBB_DATA_GoGYB_ALL_CLO]
	  SET Status_Done='Done'
	  WHERE AUTOID = @AUTOID
	  
	FETCH NEXT FROM CUR_GBB_CASES INTO @AUTOID, @SZ_CASE_ID, @SZ_CASE_NO, @InjuredParty_FirstName, @InjuredParty_LastName, @SZ_PATIENT_ADDRESS, @SZ_PATIENT_CITY, @SZ_PATIENT_STATE, @SZ_PATIENT_ZIP, @SZ_PATIENT_PHONE, @DT_DATE_OF_ACCIDENT, @DT_DOB, @SZ_POLICY_HOLDER, @SZ_POLICY_NUMBER, @SZ_CLAIM_NUMBER, @SZ_BILL_NUMBER, @DT_START_VISIT_DATE, @DT_END_VISIT_DATE, @FLT_BILL_AMOUNT, @FLT_PAID, @InsuranceCompanyId, @Provider_Id,@SZ_COMPANY_ID,@Denial_Reason1,@Denial_Reason2,@Denial_Reason3,@CASE_TYPE_NAME,@BILL_DATE,@s_a_DomainId
	END
	CLOSE CUR_GBB_CASES
	DEALLOCATE CUR_GBB_CASES




	--DROP TABLE #TEMP
END



GO
