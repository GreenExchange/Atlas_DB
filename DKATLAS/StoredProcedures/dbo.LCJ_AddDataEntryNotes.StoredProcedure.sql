USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddDataEntryNotes]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AddDataEntryNotes]
(
@USER_ID VARCHAR(50),
@CASE_ID VARCHAR(50)
)
AS
BEGIN
INSERT INTO TBLNOTES VALUES ('CASE OPENED','G',0,@CASE_ID,getdate(),@user_id)
END
GO
