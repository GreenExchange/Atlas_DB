USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddDiagnosis]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_AddDiagnosis]
(
@Diag_code		nvarchar(50),
@Diag_Name		nvarchar(300)

)
AS
BEGIN
	
	BEGIN


		-- Insert the records
		BEGIN TRAN
			
		INSERT INTO tblDiagnosis
		(
		Diag_Code,
		Diag_name
		)

		VALUES(
		@Diag_Code,
		@Diag_name
		)					

		COMMIT TRAN

	END

END
GO
