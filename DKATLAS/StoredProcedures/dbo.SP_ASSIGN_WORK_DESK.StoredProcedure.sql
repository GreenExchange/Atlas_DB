USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_ASSIGN_WORK_DESK]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ASSIGN_WORK_DESK]

@CASE_ID			NVARCHAR(50)=null,
@To_User_ID			int=null,
@Login_User_ID		int=null,
@Login_User_Name	nvarchar(50)=null,
@From_User_Id		int=null,
@From_User_Name		nvarchar(50)=null,
@History_Id			int =null

AS BEGIN
	--Set @From_User_Id=(Select UserID from issuetracker_users where UserName=@From_User_Name)
	Set @Login_User_Id=(Select UserID from issuetracker_users where UserName=@Login_User_Name)
	--Set @From_User_Id=(Select UserID from tblCase where case_id=@case_id)
	--Set @History_Id=(Select History_Id from tblCasedeskHistory where case_id=@case_id and bt_status=1)

--	if (@History_Id is not null)
--		begin
--			Update tblCaseDeskHistory
--			set bt_status=0
--			where history_id=@history_id
--		end
SET @CASE_ID=(LTRIM(RTRIM(@CASE_ID)))
	insert into tblCaseDeskHistory
	(
		Case_Id,
		Login_User_ID,
		From_User_ID,
		To_User_ID,
		Date_Changed,
		Change_Reason,
		Bt_Status
	)
	values
	(
		@CASE_ID,
		@Login_User_Id,
		@From_User_Id,
		@To_User_ID,
		getdate(),
		null,
		1
	)
declare @desc nvarchar(500)

declare @to_username as nvarchar(50)

set @to_username = (select username from issuetracker_users where userid=@To_User_ID)
set @desc = 'Assigned To changed to ' + @to_username       
exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id=@Login_User_Name,@ApplyToGroup = 0        

if Exists(select username from IssueTracker_Users where username = @Login_User_Name and UserName not like 'la-%') 
begin
if Exists(select username from IssueTracker_Users where username =@to_username and UserName like 'la-%' and ((select Status from tblcase where Case_Id =@case_id) ='Pending')) 
	begin
	  update tblcase set Status='PENDING - RESOLVED' where Case_Id =@CASE_ID 
	    set @desc = 'Status changed from PENDING to PENDING - RESOLVED'   
		exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id=@Login_User_Name,@ApplyToGroup = 0
	end
end
if Exists(select username from IssueTracker_Users where username =@Login_User_Name and UserName not like 'la-%') 
begin
	if Exists(select username from IssueTracker_Users where username =@to_username and UserName like 'la-%' and ((select Status from tblcase where Case_Id =@case_id) ='AAA pending'))
	begin
	  update tblcase set Status='AAA PENDING- RESOLVED' where Case_Id =@CASE_ID 
		set @desc = 'Status changed from AAA PENDING to AAA PENDING- RESOLVED'   
		exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id=@Login_User_Name,@ApplyToGroup = 0
	end
end
if Exists(select username from IssueTracker_Users where username =@Login_User_Name and UserName not like 'la-%') 
begin
	if Exists(select username from IssueTracker_Users where username =@to_username and UserName like 'la-%' and ((select Status from tblcase where Case_Id =@case_id) ='AAA PPO PENDING'))
	begin
	  update tblcase set Status='AAA PPO PENDING- RESOLVED' where Case_Id =@CASE_ID 
		set @desc = 'Status changed from AAA PPO PENDING to AAA PPO PENDING- RESOLVED'   
		exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id=@Login_User_Name,@ApplyToGroup = 0
	end
end
	END
GO
