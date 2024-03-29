USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Denial_Reasons]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Denial_Reasons]
	@Treatment_Id int,
	@DenialReasons_Id int,
	@Action_Type nvarchar(100)
as
BEGIN
--DECLARE @CASE_ID NVARCHAR(500)
--SET @CASE_ID = (SELECT TOP 1 CASE_ID FROM TBLTREATMENT WHERE Treatment_Id = @Treatment_Id)
IF Not Exists(Select I_txn_Treatment_Id From TXN_tblTreatment Where Treatment_Id=@Treatment_Id and DenialReasons_Id=@DenialReasons_Id)
	Begin
		INSERT INTO TXN_tblTreatment
		(Treatment_Id,DenialReasons_Id,Action_Type)
		values
		(@Treatment_Id,@DenialReasons_Id,@Action_Type)
--		
--		--Assign cases to Joe and Erin if the denial reason category is of Red Color
--		if EXISTS(select top 1 1 from tbldenialreasons where @DenialReasons_Id in (select DENIALREASONS_ID from tbldenialreasons where i_category_id=2))
--		BEGIN
--			if NOT EXISTS(select top 1 1 from tblcasedeskhistory where To_User_ID=24 and Case_Id=@Case_Id)
--			BEGIN
--				insert into tblCaseDeskHistory
--					(
--						Case_Id,
--						Login_User_ID,
--						From_User_ID,
--						To_User_ID,
--						Date_Changed,
--						Change_Reason,
--						Bt_Status
--					)
--					values
--					(
--						@Case_Id,
--						0,
--						NULL,
--						24,
--						getdate(),
--						null,
--						1
--					)
--				declare @desc nvarchar(500)
--
--				declare @to_username as nvarchar(50)
--
--				set @to_username = (select username from issuetracker_users where userid=24)
--				SET @desc = 'Case assigned to ' + @to_username
--				exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id='system',@ApplyToGroup = 0
--			END
--
--			if NOT EXISTS(select top 1 1 from tblcasedeskhistory where To_User_ID=99 and Case_Id=@Case_Id)
--			BEGIN
--				insert into tblCaseDeskHistory
--					(
--						Case_Id,
--						Login_User_ID,
--						From_User_ID,
--						To_User_ID,
--						Date_Changed,
--						Change_Reason,
--						Bt_Status
--					)
--					values
--					(
--						@Case_Id,
--						0,
--						NULL,
--						99,
--						getdate(),
--						null,
--						1
--					)
--
--
--				set @to_username = (select username from issuetracker_users where userid=99)
--				SET @desc = 'Case assigned to ' + @to_username
--				exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id='system',@ApplyToGroup = 0        
--			END
--
--		END

		Return 1
	End
Else
	Begin
		Return -1
	End

END
GO
