USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_Admin_DeleteDesks]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_Admin_DeleteDesks]
(
@Username nvarchar(50),
@Desk_Id nvarchar(3000)
)
AS
BEGIN
DECLARE
@ST NVARCHAR(3500)
IF @Username <> '' AND @Desk_Id <> ''
BEGIN

SET @ST = 'Delete from tblUserDesk where UserName = '''+@Username+''' AND Desk_Id In (' + @Desk_Id + ')'
PRINT @ST
EXEC SP_EXECUTESQL @ST
END
END
GO
