USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_Batch_Mail_Send]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_Batch_Mail_Send]
(
	@Case_Id varchar(100),
	@Type varchar(100)
)
AS
BEGIN

set deadlock_priority 10

	
	If exists(select Case_id from tblcase where Case_Id =@Case_Id )
		Begin
		
		
			IF exists(select case_id from tblBatchMailSend where Case_Id =@Case_Id)
			Begin
				update tblBatchMailSend
				set MailSendDate =getdate()
				where Case_Id =@Case_Id 
			End
			Else
			Begin
				insert into tblBatchMailSend (Case_Id,MailSendDate,Type)
				values(@Case_Id,GETDATE (),@Type)
			End	
			exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = 'Amended AR1 Document uploaded',@user_Id='System',@ApplyToGroup = 0
		
		End
	
END
GO
