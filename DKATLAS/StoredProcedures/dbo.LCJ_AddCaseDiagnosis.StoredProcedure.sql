USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddCaseDiagnosis]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_AddCaseDiagnosis]
(
@Case_Id		nvarchar(50),
@Diag_Id		int

)
AS
BEGIN
	
	BEGIN


		-- Insert the records
		BEGIN TRAN
			
		INSERT INTO tblCaseDiagnosis
		(
		Case_Id,
		Diag_Id
		)

		VALUES(
		@Case_Id,
		@Diag_Id
		)					

		COMMIT TRAN

	END

END
GO
