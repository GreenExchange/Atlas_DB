USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteStatus]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteStatus]  --[LCJ_DeleteStatus] 'XXXX'
(

@Status_Type NVARCHAR(100)

)


AS
DECLARE @str VARCHAR(10)
BEGIN
IF NOT EXISTS (SELECT * FROM tblcase WHERE Status=@Status_Type)
	BEGIN
		DELETE FROM tblStatus WHERE Status_Type = + Rtrim(Ltrim(@Status_Type))
		SELECT 0 AS [delete]
	END	
ELSE
	BEGIN
		SELECT 1 AS [delete]
	END 
	--PRINT(@STR)
END
GO
