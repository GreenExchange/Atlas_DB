USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[INSERT_PROVIDER_GROUPNAMES]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERT_PROVIDER_GROUPNAMES]
	@ID NVARCHAR(50),
	@DESCRIPTION VARCHAR(200),
	@SD_CODE VARCHAR(50),
	@AF_Show int
AS
BEGIN
	IF NOT EXISTS(SELECT 1 FROM TblProvider_Groups WHERE Provider_Group_Name = @ID)
	BEGIN
		INSERT INTO TblProvider_Groups
			(
				[Provider_Group_Name],
				[DESCRIPTION],
				[SD_CODE],
				[AF_Show] 
			)
			VALUES
			(
				@ID,
				@DESCRIPTION,
				@SD_CODE,
				@AF_Show
			)
	END
	
END
GO
