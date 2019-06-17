USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddNotesType]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_AddNotesType]
(
@DomainId nvarchar(50),
@Notes_Type		nvarchar(100),
@Notes_Type_Color	nvarchar(100)

)
AS
BEGIN
	
	BEGIN


		-- Insert the records
		BEGIN TRAN
			
		INSERT INTO tblNotesType
		(
		DomainId,
		Notes_Type,
		Notes_Type_Color		
		)

		VALUES(
		@DomainId,
		@Notes_Type,
		@Notes_Type_Color	
		)					

		COMMIT TRAN

	END

END

GO
