USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Billing_Packet_Create]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Billing_Packet_Create]  --[Billing_Packet_Create] 'bt','','','',''
(
	@DomainID NVARCHAR(50),
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
	DECLARE @i_l_user_id INT 
	SELECT s=cast(s as varchar(50)) into #caseids FROM dbo.SplitString(@s_a_MultipleCase_ID,',')
	CREATE CLUSTERED INDEX cidx_caseids on #caseids(s)

	
	SELECT @s_l_Existing_Packed_IDS= COALESCE(@s_l_Existing_Packed_IDS+',' ,'') + Case_ID
	FROM 
	Billing_Packet (NOLOCK)  
	WHERE DomainID = CAST(@DomainID as varchar(50))  AND Case_Id  IN (SELECT s FROM #caseids)
	

	IF (ISNuLL(@s_l_Existing_Packed_IDS,'') = '')
	BEGIN
		 DECLARE @MaxCase_ID nVARCHAR(100)
		 DECLARE @MaxCaseAuto_ID INTEGER
		 DECLARE @Case_Id AS nvarchar(50) 

		SET @MaxCase_ID=ISNULL((SELECT top 1 tblCase.Case_ID FROM tblCase (NOLOCK) WHERE DomainId=CAST(@DomainID as varchar(50)) AND  CASE_ID NOT LIKE 'ACT%' ORDER BY Case_AUTOID DESC),'100000')
		SET @MaxCaseAuto_ID = (SELECT top 1 items + 1 FROM dbo.[STRING_SPLIT](@MaxCase_ID,'-') Order by autoid desc)
		SET @Case_Id  = UPPER(@DomainID) + RIGHT(CAST(DATEPART(year, GETDATE()) AS varchar),2) + '-' + CAST(@MaxCaseAuto_ID AS varchar)

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
					DomainId,
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
					DomainId,
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
					--'ARB' AS Initial_Status, 
					CASE WHEN @DomainID = 'GLF' THEN Initial_Status ELSE 'ARB' END, 
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
					AND DomainID = CAST(@DomainID as varchar(50))

				SET @s_l_message	=  'Packet created successfully - New Case ID : ' + @Case_Id
				SET @i_l_result    =  SCOPE_IDENTITY()
				
				
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
					DomainId,
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
					DomainId,
					Case_ID
				FROM 
					tblTreatment (NOLOCK)
				WHERE 
					Case_Id IN (SELECT s AS Case_ID FROM #caseids)


				-- Add Notes
				INSERT INTO tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id,DomainID)
				
				SELECT 'Case Opened', 'Activity',1, @case_id, getdate(), @s_a_UserName, @DomainId
				UNION 	-- Add Caption
				SELECT @s_a_caption, 'General',1, @case_id, getdate(), @s_a_UserName, @DomainId WHERE @s_a_caption <> ''
				UNION    -- Add Bill Added notes
				SELECT 
					'Bill added for DOS ' + convert(varchar(12),DateOfService_Start,101) + ' - ' + convert(varchar(12),DateOfService_end,101)
					,'Activity',1,@Case_Id,getdate(),@s_a_UserName, @DomainID 
				FROM 
					tblTreatment  (NOLOCK)
				WHERE Case_Id IN ((SELECT s FROM #caseids))

				

				EXEC sp_createDefaultDocTypesForTree  @DomainId,  @case_id, @case_id


				-- Add Documents Please note- Only path is recorded no physical file copied...
				INSERT INTO  tblDocImages (Filename,FilePath,Status,from_flag,DomainId, BasePathId,Node_ID, CID) 
				SELECT DISTINCT b_I.Filename, b_I.FilePath, b_I.Status, b_I.from_flag, b_I.DomainId, b_I.BasePathId, n_tag.NodeID, n_tag.CaseID
				from tblTags n_tag
				LEFT OUTER JOIN tblImageTag n_IT ON  n_tag.NodeID = n_IT.TagID and n_tag.DomainId = n_IT.DomainId
				LEFT OUTER JOIN dbo.TBLDOCIMAGES n_I ON n_IT.ImageID=n_I.ImageID and n_IT.DomainId=n_I.DomainId 
				INNER JOIN tblTags b_tag ON  n_tag.NodeName = b_tag.NodeName and n_tag.DomainId = b_tag.DomainId 
				INNER JOIN tblImageTag b_IT ON  b_tag.NodeID = b_IT.TagID and b_tag.DomainId = b_IT.DomainId
				INNER JOIN dbo.TBLDOCIMAGES b_I ON b_IT.ImageID=b_I.ImageID and b_IT.DomainId=b_I.DomainId 
				and n_tag.CaseID = @case_id
				and b_tag.CaseID IN (SELECT s FROM #caseids) 
				and n_I.Filename IS NULL
				AND n_I.FilePath IS NULL


				SELECT TOP 1 @i_l_user_id =  UserId  FROM IssueTracker_Users WHERE DomainId = @DomainId and UserName = @s_a_UserName

				INSERT INTO tblImageTag          
				SELECT I.ImageID, Node_ID, @i_l_user_id, GETDATE(), NULL, NULL, @DomainId
				FROM tblDocImages I  
				WHERE CID = @case_id

				---- Add Documents Please note- Only path is recorded no physical file...
				--DECLARE  @s_l_node_name VARCHAR(500),          
				--		 @s_l_filename VARCHAR(100),          
				--		 @s_l_file_path VARCHAR(100)   ,      
				--		 @i_l_user_id int,    
				--		 @i_l_from_flag int,
				--		 @i_l_BasePathId int

				-- DECLARE curBillingPacket CURSOR READ_ONLY FOR
				--	SELECT NodeName, Filename, FilePath, loginid, from_flag , BasePathId
				--	from dbo.TBLDOCIMAGES I (NOLOCK)
				--	inner Join dbo.tblImageTag IT on IT.ImageID=i.ImageID  
				--	inner Join dbo.tblTags T on T.NodeID = IT.TagID 
				--	WHERE T.CaseID IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,',')) and T.DomainID = @DomainId
				--	OPEN curBillingPacket
 
				----FETCH THE RECORD INTO THE VARIABLES.
				--FETCH NEXT FROM curBillingPacket INTO @s_l_node_name, @s_l_filename, @s_l_file_path, @i_l_user_id, @i_l_from_flag, @i_l_BasePathId
 
				----LOOP UNTIL RECORDS ARE AVAILABLE.
				--WHILE @@FETCH_STATUS = 0
				--BEGIN

				--		EXEC SP_NEW_FILE_INSERT_ASSOCIATION
				--			@DomainId = @DomainId,       
				--			@s_a_case_id = @case_id,          
				--			@s_a_node_name = @s_l_node_name,          
				--			@s_a_filename = @s_l_filename,          
				--			@s_a_file_path = @s_l_file_path,      
				--			@i_l_user_id =   @i_l_user_id,
				--			@i_a_BasePathId = @i_l_BasePathId,
				--			@i_a_from_flag= @i_l_from_flag
				--		FETCH NEXT FROM curBillingPacket INTO @s_l_node_name, @s_l_filename, @s_l_file_path, @i_l_user_id, @i_l_from_flag, @i_l_BasePathId
				--END
 
				----CLOSE THE CURSOR.
				--CLOSE curBillingPacket
				--DEALLOCATE curBillingPacket
				---- Close the packded cases
			
				UPDATE tblCase 
				SET Status = 'IN ARB OR LIT'
				WHERE DomainID =CAST(@DomainID AS VARCHAR(50)) AND Case_Id IN (SELECT s FROM #caseids)


				DELETE FROM Auto_Billing_Packet WHERE DomainID =CAST(@DomainID AS VARCHAR(50))  AND Case_Id IN (SELECT s FROM #caseids)
				DELETE FROM Auto_Billing_Packet_Info WHERE DomainID =CAST(@DomainID AS VARCHAR(50))  AND Case_Id IN (SELECT s FROM #caseids)


				INSERT INTO Billing_Packet(Case_ID, DomainID, Packeted_Case_ID, Notes, created_by_user)
				SELECT s AS Case_ID, @DomainID, @Case_Id, @s_a_caption, @s_a_UserName  FROM #caseids
			  
			    SET @s_l_message	= 'New case created successfully - '+ @Case_Id 
				SET @i_l_result		=  0 
			COMMIT TRAN 
	END
	ELSE
	BEGIN
		SET @s_l_message	= 'Packet not created. Case ID is already transferd into '+ @DomainID+ ' => '+ @s_l_Existing_Packed_IDS 
		SET @i_l_result		=  0
	END
	SELECT @s_l_message AS [Message], @i_l_result AS [RESULT]	

END

GO
