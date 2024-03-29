USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Case_Update_Status]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[F_Case_Update_Status] 'FH11-87652','la-shital.v','21 days on hold pending IME Report','AAA PPO CONCILIATION UNRESOLVED','370'
CREATE PROCEDURE [dbo].[F_Case_Update_Status]    
(    
	@s_a_case_id			NVARCHAR(10),  
	@s_a_user_name			NVARCHAR(50),
	@s_a_case_status_old	NVARCHAR(200),        	
	@s_a_case_status_new	NVARCHAR(200),
    @s_a_case_statusid	NVARCHAR(10)
)    
AS    
BEGIN      
	SET NOCOUNT ON     
	DECLARE @i_l_count  INT     
	DECLARE @s_l_message VARCHAR(MAX)  
	DECLARE @s_l_statusid NVARCHAR(10)
	
	declare @old_stat_hierc int,
	@desc varchar(200),
	@new_stat_hierc int,
	@status_bill_notes varchar(200),
	@status_bill money,
	@status_bill_type nvarchar(20),
	@PROVIDER_ID nvarchar(50) ,
	@provider_ff nchar(10)
	
		
			IF @s_a_case_status_new = 'Settled'
			BEGIN
				IF EXISTS(SELECT 1 FROM TXN_ASSIGN_SETTLED_CASES WHERE CASE_ID=@s_a_Case_Id)
				BEGIN
					UPDATE TXN_ASSIGN_SETTLED_CASES SET isChanged = 1, DATE_CHANGED = getdate(), USER_ID =@s_a_user_name WHERE CASE_ID=@s_a_Case_Id
				END
				ELSE
				BEGIN
					INSERT INTO TXN_ASSIGN_SETTLED_CASES(CASE_ID,USER_ID,DATE_CHANGED,isChanged) VALUES(@s_a_case_id,@s_a_user_name,getdate(),1)
				END
			END
			ELSE IF @s_a_case_status_old = 'Settled'
			BEGIN
				UPDATE TXN_ASSIGN_SETTLED_CASES SET isChanged = 0 WHERE CASE_ID=@s_a_Case_Id
			END

			-- for answer received, ASSIGN CASE TO JOE, ERIN, DANA
			IF @s_a_case_status_new = 'ANSWER-RECD'
			BEGIN
				exec [SP_ASSIGN_REDCAT_DENIAL_REASONS] @s_a_case_id
			END


			SELECT @old_stat_hierc = CONVERT(int,ISNULL(STATUS_HIERARCHY,0)) FROM Tblstatus INNER JOIN TBLcase ON dbo.tblcase.status = dbo.tblstatus.status_Type
			where dbo.tblcase.case_id=@s_a_Case_Id AND dbo.tblcase.status=@s_a_case_status_old

			SELECT @new_stat_hierc = STATUS_HIERARCHY ,@status_bill = auto_bill_amount ,@status_bill_type = auto_bill_type,
				   @status_bill_notes=auto_bill_notes
			 FROM Tblstatus
			 where status_type=@s_a_case_status_new
			

			 
			--IF (@new_stat_hierc < @old_stat_hierc and @s_a_user_name <>'srosenthal')
			--BEGIN
	
			--	set @desc = 'Status Hierarchy Constraint error :Status cannot be changed from ' + @s_a_case_status_old + ' to ' + @s_a_case_status_new +'.  >>XM-003'       
				
			--	set @s_l_message = 'Status Hierarchy Constraint error :Status cannot be changed'
				   
			--	exec F_Add_Activity_Notes @s_a_case_id=@s_a_Case_Id,@s_a_notes_type='Activity',@s_a_ndesc = @desc,@s_a_user_Id=@s_a_user_name,@i_a_applytogroup = 0
			--	SELECT @s_l_message AS [MESSAGE], @s_a_case_id AS [RESULT] , Status FROM tblcase WHERE Case_Id =    @s_a_case_id
			--	RETURN
			--END

			--IF @status_bill > 0
			--BEGIN
		
			--	SELECT @provider_id=tblcase.provider_id ,@provider_ff = tblProvider.provider_ff 
			--	FROM   tblProvider INNER JOIN tblcase ON tblProvider.Provider_Id = tblcase.Provider_Id
			--	WHERE tblcase.case_id =@s_a_Case_Id


			--	INSERT INTO TBLTRANSACTIONS(CASE_ID,TRANSACTIONS_TYPE,TRANSACTIONS_DATE,TRANSACTIONS_AMOUNT,TRANSACTIONS_DESCRIPTION,PROVIDER_ID,TRANSACTIONS_FEE,USER_ID)
			--	VALUES (@s_a_case_id,@status_bill_type,GETDATE(),@status_bill,@status_bill_notes,@PROVIDER_ID,@status_bill,@s_a_user_name)

			--	set @desc = 'Payment/Transaction posted :'+ CONVERT(VARCHAR(20),@status_bill) +' '+'('+ @status_bill_type +') Desc-> ' + @status_bill_notes + '. New Status-> '+ @s_a_case_status_new + ' .' 
			--	exec F_Add_Activity_Notes @s_a_case_id=@s_a_Case_Id,@s_a_notes_type='Activity',@s_a_ndesc = @desc,@s_a_user_Id=@s_a_user_name,@i_a_applytogroup = 0
			--END

			UPDATE tblcase 
			SET Status = @s_a_case_status_new
			WHERE Case_Id = @s_a_case_id
			
			SET @desc = 'Status changed from ' + @s_a_case_status_old +' to '+@s_a_case_status_new
			
			exec F_Add_Activity_Notes @s_a_case_id=@s_a_Case_Id,@s_a_notes_type='Activity',@s_a_ndesc = @desc,@s_a_user_Id=@s_a_user_name,@i_a_applytogroup = 0
	
	SET @s_l_message = 'Case Status updated successfully'   
    set @s_l_statusid=@s_a_case_statusid
	SELECT @s_l_message AS [MESSAGE], @s_a_case_id AS [RESULT], [Status], ISNULL(@s_l_statusid,'N/A') as CurrentStatusID  FROM tblcase WHERE Case_Id =@s_a_case_id
	
	SET NOCOUNT OFF       
END
GO
