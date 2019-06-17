USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_AdminNotes_Add]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_AdminNotes_Add]
(
			@s_a_notes_desc NVARCHAR(500),
			@s_a_user_Id VARCHAR(50),
			@s_a_notes_type NVARCHAR(20)
)
AS
BEGIN
	Insert into AdminNotes (Notes_Desc, Notes_Date,User_Id,Type)
	values( @s_a_notes_desc,GETDATE(),@s_a_user_Id,@s_a_notes_type)

END
GO
