USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[ASSIGN_ANSWER_RECD]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ASSIGN_ANSWER_RECD]
	@CASEID VARCHAR(100)
AS
BEGIN
	DECLARE @JOEUSER_ID AS VARCHAR(50)
	DECLARE @ERINUSER_ID AS VARCHAR(50)
	DECLARE @DANAUSER_ID AS VARCHAR(50)
	DECLARE @desc AS VARCHAR(200)
	SET @JOEUSER_ID = (SELECT USERID FROM ISSUETRACKER_USERS WHERE USERNAME = 'jarmao')
	SET @ERINUSER_ID = (SELECT USERID FROM ISSUETRACKER_USERS WHERE USERNAME = 'estamper')
	SET @DANAUSER_ID = (SELECT USERID FROM ISSUETRACKER_USERS WHERE USERNAME = 'dgold')

	--JOE ARMAO
	IF NOT EXISTS(select top 1 1 from tblcasedeskhistory where case_id=@CASEID and To_User_Id = @JOEUSER_ID AND BT_STATUS=1)	
	BEGIN
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
				@CASEID,
				0,
				NULL,
				@JOEUSER_ID,
				getdate(),
				'ANSWER RECEIVED',
				1
			)

			SET @desc = 'Assigned To changed to jarmao'
			exec F_Add_Activity_Notes @s_a_case_id=@CASEID,@s_a_notes_type='Activity',@s_a_ndesc = @desc,@s_a_user_Id='system',@i_a_applytogroup = 0
	END
	--ERIN STAMPER
	IF NOT EXISTS(select top 1 1 from tblcasedeskhistory where case_id=@CASEID and To_User_Id = @ERINUSER_ID AND BT_STATUS=1)
	BEGIN
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
				@CASEID,
				0,
				null,
				@ERINUSER_ID,
				getdate(),
				'ANSWER RECEIVED',
				1
			)

			SET @desc = 'Assigned To changed to estamper'
			exec F_Add_Activity_Notes @s_a_case_id=@CASEID,@s_a_notes_type='Activity',@s_a_ndesc = @desc,@s_a_user_Id='system',@i_a_applytogroup = 0
	END
	--DANA GOLD
	IF NOT EXISTS(select top 1 1 from tblcasedeskhistory where case_id=@CASEID and To_User_Id = @DANAUSER_ID AND BT_STATUS=1)
	BEGIN
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
				@CASEID,
				0,
				null,
				@DANAUSER_ID,
				getdate(),
				'ANSWER RECEIVED',
				1
			)

			SET @desc = 'Assigned To changed to dgold'
			exec F_Add_Activity_Notes @s_a_case_id=@CASEID,@s_a_notes_type='Activity',@s_a_ndesc = @desc,@s_a_user_Id='system',@i_a_applytogroup = 0
	END
END
GO
