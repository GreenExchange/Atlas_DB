USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GET_INSERT_DENIAL_REASONS_DETAILS]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_INSERT_DENIAL_REASONS_DETAILS]
	@SZ_DENIAL_REASON VARCHAR(max),
	@SZ_DENIAL_ID INT OUTPUT
AS
BEGIN
	IF EXISTS(SELECT TOP 1 1 FROM tblDenialReasons WHERE DenialReasons_Type = @SZ_DENIAL_REASON)
	BEGIN		
		SET @SZ_DENIAL_ID = (SELECT TOP 1 DenialReasons_Id FROM tblDenialReasons WHERE DenialReasons_Type = @SZ_DENIAL_REASON)
	END
	ELSE
	BEGIN		
		INSERT INTO tblDenialReasons
		(DenialReasons_Type)
		VALUES
		(@SZ_DENIAL_REASON)
		SET @SZ_DENIAL_ID = (SELECT MAX(DenialReasons_Id) AS DenialReasons_Id FROM tblDenialReasons WHERE DenialReasons_Type = @SZ_DENIAL_REASON)
	END
END
GO
