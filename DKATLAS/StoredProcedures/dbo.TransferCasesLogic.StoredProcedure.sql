USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[TransferCasesLogic]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TransferCasesLogic] --TransferCasesLogic 'GYB'
(
	@Gbb_Type VARCHAR(10) 
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   	DECLARE @Case TABLE
		(
			ID INT IDENTITY(1,1),
			[CaseId] [int] NOT NULL,
			[CaseNo] [varchar](500) NULL,
			[PatientFirstName] [varchar](800) NULL,
			[PatientLastName] [varchar](800) NULL,
			[PatientAddress] VARCHAR(MAX) NULL,
			[PatientStreet] [varchar](800) NULL,
			[PatientCity] [varchar](800) NULL,
			[PatientState] [varchar](800) NULL,
			[PatientZip] [varchar](800) NULL,
			[PatientPhone] [varchar](800) NULL,
			[PolicyNumber] [varchar](800) NULL,
			[ClaimNumber] [varchar](800) NULL,
			[BillStatusName] [varchar](800) NULL,
			[AttorneyName] VARCHAR(MAX) NULL,
			[AttorneyLastName] [varchar](800) NULL,
			[AttorneyAddress] VARCHAR(MAX) NULL,
			[AttorneyCity] [varchar](800) NULL,
			[AttorneyState] [varchar](800) NULL,
			[AttorneyZip] [varchar](800) NULL,
			[AttorneyFax] [varchar](800) NULL,
			[SocialSecurityNo] [varchar](800) NULL,
			[PolicyHolder] [varchar](800) NULL,
			[BillNumber] [varchar](800) NULL,
			[FltBillAmount] [varchar](800) NULL,
			[FltPaid] [varchar](800) NULL,
			[FltBalance] [varchar](800) NULL,
			[FirstVisitDate] DATETIME NULL,
			[LastVisitDate] DATETIME NULL,
			[CaseTypeName] [varchar](800) NULL,
			[Location] [varchar](800) NULL,
			[CompanyId] [varchar](800) NULL,
			[DateofAccident] DATETIME NULL,
			[AssignedLawFirmId] [varchar](800) NULL,
			[TransferAmount] [varchar](800) NULL,
			[DateOfTransferred] DATETIME NULL,
			[BillDate] DATETIME NULL,
			DenialReason1 VARCHAR(8000) NULL,
			DenialReason2 VARCHAR(8000) NULL,
			DenialReason3 VARCHAR(8000) NULL,
			--[DomainId] VARCHAR(500) NULL,
			[AtlasProviderId] INT NULL,
			[AtlasInsuranceId] INT NULL,
			[GBB_Type] VARCHAR(10) NULL,
			[IsDuplicateCase] INT NULL
	)

		INSERT INTO @Case
		SELECT 
			CaseId	,
			CaseNo	,
			PatientFirstName	,
			PatientLastName	,
			PatientAddress	,
			PatientStreet	,
			PatientCity	,
			PatientState	,
			PatientZip	,
			PatientPhone	,
			PolicyNumber	,
			ClaimNumber	,
			BillStatusName	,
			AttorneyName	,
			AttorneyLastName	,
			AttorneyAddress	,
			AttorneyCity	,
			AttorneyState	,
			AttorneyZip	,
			AttorneyFax	,
			SocialSecurityNo	,
			PolicyHolder	,
			BillNumber	,
			FltBillAmount	,
			FltPaid	,
			FltBalance	,
			FirstVisitDate	,
			LastVisitDate	,
			CaseTypeName	,
			Location	,
			CompanyId	,
			DateofAccident	,
			AssignedLawFirmId	,
			TransferAmount	,
			DateOfTransferred	,
			BillDate	,
			DenialReason1	,
			DenialReason2	,
			DenialReason3	,
			--DomainId	,
			AtlasProviderId	,
			AtlasInsuranceId	,
			GBB_Type	,
			IsDuplicateCase	
		FROM XN_TEMP_GBB_ALL
		WHERE ISNULL(AtlasProviderId,'') <>''
			AND ISNULL(AtlasInsuranceId,'') <> ''
			AND ISNULL(Transferd_Status,'') =''


		--DECLARE @DOMAINID VARCHAR(100)
		DECLARE	@SZ_CASE_ID	VARCHAR(100)
		DECLARE	@SZ_CASE_NO	VARCHAR(100)
		DECLARE	@InjuredParty_LastName	VARCHAR(100)
		DECLARE	@InjuredParty_FirstName	VARCHAR(100)
		DECLARE	@SZ_PATIENT_ADDRESS	VARCHAR(1000)
		DECLARE	@SZ_PATIENT_CITY	VARCHAR(100)
		DECLARE	@SZ_PATIENT_STATE	VARCHAR(100)
		DECLARE	@SZ_PATIENT_ZIP	VARCHAR(100)
		DECLARE	@SZ_PATIENT_PHONE	VARCHAR(50)
		DECLARE	@SZ_POLICY_NUMBER	VARCHAR(100)
		DECLARE	@SZ_CLAIM_NUMBER	VARCHAR(100)
		DECLARE	@SZ_POLICY_HOLDER	VARCHAR(500)
		DECLARE	@SZ_BILL_NUMBER	VARCHAR(100)
		DECLARE	@FLT_BILL_AMOUNT	VARCHAR(100)
		DECLARE	@FLT_PAID	VARCHAR(100)
		DECLARE	@DT_START_VISIT_DATE	VARCHAR(100)
		DECLARE	@DT_END_VISIT_DATE	VARCHAR(100)
		DECLARE	@CASE_TYPE_NAME	VARCHAR(100)
		DECLARE	@SZ_COMPANY_ID	VARCHAR(100)
		DECLARE	@DT_DATE_OF_ACCIDENT	datetime
		DECLARE	@AssignedLawFirmId	VARCHAR(200)
		DECLARE	@BILL_DATE	VARCHAR(100)
		DECLARE	@DenialReason1	NVARCHAR(200)
		DECLARE	@DenialReason2	NVARCHAR(200)
		DECLARE	@DenialReason3	NVARCHAR(200)
		DECLARE	@ProviderID	INT
		DECLARE	@InsuranceCompanyID	INT
		DECLARE	@GBBType	VARCHAR(10)
		DECLARE	@IsDuplicateCase	INT


		DECLARE @TotalCount INT = 0
		DECLARE @Counter INT = 1
		DECLARE @MaxCaseId INT
		DECLARE	@InsuredParty_LastName	VARCHAR(100)
		DECLARE	@InsuredParty_FirstName	VARCHAR(100)
		DECLARE	@AtlasCaseID	VARCHAR(50)
		DECLARE	@NOTES	VARCHAR(MAX)

		SELECT @TotalCount = COUNT(*) FROM @Case
		SET @MaxCaseId = (SELECT MAX(Case_AutoId) from tblcase)
		WHILE(@Counter <= @TotalCount)
		BEGIN
			SELECT	@SZ_CASE_ID = CaseId, @SZ_CASE_NO = CaseNo, @SZ_COMPANY_ID = CompanyId,
					@SZ_BILL_NUMBER = BillNumber,@DT_START_VISIT_DATE = FirstVisitDate,@DT_END_VISIT_DATE = LastVisitDate,
					@FLT_BILL_AMOUNT = FltBillAmount,@FLT_PAID = FltPaid,@BILL_DATE = BillDate, --@DOMAINID = DomainId,
					@InjuredParty_FirstName = PatientFirstName,@InjuredParty_LastName = PatientLastName,@SZ_POLICY_HOLDER = PolicyHolder,
					@SZ_PATIENT_ADDRESS = PatientAddress,@SZ_PATIENT_CITY = PatientCity,@SZ_PATIENT_STATE = PatientState,
					@SZ_PATIENT_ZIP = PatientZip, @SZ_PATIENT_PHONE = PatientPhone,@DT_DATE_OF_ACCIDENT = CONVERT(NVARCHAR(15), DateofAccident, 101),
					@SZ_POLICY_NUMBER = PolicyNumber,@SZ_CLAIM_NUMBER = ClaimNumber,@AssignedLawFirmId = AssignedLawFirmId,
					@CASE_TYPE_NAME = CaseTypeName,
					@DenialReason1 = DenialReason1,@DenialReason2 = DenialReason2,@DenialReason3 = DenialReason3,
					@IsDuplicateCase = IsDuplicateCase,@ProviderID=AtlasProviderId,@InsuranceCompanyID= AtlasInsuranceId, @GBBType = GBB_Type
			FROM	@Case WHERE ID = @Counter

			SET @InsuredParty_FirstName = RTRIM(LTRIM(SUBSTRING(@SZ_POLICY_HOLDER,CHARINDEX(',',@SZ_POLICY_HOLDER) + 1,LEN(@SZ_POLICY_HOLDER))))
			SET @InsuredParty_LastName = RTRIM(LTRIM(SUBSTRING(@SZ_POLICY_HOLDER,0,CHARINDEX(',',@SZ_POLICY_HOLDER)))) 
		
			


				DECLARE @s_l_Initial_Status VARCHAR(50)  
				IF (@ProviderID in (7349,7331,7263,6246,7357,7371,7375))  
				BEGIN  
					SET @AtlasCaseID = NULL   
					SET @s_l_Initial_Status = 'ACTIVE'  
				END   
				ELSE  
				BEGIN  
					SET @AtlasCaseID = (SELECT TOP 1 CASE_ID FROM  tblCase  
								WHERE  GB_CASE_ID =@SZ_CASE_ID 
								AND GB_CASE_NO=@SZ_CASE_NO 
								AND GB_COMPANY_ID=@SZ_COMPANY_ID 
								AND IsDuplicateCase = @IsDuplicateCase
								AND provider_id = @ProviderID
								AND Case_AutoId > @MaxCaseId)
					 SET @s_l_Initial_Status = 'ARB'  
				END  





			
			
			--- Transferd Date
			UPDATE XN_TEMP_GBB_ALL
			SET Transferd_Date = convert(Date,getdate())
			WHERE  BillNumber=@SZ_BILL_NUMBER AND Transferd_Date IS NULL


			IF EXISTS(SELECT BILL_NUMBER FROM TBLTREATMENT WHERE BILL_NUMBER = @SZ_BILL_NUMBER)
			BEGIN
				PRINT 'Bill Already Exist'									
			END
			ELSE IF(ISNULL(@AtlasCaseID, '') <> '')
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
							--DomainId,
							--Service_Type,
							DocumentStatus
						)
						VALUES
						(
							@AtlasCaseID,
							@DT_START_VISIT_DATE,
							@DT_END_VISIT_DATE,
							CASE WHEN ISNUMERIC(@FLT_BILL_AMOUNT) = 0 THEN 0 ELSE CONVERT(NUMERIC(18, 2), @FLT_BILL_AMOUNT) END,
							CASE WHEN ISNUMERIC(@FLT_PAID) = 0 THEN 0 ELSE CONVERT(NUMERIC(18, 2), @FLT_PAID) END,
							@SZ_BILL_NUMBER,
							CASE WHEN ISNUMERIC(@FLT_BILL_AMOUNT) = 0 THEN 0 ELSE CONVERT(NUMERIC(18, 2), @FLT_BILL_AMOUNT) END,
							@BILL_DATE,
							(SELECT TOP 1 DenialReasons_Id from tblDenialReasons WHERE DENIALREASONS_TYPE = @DenialReason1 ),
							--@DOMAINID,
							--'PFNCS',
							'Document Pending'
						)
	
					IF((SELECT TOP 1 DenialReasons_Id FROM tblDenialReasons WHERE DENIALREASONS_TYPE = @DenialReason2 and DENIALREASONS_TYPE <> '' ) is not null)
					BEGIN
						INSERT TXN_tblTreatment (Treatment_Id, DenialReasons_Id)--, DomainId
						SELECT Treatment_Id,(SELECT TOP 1 DenialReasons_Id FROM tblDenialReasons 
						WHERE DENIALREASONS_TYPE = @DenialReason2 --AND  domainId = @DOMAINID
						) AS DenialReasons_Id --, @DOMAINID  
						FROM TBLTREATMENT WHERE CASE_ID = @AtlasCaseID AND
						BILL_NUMBER = @SZ_BILL_NUMBER 
					END
					
					IF((SELECT TOP 1 DenialReasons_Id FROM tblDenialReasons WHERE DENIALREASONS_TYPE = @DenialReason3 and 
					DENIALREASONS_TYPE <> '' ) is not null)
					BEGIN
						INSERT TXN_tblTreatment (Treatment_Id, DenialReasons_Id) --, DomainId
						SELECT Treatment_Id,(SELECT TOP 1 DenialReasons_Id FROM tblDenialReasons WHERE 
						DENIALREASONS_TYPE = @DenialReason3  --AND  domainId = @DOMAINID
						) AS 
						DenialReasons_Id --, @DOMAINID  
						FROM TBLTREATMENT WHERE CASE_ID = @AtlasCaseID 
						and BILL_NUMBER = @SZ_BILL_NUMBER 
				
					END

				SET @NOTES = 'Bill added for DOS ' + convert(varchar(9),@DT_START_VISIT_DATE) + ' - ' + convert(varchar(9),@DT_END_VISIT_DATE)
				exec LCJ_AddNotes @case_id=@AtlasCaseID,@notes_type='Activity',@Ndesc=@NOTES,@User_id='system',@Applytogroup=0 --,@DomainId = @DOMAINID
											
			END		
			ELSE 
			BEGIN
	
					DECLARE @MaxCase_ID VARCHAR(100)   
					DECLARE @MaxCase_AUTOID INT 

					SET @MaxCase_ID=ISNULL((SELECT TOP 1 tblCase.Case_ID FROM tblCase  --WHERE DomainId=@DOMAINID 
					ORDER BY Case_AUTOID DESC),'100000')

					SET @MaxCase_AUTOID = (SELECT top 1 items + 1 FROM dbo.[STRING_SPLIT](@MaxCase_ID,'-') ORDER BY AUTOID DESC)
					SET @AtlasCaseID  ='DK' + RIGHT(CAST(DATEPART(year, GETDATE()) AS NVARCHAR),2) + '-' + CAST(@MaxCase_AUTOID AS NVARCHAR)   

					INSERT INTO tblCase   
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
						--DomainId,
						GB_LawFirm_ID,
						IsDuplicateCase,
						gbb_type
					)       
					VALUES  
					(  
						@AtlasCaseID,
						@ProviderID,  
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
						'AAA NEW CASE-DATA ENTRY',--'AAA - NEW CASE ENTERED', --'AAA - NEW CASE ENTERED',--'AAA OPEN',  
						GETDATE(),
						@s_l_Initial_Status,
						@SZ_CASE_ID,
						@SZ_CASE_NO,
						@SZ_COMPANY_ID,
						1,
						--@DOMAINID,
						@AssignedLawFirmId,
						@IsDuplicateCase,
						@Gbb_Type
					)

					EXEC LCJ_AddNotes @Case_Id = @AtlasCaseID,@Notes_Type='Activity',@NDesc='Case Opened',@User_Id='System',@ApplyToGroup=0 --,@DomainId = @DOMAINID
					


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
						--DomainId,
						Service_Type,
						DocumentStatus
					)
					VALUES
					(
						@AtlasCaseID,
						@DT_START_VISIT_DATE,
						@DT_END_VISIT_DATE,
						CASE WHEN ISNUMERIC(@FLT_BILL_AMOUNT) = 0 THEN 0 ELSE CONVERT(NUMERIC(18, 2), @FLT_BILL_AMOUNT) END,
						CASE WHEN ISNUMERIC(@FLT_PAID) = 0 THEN 0 ELSE CONVERT(NUMERIC(18, 2), @FLT_PAID) END,
						@SZ_BILL_NUMBER,
						CASE WHEN ISNUMERIC(@FLT_BILL_AMOUNT) = 0 THEN 0 ELSE CONVERT(NUMERIC(18, 2), @FLT_BILL_AMOUNT) END,
						@BILL_DATE,
						(SELECT top 1 DenialReasons_Id from tblDenialReasons WHERE DENIALREASONS_TYPE = @DenialReason1  ),
						--@DOMAINID,
						'PFNCS',
						'Document Pending'
					)
			
						

					IF((SELECT TOP 1 DenialReasons_Id from tblDenialReasons WHERE DENIALREASONS_TYPE = @DenialReason2 AND DENIALREASONS_TYPE <> ''  ) IS NOT NULL)
					BEGIN
						INSERT TXN_tblTreatment (Treatment_Id,DenialReasons_Id)--, DomainId
						SELECT Treatment_Id,(SELECT TOP 1 DenialReasons_Id FROM
						 tblDenialReasons where DENIALREASONS_TYPE = @DenialReason2) as DenialReasons_Id --, @DOMAINID 
						 FROM TBLTREATMENT 
						 WHERE CASE_ID = @AtlasCaseID AND BILL_NUMBER = @SZ_BILL_NUMBER  
					END
			
					IF((SELECT TOP 1 DenialReasons_Id from tblDenialReasons WHERE DENIALREASONS_TYPE = @DenialReason3 
					AND DENIALREASONS_TYPE <> ''  ) IS NOT NULL)
					BEGIN
						INSERT TXN_tblTreatment (Treatment_Id,DenialReasons_Id) --, DomainId
						SELECT Treatment_Id,(SELECT TOP 1 DenialReasons_Id FROM tblDenialReasons WHERE 
						DENIALREASONS_TYPE = @DenialReason3 ) as DenialReasons_Id --, @DOMAINID 
						from TBLTREATMENT WHERE CASE_ID = @AtlasCaseID AND
						 BILL_NUMBER = @SZ_BILL_NUMBER  
					END

					SET @NOTES = 'Bill added for DOS ' + convert(varchar(9),@DT_START_VISIT_DATE) + ' - ' + convert(varchar(9),@DT_END_VISIT_DATE)
					exec LCJ_AddNotes @case_id=@AtlasCaseID,@notes_type='Activity',@Ndesc=@NOTES,@User_id='system',@Applytogroup=0 --,@DomainId = @DOMAINID
					
					IF(@CASE_TYPE_NAME <> 'NoFault' AND @CASE_TYPE_NAME <> 'NO FAULT' AND @CASE_TYPE_NAME <> 'No-Fault' AND @CASE_TYPE_NAME <> 'NF'  AND @CASE_TYPE_NAME <> 'ARB' AND @CASE_TYPE_NAME <> 'SP')
					BEGIN
						UPDATE TBLCASE 
						SET status = 'AAA - REJECT - RETURN TO CLIENT - WC FILE', initial_status ='Closed'
						WHERE Case_Id=@AtlasCaseID						
						exec LCJ_AddNotes @case_id=@AtlasCaseID,@notes_type='PROVIDER',@Ndesc='RFA cannot pursue a non no-fault case.',@User_id='system',@Applytogroup=0
					END		
					
					IF(@IsDuplicateCase = 1)
					BEGIN
						EXEC LCJ_AddNotes @Case_Id = @AtlasCaseID,@Notes_Type='PROVIDER',@NDesc='cannot pursue this case because it’s  paid',@User_Id='System',@ApplyToGroup=0 --,@DomainId = @DOMAINID
						update tblcase set Status='CLOSED - RETURNED TO CLIENT',Initial_Status='CLOSED' where Case_Id =@AtlasCaseID 
					END					
			END	

			
			SET @SZ_CASE_ID = NULL
			SET @SZ_CASE_NO = NULL
			SET @SZ_COMPANY_ID = NULL
			SET @SZ_BILL_NUMBER = NULL
			SET @DT_START_VISIT_DATE = NULL
			SET @DT_END_VISIT_DATE = NULL
			SET @FLT_BILL_AMOUNT = NULL
			SET @FLT_PAID = NULL
			SET @BILL_DATE = NULL
			--SET @DOMAINID = NULL
			SET @InjuredParty_FirstName = NULL
			SET @InjuredParty_LastName = NULL
			SET @SZ_POLICY_HOLDER = NULL
			SET @SZ_PATIENT_ADDRESS = NULL
			SET @SZ_PATIENT_CITY = NULL
			SET @SZ_PATIENT_STATE = NULL
			SET @SZ_PATIENT_ZIP = NULL
			SET @SZ_PATIENT_PHONE = NULL
			SET @DT_DATE_OF_ACCIDENT = NULL
			SET @SZ_POLICY_NUMBER = NULL
			SET @SZ_CLAIM_NUMBER = NULL
			SET @ProviderID = NULL
			SET @InsuranceCompanyID = NULL

			SET @Counter = @Counter + 1
		END

		----START Record Case id
		BEGIN
			UPDATE XN_TEMP_GBB_ALL
				SET Transferd_Status = T.Case_Id
				FROM XN_TEMP_GBB_ALL X
				INNER JOIN tblTreatment T ON X.BillNumber = T.BILL_NUMBER
		END ---- END Record Case id
		
		
		---START Closed Cases less than $25.
		
			insert into tblnotes (Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)	
			SELECT 'RFA is not pursuing a case less than $25.' AS Notes_Desc
					, 'PROVIDER' AS Notes_Type  
					, 1 AS Notes_Priority 
					, Case_Id 
					, GETDATE() AS Notes_Date
					, 'System'
			FROM tblCASE where GB_CASE_ID is not null and Date_Opened > CONVERT(DATE,GETDATE()) 
			AND gbb_type = @Gbb_Type
			AND (convert(decimal(38,2),Claim_Amount)-convert(decimal(38,2),Paid_Amount))< 25 
			AND Status <>'GBB CLOSED-UNOPENED/RETURN TO CLIENT'
			
			
			UPDATE tblCase
			SET Status='GBB CLOSED-UNOPENED/RETURN TO CLIENT',Initial_Status='CLOSED'
			FROM tblCASE where GB_CASE_ID is not null and Date_Opened > CONVERT(DATE,GETDATE()) 
			AND gbb_type = @Gbb_Type
			AND (convert(decimal(38,2),Claim_Amount)-convert(decimal(38,2),Paid_Amount))< 25 
			AND Status <>'GBB CLOSED-UNOPENED/RETURN TO CLIENT'
			
		---END Closed Cases less than $25.
		
		
	
		
END
GO
