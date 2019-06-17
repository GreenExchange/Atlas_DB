USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddImageType]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_AddImageType]
(
@DomainId nvarchar(50),
@Image_Type		nvarchar(100)


)
AS
BEGIN
	
	BEGIN


		-- Insert the records
		BEGIN TRAN
			
		INSERT INTO tblImageTypes 
		(
		DomainId,
		Image_Type		
		)

		VALUES(
		@DomainId,
		@Image_Type
		)					

		COMMIT TRAN

	END

END

GO
