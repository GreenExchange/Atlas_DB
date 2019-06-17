USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddDocumentType]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_AddDocumentType]
(

			@Doc_Name nvarchar(100),
			--@Doc_Type nvarchar(100),
			@Doc_Value nvarchar(100),
			@Doc_Settlement as Bit
			


)
AS
BEGIN
	
	BEGIN


		-- Insert the records
		BEGIN TRAN
			
		INSERT INTO tblDocs
		(
			Doc_Name,
			--Doc_Type,
			Doc_Value,
			Settlement
			
		)

		VALUES(
		
			@Doc_Name,
			--@Doc_Type,
			@Doc_Value,
			@Doc_Settlement
		)					

		COMMIT TRAN

	END -- END of ELSE	

END
GO
