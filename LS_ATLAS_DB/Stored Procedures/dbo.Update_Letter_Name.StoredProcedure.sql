USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Update_Letter_Name]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Letter_Name]
	@Lettername VARCHAR(200),
	@Letterid INT
AS
BEGIN
	UPDATE tbl_Client_Letter
	SET Letter_Display_Name = @Lettername
	WHERE Letter_Auto_Id = @Letterid
END

GO
