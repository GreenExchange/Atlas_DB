USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_arbitration_cases]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_arbitration_cases]
(
	@Case_Id varchar(100),
	@User_Id varchar(100),
	@isbit bit
)
AS
BEGIN

set deadlock_priority 10

	
	if(@isbit =0)-- ARB Done Cases By (Ready To Print Cases)
	Begin
		if not exists(select case_id from tblArbitrationCases where Case_Id =@Case_Id )
		Begin
			insert into tblArbitrationCases (Case_Id,ready_by_user,ready_date)
			values(@Case_Id,@user_id,GETDATE ())
		ENd
	End
	Else -- AAA Package send mail cases
	Begin
		If exists(select Case_id from tblcase where Case_Id =@Case_Id )
		Begin
			----------------------------------------------------------------------------------------------
				Declare @oldStatus varchar(200),@NewStatus varchar(200),@newDesc varchar(500)
				Declare @new_stat_hierc int,@PROVIDER_ID nvarchar(50) , @provider_ff nchar(10),@desc varchar(200),@status_bill money,@old_stat_hierc int,@motion_stat_hierc smallint,@status_bill_type nvarchar(20),@status_bill_notes varchar(200)
				
				SET @oldStatus =(SELECT Status from tblcase where Case_Id = @Case_Id)
				
				IF @oldStatus= 'AAA PPO PACKAGE PRINTED'
				Begin
				
					SET @newStatus ='AAA PPO FILED'
				End
				ELSE
				BEGIN
					SET @newStatus ='AAA - FILED '	
				END
				
				update tblcase 		
				set status=@newStatus ,Date_AAA_Arb_Filed=getdate()
				where  case_id = @Case_Id
				
				
				SELECT @new_stat_hierc = STATUS_HIERARCHY ,@status_bill = auto_bill_amount ,@status_bill_type = auto_bill_type,
					   @status_bill_notes=auto_bill_notes
				FROM Tblstatus
				WHERE status_type=@newStatus
				 
				IF ((@new_stat_hierc < @old_stat_hierc) OR (@new_stat_hierc < 900 AND @motion_stat_hierc = 1)) and @user_id <>'srosenthal'
				BEGIN
					set @desc = 'Status Hierarchy Constraint error : Status cannot be changed from ' + @oldStatus + ' to ' + @newStatus +'.  >>XM-003'       
					exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id=@User_Id,@ApplyToGroup = 0
					RETURN
				END
				
				--IF @status_bill > 0
				--BEGIN

				--	SELECT @provider_id=tblcase.provider_id ,@provider_ff = tblProvider.provider_ff 
				--	FROM   tblProvider INNER JOIN tblcase ON tblProvider.Provider_Id = tblcase.Provider_Id
				--	WHERE tblcase.case_id =@case_id


				--	INSERT INTO TBLTRANSACTIONS(CASE_ID,TRANSACTIONS_TYPE,TRANSACTIONS_DATE,TRANSACTIONS_AMOUNT,TRANSACTIONS_DESCRIPTION,PROVIDER_ID,TRANSACTIONS_FEE,USER_ID)
				--	VALUES (@case_id,@status_bill_type,GETDATE(),@status_bill,@status_bill_notes,@PROVIDER_ID,@status_bill,@USER_ID)

				--	set @desc = 'Payment/Transaction posted :'+ CONVERT(VARCHAR(20),@status_bill) +' '+'('+ @status_bill_type +') Desc-> ' + @status_bill_notes + '. New Status-> '+ @newStatus + ' .' 
				--	exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id=@User_Id,@ApplyToGroup = 0

				--END

				
				SET @newDesc = 'Status changed from ' + @oldStatus + ' to ' + @newStatus  
				exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @newDesc,@user_Id='System',@ApplyToGroup = 0
			
			----------------------------------------------------------------------------------
			IF exists(select case_id from tblArbitrationCases where Case_Id =@Case_Id)
			Begin
				update tblArbitrationCases
				set MailSendDate =getdate()
				where Case_Id =@Case_Id 
			End
			Else
			Begin
				insert into tblArbitrationCases (Case_Id,ready_by_user,ready_date,MailSendDate)
				values(@Case_Id,'System',GETDATE (),GETDATE ())
			End	
		End
	End
END
GO
