USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[FHA_WorkArea_GetSettlementPctg]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FHA_WorkArea_GetSettlementPctg](
	@Case_Id nvarchar(100)
)

AS
begin
	declare @flt_settlement_amount float
	declare @flt_settlement_pctg decimal(10,2)
	
	set @flt_settlement_pctg = (
		select top 1 cast(round(isnull(Settlement_Pctg,0),2) as decimal(10,2)) [pctg] from tblTreatment
		WHERE Case_Id = @Case_Id
	)

	set @flt_settlement_amount = (select round(isnull(sum(((claim_amount - paid_amount) * @flt_settlement_pctg)/100),0.00),2)
			from tbltreatment 
			where case_id = @Case_Id AND Treatment_Id not in(select TreatmentId  from tbl_Treatment_settled )
	)

	select ISNULL (@flt_settlement_pctg,0) [pctg] , isnull (@flt_settlement_amount,0) [amount]
end
GO
