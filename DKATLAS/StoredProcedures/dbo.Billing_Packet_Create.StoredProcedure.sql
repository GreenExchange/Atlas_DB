USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Billing_Packet_Create]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Billing_Packet_Create]
(
--	@DomainID NVARCHAR(50),
	@s_a_caption VARCHAR(MAX),
	@s_a_MultipleCase_ID NVARCHAR(MAX),
	@s_a_UserName varchar(100),
	@s_a_ARBType varchar(50)
)
AS
BEGIN
SET NOCOUNT ON;

	DECLARE @i_l_result INT
	DECLARE @s_l_message VARCHAR(500)
	DECLARE @s_l_Existing_Packed_IDS NVARCHAR(1000) = ''
	DECLARE @s_l_ARBType VARCHAR(100) = ''

	SELECT s=cast(s as varchar(50)) into #caseids FROM dbo.SplitString(@s_a_MultipleCase_ID,',')
	CREATE CLUSTERED INDEX cidx_caseids on #caseids(s)

	SELECT @s_l_Existing_Packed_IDS= COALESCE(@s_l_Existing_Packed_IDS+', ' ,'') +  tblCase.Case_ID
	FROM tblCase (NOLOCK)
	INNER JOIN Billing_Packet (NOLOCK) ON tblCase.Case_Id = Packeted_Case_ID --and tblcase.DomainId = Billing_Packet.DomainID 
	WHERE --tblCase.DomainID = CAST(@DomainID as varchar(50))  AND
	 tblCase.Case_Id  IN (SELECT s FROM #caseids)

	IF (ISNuLL(@s_l_Existing_Packed_IDS,'') = '')
	BEGIN
		 DECLARE @MaxCase_ID nVARCHAR(100)
		 DECLARE @MaxCaseAuto_ID INTEGER
		 DECLARE @Case_Id AS nvarchar(50) 

		--SET @MaxCase_ID=ISNULL((SELECT top 1 tblCase.Case_ID FROM tblCase (NOLOCK) --WHERE   CASE_ID NOT LIKE 'ACT%' 
		--ORDER BY Case_AUTOID DESC),'100000')

		SET @MaxCase_ID=ISNULL((SELECT top 1 tblCase.Case_ID FROM tblCase  WHERE Case_Id not like  'ACT%' ORDER BY Case_AUTOID DESC),'100000')
			SET @MaxCaseAuto_ID = (SELECT top 1 items + 1 FROM dbo.[STRING_SPLIT](@MaxCase_ID,'-') Order by autoid desc)
			SET @Case_Id  = 'DK' + RIGHT(CAST(DATEPART(year, GETDATE()) AS NVARCHAR),2) + '-' + CAST(@MaxCaseAuto_ID AS NVARCHAR)



		--SET @MaxCaseAuto_ID = (SELECT top 1 items + 1 FROM dbo.[STRING_SPLIT](@MaxCase_ID,'-') Order by autoid desc)
		----SET @Case_Id  = UPPER(@DomainID) + RIGHT(CAST(DATEPART(year, GETDATE()) AS varchar),2) + '-' + CAST(@MaxCaseAuto_ID AS varchar)
		--SET @Case_Id  = RIGHT(CAST(DATEPART(year, GETDATE()) AS varchar),2) + '-' + CAST(@MaxCaseAuto_ID AS varchar)

			IF(@s_a_ARBType = 'ARB')
			BEGIN
				SET @s_l_ARBType='ARB PREP'
			END
			ELSE IF(@s_a_ARBType = 'LIT')
			BEGIN
				SET @s_l_ARBType='LIT PREP'
			END
		
	      BEGIN TRAN
				-- Add New Case
				INSERT INTO tblcase
				(
					--DomainId,
					Case_Id, 
					Provider_Id,  
					InsuranceCompany_Id,  
					InjuredParty_LastName,  
					InjuredParty_FirstName,  
					InjuredParty_Address, 
					InjuredParty_City, 
					InjuredParty_State, 
					InjuredParty_Zip, 
					InsuredParty_LastName,  
					InsuredParty_FirstName,
					InsuredParty_Address, 
					InsuredParty_City, 
					InsuredParty_State, 
					InsuredParty_Zip,   
					Accident_Date,  
					Policy_Number,  
					Ins_Claim_Number,  
					IndexOrAAA_Number,  
					Status,  
					Date_Opened,  
					--Last_Status,  
					Initial_Status,  
					Memo, 
					opened_by,	
					GB_CASE_ID,
					GB_COMPANY_ID,
					GB_CASE_NO,
					Bit_FromGB,
					gbb_type,
					GB_LawFirm_ID,
					IsDuplicateCase
				)
				SELECT TOP  1
					--DomainId,
					@Case_Id, 
					Provider_Id,  
					InsuranceCompany_Id,  
					InjuredParty_LastName,  
					InjuredParty_FirstName,  
					InjuredParty_Address, 
					InjuredParty_City, 
					InjuredParty_State, 
					InjuredParty_Zip, 
					InsuredParty_LastName,  
					InsuredParty_FirstName,
					InsuredParty_Address, 
					InsuredParty_City, 
					InsuredParty_State, 
					InsuredParty_Zip,   
					Accident_Date,  
					Policy_Number,  
					Ins_Claim_Number,  
					IndexOrAAA_Number,  
					@s_l_ARBType AS Status,  
					GetDate(),  
					--Last_Status,  
					'ARB' AS Initial_Status, 
					--CASE WHEN @DomainID = 'GLF' THEN Initial_Status ELSE 'ARB' END, 
					Memo,  
					'Admin' AS opened_by,	
					GB_CASE_ID,
					GB_COMPANY_ID,
					GB_CASE_NO,
					Bit_FromGB ,
					gbb_type,
					GB_LawFirm_ID,
					IsDuplicateCase
				FROM
					tblCAse  (NOLOCK)
				WHERE 
					Case_ID IN (SELECT s FROM #caseids)
					--AND DomainID = CAST(@DomainID as varchar(50))

				SET @s_l_message	=  'Packet created successfully - New Case ID :'' '+  + @Case_Id
				SET @i_l_result    =  SCOPE_IDENTITY()
				
				exec LCJ_AddNotes  @case_id=@case_id,@notes_type='Activity',@Ndesc='Case Opened',@User_id='admin', @Applytogroup=0
				-- Add Caption

				IF(@s_a_caption <> '')
				BEGIN
					exec LCJ_AddNotes @case_id=@case_id,@notes_type='General',@Ndesc=@s_a_caption,@User_id='admin', @Applytogroup=0
				END
				-- Add Bills
				
				INSERT INTO tblTreatment
				(
					Case_Id,
					DateOfService_Start,
					DateOfService_End,
					Claim_Amount,
					Paid_Amount,
					Date_BillSent,
					SERVICE_TYPE,
					Account_Number,
					BILL_NUMBER,
					Fee_schedule,
					DenialReason_Id,
					PeerReviewDoctor_ID,
					TreatingDoctor_ID,
					--DomainId,
					ACT_CASE_ID
				)
				SELECT 
					@Case_Id,
					DateOfService_Start,
					DateOfService_End,
					Claim_Amount,
					Paid_Amount,
					Date_BillSent,
					SERVICE_TYPE,
					Account_Number,
					BILL_NUMBER,
					Fee_schedule,
					DenialReason_Id,
					PeerReviewDoctor_ID,
					TreatingDoctor_ID,
					--DomainId,
					Case_ID
				FROM 
					tblTreatment (NOLOCK)
				WHERE 
					Case_Id IN (SELECT s AS Case_ID FROM dbo.SplitString(@s_a_MultipleCase_ID,','))

				INSERT INTO tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)
				SELECT 
					'Bill added for DOS ' + convert(varchar(12),DateOfService_Start,101) + ' - ' + convert(varchar(12),DateOfService_end,101)
					,'Activity',1,@Case_Id,getdate(),@s_a_UserName 
				FROM 
					tblTreatment  (NOLOCK)
				WHERE Case_Id IN (SELECT s AS Case_ID FROM dbo.SplitString(@s_a_MultipleCase_ID,','))

				-- Add Documents Please note- Only path is recorded no physical file...
				DECLARE  @s_l_node_name VARCHAR(500),          
						 @s_l_filename VARCHAR(100),          
						 @s_l_file_path VARCHAR(100)   ,      
						 @i_l_user_id int,    
						 @i_l_from_flag int,
						 @i_l_BasePathId int

				 DECLARE curBillingPacket CURSOR READ_ONLY FOR
					SELECT NodeName, Filename, FilePath, loginid, from_flag , BasePathId
					from dbo.TBLDOCIMAGES I (NOLOCK)
					inner Join dbo.tblImageTag IT on IT.ImageID=i.ImageID  
					inner Join dbo.tblTags T on T.NodeID = IT.TagID 
					WHERE T.CaseID IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,',')) 
					OPEN curBillingPacket
 
				--FETCH THE RECORD INTO THE VARIABLES.
				FETCH NEXT FROM curBillingPacket INTO @s_l_node_name, @s_l_filename, @s_l_file_path, @i_l_user_id, @i_l_from_flag, @i_l_BasePathId
 
				--LOOP UNTIL RECORDS ARE AVAILABLE.
				WHILE @@FETCH_STATUS = 0
				BEGIN

						EXEC SP_NEW_FILE_INSERT_ASSOCIATION
						--	@DomainId = @DomainId,       
							@s_a_case_id = @case_id,          
							@s_a_node_name = @s_l_node_name,          
							@s_a_filename = @s_l_filename,          
							@s_a_file_path = @s_l_file_path,      
							@i_a_user_id =   @i_l_user_id,
							@i_a_BasePathId = @i_l_BasePathId,
							@i_a_from_flag= @i_l_from_flag
						FETCH NEXT FROM curBillingPacket INTO @s_l_node_name, @s_l_filename, @s_l_file_path, @i_l_user_id, @i_l_from_flag, @i_l_BasePathId
				END
 
				--CLOSE THE CURSOR.
				CLOSE curBillingPacket
				DEALLOCATE curBillingPacket
				-- Close the packded cases
			
				UPDATE tblCase 
				SET Status = 'IN ARB OR LIT'
				WHERE --DomainID =CAST(@DomainID AS VARCHAR(50)) AND 
				Case_Id IN (SELECT s FROM #caseids)


				DELETE FROM Auto_Billing_Packet WHERE  Case_Id IN (SELECT s FROM #caseids)
				DELETE FROM Auto_Billing_Packet_Info WHERE  Case_Id IN (SELECT s FROM #caseids)


				INSERT INTO Billing_Packet(Case_ID,  Packeted_Case_ID, Notes, created_by_user)
				SELECT s AS Case_ID, @Case_Id, @s_a_caption, @s_a_UserName  FROM dbo.SplitString(@s_a_MultipleCase_ID,',') 
			  
			    SET @s_l_message	= 'New case created successfully - ' ++ @Case_Id 
				SET @i_l_result		=  0 
			COMMIT TRAN 
	END
	ELSE
	BEGIN
		SET @s_l_message	= 'Packet not created. Case ID is already transferd into '+ ' => '+ @s_l_Existing_Packed_IDS 
		SET @i_l_result		=  0
	END
	SELECT @s_l_message AS [Message], @i_l_result AS [RESULT]	

END

GO
