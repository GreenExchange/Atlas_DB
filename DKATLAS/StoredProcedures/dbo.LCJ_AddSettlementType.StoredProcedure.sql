USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddSettlementType]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_AddSettlementType]
(

@Settlement_Type		nvarchar(100)


)
AS
BEGIN
	
	BEGIN


		-- Insert the records
		BEGIN TRAN
			
		INSERT INTO tblSettlement_Type
		(
		Settlement_Type		
		)

		VALUES(
		@Settlement_Type
		)					

		COMMIT TRAN

	END

END
GO
