USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DenialReasons_Update]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext LCJ_AddDataEntry1

CREATE PROCEDURE [dbo].[F_DenialReasons_Update]  
  
(  
	  @Case_Id NVARCHAR(200),
	  @DenialReason_Id INT,
	  @DenialReasons_Type NVARCHAR(50),
	  @UserID NVARCHAR(100)
)  
AS 
	BEGIN 
		DECLARE @NOTES VARCHAR(200)
    
			BEGIN
				UPDATE tblcase SET DenialReasons_Type=@DenialReasons_Type , Denial_Date=CONVERT(NVARCHAR(15), GETDATE(),101) where Case_Id=@Case_Id
			END
				SET @NOTES = 'Denial Reason Added ' + @DenialReasons_Type +'on'+ CONVERT(NVARCHAR(15), GETDATE(),101)
				EXEC LCJ_AddNotes @case_id=@case_id,@notes_type='Activity',@Ndesc=@NOTES,@User_id=@UserID,@Applytogroup=0
    END
GO
