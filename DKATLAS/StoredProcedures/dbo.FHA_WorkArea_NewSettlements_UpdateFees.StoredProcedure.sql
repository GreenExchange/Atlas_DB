USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[FHA_WorkArea_NewSettlements_UpdateFees]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FHA_WorkArea_NewSettlements_UpdateFees]
	-- Add the parameters for the stored procedure here
	@TreatmentId as int,
	@AttorneyFee as money,
	@FilingFeeAmt as money,
	@SettlementInt as float
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update tblTreatment 
	set AttorneyFee = @AttorneyFee,
		FilingFeeAmt = @FilingFeeAmt,
		SettlementInt = @SettlementInt
	where Treatment_Id = @TreatmentId

END
GO
