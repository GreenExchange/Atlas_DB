USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[ArbitrationNote]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ArbitrationNote]--'FH07-42372'
@DomainId nvarchar(50),
@cid varchar(50)

as
begin

	Declare @oldStatus varchar(200)
	
	SET @oldStatus =(SELECT Status from tblcase where Case_Id = @cid and DomainId=@DomainId)
	if @oldStatus= 'AAA PPO OPEN'
	Begin
		update tblcase 		
		set status='AAA PPO PACKAGE PRINTED' , DATE_STATUS_CHANGED=GETDATE()
		where  case_id=@cid		
		AND DomainId=@DomainId
	End
	ELSE
	BEGIN
		update tblcase 
		set status='AAA PACKAGE PRINTED' , DATE_STATUS_CHANGED=GETDATE()
		where  case_id=@cid
		AND DomainId=@DomainId
	END
	

	update tblcase
	set DateAAA_packagePrinting =GETDATE()
	where Case_Id =@cid
	AND DomainId=@DomainId


	if exists(select * from tblArbitrationCases where Case_Id= @cid and DomainId=@DomainId)
	Begin
		UPDATE tblArbitrationCases
		SET printed_date = GETDATE()
		WHERE Case_Id= @cid
		AND DomainId=@DomainId
	End
	else
	Begin
		insert into tblArbitrationCases (Case_Id,ready_by_user,ready_date,printed_date,DomainId)
		values(@cid,'System',GETDATE (),GETDATE (),@DomainId)
	end
 
end

GO
