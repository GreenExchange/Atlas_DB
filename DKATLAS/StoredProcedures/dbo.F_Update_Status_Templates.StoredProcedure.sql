USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Update_Status_Templates]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Update_Status_Templates]
(
@Case_Id varchar(50),
@Notes_Type varchar(20),
@Status varchar(200),
@User_Id varchar(50)
)
AS
BEGIN
Set @User_Id = (Select UserName from IssueTracker_Users where UserId=@User_Id)
if @Status <>''
begin
DECLARE @last_status varchar(100)
DECLARE @NDesc varchar(3000)

	set @last_status = (select status from tblcase where Case_Id=@Case_Id)
	update tblcase set Status=@Status where Case_Id=@Case_Id
	
	set @NDesc = 'Status changed from ' + @last_status + ' to ' + @Status
	insert into tblNotes values (@NDesc,@Notes_Type,1,@Case_Id,getdate(),@User_Id)
end
END
GO
