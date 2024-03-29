USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Update_Cases_Current_Status]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Update_Cases_Current_Status '0PEN-OK-BPO','INITIAL BILLING','FH07-42372','tech','test23233','{CLOSED}','8'
CREATE PROCEDURE [dbo].[Update_Cases_Current_Status]
	@status varchar(100),
	@case_status varchar(100)='',
	@case_id varchar(20),
	@User_Id varchar(50),
    @Desc nvarchar(2000)='',
    @NoteType varchar(100)='',
    @CourtId varchar(100)=''
AS
BEGIN
    Declare @NDesc varchar(max),
    --@Description nvarchar(2000),
	@old_stat_hierc int,  
	@new_stat_hierc int,
	@motion_stat_hierc smallint,
	@PROVIDER_ID nvarchar(50) ,
	@provider_ff nchar(10),
	@status_bill money,
	@status_bill_type nvarchar(20),
	@status_bill_notes varchar(200),
	@st varchar(MAX)
	
	DECLARE @oldStatus NVARCHAR(500)
	DECLARE @newStatus NVARCHAR(500)

	SET @oldStatus = (select status from tblcase where case_id = @Case_Id)
	SET @newStatus=@status
	
	--if(@CourtId <>'')
	--begin
	--update tblcase
	--set Court_Id =@CourtId
	--where Case_Id =@case_id	
	--end
		
	--if(@case_status<>'')
	--begin
	--  set @NDesc = 'Initial_Status changed from '+ (select Initial_Status from tblcase where case_id = @Case_Id) +' to ' + @case_status
	--   update tblcase
	--   set  Initial_Status = @case_status
	--   where case_id = @case_id
   	
	--   insert into tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)
	--   values (@NDesc,'Activity',1,@Case_Id,getdate(),@User_Id)
 --   end
        
	--if(@Desc<>'')
 --   begin
 --   insert into tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)
	--values (@Desc,@NoteType,1,@Case_Id,getdate(),@User_Id)
	--end
	
	if(@status<>'')
	begin
			IF @newStatus = '21 days on hold PENDing Peer Review' OR @newStatus = '21 days on hold pENDing IME Report' OR @newStatus = '21 days on hold pENDing IME REPORT/PEER REVIEW'
			BEGIN
				IF EXISTS(SELECT 1 FROM MST_STATUS_LOG WHERE CASE_ID=@Case_id)
				BEGIN
					UPDATE MST_STATUS_LOG SET STATUS_BIT = 1, DATE_CHANGED = getdate() WHERE CASE_ID=@Case_id
				END
				ELSE
				BEGIN
					INSERT INTO MST_STATUS_LOG(CASE_ID,DATE_CHANGED,STATUS_BIT) VALUES(@Case_id,getdate(),1)
				END
			END
			ELSE IF @oldStatus = '21 days on hold PENDing Peer Review' OR @oldStatus = '21 days on hold pENDing IME Report' OR @oldStatus = '21 days on hold pENDing IME REPORT/PEER REVIEW'
			BEGIN
					UPDATE MST_STATUS_LOG SET STATUS_BIT = 0 WHERE CASE_ID=@Case_id
			END

			--PENDING ASSIGNMENT
			IF @newStatus = 'Pending' or @newStatus = 'AAA Pending' or @newStatus = 'AAA PPO Pending'
			BEGIN
				exec sp_assign_pending_work_desk @Case_Id=@Case_Id
			END

			-- for settled status change
			IF @newStatus = 'Settled'
			BEGIN
				IF EXISTS(SELECT 1 FROM TXN_ASSIGN_SETTLED_CASES WHERE CASE_ID=@Case_id)
				BEGIN
					UPDATE TXN_ASSIGN_SETTLED_CASES SET isChanged = 1, DATE_CHANGED = getdate(), USER_ID = @User_Id WHERE CASE_ID=@Case_id
				END
				ELSE
				BEGIN
					INSERT INTO TXN_ASSIGN_SETTLED_CASES(CASE_ID,USER_ID,DATE_CHANGED,isChanged) VALUES(@Case_id,@User_Id,getdate(),1)
				END
			END
			ELSE IF @oldStatus = 'Settled'
			BEGIN
				UPDATE TXN_ASSIGN_SETTLED_CASES SET isChanged = 0 WHERE CASE_ID=@Case_id
			END

			-- for answer received, ASSIGN CASE TO JOE, ERIN, DANA
			IF @newStatus = 'ANSWER-RECD'
			BEGIN
				exec [SP_ASSIGN_REDCAT_DENIAL_REASONS] @Case_id
			END

            SELECT @old_stat_hierc = STATUS_HIERARCHY FROM Tblstatus INNER JOIN TBLcase ON dbo.tblcase.status = dbo.tblstatus.status_Type
			where dbo.tblcase.case_id=@Case_id AND dbo.tblcase.status=@oldStatus

			SELECT @motion_stat_hierc = STATUS_HIERARCHY FROM TblMotion_Status INNER JOIN TBLcase ON dbo.tblcase.Motion_Status = dbo.tblMotion_Status.status_desc
			where dbo.tblcase.case_id=@Case_id

			SELECT @new_stat_hierc = STATUS_HIERARCHY ,@status_bill = auto_bill_amount ,@status_bill_type = auto_bill_type,
				   @status_bill_notes=auto_bill_notes
			FROM Tblstatus
			 where status_type=@newStatus
			--if(@User_Id<>'ljainarine')
			-- BEGIN
				--IF ((@new_stat_hierc < @old_stat_hierc) OR (@new_stat_hierc < 900 AND @motion_stat_hierc = 1)) and @user_id <>'srosenthal'
				--BEGIN
				--	set @NDesc = 'Status Hierarchy Constraint error :status cannot be changed from ' + @oldStatus + ' to ' + @newStatus +'.  >>XM-003'       
				--	exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @NDesc,@user_Id=@User_Id,@ApplyToGroup = 0
				--	RETURN
				--END
			 -- END
			--IF @status_bill > 0
			--BEGIN

			--	SELECT @provider_id=tblcase.provider_id ,@provider_ff = tblProvider.provider_ff 
			--	FROM   tblProvider INNER JOIN tblcase ON tblProvider.Provider_Id = tblcase.Provider_Id
			--	WHERE tblcase.case_id =@case_id


			--	INSERT INTO TBLTRANSACTIONS(CASE_ID,TRANSACTIONS_TYPE,TRANSACTIONS_DATE,TRANSACTIONS_AMOUNT,TRANSACTIONS_DESCRIPTION,PROVIDER_ID,TRANSACTIONS_FEE,USER_ID)
			--	VALUES (@case_id,@status_bill_type,GETDATE(),@status_bill,@status_bill_notes,@PROVIDER_ID,@status_bill,@USER_ID)

			--	set @NDesc = 'Payment/Transaction posted :'+ CONVERT(VARCHAR(20),@status_bill) +' '+'('+ @status_bill_type +') Desc-> ' + @status_bill_notes + '. New Status-> '+ @newStatus + ' .' 
			--	exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @NDesc,@user_Id=@User_Id,@ApplyToGroup = 0
   --        END
	 	
		IF @newStatus is null
		BEGIN
			update tblcase set status= NULL where Case_Id =@Case_Id 
		END	
		ELSE
		BEGIN
			update tblcase set status= @newStatus  where Case_Id =@Case_Id
		END    
          
		 --print @st        
		 --exec @st  	
		 
		set @NDesc = 'Status changed from ' + @oldStatus + ' to ' + @newStatus       
		exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @NDesc,@user_Id=@User_Id,@ApplyToGroup = 0  
	
	END
End
GO
