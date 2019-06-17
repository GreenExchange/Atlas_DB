USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddImageType]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_AddImageType]
(

@Image_Type		nvarchar(100)


)
AS
BEGIN
	
	BEGIN


		-- Insert the records
		BEGIN TRAN
			
		INSERT INTO tblImageTypes
		(
		Image_Type		
		)

		VALUES(
		@Image_Type
		)					

		COMMIT TRAN

	END

END
GO
