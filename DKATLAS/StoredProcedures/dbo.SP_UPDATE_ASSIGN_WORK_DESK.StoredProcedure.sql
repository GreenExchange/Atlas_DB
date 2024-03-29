USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_ASSIGN_WORK_DESK]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UPDATE_ASSIGN_WORK_DESK]-- 'FH10-67183','39456'

@CASE_ID			NVARCHAR(50)=null,
@To_User_Id			INT,
@History_Id			int =null

AS BEGIN
	SET @CASE_ID=(LTRIM(RTRIM(@CASE_ID)))
	Set @History_Id=(Select max(History_Id) from tblCasedeskHistory where case_id=@case_id and to_user_id = @To_User_Id and bt_status=1)
PRINT(@History_Id)
	if (@History_Id is not null)
		begin
			Update tblCaseDeskHistory
			set bt_status=0
			where history_id=@history_id
		end
END
GO
