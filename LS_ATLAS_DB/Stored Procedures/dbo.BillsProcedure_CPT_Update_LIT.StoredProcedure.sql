USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[BillsProcedure_CPT_Update_LIT]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BillsProcedure_CPT_Update_LIT] 
	-- Add the parameters for the stored procedure here
	@tblCPT [dbo].[CPTBillsUpdateLIT] READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE b 
	SET 
	b.LITCollectedAmount= a.TLITCollectedAmount
	, b.LITIntrest = a.TLITIntrest
	, b.LITFees = a.TLITFees
	, b.CourtFees = a.TCourtFees
	FROM @tblCPT a
	INNER JOIN BILLS_WITH_PROCEDURE_CODES b ON b.CPT_ATUO_ID=a.TCPT_ATUO_ID
	WHERE 
	a.TDomainID=b.DomainID



END
GO
