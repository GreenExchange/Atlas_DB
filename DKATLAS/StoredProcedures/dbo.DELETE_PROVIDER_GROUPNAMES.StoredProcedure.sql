USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[DELETE_PROVIDER_GROUPNAMES]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_PROVIDER_GROUPNAMES]
	@ID NVARCHAR(50),
	@OperationResult INT OUTPUT
AS
BEGIN
	IF EXISTS(SELECT 1 FROM TblProvider_Groups WHERE Provider_Group_Name = @ID) AND NOT EXISTS(SELECT 1 FROM TBLPROVIDER WHERE Provider_GroupName = @ID)
	BEGIN
		DELETE FROM TblProvider_Groups WHERE Provider_Group_Name = @ID
		SET @OperationResult=0
	END
	ELSE
	BEGIN
		SET @OperationResult=1
	END
	SELECT @OperationResult
END
GO
