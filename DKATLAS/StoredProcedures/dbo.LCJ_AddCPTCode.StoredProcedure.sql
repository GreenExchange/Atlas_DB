USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddCPTCode]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_AddCPTCode]
(
@CPT_Code		nvarchar(50),
@CPT_Name		nvarchar(300),
@Amount			money

)
AS
BEGIN
	
	BEGIN


		-- Insert the records
		BEGIN TRAN
			
		INSERT INTO tblCPT
		(
		CPT_Code,
		CPT_Name,
		Amount		
		)

		VALUES(
		@CPT_Code,
		@CPT_Name,
		@Amount
		)					

		COMMIT TRAN

	END

END
GO
