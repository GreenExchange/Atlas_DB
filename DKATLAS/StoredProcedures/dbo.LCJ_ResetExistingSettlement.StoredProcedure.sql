USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_ResetExistingSettlement]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_ResetExistingSettlement]

(

@Case_Id NVARCHAR(100)

)

AS

DELETE FROM tblSettlements where Case_Id = +@Case_Id

--DECLARE @s_l_OldStatus NVARCHAR(200)
--DECLARE @s_l_Status NVARCHAR(200)
--DECLARE @s_l_NotesDesc NVARCHAR(1000)

--SET @s_l_OldStatus = (Select top 1 Old_Status from tblcase where Case_Id = @Case_Id)
--SET @s_l_Status = (Select top 1 status from tblcase where Case_Id = @Case_Id)
--SET @s_l_NotesDesc = 'Status changed from '+ @s_l_Status +' to ' +@s_l_OldStatus
			
		
UPDATE TBLCASE SET -- STATUS=Old_Status,
Defendant_id=null,
attorney_id=null,
adjuster_id=null WHERE Case_Id = +@Case_Id

-- exec F_Add_Activity_Notes @s_a_Case_Id=@Case_Id,@s_a_Notes_Type='Activity',@s_a_NDesc= @s_l_NotesDesc,@s_a_user_Id='SYSTEM',@i_a_ApplyToGroup = 0
GO
