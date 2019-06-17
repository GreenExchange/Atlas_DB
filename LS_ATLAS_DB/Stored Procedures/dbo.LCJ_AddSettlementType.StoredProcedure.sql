USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddSettlementType]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_AddSettlementType]
(

@DomainId				nvarchar(50),
@Settlement_Type		nvarchar(100)


)
AS
BEGIN
	
	BEGIN


		-- Insert the records
		BEGIN TRAN
			
		INSERT INTO tblSettlement_Type 
		(
		DomainId,
		Settlement_Type		
		)

		VALUES(
		@DomainId,
		@Settlement_Type
		)					

		COMMIT TRAN

	END

END

GO
