USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[sp_assign_pending_work_desk]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_assign_pending_work_desk]
	@Case_Id VARCHAR(100)
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM tblcasedeskhistory where Case_Id = @Case_Id)
	BEGIN
		declare @To_User_ID as int
		set @To_User_ID = (select UserId from IssueTracker_Users where UserName = (select top 1 User_Id from tblnotes where case_id=@Case_Id and notes_desc like '%Case Opened%'))
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
			0,
			0,
			@To_User_ID,
			getdate(),
			null,
			1
		)
	END
END
GO
