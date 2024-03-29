USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DenialReasons_Add]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext LCJ_AddDataEntry1

CREATE PROCEDURE [dbo].[F_DenialReasons_Add]  
  
(  
	  @s_a_case_id NVARCHAR(200),
	  @i_a_denial_id INT,
	  @s_a_user_id NVARCHAR(100)
)  
AS 
	BEGIN 
		DECLARE	@s_l_notes VARCHAR(200),
				@s_l_denial_reason_type NVARCHAR(200)
    
			 IF NOT EXISTS (SELECT * FROM tbl_Case_Denial WHERE FK_Denial_ID=@i_a_denial_id and Case_Id=@s_a_case_id)
			 BEGIN
				
				
				INSERT INTO tbl_Case_Denial (FK_Denial_ID,Case_Id) 
				VALUES (@i_a_denial_id,@s_a_case_id)
				
				SET @s_l_denial_reason_type=(SELECT DenialReason FROM MST_DenialReasons WHERE PK_Denial_ID=@i_a_denial_id)
				SET @s_l_notes = 'Denial Reason Added ' + @s_l_denial_reason_type
				
				EXEC LCJ_AddNotes @case_id=@s_a_case_id,@notes_type='Activity',@Ndesc=@s_l_notes,@User_id=@s_a_user_id,@Applytogroup=0
			 END
    END
GO
