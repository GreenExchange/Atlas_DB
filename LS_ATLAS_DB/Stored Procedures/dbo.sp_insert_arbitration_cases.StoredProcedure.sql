USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_arbitration_cases]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_arbitration_cases]
(
	@DomainId nvarchar(50),
	@Case_Id varchar(100),
	@User_Id varchar(100),
	@isbit bit,
	@Status nvarchar(200),
	@BatchCode nvarchar(50)
)
AS
BEGIN

set deadlock_priority 10

	
	if(@isbit =0)-- ARB Done Cases By (Ready To Print Cases)
	Begin
		if not exists(select case_id from tblArbitrationCases  where Case_Id =@Case_Id and DomainId=@DomainId)
		Begin
			insert into tblArbitrationCases  (Case_Id,ready_by_user,ready_date,DomainId,BatchCode)
			values(@Case_Id,@user_id,GETDATE (),@DomainId,@BatchCode)
		ENd
	End
	Else -- AAA Package send mail cases
	Begin
		If exists(select Case_id from tblcase  where Case_Id =@Case_Id and DomainId=@DomainId )
		Begin
			----------------------------------------------------------------------------------------------
				Declare @oldStatus varchar(200),@NewStatus varchar(200),@newDesc varchar(500)
				Declare @new_stat_hierc int,@PROVIDER_ID nvarchar(50) , @provider_ff nchar(10),@desc varchar(200),@status_bill money,@old_stat_hierc int,@motion_stat_hierc smallint,@status_bill_type nvarchar(20),@status_bill_notes varchar(200)
				
				SET @oldStatus =(SELECT Status from tblcase  where Case_Id = @Case_Id and DomainId=@DomainId )
				
				--IF @oldStatus= 'AAA PPO PACKAGE PRINTED'
				--Begin
				
				--	SET @newStatus ='AAA PPO FILED'
				--	--SET @newStatus =@Status
				--End
				--ELSE
				--BEGIN
				--	--SET @newStatus ='AAA - FILED '
				--	SET @newStatus =@Status	
				--END
				
				

				update tblcase  		
				set status=@Status ,Date_AAA_Arb_Filed=getdate()
				where  case_id = @Case_Id
				and DomainId=@DomainId
				
				SET @newDesc = 'Status changed from ' + @oldStatus + ' to ' + @newStatus  
				exec LCJ_AddNotes @DomainId=@DomainId,@case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @newDesc,@user_Id='System',@ApplyToGroup = 0
			


				
				--SELECT @new_stat_hierc = STATUS_HIERARCHY ,@status_bill = auto_bill_amount ,@status_bill_type = auto_bill_type,
				--	   @status_bill_notes=auto_bill_notes
				--FROM tblStatus 
				--WHERE status_type=@Status	
				--and DomainId=@DomainId
				 
				--IF ((@new_stat_hierc < @old_stat_hierc) OR (@new_stat_hierc < 900 AND @motion_stat_hierc = 1)) and @user_id <>'srosenthal'
				--BEGIN
				--	set @desc = 'Status Hierarchy Constraint error : Status cannot be changed from ' + @oldStatus + ' to ' + @Status +'.  >>XM-003'       
				--	exec LCJ_AddNotes @DomainId=@DomainId,@case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id=@User_Id,@ApplyToGroup = 0
				--	RETURN
				--END
				
				--IF @status_bill > 0
				--BEGIN

				--	SELECT @provider_id=tblcase.provider_id ,@provider_ff = tblProvider.provider_ff 
				--	FROM   tblProvider  as tblProvider 
				--	INNER JOIN tblcase  as tblcase ON tblProvider.Provider_Id = tblcase.Provider_Id and tblcase.DomainId = tblProvider.DomainId
				--	WHERE tblcase.case_id =@case_id
				--	and tblcase.DomainId=@DomainId


				--	INSERT INTO TBLTRANSACTIONS (CASE_ID,TRANSACTIONS_TYPE,TRANSACTIONS_DATE,TRANSACTIONS_AMOUNT,TRANSACTIONS_DESCRIPTION,PROVIDER_ID,TRANSACTIONS_FEE,USER_ID,DomainId)
				--	VALUES (@case_id,@status_bill_type,GETDATE(),@status_bill,@status_bill_notes,@PROVIDER_ID,@status_bill,@USER_ID,@DomainId)

				--	set @desc = 'Payment/Transaction posted :'+ CONVERT(VARCHAR(20),@status_bill) +' '+'('+ @status_bill_type +') Desc-> ' + @status_bill_notes + '. New Status-> '+ @newStatus + ' .' 
				--	exec LCJ_AddNotes @DomainId=@DomainId,@case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id=@User_Id,@ApplyToGroup = 0

				--END

				
			
			----------------------------------------------------------------------------------
			IF exists(select case_id from tblArbitrationCases  where Case_Id =@Case_Id and DomainId=@DomainId)
			Begin
				update tblArbitrationCases 
				set MailSendDate =getdate(),
				BatchCode=@BatchCode
				where Case_Id =@Case_Id 
				and DomainId=@DomainId
			End
			Else
			Begin
				insert into tblArbitrationCases  (Case_Id,ready_by_user,ready_date,MailSendDate,DomainId,BatchCode)
				values(@Case_Id,'System',GETDATE (),GETDATE (),@DomainId,@BatchCode)
			End	
		End
	End
END

GO
