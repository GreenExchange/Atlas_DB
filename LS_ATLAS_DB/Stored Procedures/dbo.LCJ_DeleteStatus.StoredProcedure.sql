USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteStatus]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteStatus]  --[LCJ_DeleteStatus] 'XXXX'
(

@DomainId	nvarchar(50),
@Status_Type NVARCHAR(100)

)


AS
DECLARE @str VARCHAR(10)
BEGIN
IF NOT EXISTS (SELECT * FROM tblcase  WHERE Status=@Status_Type and DomainId=@DomainId)
	BEGIN
		DELETE FROM tblStatus  WHERE Status_Type = + Rtrim(Ltrim(@Status_Type)) and DomainId=@DomainId
		SELECT 0 AS [delete]
	END	
ELSE
	BEGIN
		SELECT 1 AS [delete]
	END 
	--PRINT(@STR)
END

GO
