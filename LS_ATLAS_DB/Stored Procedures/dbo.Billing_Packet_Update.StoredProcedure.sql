USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Billing_Packet_Update]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Billing_Packet_Update]
(
	@DomainID VARCHAR(50),
	@s_a_PktCaseID VARCHAR(MAX),
	@s_a_MultipleCase_ID VARCHAR(MAX),
	@s_a_UserName NVARCHAR(100)
)
AS
BEGIN
SET NOCOUNT ON;
DECLARE @i_l_result INT
	DECLARE @s_l_message VARCHAR(500)
	DECLARE @s_l_Existing_Packed_IDS VARCHAR(1000) = ''

	SELECT @s_l_Existing_Packed_IDS=  tblCase.Case_ID  FROM tblCase WHERE tblCase.DomainID = @DomainID AND tblCase.Case_ID=@s_a_PktCaseID
	
	
	IF (ISNuLL(@s_l_Existing_Packed_IDS,'') != '')
	BEGIN
				
	      BEGIN TRAN			
							
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
					@s_a_PktCaseID,
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
					tblTreatment
				WHERE 
					Case_Id IN (SELECT s AS Case_ID FROM dbo.SplitString(@s_a_MultipleCase_ID,','))

				INSERT INTO tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id,DomainID)
				SELECT 
					'Bill added for DOS ' + convert(varchar(12),DateOfService_Start,101) + ' - ' + convert(varchar(12),DateOfService_end,101)
					,'Activity',1,@s_a_PktCaseID,getdate(),@s_a_UserName, @DomainID 
				FROM 
					tblTreatment
				WHERE Case_Id IN (SELECT s AS Case_ID FROM dbo.SplitString(@s_a_MultipleCase_ID,','))

				-- Add Documents Please note- Only path is recorded no physical file...
				DECLARE  @s_l_node_name VARCHAR(500),          
						 @s_l_filename VARCHAR(100),          
						 @s_l_file_path VARCHAR(100)   ,      
						 @i_l_user_id int,    
						 @i_l_from_flag int
				 DECLARE curBillingPacket CURSOR READ_ONLY FOR
					SELECT NodeName, Filename, FilePath, loginid, from_flag from dbo.TBLDOCIMAGES I 
					inner Join dbo.tblImageTag IT on IT.ImageID=i.ImageID  
					inner Join dbo.tblTags T on T.NodeID = IT.TagID 
					WHERE T.CaseID IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,',')) and T.DomainID = @DomainId
					OPEN curBillingPacket
 
				--FETCH THE RECORD INTO THE VARIABLES.
				FETCH NEXT FROM curBillingPacket INTO @s_l_node_name, @s_l_filename, @s_l_file_path, @i_l_user_id, @i_l_from_flag
 
				--LOOP UNTIL RECORDS ARE AVAILABLE.
				WHILE @@FETCH_STATUS = 0
				BEGIN

						EXEC SP_NEW_FILE_INSERT_ASSOCIATION
							@DomainId = @DomainId,       
							@s_a_case_id = @s_a_PktCaseID,          
							@s_a_node_name = @s_l_node_name,          
							@s_a_filename = @s_l_filename,          
							@s_a_file_path = @s_l_file_path,      
							@i_a_user_id =   @i_l_user_id,
							@i_a_BasePathId= 1,
							@i_a_from_flag= @i_l_from_flag
						FETCH NEXT FROM curBillingPacket INTO @s_l_node_name, @s_l_filename, @s_l_file_path, @i_l_user_id, @i_l_from_flag
				END
 
				--CLOSE THE CURSOR.
				CLOSE curBillingPacket
				DEALLOCATE curBillingPacket
				-- Close the packded cases
				UPDATE tblCase 
				SET Status = 'IN ARB OR LIT'
				WHERE DomainID =@DomainID AND Case_Id IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,','))


				DELETE FROM Auto_Billing_Packet WHERE DomainID =@DomainID AND Case_Id IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,','))
				DELETE FROM Auto_Billing_Packet_Info WHERE DomainID =@DomainID AND Case_Id IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,','))


				INSERT INTO Billing_Packet(Case_ID, DomainID, Packeted_Case_ID, Notes, created_by_user)
				SELECT s AS Case_ID, @DomainID, @s_a_PktCaseID,'', @s_a_UserName  FROM dbo.SplitString(@s_a_MultipleCase_ID,',') 
			  
			    SET @s_l_message	= 'Case added successfully to PacketID - '+ @s_a_PktCaseID 
				SET @i_l_result		=  0 
			COMMIT TRAN 
	END
	ELSE
	BEGIN
		SET @s_l_message	= 'Packet not updated. Case ID does not belongs to domain '+ @DomainID+ ' => '+ @s_a_PktCaseID 
		SET @i_l_result		=  0
	END
	SELECT @s_l_message AS [Message], @i_l_result AS [RESULT]	

END


GO
