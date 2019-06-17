USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_GetNotesDetails]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_GetNotesDetails]
(
			@s_a_case_id  NVARCHAR(10),
			@s_a_notes_type VARCHAR(20),
			@i_a_mode INT
)
AS
BEGIN
	IF(@s_a_notes_type ='')
		SELECT * FROM tblNotes WHERE Case_Id = @s_a_case_id order by Notes_ID desc
	ELSE
		SELECT * FROM tblNotes WHERE Case_Id = @s_a_case_id and Notes_Type = @s_a_notes_type order by Notes_ID desc

END
GO
